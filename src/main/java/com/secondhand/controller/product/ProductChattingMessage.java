package com.secondhand.controller.product;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductChattingMessage {
	private String type;
	private String sender;
	private String receiver;
	private String data;
	private String room;
	
}
