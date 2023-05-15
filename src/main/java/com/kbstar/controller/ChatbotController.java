package com.kbstar.controller;

import com.kbstar.dto.Msg;
import com.kbstar.util.ChatBotUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import java.io.IOException;

@Controller
public class ChatbotController {

    @Autowired
    SimpMessagingTemplate template;

    // 4번 : chsend로 응답한다. 단, StomWebSocketConfig에서 configureMessageBroker 설정 필수
    @MessageMapping("/chatbotme") // 모두에게 전송
    public void chatbotme(Msg msg, SimpMessageHeaderAccessor headerAccessor) throws IOException {
        String target = msg.getSendid(); // 보낸 사람 id
        // ncp chatbot 연동 코드 여기다 넣어야 함
        String txt = msg.getContent1();
        String result = ChatBotUtil.chat(txt);
        msg.setContent1(result);
        template.convertAndSend("/chsend/"+target, msg); // send라는 아웃바운드로 메세지를 뿌린다.
    }

}
