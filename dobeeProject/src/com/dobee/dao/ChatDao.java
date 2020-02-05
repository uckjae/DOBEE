package com.dobee.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dobee.vo.chat.ChatRoom;
import com.dobee.vo.chat.ChatUsers;
import com.dobee.vo.member.User;

public interface ChatDao {
	
	//DM 채팅 대상 리스트 가져오기
	public List<User> getDmUserList(String mail);
	
	//그룹 채팅방 만들기
	public int makeGroupChatRoom(String newChatRoomName);
	
	//그룹 채팅방 채팅방 유저 만들기
	public int makeGroupChatUsers(Map<String,String> map);
		
	//그룹 채팅방 만들고 채팅방 유저 만들기
	public int makeGroupChatRoomAndChatUsers(ChatRoom chatRoom, ChatUsers chatUsers); 
	
	//채팅방 seq 가져오기
	public int getChatSeq(String chatRoomName);
	
	//특정 회원이 속한 그룹 채팅방 리스트 가져오기
	public List<ChatRoom> getGroupChatRoomList(String mail); 
	
}
