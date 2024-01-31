package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AlramDto {
	
	private int alram_id;
	private String user_id;
	private String source_id;
	private int post_id;
	private String alram_type;
	private int checked;
	private Timestamp created;
	
	
}	
