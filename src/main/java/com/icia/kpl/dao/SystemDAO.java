package com.icia.kpl.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.kpl.dto.CUPON;
import com.icia.kpl.dto.CUSTOMER;
import com.icia.kpl.dto.MEMBER;
import com.icia.kpl.dto.OFFEVENT;
import com.icia.kpl.dto.PAGE;
import com.icia.kpl.dto.PRICE;

@Repository
public class SystemDAO {

	// [1] sql(mapper) 연결
	@Autowired
	private SqlSessionTemplate sql;

	// 고객센터 글 작성
	public int SMF003(CUSTOMER customer) {

		return sql.insert("System.SMF003", customer);
	}

	// 고객센터 목록
	public List<CUSTOMER> SMF001(PAGE paging) {

		return sql.selectList("System.SMF001", paging);
	}

	// 고객센터 글 상세보기
	public CUSTOMER SMF004(int cCode) {

		return sql.selectOne("System.SMF004", cCode);
	}

	// 고객센터 전체 게시글 갯수(페이징 처리)
	public int SMF005() {

		return sql.selectOne("System.SMF005");
	}

	// 고객센터 글 수정
	public int SMF007(CUSTOMER customer) {

		return sql.update("System.SMF007", customer);
	}

	// 고객센터 글 삭제
	public int SMF008(int cCode) {

		return sql.delete("System.SMF008", cCode);
	}

	// 이벤트 게시물 가져오기
	public List<OFFEVENT> SMF009() {

		return sql.selectList("System.SMF009");
	}

	// 이벤트 게시물 상세보기
	public OFFEVENT SMF010(int eNum) {

		return sql.selectOne("System.SMF010", eNum);
	}

	// 이벤트 게시물 작성
	public int SMF012(OFFEVENT offevent) {

		return sql.insert("System.SMF012", offevent);
	}

	// 이벤트 쿠폰 발급
	public void SMF013(CUPON cupon) {
		sql.insert("System.SMF013", cupon);
	}

	// 이벤트 게시물 삭제
	public int SMF014(int eNum) {

		return sql.delete("System.SMF014", eNum);
	}

	// 가격설정 폼이동 상품타입 미리 만들어둔게 있으면 가져오기
	public List<String> SMF015() {

		return sql.selectList("System.SMF015");
	}

	// 상품가격 설정
	public int SMF016(PRICE price) {

		return sql.insert("System.SMF016", price);
	}

	// 상품이름 중복확인
	public String SMF017(String pName) {

		return sql.selectOne("System.SMF017", pName);
	}

	// 상품리스트 폼이동
	public List<PRICE> SMF018() {

		return sql.selectList("System.SMF018");
	}

	// 상품수정 폼이동
	public PRICE SMF019(String pName) {

		return sql.selectOne("System.SMF019", pName);
	}

	// 상품수정
	public int SMF020(PRICE price) {

		return sql.update("System.SMF020", price);
	}

	// 상품삭제
	public int SMF021(String pName) {

		return sql.delete("System.SMF021", pName);
	}

	// 기존에 예매 타입의 가격이 존재하나 확인
	public int SMF024(String pType) {
		return sql.selectOne("System.SMF024", pType);
	}

	// 기존에 예매 타입의 가격이 존재하면 삭제
	public void SMF025(String pType) {
		sql.delete("System.SMF025", pType);
	}
	
	// 결제정보 넘기기
		public int SMF026(String userId) {

			return sql.selectOne("System.SMF026",userId);
		}

		// 포인트 적립
		public void SMF027(MEMBER member) {
			sql.update("System.SMF027", member);
			
		}





}
