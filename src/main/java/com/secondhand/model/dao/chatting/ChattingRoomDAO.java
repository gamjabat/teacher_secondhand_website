package com.secondhand.model.dao.chatting;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.controller.product.ProductChattingMessage;
import com.secondhand.model.dto.chatting.ChattingRoom;
import com.secondhand.model.dto.chatting.Message;

public class ChattingRoomDAO {
	
	// 채팅방 조회
    public ChattingRoom findChatRoomByMemberAndProduct(SqlSession session, String memberNo, String productNo) {
        return session.selectOne("chatting.findChatRoomByMemberAndProduct",
                Map.of("memberNo", memberNo, "productNo", productNo));
    }

    // 채팅방 생성
    public int createChatRoom(SqlSession session, ChattingRoom chatRoom) {
        return session.insert("chatting.createChatRoom", chatRoom);
    }

    // 메시지 저장
    public int saveMessage(SqlSession session, Message message) {
        return session.insert("chatting.saveMessage", message);
    }

    // 특정 채팅방의 메시지 조회
    public List<Message> getMessagesByChatRoom(SqlSession session, String chatRoomNo) {
        return session.selectList("chatting.getMessagesByChatRoom", chatRoomNo);
    }
    
    public int insertMessage(SqlSession session, Message m) {
    	return session.insert("chatting.insertMessage", m);
    }
}
