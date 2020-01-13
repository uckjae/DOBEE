package com.dobee.vo.notice;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

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
    private int nfSeq;
    private String saveName;
    //private String orgName;
    private List<CommonsMultipartFile> files;
    
}
