package com.dobee.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date valDate;
    
    
}
