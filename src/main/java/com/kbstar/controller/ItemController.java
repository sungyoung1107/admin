package com.kbstar.controller;

import com.kbstar.dto.ItemDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/tables")
public class ItemController {

    @RequestMapping("")
    public String item(Model model) {
        List<ItemDTO> list = new ArrayList<>();
        int cnt = 1;
        for (int i =1 ; i < 3 ; i ++) {
            list.add(new ItemDTO((100*cnt)+i, "pants1", 8000, "a.jpg", new Date()));
            list.add(new ItemDTO((101*cnt)+i, "pants2", 29900, "b.jpg", new Date()));
            list.add(new ItemDTO((102*cnt)+i, "pants3", 19000, "c.jpg", new Date()));
            list.add(new ItemDTO((103*cnt)+i, "pants4", 39000, "d.jpg", new Date()));
            list.add(new ItemDTO((104*cnt)+i, "pants5", 39900, "e.jpg", new Date()));
            list.add(new ItemDTO((105*cnt)+i, "skirts1", 18000, "one1.jpg", new Date()));
            list.add(new ItemDTO((106*cnt)+i, "skirts2", 29900, "one2.jpg", new Date()));
            list.add(new ItemDTO((107*cnt)+i, "skirts3", 39000, "one3.jpg", new Date()));
            list.add(new ItemDTO((108*cnt)+i, "skirts4", 59000, "one4.jpg", new Date()));
            list.add(new ItemDTO((109*cnt)+i, "skirts5", 69900, "one5.jpg", new Date()));
            cnt++;
        }
        model.addAttribute("allitem", list);
        model.addAttribute("center", "tables");

        return "index";
    }

}