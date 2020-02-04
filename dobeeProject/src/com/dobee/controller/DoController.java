package com.dobee.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dobee.dao.NoticeDao;
import com.dobee.dao.UserDao;
import com.dobee.services.ApplyService;
import com.dobee.services.ChatService;
import com.dobee.services.DebitService;
import com.dobee.services.GoogleVisionService;
import com.dobee.services.MemberService;
import com.dobee.services.NoticeService;
import com.dobee.services.ProjectService;
import com.dobee.services.ScheduleService;
import com.dobee.vo.Apply;
import com.dobee.vo.Debit;
import com.dobee.vo.chat.ChatRoom;
import com.dobee.vo.member.BreakManageList;
import com.dobee.vo.member.TeamList;
import com.dobee.vo.member.User;
import com.dobee.vo.notice.Notice;
import com.dobee.vo.notice.NoticeFile;
import com.dobee.vo.project.Project;
import com.dobee.vo.project.Task;
import com.dobee.vo.project.UpcomingTask;
import com.dobee.vo.schedule.NotSchedule;
import com.dobee.vo.schedule.Schedule;


@Controller
public class DoController {
	
	public DoController() {
		System.out.println("일단 컨트롤 오나 보자");
	}
	
    @Autowired
    private SqlSession sqlsession;
    
    @Autowired
    private ProjectService projectService;
    
    @Autowired
    private ApplyService applyService;
    
    @Autowired
    private ChatService chatService;
    
    @Autowired
    private MemberService memberService;
    
    @Autowired
    private DebitService debitService;
    
    @Autowired
    private NoticeService noticeService;
    
    @Autowired
    private ScheduleService scheduleService;
    

    //로그인
    @RequestMapping("login.do")
    public String login(){
        return "main/login";
    }
    
    
    //권한없음 페이지
    @RequestMapping("noAuth.do")
    public String noAuth() {
    	return "main/noAuthority";
    }
  
    //아이디찾기
    @RequestMapping(value="findId.do",method=RequestMethod.GET)
    public String findId(){
      return "main/findId";
    }
    
    //비밀번호 찾기(이메일 보내기)
    @RequestMapping(value="findPassWord2.do",method={RequestMethod.GET, RequestMethod.POST})
    public String findPassWord2(){
        return "main/findPassWord2";
    }
    //비밀번호 찾기(변경)
    @RequestMapping(value="findPassWordChange.do",method={RequestMethod.GET, RequestMethod.POST})
    public String findPassWordChange(HttpSession session){
    	String mail = (String) session.getAttribute("mail");
    	System.out.println("메일?"+mail);
        return "main/findPassWordChange";
    }
    

    //비밀번호재설정
    //public String resetPwd(){
    //  return null;
    //}
    
    @RequestMapping("password.do")
    public String resetPwd(HttpServletRequest req, Model model){
    	System.out.println("DoController resetPwd() in!!");
    	System.out.println(req.getParameter("mail"));
    	UserDao userDao = sqlsession.getMapper(UserDao.class);
    	User user = userDao.getUser(req.getParameter("mail"));
    	System.out.println(user.toString());
    	model.addAttribute("user", user);
        return "main/emailPwdReset";
    }

    @RequestMapping("resetPwdResult.do")
    public String resetPwdResult(User user){
        System.out.println("DoController resetPwdResult() in!!");
        System.out.println(user.toString());
        memberService.resetPwd(user);
    	return "redirect: index.jsp";
    }


    //메인페이지(로그인후)
    @RequestMapping("main.do")
    public String main(Principal principal , HttpServletRequest request, Model model){
    	System.out.println("컨트롤러 main.do");
    	User user = (User) request.getSession().getAttribute("user");
    	model.addAttribute("user", user);
    	
    	//출근한 팀원 가져오기~!~! 02.03 알파카
    	List<User> onWorkTeamMemberList = memberService.getOnWorkTeamMember(user);
    	model.addAttribute("onWorkTeamMemberList", onWorkTeamMemberList);
    	
    	// 마감임박 업무 리스트 GET			0131 게다죽 	~ing
    	List<UpcomingTask> utList = projectService.getUpcomingTask(principal.getName());
    	System.out.println("utList : "+ utList);
    	model.addAttribute("utList", utList);
    	
    	//공지사항 최신글 가져오기 02.03 알파카
    	List<Notice> recentNoticeList = noticeService.getRecentNotice();
    	model.addAttribute("recentNoticeList", recentNoticeList);
    	
    	//로그인한 회원이 참여 중인 프로젝트 중 진행중인 목록 가져오기
    	List<Project> pjtList = projectService.getInProgressPjtList(user.getMail()); //특정 회원이 속한 프로젝트 리스트 가져오기
    	model.addAttribute("pjtList",pjtList);
    	
    	//로그인한 회원이 참여 중인 프로젝트 중 진행률 가져오기
    	Map<String, Integer> progressRate = new HashMap<String, Integer>(); //프로젝트 이름이 key, 진행률이 value
    	//List<Task> allTaskList = null;
    	int result = 0;
    	for(int i = 0; i<pjtList.size(); i++) {
    		result = projectService.getPjtProgressRate(pjtList.get(i).getPjtSeq());
    		progressRate.put(pjtList.get(i).getPjtName(), result);
    	}
    	System.out.println("맵은요?"+progressRate);
    	model.addAttribute("progressRate",progressRate);
    	
        return "main/main";
    }

