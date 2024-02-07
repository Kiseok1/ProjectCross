package com.java.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class access_token {
	
	private String access_token;
	private String refresh_token;
	private int expires_in;
	private String scope;
	private String token_type;
	private String error;
	private String error_description;
	private int refresh_token_expires_in;

}
