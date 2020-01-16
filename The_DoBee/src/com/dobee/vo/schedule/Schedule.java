package com.dobee.vo.schedule;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Schedule {
    private int schSeq;
    private Date startTime;
    private Date endTime;

}
