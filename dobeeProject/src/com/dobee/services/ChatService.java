package com.dobee.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobee.dao.ChatDao;
import com.dobee.dao.UserDao;
import com.dobee.vo.chat.ChatRoom;
import com.dobee.vo.chat.ChatUsers;

@Service
public class ChatService {
	
    SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	//그룹 채팅방 만들기
	public int makeGroupChatRoom(String chatRoomName){
		ChatDao chatdao = sqlSession.getMapper(ChatDao.class);
		int result = chatdao.makeGroupChatRoom(chatRoomName);
		
		return result;
	}
	
	//채팅방 참여자 리스트 만들기
	public int makeGroupChatUsers(String chatRoomName, List<String> chatUsers) {
		ChatDao chatdao = sqlSession.getMapper(ChatDao.class);
		int result = 0;
		Map<String, String> map = new HashMap<String, String>();
		map.put("chatRoomName", chatRoomName);
		for(int i = 0; i<chatUsers.size(); i++) {
			String chatUserMail = chatUsers.get(i).toString();
			map.put("mail", chatUserMail);
			result = chatdao.makeGroupChatUsers(map);
		}

		return result;
		
	}
	
	//채팅방 seq 가져오기
	public int getChatSeq(String chatRoomName) {
		ChatDao chatdao = sqlSession.getMapper(ChatDao.class);
		int chatSeq = chatdao.getChatSeq(chatRoomName);			
		return chatSeq;
			
	}
	
	//회원이 속한 그룹 채팅방 리스트 가져오기
	public List<ChatRoom> getGroupChatRoomList(String mail) {
		ChatDao chatdao = sqlSession.getMapper(ChatDao.class);
		System.out.println("메일 가져오니??"+mail);
		List<ChatRoom> groupChatRoomList = chatdao.getGroupChatRoomList(mail);
		System.out.println("서비스에서 가져와??"+groupChatRoomList.toString());
		return groupChatRoomList;
	}
	
}
