package com.dobee.vo.schedule;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class TaskSchedule extends Schedule {
    private int tsSeq;
    private int tskSeq;//업무번호(Task)
}
