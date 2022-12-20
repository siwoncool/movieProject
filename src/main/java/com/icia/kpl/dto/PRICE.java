package com.icia.kpl.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PRICE {
	private String pName;			// 상품이름
	private String pType;			// 상품 분류 음식,티켓,기념품,회원권
	private int pPrice;				// 가격
	private int pDc;				// 할인율
	private String pImgName;		// 상품 이미지 링크
	private MultipartFile pImgFile;	//상품이미지
}
