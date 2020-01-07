package com.dobee.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
@Getter
@Setter
public class Apply {
    private int aSeq;
    private Date reqDate;
    private String reason;
    private Date startAt;
    private Date endAt;
    private String isAuth;
    private String rejReason;
    private String Drafter;
    private String Approval;
    private int aCode;
}