    //관리자 메인전 경고화면
    @RequestMapping("adminWarnig.do")
    public String adminWarning() {
    	return "admin/AdminWarning";
    }
    
    
    //관리자 메인
    @RequestMapping("adminMain.do")
    public String adminMain(HttpServletRequest request, Model model) {
    	User user = (User) request.getSession().getAttribute("user");
    	UserDao userDao = sqlsession.getMapper(UserDao.class);
    	List<User> userInfoList = userDao.getUserInfoList();
    	model.addAttribute("user", user);
    	model.addAttribute("userList", userInfoList);
    	return "admin/AdminMain";
    }
    
    
    //관리자 법인카드등록 뷰단 이동
    @RequestMapping(value="AdminDebit.do",method=RequestMethod.GET)
    public String adminAddDebit() {
    	return "admin/AddDebit";
    }
    

    //관리자 법인카드 목록 뷰단이동 및 불러오기
    @RequestMapping(value="ListDebit.do",method=RequestMethod.GET)
    public ModelAndView adminListDebit() {
    	ModelAndView mav = new ModelAndView();
    	ArrayList debitList = debitService.listDebit();
    	mav.addObject("debitList", debitList);
    	mav.setViewName("admin/ListDebit");
    	return mav;
    }
    
    
    //관리자 법인카드 디비에 등록
    @ResponseBody
    @RequestMapping(value="AdminDebit.do",method=RequestMethod.POST)
    public int adminAddDebitOK(@RequestParam(value="cardNum") String cardNum,
    		@RequestParam(value="corp") String corp,
    		@RequestParam(value="name") String name,
    		@RequestParam(value="nickName") String nickName,
    		@RequestParam(value="entry") String entry,
    		@RequestParam(value="valDate") String valDate) {
    	System.out.println("일단 컨트롤러 타는지 확인 ");
    	int result = 0;
    	Debit list = new Debit();
    	list.setCardNum(cardNum);
    	list.setCorp(corp);
    	list.setEntry(entry);
    	list.setName(nickName);
    	list.setNickName(nickName);
    	list.setValDate(valDate);
    	
    	
    	System.out.println("컨트롤단 : 받은 데이터 : " + list);
    	boolean check = debitService.addDebit(list);
    	
    	if(check) {
    		System.out.println("컨트롤단  : 법인카드 등록 성공");
    		result = 1;
    	}else {
    		result = 0;
    		System.out.println("컨트롤단 : 법인카드 등록 실패");
    	}
    	//return "redirect:ListDebit.do";
    	return result;
    }
    
    
    //회사 일정등록
    //@RequestMapping(value = "", method = RequestMethod.POST)
    public String addSchedule(){
        return null;
    }


    //마이페이지
    @RequestMapping(value = "mypage.do", method = RequestMethod.GET)
    public String mypage(Principal principal, Model model){
    	//회원 정보 가져오기
    	String mail = principal.getName();
    	User user = memberService.getUserInfo(mail);
    	model.addAttribute("user", user);
        return "myPage/myPage";
    }
    
    
    //공지사항리스트
    @RequestMapping("noticeList.do")
    public String noticeList(Notice notice, HttpServletRequest request, Model model){
    	User user = (User) request.getSession().getAttribute("user");
		List<Notice>list=null;
		NoticeDao noticedao=sqlsession.getMapper(NoticeDao.class);
		list=noticedao.noticeList(notice);
		System.out.println(list);
		model.addAttribute("list",list);
		
		//로그인한 회원이 참여 중인 프로젝트 목록 가져오기
		List<Project> pjtList = projectService.getInProgressPjtList(user.getMail()); //특정 회원이 속한 프로젝트 리스트 가져오기
    	model.addAttribute("pjtList",pjtList);
    
        return "notice/noticeList";
    }


    //공지사항상세보기 value="noticeWrite.do",method=RequestMethod.POST
    @RequestMapping(value="noticeDetail.do", method=RequestMethod.GET)
    public String noticeDetail(@RequestParam(value="notSeq") int notSeq, HttpServletRequest request, Model model){
        Notice notice = null; 
        NoticeFile nf = null;
        NotSchedule ns = null;
        Schedule sc = null;
        
        User user = (User) request.getSession().getAttribute("user");
        //로그인한 회원이 참여 중인 프로젝트 목록 가져오기
        List<Project> pjtList = projectService.getInProgressPjtList(user.getMail()); //특정 회원이 속한 프로젝트 리스트 가져오기
    	model.addAttribute("pjtList",pjtList);
    	
        int noticeCount = 0;
                        
        //조회수 올리기
        noticeCount = noticeService.updateNoticeCount(notSeq);
        
        //DB에서 글 가져오기
        notice = noticeService.getNotice(notSeq);
        model.addAttribute("notice", notice);
        
        //DB에서 파일 가져오기
        nf = noticeService.getNoticeFile(notSeq);
        if(nf !=null) {
            model.addAttribute("nf", nf);
        } else {
        	model.addAttribute("nf", null);
        }

        //DB에서 공지사항 일정 가져오기
        ns = noticeService.getNotSchedule(notSeq);
        
        if(ns !=null) {
        	model.addAttribute("ns", ns);
            sc = scheduleService.getSchedule(ns.getSchSeq());
            model.addAttribute("sc", sc);
        } else {
        	model.addAttribute("ns", null);
        	model.addAttribute("sc", null);
        }
        
       
        return "notice/noticeDetail";
    }
    
