package com.dobee.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
@Getter
@Setter
public class Debit {
    private int cardNum;
    private String corp;
    private String name;
    private String nickName;
    private String entry;
    private Date valDate;
}
