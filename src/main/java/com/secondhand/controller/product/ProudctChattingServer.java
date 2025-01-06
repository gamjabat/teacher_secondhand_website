package com.secondhand.controller.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

@ServerEndpoint("/chatting") //선언부에 어노테이션을 사용함. 스크립트에서 쓴 주소
public class ProudctChattingServer {
	@OnOpen
	public void open(Session session,EndpointConfig config) {
		System.out.println("손님 접속 ! ");
//		try {
//		session.getBasicRemote().sendText("채팅접속을 환영합니다.");  //클라에게 메세지를 전송하는거 알아서.
//		
//		}catch(IOException e){
//			e.printStackTrace();
//		}
	}

	@OnMessage
	public void message(Session session,String data) { 
		
		System.out.println(data);
		
		ProductChattingMessage m=new Gson().fromJson(data,ProductChattingMessage.class);  //형변환.
		
		//session에 접속한 회원 저장.
		session.getUserProperties().put("info",m);		
	    
		//타입에 대한 분리.
		Set<Session> clients=session.getOpenSessions();
		switch (m.getType()) {
			//새로운 클라이언트가 접속시
		case "open" : initAlarm(clients,m); break;
			//접속한 회원이 메세지를 전달시
		case "msg" : sendChattingMessage(clients,m); break; 
	}
}
	
//		try {
//		session.getBasicRemote().sendText(data);
//		}catch(IOException e) {
//			e.printStackTrace();
//		}
		

	private void initAlarm(Set<Session> clients, ProductChattingMessage m) {
		//000님이 접속했습니다. -> 알람
		ProductChattingMessage msg=ProductChattingMessage.builder().type("alram").data(m.getSender()+"접속했습니다.").build();
		clients.forEach(client->sendMessage(client,new Gson().toJson(msg)));
		
		//현재 접속한 회원을 전송
		List<String> users=new ArrayList<>();
		clients.forEach(client->{
			ProductChattingMessage info=(ProductChattingMessage)client.getUserProperties().get("info");
			users.add(info.getSender());
		});
		ProductChattingMessage msg2=ProductChattingMessage.builder().type("users").data(new Gson().toJson(users)).build();
		clients.forEach(client->{
			sendMessage(client,new Gson().toJson(msg2));
		});
	}	
	
	private void sendChattingMessage(Set<Session> clients, ProductChattingMessage m) {
		//room, receiver의 값에 따라 분기처리해서 메세지를 전달
		if(!m.getRoom().equals("")&&!m.getReceiver().equals("")) { //특정 타겟에게 분기			
		
		} else if (!m.getReceiver().equals("")) {
			
		} else {
			//전체전송.
			clients.forEach(client->sendMessage(client,new Gson().toJson(m)));
		}
	}
	
	private void sendMessage(Session session, String m) {
		try {
			session.getBasicRemote().sendText(m);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

