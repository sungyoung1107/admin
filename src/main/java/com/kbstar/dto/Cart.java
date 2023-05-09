package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Cart {
    private int id;
    private String cust_id;
    private int item_id;
    private int cnt;
    private Date rdate;

    // 조인을 위한 변수 추가
    private String cust_name;
    private String item_name;
    private int item_price;
    private String item_imgname;

    // 합계 금액
    private double total;

    public Cart(int id, int item_id, int cnt) {
        this.id = id;
        this.item_id = item_id;
        this.cnt = cnt;
    }

    public Cart(String cust_id, int item_id, int cnt) {
        this.cust_id = cust_id;
        this.item_id = item_id;
        this.cnt = cnt;
    }

    public Cart(int id, String cust_id, int item_id, int cnt) {
        this.id = id;
        this.cust_id = cust_id;
        this.item_id = item_id;
        this.cnt = cnt;
    }
}
