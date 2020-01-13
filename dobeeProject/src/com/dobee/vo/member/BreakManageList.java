package com.dobee.vo.member;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class BreakManageList {
   String entry;
   String reqDate;
   String startAt;
   String endAt;
   String isAuth;
   String UsingBreak;
   String reason;
   String rejReason;
   
}
