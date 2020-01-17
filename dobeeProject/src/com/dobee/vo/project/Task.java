package com.dobee.vo.project;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Task {
    private int tskSeq;
    private String title;
    private String progress;
    private int important;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startAt;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endAt;
    private String mail;
    private int pjtSeq;

}
