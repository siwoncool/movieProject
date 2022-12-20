package com.icia.kpl.dto;

import lombok.Data;

@Data
public class CMF026DTO {
	private int mCode;			// 상영영화코드
	private String bLocation;	// 지점 지역
	private String tName;		// 지점이름
	private String bDate;		// 상영일
}
