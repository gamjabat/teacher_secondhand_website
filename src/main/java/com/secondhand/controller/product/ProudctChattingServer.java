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
    public void open(Session session, EndpointConfig config) {
        System.out.println("손님 접속: " + session.getId());
        session.getUserProperties().put("room", ""); // 초기 room 값 설정
    }

    @OnMessage
    public void message(Session session, String data) {
        System.out.println("수신 데이터: " + data);

        ProductChattingMessage m = new Gson().fromJson(data, ProductChattingMessage.class);

        switch (m.getType()) {
            case "open":
                session.getUserProperties().put("room", m.getRoom());
                System.out.println("클라이언트가 룸에 접속: " + m.getRoom());
                initAlarm(session.getOpenSessions(), m);
                break;

            case "msg":
                sendToRoom(session.getOpenSessions(), m.getRoom(), m);
                break;

            default:
                System.out.println("알 수 없는 메시지 타입: " + m.getType());
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
}



