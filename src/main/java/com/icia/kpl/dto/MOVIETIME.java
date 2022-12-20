package com.icia.kpl.dto;

import lombok.Data;

@Data
public class MOVIETIME {
	
	private int bCode;	// 예매 고유번호
	private int BTCode;	// 상영관정보 테이블의 기본키 -> 식별과 조인등에 쓰임
	private String bDate;	// 상영일
	private String bTime;	// 상영시간
	private int bSeat;		// 남은 좌석수
	
}
