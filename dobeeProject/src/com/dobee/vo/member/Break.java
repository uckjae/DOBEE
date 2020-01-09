package com.dobee.vo.member;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Break {
    private String mail;
    private int totalBreak;
    private int usedBreak;
}
