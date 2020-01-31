package com.dobee.vo.project;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class UpcomingTask {
	private int pjtSeq;
	private String pjtName;
    private String title;
    private String progress;
    private int important;
    private String endAt;
    
}
