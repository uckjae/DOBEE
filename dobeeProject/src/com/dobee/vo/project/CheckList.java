package com.dobee.vo.project;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class CheckList {
    private int chkSeq;
    private String content;
    private boolean isCheck;
    private int tskSeq;
}