    //공지사항 파일 다운로드 noticeDownload.do
    @RequestMapping(value="noticeDownload.do")
    public void noticeDownload(@RequestParam(value="p") String p, @RequestParam(value="f") String f, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		/*
		 * //한글 처리 형식 지정 String sEncoding = new
		 * String(filename.getBytes("euc-kr"),"8859_1");
		 * response.setHeader("Content-Disposition","attachment;filename= " +
		 * sEncoding);
		 * //response.setHeader("Content-Disposition","attachment;filename= " + filename
		 * +";");
		 */
		// 한글 파일명 처리 (Filtter 처리 확인) -> 경우 ...
		// 한글 파일 깨짐 현상 해결하기
		// String fname = new String(f.getBytes("ISO8859_1"),"UTF-8");
		String fname = new String(f.getBytes("euc-kr"), "8859_1");
		// 다운로드 기본 설정 (브라우져가 read 하지 않고 ... 다운 )
		// 요청 - 응답 간에 헤더정보에 설정을 강제 다운로드
		// response.setHeader("Content-Disposition", "attachment;filename=" +
		// new String(fname.getBytes(),"ISO8859_1"));
		response.setHeader("Content-Disposition", "attachment;filename=" + fname + ";");
		// 파일명 전송
		// 파일 내용전송
		String fullpath = request.getServletContext().getRealPath(p + "/" + f);
		FileInputStream fin = new FileInputStream(fullpath);
		// 출력 도구 얻기 :response.getOutputStream()
		ServletOutputStream sout = response.getOutputStream();
		byte[] buf = new byte[1024]; // 전체를 다읽지 않고 1204byte씩 읽어서
		int size = 0;
		while ((size = fin.read(buf, 0, buf.length)) != -1) // buffer 에 1024byte
		// 담고
		{ // 마지막 남아있는 byte 담고 그다음 없으면 탈출
			sout.write(buf, 0, size); // 1kbyte씩 출력
		}
		fin.close();
		sout.close();
	}
    


    //공지사항글쓰기 view 페이지
    @RequestMapping(value="noticeWrite.do",method=RequestMethod.GET)
    public String noticeWrite(HttpServletRequest request, Model model){
    	User user = (User) request.getSession().getAttribute("user");
        //로그인한 회원이 참여 중인 프로젝트 목록 가져오기
    	List<Project> pjtList = projectService.getInProgressPjtList(user.getMail()); //특정 회원이 속한 프로젝트 리스트 가져오기
    	model.addAttribute("pjtList",pjtList);
    	
        return "notice/noticeWrite";
    }
    
    //공지사항글쓰기 처리 
    @RequestMapping(value="noticeWrite.do",method=RequestMethod.POST)
    public String noticeWrite(Notice n, NoticeFile nf, Schedule sc, NotSchedule ns, HttpServletRequest request) throws IOException {
    	
    	System.out.println("파일 어떻게 들어와?"+nf);
    	System.out.println("파파파파일"+nf.getFile());
    	
    	//공지사항 글 DB 넣기
    	int notSeq = noticeService.noticeWrite(n); //서비스 리턴 값으로 notice의 seq를 가져옴
    	
    	//파일 업로드 파일명
    	CommonsMultipartFile file = nf.getFile();
    	String filename = file.getOriginalFilename(); //원본 파일명
    	System.out.println("파일 업로드 안하면 어케 됨?"+nf);
    	System.out.println("파일 이름?"+filename);
    	//공지사항 파일을 업로드한 경우
    	if(!( filename == null || filename.trim().equals("") )) {
        	String path = request.getServletContext().getRealPath("/upload");
        	String fpath = path + "\\" + filename;
        		
        	//파일 쓰기 작업
        	FileOutputStream fs = new FileOutputStream(fpath); // 없으면 거기다가 파일 생성함
        	fs.write(file.getBytes());
        	fs.close();
        		
        	//DB에 파일 이름 저장
        	nf.setOrgName(filename);
        	UUID randomIdMulti = UUID.randomUUID();
        	String saveName = filename+"_"+randomIdMulti;
        	System.out.println("저장될 파일 이름?"+saveName);
        	nf.setSaveName(saveName);
        
        	//공지사항 글번호 주입
        	nf.setNotSeq(notSeq);
        	
        	int result = noticeService.noticeFileWrite(nf);
        	if(result > 0) {
        		System.out.println("공지사항 파일 업로드 완료");
        	}
    	}
    	
    	//공지사항 일정을 입력한 경우
    	if(!(sc.getStartTime() == null && sc.getEndTime() == null)) {
    		
    		int result = scheduleService.addSchedule(sc); 
    		
    		if(result > 0) { //DB에 잘 저장됨
    			System.out.println("스케쥴 등록 완료");
    			int schSeq = result;
    			ns.setSchSeq(schSeq);
    			//공지사항 일정 등록
    			
    			ns.setNotSeq(notSeq); //공지사항 글 번호 주입
    			int result2 = noticeService.addNotSchedule(ns);
    			
    			if(result2 > 0) {
    				System.out.println("공지사항 일정 등록 완료");
    			}
    			
    		}
    	}    	
    	return "redirect:noticeList.do"; //들어주는 주소 ...
    }


