package com.dobee.services;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ReceiptService {
	
	
	public ArrayList<String> fileUpload(MultipartHttpServletRequest mRequest) throws UnsupportedEncodingException {
		
		ArrayList<String> arrayList = new ArrayList<>();
			
		String isSuccess = "false";
		
		String uploadPath = "/Users/psh/DOBEE/dobeeProject/WebContent/upload/";
		
		File dir = new File(uploadPath);

		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		Iterator<String> iter = mRequest.getFileNames();
		
		while(iter.hasNext()) {
			System.out.println("서비스단 / ReceiptService:  와일문 시작 ");
			String uploadFileName = iter.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String origName;
			
			//String originalFileName = mFile.getOriginalFilename();
			origName = new String(mFile.getOriginalFilename().getBytes("8859_1"), "utf-8");

			String saveFileName = origName;
			System.out.println("upload 서비스단 시작");
			System.out.println(saveFileName);
			if(saveFileName != null && !saveFileName.equals("")) {
				if(new File(uploadPath + saveFileName).exists()) {
					String ex = "";
					String ori = "";
					ori = saveFileName.split("\\.")[0];
					ex = saveFileName.split("\\.")[1];
					System.out.println("서비스단:ReceiptService: 파일명/확장자 =" + ori +"/" + ex );
					saveFileName = ori + "_" + System.currentTimeMillis() + ex;
				}
				
				try {
					mFile.transferTo(new File(uploadPath + saveFileName));
					isSuccess = "true";				
				} catch (IllegalStateException e) {
					e.printStackTrace();
					System.out.println("서비스단 / boardService.java: try 구문 예외 발생");
					isSuccess = "false";
				} catch (IOException e) {
					e.printStackTrace();
					System.out.println("서비스단 / boardService.java: try 구문 예외 발생222");
					isSuccess = "false";
				}
				
			} // if end
			else {
				System.out.println("서비스단 / ReceiptService: form 태그로 부터 온 데이타가 없습니다.");
			}
		
			arrayList.add(isSuccess);
			arrayList.add(uploadPath);
			arrayList.add(saveFileName);
		} // while end
		return arrayList;
	} // fileUpload end

}
