package com.icia.kpl.dto;

import lombok.Data;

@Data
public class CUSTOMER {
	private int cCode;				// 글 번호
	private	String cId;				// 작성자
	private String cTitle;			// 글 제목
	private String cContent;		// 글 내용
	private String cAnswer1;		// 답변 내용
	private String cOpen;			// 공개 비공개
	private String cAnswer2;		// 맵퍼에서 기본 '답변 전' 어드민 답변 시 답변완료	

}