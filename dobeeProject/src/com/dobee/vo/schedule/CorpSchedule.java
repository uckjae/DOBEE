package com.dobee.vo.schedule;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class CorpSchedule extends Schedule {
    private int csSeq;
    private String csContent;
}
