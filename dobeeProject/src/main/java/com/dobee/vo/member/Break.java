package com.dobee.vo.member;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Break {
    private String mail;
    private int totalBreak;
    private int usedBreak;
}
