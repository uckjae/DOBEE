package com.dobee.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.dao.UserDao;
import com.dobee.vo.member.Authority;
import com.dobee.vo.member.TeamList;


@RestController
@RequestMapping("ajax/admin/**")
public class AjaxControllerAdmin {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	JavaMailSender javaMailSender;
	
	
	@Autowired
	private VelocityEngineFactoryBean velocityEngineFactoryBean;
	
	
	@RequestMapping("authorityList.do")
	public List<Authority> getAuthorityList(){
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		List<Authority> authorityList = userDao.getAuthority();
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
}
