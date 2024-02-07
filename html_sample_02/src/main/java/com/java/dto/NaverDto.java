package com.java.dto;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@Data
@NoArgsConstructor
/* @JsonIgnoreProperties(ignoreUnknown=true) */
public class NaverDto {
	
	public String resultcode;
	public String message;
	public String id;
	public String nickname;
	public String name;
	public String email;
	public String gender;
	public String age;
	public String birthday;
	public String profile_image;
	public String birthyear;
	public String mobile;
		
		
		
	
		

	
	
	

	

	}





