package com.icia.kpl.dto;

import lombok.Data;

@Data
public class BRANCH {
	private String bName;		// 지점이름
	private String bAddr;		// 지점 위치
	private String bLocation;	// 지점 지역
	private String bCall;		// 지점 전화번호
	
	private String bAddr1;		// 지점 주소 받기1
	private String bAddr2;		// 지점 주소 받기2
	private String bAddr3;		// 지점 주소 받기3
	
}
