package com.dobee.vo.member;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class BreakManageList {
	int aplSeq;
   String entry;
   String reqDate;
   String startAt;
   String endAt;
   String isAuth;
   int usingBreak;
   String reason;
   String rejReason;
   String drafter;
   String name;
   
}
