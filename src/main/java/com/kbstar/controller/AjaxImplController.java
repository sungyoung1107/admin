package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.dto.Chart;
import com.kbstar.service.AdmService;
import com.kbstar.service.ChartService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
public class AjaxImplController {

    @Autowired
    AdmService admService;

    @Autowired
    ChartService chartService;

    // result 반환
    @RequestMapping("/checkid")
    public int checkid(String id) throws Exception{
        int result = 0;
        Adm adm = null;
        adm = admService.get(id);
        if(adm!=null){
            result = 1;
        }
        return result;
    }

    @RequestMapping("/chart1")
    public Object chart1() throws Exception {

        try {
            List<Chart> list = chartService.getMontlyTotal();
            JSONArray fma = new JSONArray();
            JSONArray ma = new JSONArray();

            for (Chart c : list) {
                if (c.getGender().toUpperCase().equals("F")) {
                    fma.add(c.getTotal());
                } else {
                    ma.add(c.getTotal());
                }
            }

            JSONObject fmo = new JSONObject();
            JSONObject mo = new JSONObject();
            fmo.put("name", "Female");
            fmo.put("data", fma);
            mo.put("name", "Male");
            mo.put("data", ma);

            JSONArray data = new JSONArray();
            data.add(fmo);
            data.add(mo);
            log.info(data.toJSONString());
            return data;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
}
