package com.dobee.vo.schedule;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class CorpSchedule extends Schedule {
    private int cSSeq;
    private String cSContent;
}
