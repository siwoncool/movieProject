package com.icia.kpl.dto;

import lombok.Data;

@Data
public class SEQDTO {
	
	// 이 DTO에 sql문을 적고 맵퍼에서 select로 실행시키면 실행이 된다. ${seq}로 실행가능
	
	private String seq; // 시퀀스 자동 생성 및 삭제인데 sql문 통틀어 사용가능
}
