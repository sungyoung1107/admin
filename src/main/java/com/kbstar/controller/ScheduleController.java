package com.kbstar.controller;

import com.kbstar.dto.Msg;
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

import javax.print.attribute.standard.JobName;
import java.util.List;
import java.util.Random;

@Slf4j
@Component
public class ScheduleController {
    
    // cronJobDailyUpdate()에 의해 몇초마다 집계된 데이터를 보낼 때 사용
    @Autowired
    private SimpMessageSendingOperations messagingTemplate;

    @Autowired
    CartService cartService = new CartService();

    @Autowired
    SalesService salesService = new SalesService();

    // Annotation이 중요, 함수명이 중요한 것이 아님
    // 5초마다 작업해서 관리자 화면에 찍자!!!
    @Scheduled(cron = "*/5 * * * * *")
    public void cronJobDailyUpdate() {

//        log.info("----------- Scheduler ------------");

        Random r = new Random();
        int content1 = r.nextInt(100)+1;
        int content2 = r.nextInt(1000)+1;
        int content3 = r.nextInt(500)+1;
        int content4 = r.nextInt(10)+1;

        MsgAdm msg = new MsgAdm();
        msg.setContent1(content1);
        msg.setContent2(content2);
        msg.setContent3(content3);
        msg.setContent4(content4);

        // 15초마다 msg 작업해서 sendadm 경로로 보낸다. StomWebSocketConfig에 고쳐줘야 함
        messagingTemplate.convertAndSend("/sendadm", msg);

    }

    // 8초마다 로그를 찍자!!!!
    @Scheduled(cron = "*/8 * * * * *")
    public void cronJobWeeklyUpdate() throws Exception {
        double num = cartService.gettotal();
        log.info(num + "");
    }

}

/*
    초 분 시 일 월 요일
cron = "*  *  *  *  *  *" */

 //       0 0 * * * * : 매 시 0분 0초에 작업
 //       */15 * * * * * : 매 15초마다 작업
 //       0 0 0 1,8,17,26 * * : 매달 1, 8, 17, 26일 자정에 작업
 //       0 0 10-20 * * * : 매일 10시 ~ 20시 한시간 간격으로 작업
 //       0 0 9-18 * * 1-5 : 월 ~ 금(평일) 9 ~ 18시 매 정각에 작업
 //       0 0 */3 4 * * : 매달 4일에 3시간 간격으로 작업
