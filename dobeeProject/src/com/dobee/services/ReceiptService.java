package com.dobee.services;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class ReceiptService {
	
	
	public boolean fileUpload(MultipartHttpServletRequest mRequest) {

		boolean isSuccess = false;
		
		String uploadPath = "/users/psh/file/";
		
		File dir = new File(uploadPath);

		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		Iterator<String> iter = mRequest.getFileNames();
		while(iter.hasNext()) {
			String uploadFileName = iter.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String originalFileName = mFile.getOriginalFilename();
			String saveFileName = originalFileName;
			
			if(saveFileName != null && !saveFileName.equals("")) {
				if(new File(uploadPath + saveFileName).exists()) {
					saveFileName = saveFileName + "_" + System.currentTimeMillis();
				}
				
				try {
					mFile.transferTo(new File(uploadPath + saveFileName));
					isSuccess = true;				
				} catch (IllegalStateException e) {
					e.printStackTrace();
					System.out.println("서비스단 / boardService.java: try 구문 예외 발생");
					isSuccess = false;
				} catch (IOException e) {
					e.printStackTrace();
					System.out.println("서비스단 / boardService.java: try 구문 예외 발생222");
					isSuccess = false;
				}
			} // if end
		} // while end
		return isSuccess;
	} // fileUpload end

}
