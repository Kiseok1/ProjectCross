package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class User_followDto {
	
	private int follow_id;
	private String user_id;
	private String source_id;
	private String target_id;
	private Timestamp created;
	private Timestamp updated;
	
	
}
