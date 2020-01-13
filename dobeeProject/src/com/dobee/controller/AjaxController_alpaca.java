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
import com.dobee.vo.chat.ChatRoom;
import com.dobee.vo.chat.ChatUsers;
import com.dobee.vo.member.User;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@RestController
public class AjaxController_alpaca {
	
	private SqlSession sqlsession;
	private ChatService chatservice;
	

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	public void setChatservice(ChatService chatservice) {
		this.chatservice = chatservice;
	}

	//회원 목록 가져오기
    @RequestMapping(value="getUserList.do", method=RequestMethod.POST)
    @JsonManagedReference
    public List<User> getUserList() {
    	UserDao userdao = sqlsession.getMapper(UserDao.class);
    	List<User> result = userdao.getUserList();
    	
    	return result;
    }
    
    @RequestMapping(value="makeChatRoom.do", method=RequestMethod.POST)
    public String makeChatRoom(@RequestParam(value="chatRoomName") String chatRoomName, @RequestParam(value="chatUserList[]") List<String> chatUsers) {
    	System.out.println("이거 타니???");
    	String responseData = "";
    	int result = 0;
    	int result2 = 0;
    	
    	result = chatservice.makeGroupChatRoom(chatRoomName);
    	//유저리스트 채팅방 db에 저장하기
		if(result > 0 ) { //채팅방 만듦
			
			result2 = chatservice.makeGroupChatUsers(chatRoomName, chatUsers);
			responseData = "success";
			System.out.println("성공함");
			
		}
	
    	return responseData;
    }
    
    
    
    //그룹 채팅방 만들기
    /*
    @RequestMapping(value="makeChatRoom.do", method=RequestMethod.POST)
    public String makeChatRoom(@RequestParam(value="chatRoomName") String chatRoomName, @RequestParam(value="chatUserList[]") List<String> chatUserList) {
    	System.out.println("이거 타니???");
    	System.out.println("채팅방"+chatRoomName);
    	System.out.println("유저리스트"+chatUserList);

    	return null;
    }
    
    
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
