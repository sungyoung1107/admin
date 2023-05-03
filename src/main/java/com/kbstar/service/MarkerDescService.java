package com.kbstar.service;


import com.kbstar.dto.MarkerDesc;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.MarkerDescMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class MarkerDescService implements KBService<Integer, MarkerDesc> {

    /**
     * 등록 및 가입 진행
     * argument : Object
     * return : null
     *
     * @param markerDesc
     */
    @Autowired
    MarkerDescMapper mapper;
    @Override
    public void register(MarkerDesc markerDesc) throws Exception {
        mapper.insert(markerDesc);
    }

    @Override
    public void remove(Integer i) throws Exception {
        mapper.delete(i);
    }

    @Override
    public void modify(MarkerDesc markerDesc) throws Exception {
        mapper.update(markerDesc);
    }

    @Override
    public MarkerDesc get(Integer i) throws Exception {
        return mapper.select(i);
    }

    public List<MarkerDesc> getmarkerdesc(int id) throws Exception{
        return mapper.getmarkerdesc(id);
    }

    @Override
    public List<MarkerDesc> get() throws Exception {
        return mapper.selectall();
    }
}
