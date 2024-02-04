package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class PostMediaUserDto {

	private PostDto postDto;
	private MediaDto mediaDto;
	private Cross_userDto cross_userDto;
}
