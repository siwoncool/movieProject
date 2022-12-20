package com.icia.kpl.dto;

import lombok.Data;

@Data
public class CMF033PASSDTO {
	// 좌석 고르는데로 넘어갈껀데 하단 정보를 가져간다.
	
	private String Poster;
	private String Title;
	private String Genre;
	private String Age;
	private String RunTime;
	private String Branch;
	private String Date;
	private String Num; // 관정보
	
	private String userId; // 포인트 가져올 유저 아이디
	
	// 예매좌석등을 가져오는데 사용되는 bCode
	private int bCode;
	
}
