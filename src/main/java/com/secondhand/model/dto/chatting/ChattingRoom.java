package com.secondhand.model.dto.chatting;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChattingRoom {
	private String chatRoomNo;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private String chatRoomMemberNo;
    private String chatRoomProductNo;
}