    //공지사항수정하기 view
    @RequestMapping(value="noticeModify.do",method=RequestMethod.GET)
    public String noticeModify(@RequestParam(value="notSeq") int notSeq, HttpServletRequest request, Model model){
    	Notice notice = null; 
        NoticeFile nf = null;
        NotSchedule ns = null;
        Schedule sc = null;
        
        User user = (User) request.getSession().getAttribute("user");
        //로그인한 회원이 참여 중인 프로젝트 목록 가져오기
        List<Project> pjtList = projectService.getInProgressPjtList(user.getMail()); //특정 회원이 속한 프로젝트 리스트 가져오기
    	model.addAttribute("pjtList",pjtList);
    	
    	
        
        //DB에서 글 가져오기
        notice = noticeService.getNotice(notSeq);
        model.addAttribute("notice", notice);
        
        //DB에서 파일 가져오기
        nf = noticeService.getNoticeFile(notSeq);
        if(nf !=null) {
            model.addAttribute("nf", nf);
        } else {
        	model.addAttribute("nf", null);
        }

        //DB에서 공지사항 일정 가져오기
        ns = noticeService.getNotSchedule(notSeq);

        if(ns !=null) {
        	model.addAttribute("ns", ns);
            sc = scheduleService.getSchedule(ns.getSchSeq());
            model.addAttribute("sc", sc);
        } else {
        	model.addAttribute("ns", null);
        	model.addAttribute("sc", null);
        }
        
    	return "notice/noticeModify";
    }
    
    //공지사항수정하기 처리
    @RequestMapping(value="noticeModify.do",method=RequestMethod.POST)
    public String noticeModify(@RequestParam(value="notSeq") String notSeq, Notice n, NoticeFile nf, Schedule sc, NotSchedule ns, HttpServletRequest request) throws IOException {
    	System.out.println("수정 타니?");
    	System.out.println("파일 가져와?"+nf);
    	//서비스 연결 >> 제목 & 내용 수정
    	
    	int noticeModify = noticeService.noticeModify(n);
    	
    	CommonsMultipartFile file = nf.getFile();
    	String filename = file.getOriginalFilename(); //원본 파일명
    	System.out.println("파일이름?"+filename);
    	
    	//원래 있었는지 없었는지 확인 후 있으면 update, 없으면 insert
    	String fileExists = request.getParameter("fileExists");
    	String notScheduleExists = request.getParameter("notScheduleExists");
    	String fileNameExists = request.getParameter("fileNameExists");
    	
    	System.out.println("스팬 테그 값 나와?"+fileNameExists);
    	//공지사항 파일 업로드 하기
    	if(!( filename == null || filename.trim().equals("") )) {
    		String path = request.getServletContext().getRealPath("/upload");
        	String fpath = path + "\\" + filename;
        		
        	//파일 쓰기 작업
        	FileOutputStream fs = new FileOutputStream(fpath); // 없으면 거기다가 파일 생성함
        	fs.write(file.getBytes());
        	fs.close();
        		
        	//DB에 파일 이름 저장
        	nf.setOrgName(filename);
        	UUID randomIdMulti = UUID.randomUUID();
        	String saveName = filename+"_"+randomIdMulti;
        	//System.out.println("저장될 파일 이름?"+saveName);
        	nf.setSaveName(saveName);
        
        	//공지사항 글번호 주입
        	nf.setNotSeq(n.getNotSeq());
        	
    		if(fileExists.equals("true")) { //원래 파일을 업로드했던 경우 -> update하기
            	int result = noticeService.noticeFileModify(nf);
            	if(result > 0) {
            		System.out.println("공지사항 파일 update 완료");
            	}
        	} else { //새로 파일을 업로드 한 경우 -> insert 하기
        		System.out.println("새로 파일 업로드 하니?");
        		int result = noticeService.noticeFileWrite(nf);
            	if(result > 0) {
            		System.out.println("공지사항 파일 insert 완료");
            	}
        		
        	}
    	} else { //파일 업로드를 하지 않는 경우
    		System.out.println("파일 업로드 안할거니?");
    		
    		
    	}
    	
    	//공지사항 일정을 입력한 경우
    	if(!(sc.getStartTime() == null && sc.getEndTime() == null)) {
    		if(notScheduleExists.equals("true")) { //기존 일정이 있던 경우 -> update
    			//스케쥴 update
    			int result = scheduleService.scheduleModify(sc);
    			//일정 내용 update
    			if( result > 0 ) {
    				System.out.println("스케쥴 update 완료");
    				int result2 = noticeService.notScheduleModify(ns);
    				
    				if(result2 > 0) {
        				System.out.println("공지사항 일정 update 완료");
        			}
    			}
    			
    		} else { //새로 일정을 추가한 경우 -> insert
    			int result = scheduleService.addSchedule(sc); 
        		if(result > 0) { //DB에 잘 저장됨
        			System.out.println("스케쥴 insert 완료");
        			int schSeq = result;
        			ns.setSchSeq(schSeq);
        			//공지사항 일정 등록
        			ns.setNotSeq(n.getNotSeq()); //공지사항 글 번호 주입
        			int result2 = noticeService.addNotSchedule(ns);
        			
        			if(result2 > 0) {
        				System.out.println("공지사항 일정 insert 등록 완료");
        			}
        		}
    		}
    	}
		return "redirect:noticeDetail.do?notSeq="+n.getNotSeq();
    }
    /*
    
    //공지사항수정하기 처리
    @RequestMapping(value="noticeModify.do",method=RequestMethod.POST)
    public String noticeModify(@RequestParam(value="notSeq") String notSeq, Notice n, NoticeFile nf, Schedule sc, NotSchedule ns, HttpServletRequest request) throws IOException {
    	System.out.println("수정 타니?");
    	//서비스 연결 >> 제목 & 내용 수정
    	int noticeModify = noticeService.noticeModify(n);
    	
    	CommonsMultipartFile file = nf.getFile();
    	String filename = file.getOriginalFilename(); //원본 파일명
    	System.out.println("파일이름?"+filename);
    	
    	//원래 있었는지 없었는지 확인 후 있으면 update, 없으면 insert
    	String fileExists = request.getParameter("fileExists");
    	String notScheduleExists = request.getParameter("notScheduleExists");
    	String fileNameExists = request.getParameter("fileNameExists");
    	
    	System.out.println("스팬 테그 값 나와?"+fileNameExists);
    	//공지사항 파일 업로드 하기
    	if(!( filename == null || filename.trim().equals("") )) {
    		String path = request.getServletContext().getRealPath("/upload");
        	String fpath = path + "\\" + filename;
        		
        	//파일 쓰기 작업
        	FileOutputStream fs = new FileOutputStream(fpath); // 없으면 거기다가 파일 생성함
        	fs.write(file.getBytes());
        	fs.close();
        		
        	//DB에 파일 이름 저장
        	nf.setOrgName(filename);
        	UUID randomIdMulti = UUID.randomUUID();
        	String saveName = filename+"_"+randomIdMulti;
        	//System.out.println("저장될 파일 이름?"+saveName);
        	nf.setSaveName(saveName);
        
        	//공지사항 글번호 주입
        	nf.setNotSeq(n.getNotSeq());
        	
    		if(fileExists.equals("true")) { //원래 파일을 업로드했던 경우 -> update하기
            	int result = noticeService.noticeFileModify(nf);
            	if(result > 0) {
            		System.out.println("공지사항 파일 update 완료");
            	}
        	} else { //새로 파일을 업로드 한 경우 -> insert 하기
        		System.out.println("새로 파일 업로드 하니?");
        		int result = noticeService.noticeFileWrite(nf);
            	if(result > 0) {
            		System.out.println("공지사항 파일 insert 완료");
            	}
        		
        	}
    	} else { //파일 업로드를 하지 않는 경우
    		System.out.println("파일 업로드 안할거니?");
    		
    		
    	}
    	
    	//공지사항 일정을 입력한 경우
    	if(!(sc.getStartTime() == null && sc.getEndTime() == null)) {
    		if(notScheduleExists.equals("true")) { //기존 일정이 있던 경우 -> update
    			//스케쥴 update
    			int result = scheduleService.scheduleModify(sc);
    			//일정 내용 update
    			if( result > 0 ) {
    				System.out.println("스케쥴 update 완료");
    				int result2 = noticeService.notScheduleModify(ns);
    				
    				if(result2 > 0) {
        				System.out.println("공지사항 일정 update 완료");
        			}
    			}
    			
    		} else { //새로 일정을 추가한 경우 -> insert
    			int result = scheduleService.addSchedule(sc); 
        		if(result > 0) { //DB에 잘 저장됨
        			System.out.println("스케쥴 insert 완료");
        			int schSeq = result;
        			ns.setSchSeq(schSeq);
        			//공지사항 일정 등록
        			ns.setNotSeq(n.getNotSeq()); //공지사항 글 번호 주입
        			int result2 = noticeService.addNotSchedule(ns);
        			
        			if(result2 > 0) {
        				System.out.println("공지사항 일정 insert 등록 완료");
        			}
        		}
    		}
    	}    
		return "redirect:noticeDetail.do?notSeq="+n.getNotSeq(); // "redirect:noticeDetail.do?notSeq="+n.getNotSeq();들어주는 주소 ...
    }
    */


