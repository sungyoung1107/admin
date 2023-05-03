package com.kbstar;


import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class LombokTest {

    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());

    @Test
    void contextLoad() {
//        ItemDTO cust = new ItemDTO("id01", "pwd01", "이말숙");
//        logger.info(cust.toString());
    }
}
