package com.kbstar.controller;

import com.kbstar.dto.MsgAdm;
import com.kbstar.dto.Sales;
import com.kbstar.service.CartService;
import com.kbstar.service.SalesService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Random;

@Slf4j
@RestController
public class ChartsController {

    @Autowired
    SalesService salesService = new SalesService();

    @RequestMapping("/groupSales")
    public Object groupSales(Model model) throws Exception {
        // series : [ { 'name' : 'Male', 'data' : []}, {'name' : 'Female', 'data' : []} ]
        List<Sales> salesList = salesService.groupsales();

        JSONArray series = new JSONArray();

        JSONObject male = new JSONObject();
        male.put("name", "Male");
        JSONArray maleData = new JSONArray();

        JSONObject female = new JSONObject();
        female.put("name", "Female");
        JSONArray femaleData = new JSONArray();

        for (Sales sales : salesList) {
            if (sales.getGender().trim().equals("M")) {
                // 매출액이 없는 경우 0으로 세팅
                if (sales.getPrice() == null || sales.getPrice() == 0) {
                    maleData.add(0);
                } else {
                    maleData.add(sales.getPrice()); // 매출액이 있는 경우 매출액 set
                }
            } else {
                if (sales.getGender().trim().equals("F")) {
                    // 매출액이 없는 경우 0으로 세팅
                    if (sales.getPrice() == null || sales.getPrice() == 0) {
                        femaleData.add(0);
                    } else{
                        femaleData.add(sales.getPrice()); // 매출액이 있는 경우 매출액 set
                    }
                }
            }
        }
        male.put("data", maleData);
        female.put("data", femaleData);

        series.add(male);
        series.add(female);

        return series;
    }


//    @RequestMapping("/groupSales")
//    @Scheduled(cron = "*/10 * * * * *")
//    public Object groupSales(Model model) throws Exception {
//        List<Sales> list = null;
//        list = salesService.groupsales();
//
//        // data : { labels:[], datasets[{data: []}]}
//        JSONObject joData = new JSONObject();
//
//        // 월 매출액
//        JSONArray jaLabel = new JSONArray();
//        for(int i =1 ; i <13 ; i++) {
//            jaLabel.add(i);
//        }
//        JSONObject joInnerData = new JSONObject();
//        // innerdata
//        JSONArray jaInnerData = new JSONArray();
//        for (Sales sales : list){
//            // 매출액이 없는 경우 0으로 세팅
//            if(sales.getPrice() == null || sales.getPrice() == 0){
//                jaInnerData.add(0);
//                continue; // 아래구문 패스
//            }
//            jaInnerData.add(sales.getPrice()); // 매출액이 있는 경우 매출액 set
//        } // [XXX, XXX, XXX, ....]
//        joInnerData.put("data", joInnerData); // {data: []}
//
//        // datasets
//        JSONArray jaDatasets = new JSONArray();
//        jaDatasets.add(joInnerData); // [{data: []}]
//
//        joData.put("labels", jaLabel); // labels : [1,2,3,4,5,6,7,8,9,10,11,12]
//        joData.put("datasets", jaDatasets); // datasets: [{data: []}]
//
//        return joData;
//    }

}