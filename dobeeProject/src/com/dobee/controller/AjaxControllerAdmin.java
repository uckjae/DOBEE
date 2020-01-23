package com.dobee.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.dao.UserDao;
import com.dobee.services.MemberService;
import com.dobee.vo.member.Authority;
import com.dobee.vo.member.TeamList;
import com.dobee.vo.member.User;
import com.google.common.net.MediaType;


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
	
	@RequestMapping(value="sendEmail.do")
	public void sendMail(HttpServletRequest req) {
		System.out.println("ajaxControllerAdmin sendMail() in!!!!!");
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper messageHelper = null;
		String mail = req.getParameter("mail");
		
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
		path.append("/whatthepassword.do");
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
    	 //System.out.println(user);
    	 UserDao userDao = sqlSession.getMapper(UserDao.class);
    	 String find = userDao.findId(name,phone);
    	 System.out.println("값:"+find);
         return find;
    }
    
    //사원 이미지 가져오기 @RequestParam(value="mail") String mail, HttpServletRequest request, HttpServletResponse response // new ResponseEntity<byte[]>(myPic, HttpStatus.OK)
    @RequestMapping(value="getMyPic.do", method=RequestMethod.POST)
    public String getByteImg() {
    	System.out.println("이미지 가져오기 컨트롤러 타니?");
    	//System.out.println("메일 가져와?"+mail);
    	//User user = memberService.getUserInfo(mail);
    	//byte[] myPic = user.getMyPic();
    	//response.setContentType("image/jpeg");
    	return null;
    }
    
    
    //사원 정보 수정 --01.23 알파카
    @RequestMapping(value="modifyUser.do", method=RequestMethod.POST)
    public String modifyUser(User user) {
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
    
}


