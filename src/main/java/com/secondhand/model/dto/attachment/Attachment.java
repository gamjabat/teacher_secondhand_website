package com.secondhand.model.dto.attachment;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Attachment {
	private String attachmentNo;
    private String fileOriginalName;
    private String fileRename;
    private Timestamp createdAt;
    private String attachmentProductNo;
    private String attachmentMemberNo;
}
