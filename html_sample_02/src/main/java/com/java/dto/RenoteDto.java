package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RenoteDto {
	
	
	private int renote_id;
	private int post_id;
	private String user_id;
	private Timestamp created;
	private int post_order;
	
}