    // 개인_부재일정신청 GET 0110           게다죽
    @RequestMapping(value="breakApply.do", method=RequestMethod.GET)
    public String absApply(HttpServletRequest request, Model model){
    	//로그인한 회원이 참여 중인 프로젝트 목록 가져오기
    	User user = (User) request.getSession().getAttribute("user");
    	List<Project> pjtList = projectService.getInProgressPjtList(user.getMail()); //특정 회원이 속한 프로젝트 리스트 가져오기
    	model.addAttribute("pjtList",pjtList);
        return "attend/breakApply";
    }
    
   
    
    
    // 개인_부재일정 수정/삭제 GET                0120    COMPLETE
    @RequestMapping(value="editApply.do", method=RequestMethod.GET)
    public String getEditApply (HttpServletRequest request, Model model, Apply apply, Authentication auth, Integer aplSeq) {
    	//로그인한 회원이 참여 중인 프로젝트 목록 가져오기
    	User user = (User) request.getSession().getAttribute("user");
    	List<Project> pjtList = projectService.getInProgressPjtList(user.getMail()); //특정 회원이 속한 프로젝트 리스트 가져오기
    	model.addAttribute("pjtList",pjtList);
    	
    	apply.setAplSeq(aplSeq);
        apply.setDrafter(auth.getName());
        BreakManageList results = applyService.getBMLforEdit(apply);
        model.addAttribute("editApplyList", results);
        
        return "attend/breakApplyEdit";
    }
    
    
    // 개인_부재일정 수정 POST      0121 COMPLETE
    @RequestMapping(value="postEditApply.do", method = RequestMethod.POST)
    public String postEditApply (BreakManageList bml, Integer aplSeq, Authentication auth) {
        bml.setDrafter(auth.getName());
        bml.setAplSeq(aplSeq);
        int results = applyService.postEditApply(bml);
        
        return "redirect: editApply.do";
    }
    
    
    // 개인_부재일정 삭제 POST          0120    COMPLETE
    @RequestMapping(value="deleteApply.do", method=RequestMethod.GET)
    public String postDeleteApply (Integer aplSeq) {
        applyService.deleteApply(aplSeq);
        
        return "reidrect: attend/breakManage";    
    }


