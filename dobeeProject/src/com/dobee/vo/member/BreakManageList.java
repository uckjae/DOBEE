package com.dobee.vo.member;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class BreakManageList {
   private int aplSeq;
   private String entry;
   private String reqDate;
   private String startAt;
   private String endAt;
   private int useBreak;   
   private String isAuth;
   private int apyCode;
   private String reason;
   private String rejReason;
   private String drafter;
   private String approval;
   private String name;

   private int usingBreak;
   
}
