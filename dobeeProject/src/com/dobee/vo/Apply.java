package com.dobee.vo;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Apply {
    private int aplSeq;
    private String reqDate;
    private String reason;
    private String startAt;
    private String endAt;
    private String isAuth;
    private String rejReason;
    private String drafter;
    private String approval;
    private int apyCode; 
    
}
