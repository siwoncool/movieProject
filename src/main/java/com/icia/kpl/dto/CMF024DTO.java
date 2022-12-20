package com.icia.kpl.dto;

import lombok.Data;

@Data
public class CMF024DTO {
	private String tName;	// 지점이름
	private String bDate;	// 날짜
	private int mCode;		// 영화코드
	private int tNum;		// 해당 상영관의 관 번호
	private String bTime;	// 상영시간
	private int bSeat;		// 남은 좌석
	private int bCode;
}
