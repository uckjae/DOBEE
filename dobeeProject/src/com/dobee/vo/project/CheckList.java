package com.dobee.vo.project;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class CheckList {
    private int chkSeq;
    private String content;
    private boolean isCheck;
    private int seq;
}
