package com.dobee.handler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.dobee.services.ProjectService;

public class AlarmHandler extends TextWebSocketHandler {
	
	
	private static Map<String, WebSocketSession> users = new HashMap<String,WebSocketSession>();
	
	private void log(String msg) {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simple.format(new Date());
		System.out.println(date + " : " + msg);
	}
	
	//연결
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getPrincipal().getName() + " 접속");
		users.put(session.getPrincipal().getName(), session); //userid 와 session 저장
	}	
	
	//연결해제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		if(session.getPrincipal() != null) {
			if(users.containsKey(session.getPrincipal().getName())) {
				users.remove(session.getPrincipal().getName()); //연결해제된 id 삭제
				log(session.getPrincipal().getName() + " 해제");
			}
		}
	}
	
	//데이터 전송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		  System.out.println("AlarmHandler in!!");
		  System.out.println(message.getPayload());
		  String data = message.getPayload();
		  
		  JSONParser parser = new JSONParser();
		  Object object = parser.parse(data);
		  JSONObject jsonObject = (JSONObject)object;
		  
		  String cmd = (String) jsonObject.get("cmd");
		  String mail = (String) jsonObject.get("mail");
		  if(users.containsKey(mail)) {
			  if(cmd.equals("addTask")) {
				  String content = (String)jsonObject.get("content");
				  TextMessage msg = new TextMessage("["+content+"]\n업무가 추가 되었습니다");
				  users.get(mail).sendMessage(msg);
				  log(mail + " / " + message.getPayload() + " / " + msg.getPayload());
			  }
		  }


		
	}
	
	//연결에 문제 발생시
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception{
		log(session.getPrincipal().getName() + " / " + exception.getMessage());
	}
}
