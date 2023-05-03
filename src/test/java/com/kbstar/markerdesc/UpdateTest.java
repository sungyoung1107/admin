package com.kbstar.markerdesc;

import com.kbstar.dto.MarkerDesc;
import com.kbstar.service.MarkerDescService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {
    @Autowired
    MarkerDescService service;

    @Test
    void contextLoads() {
        try{
//			service.modify(new Item(104, "newname", 77,"newimg", new Date()));
            service.modify(new MarkerDesc(14,107, "양꼬치", 25000, "yang2.jpg"));
            service.get();
        }catch(Exception e){
            log.info("Error");
        }
    }

}
