package com.dobee.vo.schedule;

import com.dobee.vo.schedule.Schedule;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class TaskSchedule extends Schedule {
    private int tSSeq;
    private int seq;//업무번호(Task)
}
