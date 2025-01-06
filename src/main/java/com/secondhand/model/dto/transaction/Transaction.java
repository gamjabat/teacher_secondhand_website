package com.secondhand.model.dto.transaction;

import java.sql.Timestamp;

import com.secondhand.model.dto.product.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Transaction {
	private String transactionNo;
    private Timestamp createdAt;
    private Timestamp updatedAt; 
    private Timestamp deletedAt; 
    private char isDeleted;
    private String memberNo;
    private String productNo;
    private String statusNo;

}