    // 연장근무 신청 GET          0110 게다죽
    @RequestMapping(value = "extendApply.do", method=RequestMethod.GET)
    public String overTiemApply(){
    	
        
        return "attend/extendApply";
    }
    
    
    


    // 개인_부재일정관리 GET            0112 게다죽        COMPLETE 0116
    @RequestMapping(value="breakManage.do", method=RequestMethod.GET)
    public String absMg(Model model, Authentication auth){
        List<BreakManageList> results = applyService.absMg(auth.getName());
        model.addAttribute("brkList", results);
        
        return "attend/breakManage";
    }
    

    // 개인_근무내역관리/확인 GET         0121 게다죽        ~ing....???                 &&&&&&&&&&&&&&&& 차트 어째함? ㄹㅇ 모르겠
    @RequestMapping(value="workManage.do", method=RequestMethod.GET)
    public String getExtList(Model model, Authentication auth){
        List<Apply> results = applyService.getExtList(auth.getName());
        model.addAttribute("extList", results);

        return "attend/workManage";
    }
    
    
    // 개인_연장근무 신청 수정 Page GET       0121 게다죽        COMPLETE
    @RequestMapping(value="editExtApply.do", method=RequestMethod.GET)
    public String getEditExtList (Model model, Apply apply, Authentication auth, Integer aplSeq) {
        apply.setAplSeq(aplSeq);
        apply.setDrafter(auth.getName());
        Apply results = applyService.getELforEdit(apply);
        model.addAttribute("ELforEdit", results);
        
        return "attend/extApplyEdit";
    }
    
    
    // 개인_연장근무 신청 수정 Page POST      0121 게다죽        COMPLETE
    @RequestMapping(value="postEditExtApply.do", method = RequestMethod.POST)
    public String postEditExtList (Apply apply, Integer aplSeq, Authentication auth) {
        apply.setAplSeq(aplSeq);
        apply.setDrafter(auth.getName());
        int result = applyService.postEditExtApply(apply);
        
        return "redirect: workManage.do";
    }
    
    
    // 개인_연장근무 신청 삭제 POST       0121 게다죽        COMPLETE
    @RequestMapping(value="deleteExtApply.do", method=RequestMethod.GET)
    public String postDeleteExtList (Integer aplSeq) {
        int result = applyService.postDeleteExtList(aplSeq);
        
        return "redirect: workManage.do";
    }


    // 매니저_부재관리 - isAuth update GET     0204 updated 게다죽
    @RequestMapping(value="absManage.do", method=RequestMethod.GET)
    public String absSign(Model model, HttpServletRequest req){
    	User user = (User) req.getSession().getAttribute("user");
    	int teamCode = user.getTeamCode();
        List<BreakManageList> results = applyService.breakListMgr(teamCode);
        model.addAttribute("brkListMgr", results);
        
        return "attend/breakManagement_Mgr";
    }


    // 매니저_부재관리 - isAuth update POST        0115 게다죽
    @RequestMapping(value="absManage.do", method=RequestMethod.POST)
    public String absReqHandle(Apply apply) {
        System.out.println("이거 봐바 : " + apply.toString());
        applyService.absReqHandle(apply);
        
        return "redirect: absManage.do";
    }
    

    // 매니저_연장근무관리 리스트 - isAuth update GET           0204 updated 게다죽
    @RequestMapping(value="extManage.do", method=RequestMethod.GET)
    public String extSign(Model model, HttpServletRequest req){
    	User user = (User) req.getSession().getAttribute("user");
    	int teamCode = user.getTeamCode();
        List<BreakManageList> results = applyService.extListMgr(teamCode);
        model.addAttribute("extListMgr", results);
        
        return "attend/extendManagement_Mgr";
    }
    
    
    // 매니저_연장근무관리 리스트 - isAuth update POST          0115 게다죽
    @RequestMapping(value="extManage.do", method=RequestMethod.POST)
    public String extReqHandle(Apply apply){
        applyService.extReqHandle(apply);
        
        return "redirect: extManage.do";
    }


    //카드관리 리스트
    public String debitList(){
        return null;
    }


    //카드관리 카드추가
    public String addDebit(){
        return null;
    }

    
    //비용정산신청 뷰단 화면 이동
    @RequestMapping("receiptRegit.do")
    public String receiptReg(){
    	System.out.println("receiptRegit.do.do 요청했음");
        return "payment/receiptRegit";
    }


    //비용정산신청 영수증사진으로  google Vision API 요청
    @RequestMapping("goVision.do")
    public String goGoogleApi(){
    	System.out.println("goGoogleApi 함수요청");
    	GoogleVisionService vision = new GoogleVisionService();
    	
    	System.out.println(" vision 서비스단 통과");
    	
    	
    	
        return null;
    }
    
    
    
    
    
    
    //비용정산신청 vision 으로 부터 읽어온 text수정까지 하고 최종 확인
    public String receiptConfirm(){
        return null;
    }


    //비용처리
    public String paymentSignList(){
        return null;
    }


    //비용처리승인
    public String paymentSignApprov(){
        return null;
    }


