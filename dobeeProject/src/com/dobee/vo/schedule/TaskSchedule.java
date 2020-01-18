package com.dobee.vo.schedule;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class TaskSchedule extends Schedule {
    private int tsSeq; //업무일정번호
    private int tskSeq;//업무번호(Task)
}
