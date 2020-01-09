package com.dobee.vo.member;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class BreakList {
    private int brkSeq;
    private int aplSeq;
    private String mail;
    private int usingBreak;
}
