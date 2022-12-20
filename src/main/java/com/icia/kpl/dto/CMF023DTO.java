package com.icia.kpl.dto;

import lombok.Data;

@Data
public class CMF023DTO {
	private String tName;	// 지점 이름
	private String mTitle;	// 영화이름
	private int tNum;		// 지점의 상영관 번호
	private int mCode;		// 영화정보 기본키 번호
	private String tType; 	// 상영관 타입
	private int tSize;		// 상영관 크기
}
