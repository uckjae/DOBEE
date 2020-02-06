package com.dobee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.services.ChatService;
import com.dobee.services.MemberService;
import com.dobee.vo.member.User;

@RestController
@RequestMapping("ajax/chat/**")
public class AjaxController_Chat {
	
	@Autowired
	private ChatService chatservice;
	@Autowired
	private MemberService memberService;

	//회원 목록 가져오기(관리자 x)
    @RequestMapping(value="getUserList.do", method=RequestMethod.POST)
    public List<User> getUserList() {
    	List<User> userList = null;
    	userList = memberService.getUserList();
    	return userList;
    }
    
    //채팅방 만들기
    @RequestMapping(value="makeChatRoom.do", method=RequestMethod.POST)
    public String makeChatRoom(@RequestParam(value="newChatRoomName") String newChatRoomName, @RequestParam(value="chatUserList[]") List<String> chatUsers) {
    	String responseData = "";
    	int result = 0;
    	int result2 = 0;    	
    	result = chatservice.makeGroupChatRoom(newChatRoomName);
    	//유저리스트 채팅방 db에 저장하기
		if(result > 0 ) { //채팅방 만듦
			
			result2 = chatservice.makeGroupChatUsers(newChatRoomName, chatUsers);
			responseData = "success";
		}
	
    	return responseData;
    }
    
    //1:1 채팅방 접속
    @RequestMapping(value = "chatDm.do", method = RequestMethod.POST)
    public String chatDm(@RequestParam(value="name") String name, @RequestParam(value="mail") String mail) {
    	//String socketUrl = "{chatType : 'DM', mail : mail, }";
    	String socketUrl = "dm";
    	
    	return socketUrl;
    }
    
    //들어오는 메일로 USER 정보 가져오기 -> 사진
    @RequestMapping(value = "getChatUserInfo.do", method = RequestMethod.POST)
    public String getChatUserInfo(@RequestParam(value="mail") String mail) {
    	
    	
    	return null;
    }
}
