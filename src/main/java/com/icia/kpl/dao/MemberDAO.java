package com.icia.kpl.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.kpl.dto.MEMBER;
import com.icia.kpl.dto.PAGE;
import com.icia.kpl.dto.SEARCH;

@Repository
public class MemberDAO {

	// [1] sql(mapper) 연결

	@Autowired
	private SqlSessionTemplate sql;

	// 회원가입
	public int MMF005(MEMBER member) {

		return sql.insert("Member.MMF005", member);
	}

	// 에이잭스로 아이디 중복 검사
	public String MMF002(String memId) {
		// System.out.println("service -> dao memid : " + memId);
		return sql.selectOne("Member.MMF002", memId);
	}

	// 로그인
	public String MMF007(MEMBER member) {

		// System.out.println("service -> dao member : " + member);
		return sql.selectOne("Member.MMF007", member);
	}

	// 내정보 보기
	public MEMBER MMF009(String mId) {

		// System.out.println("service -> dao mId : " + mId);
		return sql.selectOne("Member.MMF009", mId);
	}

	// 회원 수정
	public int MMF011(MEMBER member) {
		// System.out.println("회원 수정 service -> dao member : " + member);
		return sql.update("Member.MMF011", member);
	}

	// 회원 탈퇴
	public int MMF012(String mId) {

		// System.out.println("회원 탈퇴 service -> dao mId : " + mId);
		return sql.delete("Member.MMF012", mId);
	}

	// 로그인시 유저모드 가져오기
	public String MMF013(MEMBER member) {

		return sql.selectOne("Member.MMF013", member);
	}

	// 정보 확인하기
	public int MMF015(MEMBER member) {

		return sql.selectOne("Member.MMF015", member);
	}

	// 비밀번호 수정
	public int MMF017(MEMBER member) {
		// System.out.println("비밀번호 변경 service -> dao member : " + member);
		return sql.update("Member.MMF017", member);
	}

	// 회원 검색
	public List<MEMBER> MMF020(SEARCH search) {
		System.out.println(search);
		return sql.selectList("Member.MMF020", search);
	}

	// 회원목록 검색시 회원목록 갯수
	public int MMF021(SEARCH search) {

		return sql.selectOne("Member.MMF021", search);
	}

	// 관리자 변경
	public int MMF022(MEMBER member) {

		return sql.update("Member.MMF022", member);
	}

	// 회원 목록
	public List<MEMBER> MMF018(PAGE paging) {

		return sql.selectList("Member.MMF018", paging);
	}

	// 회원 목록 갯수
	public int MMF019() {

		return sql.selectOne("Member.MMF019");
	}

}
