package com.dobee.vo.chat;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data @ToString
public class ChatContent {
	
	private int ChatMsgSeq;
	private String ChatContent;
	private Date ChatTime;
	private int ChatSeq;
	private String mail;

}
