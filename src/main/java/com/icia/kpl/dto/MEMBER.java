package com.icia.kpl.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MEMBER {
	

	private String mId;					// 아이디
	private String mPw;					// 비밀번호
	private String mName;				// 이름
	private String mBirth;				// 생일
	private String mGender;				// 성별
	private String mEmail;				// 이메일
	private String mAddr1;				// 주소1
	private String mAddr2;				// 주소2
	private String mAddr3;				// 주소3
	private String mAddr;				// 결합하는 주소
	private String mProFileName;		// 프로필사진 이름
	private MultipartFile mProFile;		// 프로필 사진
	private String mGrade;				// 등급
	private String mPay;				// 결제정보
	private String mOne;				// 원터치 결제 유무
	private String mMode;				// 회원 모드(어드민, 유저)
	private String mPhone;				// 연락처
	private int mPoint;					// 회원 포인트
	
	private String mcPw;				// 비밀번호 변경
}
