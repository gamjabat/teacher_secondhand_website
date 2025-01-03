package com.secondhand.model.dto.product;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {
	private String productNo;
	private String productName;
	private int price;
	private String productDescription;
	private String hashTags;
	private String tradeLocation;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private Timestamp deletedAt;
	private char isDeleted;
	
	private String productMemberNo;
	private String transMethodNo;
	private String productCategoryNo;
	
	private String memberName;
	private String nickname;
	private String transMethodName;
	private String productCategoryName;
}
