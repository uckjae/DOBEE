package com.dobee.vo.schedule;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class NotSchedule extends Schedule {
    private int nsSeq; //공지사항 일정 번호
    private String nsContent; //공지사항 일정 내용
    private int schSeq; //일정 번호(FK)
    private int notSeq; //글번호(FK)
}
