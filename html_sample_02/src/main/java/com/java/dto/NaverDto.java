
package com.java.dto;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.java.dto.KakaoDto.Properties;

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
	public Responses response;
	
	@Data
	public class Responses{
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
		public String mobile_e164;
		
	}
	

		

	
	
	

	

	}






