package com.kbstar.marker;

import com.kbstar.dto.Marker;
import com.kbstar.service.MarkerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {
    @Autowired
    MarkerService service;

    @Test
    void contextLoads() {
        try{
//			service.modify(new Item(104, "newname", 77,"newimg", new Date()));
            service.modify(new Marker(100, "밥플러스2", "지메일",30, 70, "aaa.jpg", "b"));
            service.get();
        }catch(Exception e){
            log.info("Error");
        }
    }

}
