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
public class Message {
	private String messageNo;
    private String messageContent;
    private LocalDateTime createdAt;
    private String messageProductNo;
    private String senderMemberNo;
    private String receiverMemberNo;
}
