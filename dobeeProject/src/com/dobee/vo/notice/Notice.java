package com.dobee.vo.notice;


import java.util.Date;


import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Notice {
    private int notSeq; //글 번호
    private String title; //글 제목
    private String content; //글내용
    private Date regDate; //작성일
    private int count; //조회수
   
}