    //프로젝트메인
    @RequestMapping("pjtMain.do")
    public String projectList(Model model, HttpServletRequest request){
    	User user = (User) request.getSession().getAttribute("user");
    	List<Project> inProgressPjtList = null;
    	List<Project> completedPjtList = null;
    	//권한 코드에 따라서 뿌리는 값 다르게 하기
    	if(user.getAuthCode() == 3) { // PM 회원인 경우
    		inProgressPjtList = projectService.getAllInProgressPjtList(); //진행중인 모든 프로젝트 리스트
    		completedPjtList = projectService.getAllCompletedPjtList(); //완료된 모든 프로젝트 리스트
    		
    	} else { //일반 회원인 경우
    		inProgressPjtList = projectService.getInProgressPjtList(user.getMail()); //특정 회원이 속한 진행중인 프로젝트 리스트 가져오기
    		completedPjtList = projectService.getCompletedPjtList(user.getMail()); //특정 회원의 완료된 프로젝트 리스트 가져오기
    	}
    	model.addAttribute("inProgressPjtList", inProgressPjtList);
    	model.addAttribute("completedPjtList", completedPjtList);
    	
    	//로그인한 회원이 참여 중인 프로젝트 중 진행중인 목록 가져오기
    	List<Project> pjtList = projectService.getInProgressPjtList(user.getMail()); //특정 회원이 속한 프로젝트 리스트 가져오기
    	model.addAttribute("pjtList",pjtList);
   
        return "project/pjtMain_new";
    }


    //칸반보드 메인 불러오기
    @RequestMapping("pjtKanban.do")
    public String kanban(@RequestParam(value="pjtSeq") String pjtSeq, Model model, HttpServletRequest request){
    	
    	System.out.println("Docontorller kanban()");
    	int seq = Integer.parseInt(pjtSeq);
    	Project project = projectService.getProject(seq);
    	List<Task> taskList = projectService.taskList(seq);
    	List<User> pjtMember = projectService.getPjtMember(seq);
    	User user = (User) request.getSession().getAttribute("user"); //로그인한 사람!
    	
    	System.out.println("로그인한 사람 나와!"+user.toString());
    	
    	//List<Project>list = projectService.projectList(user.getMail()); //이 회원이 속한 포로젝트 중 현재 진행중인 프로젝트 가져오기
    	
    	//로그인한 회원이 참여 중인 프로젝트 목록 가져오기
    	List<Project> pjtList = projectService.getInProgressPjtList(user.getMail()); //특정 회원이 속한 프로젝트 리스트 가져오기
    	model.addAttribute("pjtList",pjtList);
    	

    	model.addAttribute("user",user);
    	
    	JSONArray jsonArray = new JSONArray();
    	jsonArray.addAll(taskList);
    	model.addAttribute("project", project);
    	model.addAttribute("taskList", jsonArray);
    	model.addAttribute("pjtMember", pjtMember);
    	
        return "project/pjtKanban_new_final";
        
        
    }
    
    
    //업무생성
    @RequestMapping("addPMTask.do")
    public String addPMTask(Task task){
    	
    	int result = projectService.addPMTask(task);
    	return "redirect: pjtKanban.do?pjtSeq="+task.getPjtSeq();
    }


    //업무수정 -- 01.28 알파카 수정
    @RequestMapping("taskEdit.do")
    public String taskEdit(Task task, Schedule sc, HttpServletRequest req){
    	System.out.println("DoController taskEdit() in!!");
    	System.out.println("수정 타자!!!");
    	
    	task.setTitle(req.getParameter("title"));
    	task.setProgress(req.getParameter("progress"));
    	System.out.println(task.toString());
    	int editTaskResult = 0;
    	int result1 = 0;
    	int result2 = 0;
    	int result3 = 0;
    	String view = "";
    	String result = "";
    	
    	editTaskResult = projectService.editTask(task); //업무 수정
    	
    	//기존에 일정이 있으면 -> UPDATE / 기존에 일정이 없으면 -> INSERT
    	//프로젝트 업무 일정 테이블에 업무 일정 번호가 있는지 없는지 체크
    	if(task.getTsSeq() != 0) { //업무 일정 번호가 있으면 -> update
    		//일정 업데이트
    		result1 = scheduleService.scheduleModify(sc);
    		result = "success";
    	} else {
    		result2 = scheduleService.addSchedule(sc); //일정 추가하기
    		result3 = scheduleService.addTaskSchedule(task.getPjtSeq(), sc.getSchSeq(), task.getTskSeq()); //프로젝트 업무 일정 추가하기
    		result = "success";
    	}
        
        if(editTaskResult > 0 && result == "success") {
        	view = "redirect: pjtKanban.do?pjtSeq="+task.getPjtSeq();
        } else {
        	view = "pjtMain.do";
        }
    	return view;
    }


    //업무상세정보입력
    public String addTask(){
        return null;
    }


    //상세업무조회
    public String taskDetail(){
        return null;
    }


    //상세업무 입력
    public String addTaskDetail(){
        return null;
    }


    //상세업무수정
    public String modiTaskDetail(){
        return null;
    }


    //상세업무 삭제
    public String delTaskDetail(){
        return null;
    }


    //체크리스트조회
    public String checkList(){
        return null;
    }


    //체크리스트 입력
    public String addCheckList(){
        return null;
    }


    //체크리스트 수정정
    public String modiCheckList(){
        return null;
    }


    //체크리스트삭제
    public String delCheckList(){
        return null;
    }


    //프로젝트 캘린더
    public String projectCalendar(){
        return null;
    }


    //프로젝트 분석
    public String projectChart(){
        return null;
    }


