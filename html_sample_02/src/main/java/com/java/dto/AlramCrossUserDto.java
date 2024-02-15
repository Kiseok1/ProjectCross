package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class AlramCrossUserDto {
	
	private AlramDto alramDto;
	private Cross_userDto cross_userDto;
	
}
