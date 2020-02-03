package com.dobee.vo;


import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Debit {
    private String cardNum;
    private String corp;
    private String name;
    private String nickName;
    private String entry;
    private String valDate;
}
