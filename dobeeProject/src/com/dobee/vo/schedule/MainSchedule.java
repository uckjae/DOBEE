package com.dobee.vo.schedule;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class MainSchedule {
    private String startTime;	// 시작 시간
    private String endTime;		// 종료 시간
    private String title;		// 제목
    private String entry;		// 항목
}
