package ncontroller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class FileController {

	
	/***************************************************
	 * URL: /rest/controller/upload  
	 * upload(): receives files
	 * @param request : MultipartHttpServletRequest auto passed
	 * @param response : HttpServletResponse auto passed
	 * @return LinkedList<FileMeta> as json format
	 * @throws IOException 
	 * @throws IllegalStateException 
	 ****************************************************/
	@RequestMapping(value="upload.htm", method = RequestMethod.POST)
	public void upload(MultipartHttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		System.out.println("컨트롤렄ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
		
		List<MultipartFile> files = request.getFiles("f"); //multiparthttpservletrequest 기능에 다중의 파일들을 list로 받을 수 있다.
		//input type ="file" name="f"가 가지고 있는 모든 파일들을 불러온다.
		//default 경로로 c: temp 폴더 안으로 들어간다.
		for(MultipartFile fileing : files) {
			File file = new File("/bbbb/", fileing.getOriginalFilename());
			fileing.transferTo(file);
		}
	 
	}
	/***************************************************
	 * URL: /rest/controller/get/{value}
	 * get(): get file as an attachment
	 * @param response : passed by the server
	 * @param value : value from the URL
	 * @return void
	 ****************************************************/
	@RequestMapping(value = "/get/{value}", method = RequestMethod.GET)
	 public void get(HttpServletResponse response,@PathVariable String value){
		/* FileMeta getFile = files.get(Integer.parseInt(value));
		 try {		
			 	response.setContentType(getFile.getFileType());
			 	response.setHeader("Content-disposition", "attachment; filename=\""+getFile.getFileName()+"\"");
		        FileCopyUtils.copy(getFile.getBytes(), response.getOutputStream());
		 }catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		 }*/
	 }
 
}
