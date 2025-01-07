package com.secondhand.model.dto.member;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class CartList {
	 	private String cartNo;          // 장바구니 번호
	    private LocalDateTime createdAt; // 생성 일자
	    private String cartMemberNo;    // 회원 번호
	    private String cartProductNo;   // 상품 번호
}
