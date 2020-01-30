package com.dobee.vo.schedule;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class MainSchedule {
    private int schSeq; 	// 일정 번호
    private String startTime;	// 시작 시간
    private String endTime;		// 종료 시간
    private String nsContent;	// 제목
    
}
