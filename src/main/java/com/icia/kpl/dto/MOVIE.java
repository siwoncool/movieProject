package com.icia.kpl.dto;

import lombok.Data;

@Data
public class MOVIE {
 private int mCode;			// 영화코드
 private String mTitle;		// 영화제목
 private String mOpen;		// 개봉일
 private String mRunTime;	// 러닝타임
 private String mAge;		// 관람가
 private String mPoster;	// 포스터 주소
 private String mPreView;	// 예고편
 private String mGenre;		// 장르
 private String mLike;		// like 갯수
}
