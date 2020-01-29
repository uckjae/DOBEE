package com.dobee.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.dobee.dao.UserDao;
import com.dobee.services.MemberService;
import com.dobee.vo.member.Authority;
import com.dobee.vo.member.TeamList;
import com.dobee.vo.member.User;


@RestController
@RequestMapping("ajax/admin/**")
public class AjaxControllerAdmin {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	JavaMailSender javaMailSender;
	
	@Autowired
	MemberService memberService;
	
	
	@Autowired
	private VelocityEngineFactoryBean velocityEngineFactoryBean;
	
	
	@RequestMapping("authorityList.do")
	public List<Authority> getAuthorityList(){
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		List<Authority> authorityList = userDao.getAuthority();
		System.out.println(authorityList);
		return authorityList;
	}
	
	@RequestMapping("teamList.do")
	public List<TeamList> getTeamList(){
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		List<TeamList> teamList = userDao.getTeamList();
		return teamList;
	}
	
	@RequestMapping(value="findMail.do")
	public String findMail(HttpServletRequest req){
		String serfrom="dnjsvltm327@gmail.com";
		String tomail =req.getParameter("mail");
		String title =req.getParameter("title");
		String content=req.getParameter("content");
		
		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");
			messageHelper.setFrom(serfrom);
			messageHelper.setTo(tomail);     // 받는사람 이메일
		    messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		    messageHelper.setText(content);  // 메일 내용
			
			/* mailSender.send(message); */
		}catch(Exception e){
			System.out.println(e);
		}
		return "redirect:/mail/mailForm";
	}
	
	
	@RequestMapping(value="sendEmail.do")
	public void sendMail(HttpServletRequest req) {
		
		System.out.println("ajaxControllerAdmin sendMail() in!!!!!");
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper messageHelper = null;
		String mail = req.getParameter("mail"); //받는 사람 이메일
		
		Enumeration<String> enu = req.getParameterNames();
		while(enu.hasMoreElements()) {
			System.out.println("while");
			System.out.println(enu.nextElement());
		}
		
		System.out.println("메일주소!!!");
		System.out.println(mail);
		String name = req.getParameter("name");
		String date = new SimpleDateFormat("yyyy년 MM월 dd일 E요일").format(new Date());
		StringBuilder path = new StringBuilder();
		path.append(req.getLocalAddr());
		path.append(":");
		path.append(req.getLocalPort());
		path.append(req.getContextPath());
		path.append("/password.do");
		try {
			
			messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			Map model = new HashMap();
			model.put("mail",mail);
			model.put("name", name);
			model.put("date", date);
			model.put("path",path.toString());
	
			
			String mailBody = VelocityEngineUtils.mergeTemplateIntoString(velocityEngineFactoryBean.createVelocityEngine(), "emailTemplate.vm","UTF-8", model);
			messageHelper.setFrom("admin@dobee.com");
			messageHelper.setTo(mail);
			StringBuilder subject = new StringBuilder();
			
			subject.append(name); 
			subject.append("님 DOBEE에 사원등록이 되었습니다.");
			messageHelper.setSubject(subject.toString());
			messageHelper.setText(mailBody,true);
			System.out.println("req.getContextPath()"+req.getContextPath());
			javaMailSender.send(message);
		} catch (Exception e) {
			System.out.println("AjaxAdmin sendMail()" + e.toString());
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("getTeam.do")
	public TeamList getTeam(HttpServletRequest req, String teamCode) {
		System.out.println("AjaxControllerAdmin getTeam()");
		Enumeration enu = req.getParameterNames();
		while(enu.hasMoreElements()) {
		System.out.println(enu.nextElement());
		}
		System.out.println(teamCode);
		TeamList team = memberService.getTeam(teamCode);
		return team;
	}
	
	//아이디찾기
    @RequestMapping(value="findId.do",method=RequestMethod.GET)
    public String findId(String name, String phone){
    	 System.out.println(name);
    	 UserDao userDao = sqlSession.getMapper(UserDao.class);
    	 String find = userDao.findId(name,phone);
    	 System.out.println("값:"+find);
         return find;
    }
    
    //비밀번호 찾기
    @RequestMapping(value="findPassWord.do",method=RequestMethod.GET)
    public String findPassWord(String mail, String name){
    	System.out.println(mail);
    	System.out.println(name);
    	UserDao userDao =sqlSession.getMapper(UserDao.class);
    	String find = userDao.findPassWord(mail, name);
    	System.out.println("값:"+find);
    	return find;
    }
    
    
    //사원 정보 수정 --01.23 알파카
    @RequestMapping(value="modifyUser.do", method=RequestMethod.POST)
    public String modifyUser(User user, HttpServletRequest request) throws IOException {
    	System.out.println("수정 타니?");
    	System.out.println("수정정보 가져오니?"+user.toString());
    	Enumeration<String> enu = request.getParameterNames();
    	while(enu.hasMoreElements()) {
    		System.out.println(enu.nextElement());
    	}
    	
    	//파일 업로드 파일명
    	CommonsMultipartFile file = user.getFile();
    	String filename = file.getOriginalFilename(); //원본 파일명
    	
        String path = request.getServletContext().getRealPath("/upload");
        String fpath = path + "\\" + filename;
        		
        //파일 쓰기 작업
    	FileOutputStream fs = new FileOutputStream(fpath); // 없으면 거기다가 파일 생성함
    	fs.write(file.getBytes());
    	fs.close();
        //DB에 파일 이름 저장
    	user.setMyPic(filename);
    	
    	String responseData = "";
		int result = 0;
		result = memberService.modifyUser(user);
		if(result > 0) {
			responseData = "success";
		}
    	return responseData;
    	
    	
    }
    
    //사원 삭제 --01.23 알파카
    @RequestMapping(value="deleteUser.do", method=RequestMethod.POST)
    public String deleteUser(@RequestParam(value="mail") String mail) {
    	String responseData = "";
		int result = 0;
		result = memberService.deleteModify(mail);
		if(result > 0) {
			responseData = "success";
		}
    	return responseData;
    }
    
    
    //팀 코드 수정 -성호 
    @RequestMapping("adminTeamCodeModify.do")
    public int modifyTeamCode(@RequestParam HashMap map) {
    	int result = 0 ; 
    	System.out.println("컨트롤러 도착");
    	System.out.println("받은 데이터: " + map);
    	result = memberService.modifyTeamCode(map);
    	
    	if(result > 0) {
    		System.out.println("팀코드 수정 성공");
    	}else {
    		System.out.println("팀코드 수정 실패");
    	}
    	
    	return result;
    }
    
    
    //팀 코드 삭제 -성호
    @RequestMapping("delTeamCode.do")
    public int delTeamCode(@RequestParam(value="teamCode")int teamCode) {
    	int result = 0;
    	result = memberService.delTeamCode(teamCode);
    	if(result >0) {
    		System.out.println("팀 코드 삭제 완료");
    	}else {
    		System.out.println("팀 코드 삭제 실패");
    	}
    	return result;
    }
    
    
    //팀 코드 등록 -성호
    @RequestMapping("addTeamCode.do")
    public int addTeamCode(@RequestParam(value="teamCode")int teamCode,
    		@RequestParam(value="teamName") String teamName) {
    	int result = 0;
    	TeamList tl = new TeamList();
    	tl.setTeamCode(teamCode);
    	tl.setTeamName(teamName);
    	result = memberService.addTeamList(tl);
    	if(result >0) {
    		System.out.println("팀 코드 등록 완료");
    	}else {
    		System.out.println("팀 코드 등록 실패");
    	}
    	
    	return result;
    }
    
}


