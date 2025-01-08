package com.secondhand.model.dto.review;

import java.sql.Timestamp;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Review {
	private String reviewNo;
    private int rating;
    private String reviewContent;
    private String reviewTransNo;
    private Timestamp createdAt;
	private Timestamp updatedAt;
	private Timestamp deletedAt;
	private char isDeleted;
}
