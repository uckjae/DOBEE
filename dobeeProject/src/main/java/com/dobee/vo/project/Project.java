package com.dobee.vo.project;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
@Getter @Setter
public class Project {
    private int pSeq;
    private String pName;
    private Date pStartDate;
    private Date pEndDate;
    private String pProgress;
}
