package com.dobee.vo.project;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
@Getter
@Setter
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
