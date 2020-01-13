package com.dobee.controller;




import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.dobee.dao.NoticeDao;
import com.dobee.dao.ProjectDao;
import com.dobee.dao.UserDao;
import com.dobee.services.ApplyService;
import com.dobee.services.ChatService;
import com.dobee.services.GoogleVisionApi;
import com.dobee.services.MemberService;
import com.dobee.vo.Apply;
import com.dobee.vo.chat.ChatRoom;
import com.dobee.vo.member.User;
import com.dobee.vo.member.UserInfo;
import com.dobee.vo.notice.Notice;
import com.dobee.vo.project.Project;


@Controller
public class DoController {
	
	public DoController() {
		System.out.println("일단 컨트롤 오나 보자");
	}
	
	
    @Autowired
    private SqlSession sqlsession;
    
    @Autowired
    private ApplyService applyService;
    
    @Autowired
    private ChatService chatService;
    
    public void setSqlsession(SqlSession sqlsession) {
    	this.sqlsession = sqlsession;
    }
    
    @Autowired
    private MemberService memberService;
    

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
    public String fidId(){
        return null;
    }


    public String fidIdResult(){
        return null;
    }

    //비밀번호재설정
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


    public String resetPwdResult(){
        return null;
    }


    //메인페이지(로그인후)
    @RequestMapping("main.do")
    public String main(){
    	System.out.println("컨트롤러 main.do");
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
    
    
    //회사 일정등록
    //@RequestMapping(value = "", method = RequestMethod.POST)
    public String addSchedule(){
        return null;
    }


    //출근/퇴근버튼
    public String attendButton(){
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


    //공지사항상세보기
    public String noticeDetail(){
        return null;
    }


  //공지사항글쓰기
    @RequestMapping(value="noticeWrite.do",method=RequestMethod.GET)
    public String noticeWrite(){
        return "notice/noticeWrite";
    }
    @RequestMapping(value="noticeWrite.do",method=RequestMethod.POST)
    public String noticeWrite(Notice n,HttpServletRequest request,Principal principal) throws IOException {
    	
    		List<CommonsMultipartFile> files = n.getFiles();
    		List<String>filenames = new ArrayList<String>(); //파일명관리
    		
    		if(files != null && files.size()>0){ //최소한개 업로드
    			for(CommonsMultipartFile multifile : files) {
    				String filename = multifile.getOriginalFilename();//?
    				String path  = request.getServletContext().getRealPath("/notice/upload");
    			    
    				String fpath = path+"\\"+filename;
    			    
    			    if(!filename.equals("")) {//실 파일 업로드
    			    	FileOutputStream fs = new FileOutputStream(fpath);
    			    	fs.write(multifile.getBytes());
    			    	fs.close();
    			    }
    			    filenames.add(filename);//파일명을 별도 관리 (DB insert)
    			}
    		}
    		
    		n.setSaveName(filenames.get(0));
    		
    		NoticeDao noticedao =sqlsession.getMapper(NoticeDao.class);
    		noticedao.noticeWrite(n);		
    		return "redirect:noticeList.do"; //들어주는 주소 ...
    }


    //공지사항수정하기
    public String noticeModi(){
        return null;
    }


    //공지사항삭제하기
    public String noticeDelte(){
        return null;
    }


    // 부재일정신청 GET 0110
    @RequestMapping(value="breakApply.do", method=RequestMethod.GET)
    public String absApply(){
        return "attend/breakApply";
    }
    
    // 부재일정신청 POST 0112
    @RequestMapping(value="breakApply.do", method=RequestMethod.POST)
    public String absApplyPost(Apply apply, HttpServletRequest req){
    	String result = applyService.absApply(apply);
    	// System.out.println("봐봐  : " + result);
    	
        return "attend/breakApply";
    }


  //연장근무신청
    @RequestMapping(value = "extendApply.do", method = RequestMethod.GET)
    public String overTiemApply(){
        return "attend/extendApply";
    }
    
    
    // 연장근무 신청 POST
 	/* 01.10 by 게다죽 */
     @RequestMapping(value="extendApply.do", method = RequestMethod.POST)
     public String extendApplyPost(Apply apply, HttpServletRequest req) {
    	String result = applyService.overtimeApply(apply);
    	// System.out.println("봐봐 이," + result);

     	return "attend/extendApply";
     }


    //부재일정관리
    @RequestMapping("breakManage.do")
    public String absMg(){
        return "attend/breakManage";
    }


    //근무내역확인
    @RequestMapping("workManage.do")
    public String workChart(){
        return "attend/workManage";
    }


    //부재관리
    @RequestMapping("absManage.do")
    public String absSign(){
        return "attend/absenceManage";
    }



    //연장근무관리 리스트
    @RequestMapping("extendManage.do")
    public String overtiemSignList(){
        return "attend/extendManage";
    }


    //연장근무관리 승인
    public String overtimeSingApprov(){
        return null;
    }


    //연장근무관리 거절
    public String overtimeSignReject(){
        return null;
    }


    //카드관리 리스트
    public String debitList(){
        return null;
    }


    //카드관리 카드추가
    public String addDebit(){
        return null;
    }


    //비용현황
    @RequestMapping("debitList.do")
    public String paymentChart(){
    	System.out.println("debitlist.do 까지 왔음");
        return "payment/test";
    }
    

    //비용정산신청 뷰단 화면 이동
    @RequestMapping("reciptRegit.do")
    public String receiptReg(){
    	System.out.println("reciptRegit.do 요청했음");
        return "payment/reciptRegit";
    }


    //비용정산신청 영수증사진으로  google Vision API 요청
    @RequestMapping("goVision.do")
    public String goGoogleApi(){
    	System.out.println("goGoogleApi 함수요청");
    	GoogleVisionApi vision = new GoogleVisionApi();
    	
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
    public String projectList(Project project,Model model){
    	
    		List<Project>list=null;
    	
    		ProjectDao projectdao=sqlsession.getMapper(ProjectDao.class);
    		list= projectdao.getPjt(project);
    		System.out.println(list);
    		model.addAttribute("list",list);
    
        return "project/pjtMain";
    }


    //프로젝트생성
    public String addProject(){
        return null;
    }


    //칸반보드
    public String kanban(){
        return null;
    }


    //업무생성
    public String addTaskPM(){
        return null;
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
    	
    	return "chat/chatMain";
    }
    
    
    //그룹 채팅 메인
    @RequestMapping(value = "chatGroup.do", method = RequestMethod.GET)
    public String chatGroup(@RequestParam(value="roomName") String roomName) {
    
    	return null;
    }
    
  
    
    
//    //전체 채팅 채팅방 가져오기
//    @RequestMapping("groupChat.do")
//    public String groupChatMain() {
//    	return "chat/chatMain_group";
//    }
    
    
    //관리자_사원추가 페이지
   @RequestMapping(value = "addUser.do", method = RequestMethod.GET )
   public String addUser() {
	   System.out.println("Docontroller addUser() in");
	   return "admin/AddMember";
   }
    
    
    //관리자_사원추가 서비스
    @RequestMapping(value="regitUser.do", method = RequestMethod.POST)
    public String regitUser(User user) {
    	System.out.println("DoContorller regitUser()");
    	System.out.println(user.toString());
    	return null;
    }
    
    
}