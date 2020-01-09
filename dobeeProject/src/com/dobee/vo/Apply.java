package com.dobee.vo;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Apply {
    private int aplSeq;
    private Date reqDate;
    private String reason;
    private Date startAt;
    private Date endAt;
    private String isAuth;
    private String rejReason;
    private String Drafter;
    private String Approval;
    private int apyCode;
}
