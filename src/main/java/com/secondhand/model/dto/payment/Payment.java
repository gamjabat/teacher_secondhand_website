package com.secondhand.model.dto.payment;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Payment {
	private String paymentNo;           // 결제 고유 번호
    private int paymentAmount;   // 결제 금액
    private String payoneId;            // Payone 결제 고유 ID
    private String paymentReceiptUrl;   // 결제 영수증 URL
    private Timestamp createdAt;             // 생성일자
    private Timestamp updatedAt;             // 수정일자
    private int refundAmount;    // 환불 금액
    
    private String paymentTransNo;      // 거래 테이블의 외래 키
    private String paymentStatusNo;     // 결제 상태 코드 (외래 키)
    private String paymentMethodNo;     // 결제 방식 코드 (외래 키)
    private String refundStatusNo;      // 환불 상태 코드 (외래 키)
}
