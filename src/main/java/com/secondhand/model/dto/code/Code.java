package com.secondhand.model.dto.code;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Code {
		private String typeNo;
	    private String typeName;
	    private boolean isActive;
	    private String typeDescription;
}
