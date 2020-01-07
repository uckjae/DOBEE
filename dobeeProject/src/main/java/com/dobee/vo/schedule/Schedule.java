package com.dobee.vo.schedule;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
@Getter
@Setter
public class Schedule {
    private int sSeq;
    private Date startTime;
    private Date endTime;

}
