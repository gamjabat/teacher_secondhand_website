package com.secondhand.controller.product;

import java.io.IOException;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.secondhand.model.dto.chatting.Message;
import com.secondhand.moder.service.chatting.ChattingService;

@ServerEndpoint("/chatting") //선언부에 어노테이션을 사용함. 스크립트에서 쓴 주소
public class ProudctChattingServer {
	@OnOpen
    public void open(Session session, EndpointConfig config) {
        session.getUserProperties().put("room", ""); // 초기 room 값 설정
    }

    @OnMessage
    public void message(Session session, String data) {
        ProductChattingMessage pcm = new Gson().fromJson(data, ProductChattingMessage.class);
        
        Message m = Message.builder()
        			.messageContent(pcm.getData())
        			.messageProductNo(pcm.getRoom())
        			.senderMemberNo(pcm.getSenderNo())
        			.build();
        

        switch (pcm.getType()) {
            case "open":
                session.getUserProperties().put("room", pcm.getRoom());
                initAlarm(session.getOpenSessions(), pcm);
                break;

            case "msg":
            	saveMessageToDatabase(m);
                sendToRoom(session.getOpenSessions(), pcm.getRoom(), pcm);
                break;

            default:
                System.out.println("알 수 없는 메시지 타입: " + pcm.getType());
        }
    }

    private void sendToRoom(Set<Session> sessions, String room, ProductChattingMessage m) {
        sessions.forEach(client -> {
            String clientRoom = (String) client.getUserProperties().get("room");
            if (room.equals(clientRoom)) {
                sendMessage(client, new Gson().toJson(m));
            }
        });
    }

    private void initAlarm(Set<Session> sessions, ProductChattingMessage m) {
        String room = m.getRoom();
        ProductChattingMessage msg = ProductChattingMessage.builder()
                .type("alarm")
                .room(room)
                .data(m.getSender() + "님이 " + room + "에 접속했습니다.")
                .build();

        sendToRoom(sessions, room, msg);
    }

    private void sendMessage(Session session, String message) {
        try {
            session.getBasicRemote().sendText(message);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    private void saveMessageToDatabase(Message m) {
        // 예시: Service 또는 DAO를 통해 데이터베이스에 저장
        ChattingService chattingService = new ChattingService();
        chattingService.insertMessage(m);
    }
}



