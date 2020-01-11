package com.dobee.vo.notice;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Notice {
    private int notSeq;
    private String title;
    private String content;
    private Date regDate;
    private int count;
    
}