    //채팅 메인
    @RequestMapping("chat.do")
    public String chatMain(Model model, Principal principal) {
    	
    	String mail = principal.getName();
    	User user = memberService.getUser(mail);
    	//회원 정보 저장하기
    	model.addAttribute("user", user);
    	
    	//이 회원이 속한 채팅방 목록 가져오기
    	List<ChatRoom> groupChatRoomList = chatService.getGroupChatRoomList(mail);
    	List<String> roomNameList = new ArrayList<String>();
    	
    	for(int i = 0; i < groupChatRoomList.size(); i++) {
    		roomNameList.add(groupChatRoomList.get(i).getChatRoomName());
    	}

    	model.addAttribute("roomNameList", roomNameList);
    	
    	//사원 목록 가져오기
    	List<User> userList = memberService.getUserList();
    	model.addAttribute("userList", userList);
    	
    	//기본 나에게 채팅으로 셋팅
    	model.addAttribute("chatType", "SELF");
    	
    	//로그인한 회원이 참여 중인 프로젝트 중 진행중인 목록 가져오기
    	List<Project> pjtList = projectService.getInProgressPjtList(user.getMail()); //특정 회원이 속한 프로젝트 리스트 가져오기
    	model.addAttribute("pjtList",pjtList);
    	
    	return "chat/chatMain";
    }
    
    
    //그룹 채팅 메인
    @RequestMapping(value = "chatGroup.do", method = RequestMethod.GET)
    public String chatGroup(@RequestParam(value="roomName") String roomName, Model model, Principal principal) {
    	String mail = principal.getName();
    	User user = memberService.getUser(mail);
    	//회원 정보 저장하기
    	model.addAttribute("user", user);    	
    	//이 회원이 속한 채팅방 목록 가져오기
    	List<ChatRoom> chatRoomList = chatService.getGroupChatRoomList(mail);
    	List<String> roomNameList = new ArrayList<String>();
    	
    	for(int i = 0; i < chatRoomList.size(); i++) {
    		roomNameList.add(chatRoomList.get(i).getChatRoomName());
    	}

    	model.addAttribute("roomNameList", roomNameList);
    	
    	//로그인한 회원이 참여 중인 프로젝트 중 진행중인 목록 가져오기
    	List<Project> pjtList = projectService.getInProgressPjtList(mail); //특정 회원이 속한 프로젝트 리스트 가져오기
    	model.addAttribute("pjtList",pjtList);
    	
    	
    	//사원 목록 가져오기
    	List<User> userList = memberService.getUserList();
    	model.addAttribute("userList", userList);
    	
    	//해당 그룹 채팅방으로 셋팅
    	model.addAttribute("roomName", roomName);
    	model.addAttribute("chatType", "GROUP");
    	
    	return "chat/chatMain_group";
    }
    
    //DM 채팅 메인
    @RequestMapping(value = "chatDm.do", method = RequestMethod.GET)
    public String chatDm(@RequestParam(value="dmName") String dmName, @RequestParam(value="dmMail") String dmMail, Model model, Principal principal) {
    	String mail = principal.getName();
    	User user = memberService.getUser(mail);
    	
    	//회원 정보 저장하기
    	model.addAttribute("user", user);    	
    	//이 회원이 속한 채팅방 목록 가져오기
    	List<ChatRoom> chatRoomList = chatService.getGroupChatRoomList(mail);
    	List<String> roomNameList = new ArrayList<String>();
    	
    	for(int i = 0; i < chatRoomList.size(); i++) {
    		roomNameList.add(chatRoomList.get(i).getChatRoomName());
    	}

    	model.addAttribute("roomNameList", roomNameList);
    	
    	
    	//사원 목록 가져오기
    	List<User> userList = memberService.getUserList();
    	model.addAttribute("userList", userList);
    	
    	//로그인한 회원이 참여 중인 프로젝트 중 진행중인 목록 가져오기
    	List<Project> pjtList = projectService.getInProgressPjtList(mail); //특정 회원이 속한 프로젝트 리스트 가져오기
    	model.addAttribute("pjtList",pjtList);
    	
    	
    	//해당 DM 채팅방으로 셋팅
    	model.addAttribute("dmName", dmName);
    	model.addAttribute("dmMail", dmMail);
    	model.addAttribute("chatType", "DM");
    	
    	return "chat/chatMain_DM";
    }
    
  
    
  
    
    
    //관리자_사원추가 페이지
   @RequestMapping(value = "addUser.do", method = RequestMethod.GET )
   public String addUser() {
	   System.out.println("Docontroller addUser() get in");
	   return "admin/AddMember";
   }
    
    
    //관리자_사원추가 서비스
   @RequestMapping(value = "addUser.do", method = RequestMethod.POST)
   public String addUser(User user, HttpServletRequest request) throws IOException {
	    
	   
	   
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
        	
        int result = memberService.addUser(user);
        if(result > 0) {
    		System.out.println("멤버 추가 완료");
        }
   		
    	return "redirect: adminMain.do";
    }
   	
   
   //관리자_사원 정보 수정 view
   @RequestMapping(value = "modifyUser.do", method = RequestMethod.GET)
   public String modifyUser(@RequestParam(value="mail") String mail, Model model) {
	   //서비스 통해서 유저 메일로 유저 정보 가져와서 뿌리기
	   User user = memberService.getUserInfo(mail);
	   model.addAttribute("user", user);
	   return "admin/ModifyMember";
   }
  
   @RequestMapping(value="teamManagement.do", method= RequestMethod.GET)
   public String teamManagement(Model model) {
	   UserDao userDao = sqlsession.getMapper(UserDao.class);
	   List<TeamList> teamList = userDao.getTeamList();
	   model.addAttribute("teamList", teamList);
	   return "admin/TeamManagement";
   }
   
   
    //비용 차트 뷰단 가기
	@RequestMapping(value="paymentChart.do", method=RequestMethod.GET)
	public String paymentChart() {
		return "payment/payChart";
	}
    
    
}