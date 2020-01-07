package com.dobee.vo.schedule;

import com.dobee.vo.schedule.Schedule;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class NotSchedule extends Schedule {
    private int nSSeq;
    private String nSContent;
    private int nSeq;
}
