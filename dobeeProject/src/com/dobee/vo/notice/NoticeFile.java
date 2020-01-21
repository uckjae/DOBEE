package com.dobee.vo.notice;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class NoticeFile {
	
	private int nfSeq;
	private String orgName; //파일 원본 이름
	private String saveName; //파일 저장 이름
	private int notSeq;
	private CommonsMultipartFile file;
	
}
