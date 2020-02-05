package com.dobee.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import com.dobee.vo.member.UserInfo;


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
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
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
	
	//사원메일발송
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
		path.append("http://");
		path.append(req.getLocalAddr());
		path.append(":");
		path.append(req.getLocalPort());
		path.append(req.getContextPath());
		path.append("/findPassWordChange.do");
		try {
			
			messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			Map model = new HashMap();
			model.put("mail",mail);
			model.put("name", name);
			model.put("date", date);
			model.put("path",path.toString());
	
			
			String mailBody = VelocityEngineUtils.mergeTemplateIntoString(velocityEngineFactoryBean.createVelocityEngine(), "emailTemplate.vm","UTF-8", model);
			messageHelper.setFrom("letsdobee@gmail.com");
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
	
	//비밀번호 찾기 메일 발송
	  @RequestMapping(value="findEmail.do",method=RequestMethod.POST)
	  public void findMail(HttpServletRequest req, HttpSession session){
	 
	 
	  /*session.setAttribute("dice", dice);
	 String di = (String)session.getAttribute("dice"); */
	  
	  MimeMessage message = javaMailSender.createMimeMessage();
	  MimeMessageHelper messageHelper = null;
	  String mail =req.getParameter("mail"); //받는 사람 이메일(작성한 이메일)
	  
	  session.setAttribute("mail", mail);
	  
	  StringBuilder path = new StringBuilder();
	  	path.append("http://");
		path.append(req.getLocalAddr());
		path.append(":");
		path.append(req.getLocalPort());
		path.append(req.getContextPath());
		path.append("/findPassWordChange.do");
	  
	  try {		  
		  messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		  Map model = new HashMap();
		  model.put("mail",mail);
		  model.put("path", path.toString());
		  String mailBody =VelocityEngineUtils.mergeTemplateIntoString(velocityEngineFactoryBean.createVelocityEngine(), "emailTemplate2.vm","UTF-8",model);	  		  
		  //이메일 내용은 emailTemplate2.vm이고 형식UTF-8
		  messageHelper.setFrom("letsdobee@gmail.com");//보내는이메일
		  messageHelper.setTo(mail); 
		  //받는이메일
		  StringBuilder subject = new StringBuilder();  
		  subject.append("DOBEE 사원비밀번호 찾기 입니다");             //이메일 제목
		  messageHelper.setSubject(subject.toString()); //이메일 제목 세팅완료
		  messageHelper.setText(mailBody,true);         //이메일 내용 세팅완료	
		  System.getProperty("line.separator");
		  javaMailSender.send(message);                //이메일 모든내용(메세지)보내기
	      
	  }catch(Exception e){
		    e.printStackTrace();
		  }
	  
	  }
	  
	//메일입력 DB 확인
	@RequestMapping(value="mailCheck.do",method=RequestMethod.GET)
	 public String findPassWord(String mail){
	   System.out.println(mail);
	   UserDao userDao =sqlSession.getMapper(UserDao.class);
	   String find = userDao.mailCheck(mail);
	   System.out.println("값:"+find);
	   return find;
	    }
	//비밀번호찾기2
	@RequestMapping(value="findPassWord2.do",method= {RequestMethod.GET, RequestMethod.POST})
	 public String findPassWord2(String mail){
	     System.out.println("mail"+mail);
	     UserDao userDao =sqlSession.getMapper(UserDao.class);
	     String find = userDao.findPassWord2(mail);
	     System.out.println("값:"+find);
	     return find;
	    }
	//비밀번호 변경
	@RequestMapping(value="passwordChange.do",method=RequestMethod.POST)
	public String passwordChange(User user,HttpServletRequest request) {
	    System.out.println("비밀번호 들어오나?: ");
	    
	    Enumeration<String> enu = request.getParameterNames();
	    while(enu.hasMoreElements()) {
	    	System.out.println(enu.nextElement());
	    }
	    String mail = request.getParameter("mail");
	    System.out.println("메일"+mail);
	    
	    UserDao userDao =sqlSession.getMapper(UserDao.class);
	    
	    String inputpass =user.getPassword();
	    String password = bCryptPasswordEncoder.encode(inputpass);
	    user.setPassword(password);
	    
	    String find =userDao.passwordChange(password, mail);
	    
	    System.out.println("find 비밀번호 변경: "+find);
	    return find;
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
    
    //사원 정보 수정 --01.23 알파카
    @RequestMapping(value="modifyUser.do", method=RequestMethod.POST)
    public String modifyUser(User user, HttpServletRequest request) throws IOException {
    	System.out.println("수정 타니?");
    	System.out.println("수정정보 가져오니?"+user.toString());
    	
    	
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
		System.out.println(result);
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
    
    
    // 팀 등록에서 이메일 중복 확인 해주는 아작스
    @RequestMapping("checkEmail.do")
    public ArrayList<UserInfo> checkEmail(@RequestParam(value="mail") String mail) {
    	System.out.println(" 이메일 중복 컨트롤로 오냐 : " + mail);
    	ArrayList<UserInfo> list = new ArrayList<>();
    	list = memberService.checkEmail(mail);
    	
    	return list;
    };
}


