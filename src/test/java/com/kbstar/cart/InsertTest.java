package com.kbstar.cart;
import com.kbstar.dto.Cart;
import com.kbstar.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
public class InsertTest {
    @Autowired
    CartService service;
    @Test
    void contextLoads(){
//        Date date = new Date();
        Cart obj = new Cart(105,"id01", 100, 999);
        try {
            service.register(obj);
            service.get();
            log.info("등록 정상");
        } catch (Exception e) {
            // 객체 비교 (예외상황 객체 비교)
            if(e instanceof DuplicateKeyException){
                log.info("CART ID가 중복 되었습니다");
            }else {
                log.info("시스템 장애입니다.");
            }
            // e.printStackTrace();
        }
    }
}





