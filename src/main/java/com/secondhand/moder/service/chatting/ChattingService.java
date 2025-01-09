package com.secondhand.moder.service.chatting;

import java.util.List;
import static com.secondhand.common.SqlSessionTemplate.getSession;
import org.apache.ibatis.session.SqlSession;

import com.secondhand.controller.product.ProductChattingMessage;
import com.secondhand.model.dao.chatting.ChattingRoomDao;
import com.secondhand.model.dto.chatting.ChattingRoom;
import com.secondhand.model.dto.chatting.Message;

public class ChattingService {
    private ChattingRoomDao dao = new ChattingRoomDao();

    // 채팅방 번호 생성
    public String generateChatRoomNo() throws RuntimeException {
        SqlSession session = getSession();
        try {
            String chatRoomNo = "CR_" + System.currentTimeMillis();
            return chatRoomNo;
        } finally {
            session.close();
        }
    }

    // 채팅방 조회 또는 생성
    public ChattingRoom getOrCreateChatRoom(String memberNo, String productNo) throws RuntimeException {
        SqlSession session = getSession();
        try {
        	ChattingRoom chatRoom = dao.findChatRoomByMemberAndProduct(session, memberNo, productNo);
            if (chatRoom == null) {
                chatRoom = new ChattingRoom();
                chatRoom.setChatRoomNo(generateChatRoomNo());
                chatRoom.setChatRoomMemberNo(memberNo);
                chatRoom.setChatRoomProductNo(productNo);

                int result = dao.createChatRoom(session, chatRoom);
                if (result <= 0) {
                    session.rollback();
                    throw new RuntimeException("채팅방 생성 실패");
                }
                session.commit();
            }
            return chatRoom;
        } catch (Exception e) {
            session.rollback();
            throw new RuntimeException("채팅방 조회 또는 생성 중 오류 발생: " + e.getMessage());
        } finally {
            session.close();
        }
    }

    // 메시지 저장
//    public void saveMessage(String chatRoomNo, String content, String senderNo, String receiverNo) throws RuntimeException {
//        SqlSession session = getSession();
//        try {
//            Message message = new Message();
//            message.setMessageNo("MG_" + System.currentTimeMillis());
//            message.setMessageContent(content);
//            message.setChatRoomNo(chatRoomNo);
//            message.setSenderMemberNo(senderNo);
//            message.setReceiverMemberNo(receiverNo);
//
//            int result = dao.saveMessage(session, message);
//            if (result <= 0) {
//                session.rollback();
//                throw new RuntimeException("메시지 저장 실패");
//            }
//            session.commit();
//        } catch (Exception e) {
//            session.rollback();
//            throw new RuntimeException("메시지 저장 중 오류 발생: " + e.getMessage());
//        } finally {
//            session.close();
//        }
//    }

    // 특정 채팅방의 메시지 조회
    public List<Message> getMessagesByChatRoom(String chatRoomNo) {
        SqlSession session = getSession();
        try {
            return dao.getMessagesByChatRoom(session, chatRoomNo);
        } finally {
            session.close();
        }
    }

    // 채팅방 정보 조회
    public ChattingRoom findChatRoomByMemberAndProduct(String memberNo, String productNo) {
        SqlSession session = getSession();
        try {
            return dao.findChatRoomByMemberAndProduct(session, memberNo, productNo);
        } finally {
            session.close();
        }
    }
    
    public int insertMessage(Message m) {
        SqlSession session = getSession();
        int result = dao.insertMessage(session, m);
        if (result>0) session.commit();
        else session.rollback();
        session.close();
        return result;
    }
    
    public List<Message> getMeessagesByProductNo(String productNo) {
        SqlSession session = getSession();
        List<Message> messages = dao.getMeessagesByProductNo(session, productNo);
        session.close();
        return messages;
    }
}