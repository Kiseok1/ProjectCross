package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class PostDto {
	
	private int post_id;
	private String user_id;
	private String pcontent;
	private String plocation;
	private int plike;
	private int renote;
	private int pgroup;
	private int pstep;
	private int pindent;
	private int hit;
	private int viewhit0;
	private int viewhit6;
	private int viewhit12;
	private int viewhit18;
	private Timestamp created;
	private Timestamp updated;
	private int quo_post_id;
	
	
	
	
}
