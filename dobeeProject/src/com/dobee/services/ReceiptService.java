package com.dobee.services;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class ReceiptService {
	
	public List<String> fileUpload(MultipartHttpServletRequest mRequest) throws UnsupportedEncodingException {
		
		
		List<String> arrayList = new ArrayList<String>();
		String isSuccess = "false";
		String uploadPath = "C:\\SmartWeb\\DOBEE3\\dobeeProject\\WebContent\\upload\\";  //이건 윈도우 전용 경로
		//String uploadPath = "/Users/psh/DOBEE_New/dobeeProject/WebContent/upload/"; 이건 맥전용 경로
		// String uploadPath = "/var/lib/tomcat/webapps/dobeeProject/upload/"; AWS ec2 경로
		File dir = new File(uploadPath);

		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		Iterator<String> iter = mRequest.getFileNames();
		
		while(iter.hasNext()) {
			String uploadFileName = iter.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String origName;
			
			origName = new String(mFile.getOriginalFilename().getBytes("8859_1"), "utf-8");

			String saveFileName = origName;
			if(saveFileName != null && !saveFileName.equals("")) {
				if(new File(uploadPath + saveFileName).exists()) {
					String ex = "";
					String ori = "";
					ori = saveFileName.split("\\.")[0];
					ex = saveFileName.split("\\.")[1];
					saveFileName = ori + "_" + System.currentTimeMillis() + "." +ex;
				}
				try {
					mFile.transferTo(new File(uploadPath + saveFileName));
					isSuccess = "true";				
				} catch (IllegalStateException e) {
					e.printStackTrace();
					isSuccess = "false";
				} catch (IOException e) {
					e.printStackTrace();
					isSuccess = "false";
				}
			} // if end
			arrayList.add(isSuccess);
			arrayList.add(uploadPath);
			arrayList.add(saveFileName);
		} // while end
		return arrayList;
	} // fileUpload end
}
