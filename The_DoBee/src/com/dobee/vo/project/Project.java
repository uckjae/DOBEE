package com.dobee.vo.project;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Project {
    private int pjtSeq;
    private String pjtName;
    private String pjtStartAt;
    private String pjtEndAt;
    private String pjtProgress;
}
