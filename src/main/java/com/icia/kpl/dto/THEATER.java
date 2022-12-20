package com.icia.kpl.dto;

import lombok.Data;

@Data
public class THEATER {
	private int tCode;	//고유식별코드(시퀀스)
	private String tName; // 지점이름
	private int tNum;	// 지점에서 몇 상영관인지?
	private String tType; // 2D, 4D, IMAX인지
	private String tLineEnd;	// 좌석 끝행
	private int tRowEnd;		// 좌석 끝열
	private int tSize;			// 상영관 총 좌석수
	private int tMCode;			// 상영관에 배정된 영화
}
