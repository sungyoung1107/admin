package com.kbstar.service;

import com.kbstar.dto.Cust;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.CustMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j // 로그 쓸 수 있음
@Service
public class CustService implements KBService<String, Cust> {

    @Autowired
//    KBMapper mapper;
    CustMapper mapper; // mapper를 활용해 db 연결

    @Override
    public void register(Cust cust) throws Exception {
//        mapper.insert(cust);
        mapper.insert(cust);
        log.info("Register finished. Send mail......................" + cust.getId());
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);

    }

    @Override
    public void modify(Cust cust) throws Exception {
        mapper.update(cust);
    }

    @Override
    public Cust get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Cust> get() throws Exception {
        return mapper.selectall();
    }

}
