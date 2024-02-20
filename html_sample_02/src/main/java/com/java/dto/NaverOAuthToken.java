package com.java.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class NaverOAuthToken {
	
	 private String access_token;
	    private String refresh_token;
	    private String token_type;
	    private String expires_in;
	    private String scope;

	   

}
