package com.dobee.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
@Getter
@Setter
public class Notice {
    private int nSeq;
    private String title;
    private String content;
    private Date regDate;
    private int count;

}
