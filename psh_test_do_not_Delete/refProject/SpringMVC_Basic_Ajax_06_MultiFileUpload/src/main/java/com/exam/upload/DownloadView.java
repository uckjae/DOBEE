package com.exam.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView{

	private static final Logger logger = LoggerFactory.getLogger(DownloadView.class);
	
	public DownloadView() {
		//파일 다운로드를 위해 컨텐츠 타입을 " application/download "로 설정
		setContentType("application/download); charset=utf-8");
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		File file = (File) model.get("downloadFile");
		
		response.setContentType(getContentType());
		response.setContentLength((int) file.length()); //컨텐츠의 크기를 파일의 크기로 지정
		
		String userAgent = request.getHeader("User-Agent");
		logger.debug("User-Agent:"+userAgent);
		
		boolean ie = userAgent.indexOf("MSIE") > -1;
		String fileName = null;
		
		if (ie) {
			fileName = URLEncoder.encode(file.getName(), "utf-8");
		} else {
			fileName = new String(file.getName().getBytes("utf-8"),"iso-8859-1");
		}
		//Content-Disposition헤더를 이용해서 전송되는 파일의 이름을 명시
		response.setHeader("Content-Disposition", "attachment; filename=\""
								+ fileName +"\"");
		//전송되는 데이터의 인코딩이 바이너리 타입이라는것을 명시
		response.setHeader("Content-Transfer-Encoding","binary");
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		} finally {
			if(fis != null) 
				try { fis.close(); } catch (IOException ex) {}
		}
		out.flush();
	}
	
}
