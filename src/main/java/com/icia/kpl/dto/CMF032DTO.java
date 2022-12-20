package com.icia.kpl.dto;

import lombok.Data;

@Data
public class CMF032DTO {
	// 상영관시간표에서 누른정보로 예매 들어가기
	
	private int bCode;
	private int mCode;
	private String bLocation;
	private String tName;
	private String bDate;
	private String mTitle;
	private int tNum;
}
