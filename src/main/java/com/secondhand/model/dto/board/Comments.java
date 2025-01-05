package com.secondhand.model.dto.board;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Comments {
	private String commentNo;           // 댓글 고유 번호
    private String commentContent;      // 댓글 내용
    private int commentLikeCount;       // 좋아요 수
    private String createdAt;           // 생성 시간
    private String updatedAt;           // 수정 시간
    private String deletedAt;           // 삭제 시간 (nullable)
    private char isDeleted;          // 삭제 여부
   
    //FOREIGN KEY
    private String commentMemberNo;     // 댓글 작성자 고유 번호
    private String commentQnaNo;        // 관련된 질문(QnA) 고유 번호
}
