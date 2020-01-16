package com.dobee.vo.project;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Task {
    private int tSeq;
    private String title;
    private String progress;
    private int important;
    private Date startAt;
    private Date endAt;
    private String mail;
    private int pSeq;

}
