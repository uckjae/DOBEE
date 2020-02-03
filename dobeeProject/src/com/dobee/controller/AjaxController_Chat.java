package com.dobee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.dao.UserDao;
import com.dobee.services.ChatService;
import com.dobee.services.MemberService;
import com.dobee.vo.chat.ChatRoom;
import com.dobee.vo.chat.ChatUsers;
import com.dobee.vo.member.User;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@RestController
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
			System.out.println("성공함");
		}
	
    	return responseData;
    }
    
    //1:1 채팅방 접속
    @RequestMapping(value = "chatDm.do", method = RequestMethod.POST)
    public String chatDm(@RequestParam(value="name") String name, @RequestParam(value="mail") String mail) {
    	System.out.println("1:1 채팅방 타??");
    	System.out.println("이름 가져와??"+name);

    	System.out.println("메일 가져와??"+mail);
    	//String socketUrl = "{chatType : 'DM', mail : mail, }";
    	String socketUrl = "dm";
    	
    	return socketUrl;
    }
    
    //그룹 채팅방 접속
//    @RequestMapping(value = "chatGroup.do", method = RequestMethod.POST)
//    public String chatGroup(@RequestParam(value="chatRoomName") String chatRoomName) {
//    	System.out.println("그룹 채팅방 타??");
//    	System.out.println("이름 가져와??"+chatRoomName);
//
//    	//String socketUrl = "{chatType : 'DM', mail : mail, }";
//    	String socketUrl = "group";
//    	
//    	return socketUrl;
//    }
    
    //그룹 채팅방 만들기
    /*
 
    
    @RequestMapping(value="makeChatRoom.do", method=RequestMethod.POST)
    public String makeChatRoom(ChatRoom chatroom) {
    	System.out.println("이거 타니???");
    	System.out.println("채팅방"+chatroom.toString());
    	System.out.println("유저리스트"+chatusers.toString());
    	Map<String, List<ChatUsers>> groupChatRoom = new HashMap<String, List<ChatUsers>>();
    	groupChatRoom.put(chatroom.getChatRoomName(), chatusers);
    	
    	return null;
    }
    
    */
}
