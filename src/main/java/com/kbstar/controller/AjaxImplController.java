package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class AjaxImplController {

    @Autowired
    AdmService admService;

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
}
