package com.dobee.vo.schedule;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class NotSchedule extends Schedule {
    private int nsSeq;
    private String nsContent;
    private int notSeq;
}
