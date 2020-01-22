package com.dobee.controller;




import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.dobee.vo.member.UserInfo;
import com.dobee.vo.notice.Notice;
import com.dobee.vo.notice.NoticeFile;
import com.dobee.vo.project.Project;
import com.dobee.vo.project.Task;
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
    public String findId(String name, String phone ,  Model model){
    	String find;
    	UserDao userDao = sqlsession.getMapper(UserDao.class);
    	 find = userDao.findId(name, phone);
    	 model.addAttribute("find",find);
      return "main/findId";
    }

    public String fidIdResult(){
        return null;
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
        return "main/main";
    }

    //관리자 메인전 경고화면
    @RequestMapping("adminWarnig.do")
    public String adminWarning() {
    	return "admin/AdminWarning";
    }
    
    
    //관리자 메인
    @RequestMapping("adminMain.do")
    public String adminMain(Model model) {
    	UserDao userDao = sqlsession.getMapper(UserDao.class);
    	List<User> userList = userDao.getUserList();
    	List<UserInfo> userInfoList = userDao.getUserInfoList();
    	model.addAttribute("userList", userList);
    	model.addAttribute("userInfoList", userInfoList);
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
    @RequestMapping(value="AdminDebit.do",method=RequestMethod.POST)
    public String adminAddDebitOK(Debit debit) {
    	System.out.println("컨트롤 AdminDebit.do 응답 한다.");
    	boolean check = debitService.addDebit(debit);
    	
    	System.out.println("여기까지 오는지 보자 :" + check);
    	if(check) {
    		System.out.println("컨트롤단  : 법인카드 등록 성공");
    	}else {
    		System.out.println("컨트롤단 : 법인카드 등록 실패");
    		return null;
    		//등록 실패하면 아무일도 안일어남
    	}
    	//등록 성공하면 카드 목록 뷰단으로 이동
    	return "redirect:ListDebit.do";
    }
    
    
    //회사 일정등록
    //@RequestMapping(value = "", method = RequestMethod.POST)
    public String addSchedule(){
        return null;
    }



    //마이페이지
    //@RequestMapping(value = "", method = RequestMethod.GET)
    public String mypage(){
        return null;
    }


    //@RequestMapping(value = "", method = RequestMethod.POST)
    public String mypageModi(){
        return null;
    }

    
    //공지사항리스트
    @RequestMapping("noticeList.do")
    public String noticeList(Notice notice,Model model){
    	
    			List<Notice>list=null;
    	
    		NoticeDao noticedao=sqlsession.getMapper(NoticeDao.class);
    		list=noticedao.noticeList(notice);
    		System.out.println(list);
    		model.addAttribute("list",list);
    
        return "notice/noticeList";
    }


    //공지사항상세보기 value="noticeWrite.do",method=RequestMethod.POST
    @RequestMapping(value="noticeDetail.do", method=RequestMethod.GET)
    public String noticeDetail(@RequestParam(value="notSeq") int notSeq, Model model){
        Notice notice = null; 
        NoticeFile nf = null;
        NotSchedule ns = null;
        Schedule sc = null;
        
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
    public String noticeWrite(){
        return "notice/noticeWrite";
    }
    
    //공지사항글쓰기 처리 
    @RequestMapping(value="noticeWrite.do",method=RequestMethod.POST)
    public String noticeWrite(Notice n, NoticeFile nf, Schedule sc, NotSchedule ns, HttpServletRequest request) throws IOException {
    	
    	//공지사항 글 DB 넣기
    	int notSeq = noticeService.noticeWrite(n); //서비스 리턴 값으로 notice의 seq를 가져옴
    	
    	//파일 업로드 파일명
    	CommonsMultipartFile file = nf.getFile();
    	String filename = file.getOriginalFilename(); //원본 파일명
    	
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
    public String noticeModify(@RequestParam(value="notSeq") int notSeq, Model model){
    	Notice notice = null; 
        NoticeFile nf = null;
        NotSchedule ns = null;
        Schedule sc = null;
        
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
        System.out.println("nf 있니?"+nf);

        //DB에서 공지사항 일정 가져오기
        ns = noticeService.getNotSchedule(notSeq);
        System.out.println("sc 있니?"+sc);
        System.out.println("ns 있니?"+ns);

        
        if(ns !=null) {
            System.out.println("공지사항 일정?"+ns.toString());
        	model.addAttribute("ns", ns);
            sc = scheduleService.getSchedule(ns.getSchSeq());
            System.out.println("스케쥴은?"+sc.toString());
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
    	
    	//서비스 연결 >> 제목 & 내용 수정
    	int noticeModify = noticeService.noticeModify(n);
    	
    	CommonsMultipartFile file = nf.getFile();
    	String filename = file.getOriginalFilename(); //원본 파일명
    	System.out.println("파일이름?"+filename);
    	
    	//원래 있었는지 없었는지 확인 후 있으면 update, 없으면 insert
    	String fileExists = request.getParameter("fileExists");
    	
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
        		System.out.println("원래 파일 있었니?");
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
    	}
    	
    	
    	
    	
    	/*

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
    	*/
		return "redirect:noticeList.do"; // "redirect:noticeDetail.do?notSeq="+n.getNotSeq();들어주는 주소 ...
    }
    


    // 개인_부재일정신청 GET 0110           게다죽
    @RequestMapping(value="breakApply.do", method=RequestMethod.GET)
    public String absApply(){
        return "attend/breakApply";
    }
    
    
    // 개인_부재일정신청 POST 0112          게다죽
    @RequestMapping(value="breakApply.do", method=RequestMethod.POST)
    public String absApplyPost(Apply apply, Authentication auth){
        apply.setDrafter(auth.getName());
        String result = applyService.absApply(apply);
        // System.out.println("봐봐  : " + result);
        
        return "attend/breakApply";
    }
    
    
    // 개인_부재일정 수정/삭제 GET                0120    COMPLETE
    @RequestMapping(value="editApply.do", method=RequestMethod.GET)
    public String getEditApply (Model model, Apply apply, Authentication auth, Integer aplSeq) {
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
        
        return "main/main";
    }
    
    
    // 개인_부재일정 삭제 POST          0120    COMPLETE
    @RequestMapping(value="deleteApply.do", method=RequestMethod.GET)
    public String postDeleteApply (Integer aplSeq) {
        applyService.deleteApply(aplSeq);
        
        return "attend/breakManage";    
    }


    // 연장근무 신청 GET          0110 게다죽
    @RequestMapping(value = "extendApply.do", method=RequestMethod.GET)
    public String overTiemApply(){
        
        return "attend/extendApply";
    }
    
    
    // 개인_연장근무신청 POST           0112 게다죽
    @RequestMapping(value="extendApply.do", method = RequestMethod.POST)
    public String extendApplyPost(Apply apply) {
        String result = applyService.overtimeApply(apply);
        // System.out.println("봐봐 이," + result);

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
        
        return "main/main";
    }
    
    
    // 개인_연장근무 신청 삭제 POST       0121 게다죽        COMPLETE
    @RequestMapping(value="deleteExtApply.do", method=RequestMethod.GET)
    public String postDeleteExtList (Integer aplSeq) {
        System.out.println("이거 일단 도니?" );
        System.out.println("이거 일단 도니?" + aplSeq);
        int result = applyService.postDeleteExtList(aplSeq);
        System.out.println("이거 일단 도니?" + result);
        System.out.println("결과를 확인하는 ? " + result);
        return "attend/workManage";
    }


    // 매니저_부재관리 - isAuth update GET     0114 게다죽            // 나중에 권한 코드로 수정 validation 입혀줘야 하고
    @RequestMapping(value="absManage.do", method=RequestMethod.GET)
    public String absSign(Model model){                         
        List<BreakManageList> results = applyService.breakListMgr();
        model.addAttribute("brkListMgr", results);
        
        return "attend/breakManagement_Mgr";
    }


    // 매니저_부재관리 - isAuth update POST        0115 게다죽
    @RequestMapping(value="absManage.do", method=RequestMethod.POST)
    public String absReqHandle(Apply apply) {
        System.out.println("이거 봐바 : " + apply.toString());
        applyService.absReqHandle(apply);
        
        return "attend/breakManagement_Mgr";
    }
    

    // 매니저_연장근무관리 리스트 - isAuth update GET           0115 게다죽
    @RequestMapping(value="extManage.do", method=RequestMethod.GET)
    public String extSign(Model model){
        List<BreakManageList> results = applyService.extListMgr();
        model.addAttribute("extListMgr", results);
        
        return "attend/extendManagement_Mgr";
    }
    
    
    // 매니저_연장근무관리 리스트 - isAuth update POST          0115 게다죽
    @RequestMapping(value="extManage.do", method=RequestMethod.POST)
    public String extReqHandle(Apply apply){
        applyService.extReqHandle(apply);
        
        return "attend/extendManagement_Mgr";
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
    public String projectList(@RequestParam(value="mail") String mail, Model model){
    	List<Project>list = projectService.projectList(mail);
    	model.addAttribute("list",list);
   
        return "project/pjtMain_new";
    }


    //칸반보드 메인 불러오기
    @RequestMapping("pjtKanban.do")
    public String kanban(@RequestParam(value="pjtSeq") String pjtSeq,Model model){
    	System.out.println("Docontorller kanban()");
    	int seq = Integer.parseInt(pjtSeq);
    	Project project = projectService.getProject(seq);
    	List<Task> taskList = projectService.taskList(seq);
    	List<User> pjtMember = projectService.getPjtMember(seq);
    	
    	JSONArray jsonArray = new JSONArray();
    	jsonArray.addAll(taskList);
    	model.addAttribute("project", project);
    	model.addAttribute("taskList", jsonArray);
    	model.addAttribute("pjtMember", pjtMember);
        return "project/pjtKanban_new";
    }


    //업무생성
    @RequestMapping("addPMTask.do")
    public String addPMTask(Task task){
    	System.out.println("Docontorller addPMTask() in!!");
    	projectService.addPMTask(task);
    	return "redirect: pjtKanban.do?pjtSeq="+task.getPjtSeq();
    }


    //업무삭제
    public String delTask(){
        return null;
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
    	
    	return "chat/chatMain3";
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
   public String addUser(User user, UserInfo userInfo) {
   		System.out.println("Docontroller addUser() post in");
   		memberService.addUser(user, userInfo);
   		
   		
    	return "redirect: adminMain.do";
    }
   	
  
   @RequestMapping(value="teamManagement.do", method= RequestMethod.GET)
   public String teamManagement(Model model) {
	   UserDao userDao = sqlsession.getMapper(UserDao.class);
	   List<TeamList> teamList = userDao.getTeamList();
	   model.addAttribute("teamList", teamList);
	   return "admin/TeamManagement";
   }
  

    
    
}