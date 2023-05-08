package com.kbstar.Item;

import com.kbstar.dto.ItemSearch;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SearchTest {
	@Autowired
	ItemService service;

	@Test
	void contextLoads() {
		try{
			ItemSearch ms = new ItemSearch("바", 10000, "2023/04/01", "2023/05/03");
			service.search(ms);
			log.info("success");
		}catch(Exception e){
			log.info("Error");
			e.printStackTrace();
		}
	}

}
