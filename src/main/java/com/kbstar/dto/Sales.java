package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Sales {
//    private Date rdate;
    private String rdate; // 2023-01-02
    private int price;
    private String gender;
}
