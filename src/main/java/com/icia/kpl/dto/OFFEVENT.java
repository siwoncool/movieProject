package com.icia.kpl.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class OFFEVENT {
	 private int eNum;					// 이벤트 게시물 번호
	 private String eTitle;				// 이벤트 제목
	 private String eImg;			// 제목 이미지 이름
	 private MultipartFile eImgFile;    // 제목 이미지 사진
	 private String Copon;				//  쿠폰
	 private String eContent; 		    // 게시물 내용 이미지
	 private MultipartFile  eContentFile;		// 게시물 내용 이미지 사진

	

}

