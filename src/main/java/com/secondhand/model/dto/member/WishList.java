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
public class WishList {
	 	private String wishlistNo;         // 위시리스트 고유 번호 (WL_0001)
	    private LocalDateTime createdAt;   // 생성 일시
	    private LocalDateTime updatedAt;   // 수정 일시
	    private LocalDateTime deletedAt;   // 삭제 일시 (null이면 삭제되지 않음)
	    private String isDeleted;          // 삭제 여부 (Y/N)
	    private String wishlistMemberNo;   // 좋아요를 누른 사용자 번호
	    private String wishlistProductNo;  // 좋아요를 누른 상품 번호
}
