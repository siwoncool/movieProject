package com.icia.kpl.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.kpl.dto.BRANCH;
import com.icia.kpl.dto.CMF023DTO;
import com.icia.kpl.dto.CMF024DTO;
import com.icia.kpl.dto.CMF026DTO;
import com.icia.kpl.dto.CMF032DTO;
import com.icia.kpl.dto.CMF039DTO;
import com.icia.kpl.dto.CMF047DTO;
import com.icia.kpl.dto.LIKE;
import com.icia.kpl.dto.MEMBER;
import com.icia.kpl.dto.MOVIE;
import com.icia.kpl.dto.MOVIETIME;
import com.icia.kpl.dto.SEQDTO;
import com.icia.kpl.dto.THEATER;

@Repository
public class MovieDAO {

	// [1] sql(mapper) 연결
	
	@Autowired
	private SqlSessionTemplate sql;

	// 영화정보 저장하기
	public int CMF003(MOVIE movie) {
		
		//System.out.println("무비 : " + movie);
		return sql.insert("Movie.CMF003", movie);
	}

	// 영화정보 불러오기
	public MOVIE CMF004(int mCode) {
		
		return sql.selectOne("Movie.CMF004",mCode);
	}

	// 영화정보 리스트 불러오기
	public List<MOVIE> CMF005() {
		
		return sql.selectList("Movie.CMF005");
	}

	// 좋아요 전에 올렸나 아닌가 확인
	public int CMF006_1(LIKE like) {
		
		return sql.selectOne("Movie.CMF006_1",like);
	}

	// 좋아요 갯수 가져오기
	public int CMF006(int mCode) {
		
		return sql.selectOne("Movie.CMF006", mCode);
	}
	
	// 좋아요 추가
	public void CMF006_2(LIKE like) {
		sql.insert("Movie.CMF006_2", like);
		
	}
	
	// 좋아요 삭제
	public void CMF006_3(LIKE like) {
		sql.delete("Movie.CMF006_3", like);
	}
	
	// 지점 추가
	public int CMF008(BRANCH branch) {
		
		return sql.insert("Movie.CMF008", branch);
	}

	// 지점 정보 가져오는 ajax
	public List<BRANCH> CMF010(String bLocation) {
		
		return sql.selectList("Movie.CMF010", bLocation);
	}

	// 지점 이름 불러오기
	public List<String> CMF011() {
		
		return sql.selectList("Movie.CMF011");
	}

	// 지점 상영관 추가시 상영관 번호
	public int CMF012(String bName) {
		
		return sql.selectOne("Movie.CMF012", bName);
	}

	// 상영관추가
	public int CMF013(THEATER theater) {
		return sql.insert("Movie.CMF013", theater);
	}

	// 기존 상영시간표 삭제
	public int CMF016() {
		
		SEQDTO seqdto = new SEQDTO();
		
		// 시퀀스 삭제
		String seq = "DROP SEQUENCE BCODE_SEQ";
		seqdto.setSeq(seq);
		sql.selectOne("Movie.CMF016_1", seqdto);
		
		// 시퀀스 생성
		seq = "CREATE SEQUENCE BCODE_SEQ START WITH 1";
		seqdto.setSeq(seq);
		sql.selectOne("Movie.CMF016_2", seqdto);
		
		// 예매정보 전부 삭제
		sql.delete("Movie.CMF041");
		
		
		return sql.delete("Movie.CMF016");
	}

	// 상영관 정보 리스트로 불러오기
	public List<THEATER> CMF017() {
		
		return sql.selectList("Movie.CMF017");
	}
	
	// 기존 상영시간표가 있는지 확인
	public int CMF018() {
		return sql.selectOne("Movie.CMF018");
	}

	// 영화 러닝 타임 구해오기
	public String CMF019(int tmCode) {
		return sql.selectOne("Movie.CMF019",tmCode);
	}

	// 상영시간표 넣기
	public int CMF020(MOVIETIME movietime) {
		
		return sql.insert("Movie.CMF020", movietime);
	}

	// 지점에 현재 상영중인 영화 가져오기
	public List<String> CMF022(String branchName) {
		
		return sql.selectList("Movie.CMF022", branchName);
	}

	// 해당 지점에 해당 상영관 영화를 상영하는 관정보
	public List<String> CMF023(CMF023DTO dto) {
		
		return sql.selectList("Movie.CMF023",dto);
	}

	//상영시간표3 ajax 상영시간정보
	public List<CMF024DTO> CMF024(CMF024DTO dto) {
		
		return sql.selectList("Movie.CMF024",dto);
	}

	// 영화정보(타이틀, 코드) 가져오기
	public List<MOVIE> CMF025() {
		return sql.selectList("Movie.CMF025");
	}

	// 상영하는 상영관 지역표시ajax
	public List<CMF026DTO> CMF026(int mCode) {
		
		return sql.selectList("Movie.CMF026", mCode);
	}

	// 유저 나이 구해오기 ajax
	public String CMF028(String user) {
		return sql.selectOne("Movie.CMF028", user);
	}
	
	// 상영하는 상영관 표시 ajax
	public List<CMF026DTO> CMF029(CMF026DTO dto) {
		return sql.selectList("Movie.CMF029", dto);
	}

	// 상영하는 상영일 표시 ajax
	public List<CMF026DTO> CMF030(CMF026DTO dto) {
		return sql.selectList("Movie.CMF030", dto);
	}

	// 이거 뭔지 모르겠는데? 잡리스트에서 엉킨듯하나 사용되지 않는것으로 보임
	public CMF032DTO CMF032(int bCode) {
		return sql.selectOne("Movie.CMF032", bCode);
	}

	// 선택한 시간의 상영관 행, 열, 사이즈 구해오기
	public THEATER CMF034(int bCode) {
		
		return sql.selectOne("Movie.CMF034", bCode);
	}

	// 선택한 예매 정보 가져오기
	public MOVIETIME CMF035(int bCode) {
		return sql.selectOne("Movie.CMF035", bCode);
	}

	// 티켓 가격 구해오기
	public int CMF036() {
		
		return sql.selectOne("Movie.CMF036");
	}

	// 유저 포인트 구해오기
	public int CMF037(String userId) {
	
		return sql.selectOne("Movie.CMF037", userId);
	}

	// 이미 예매된 좌석 구해오기
	public List<String> CMF038(int bCode) {
		
		return sql.selectList("Movie.CMF038", bCode);
	}

	// 좌석 저장
	public int CMF039(CMF039DTO dto) {
		int bCode=dto.getBCode();
		sql.update("Movie.CMF042", bCode);
		return sql.insert("Movie.CMF039", dto);
	}

	//결제 취소
	public int CMF040(String bUUID) {
		return sql.delete("Movie.CMF040", bUUID);
	}

	// 포인트 적립
	public int CMF043(MEMBER member) {
		return sql.delete("Movie.CMF043", member);
	}

	// 예약된 uuid 가져오기
	public List<CMF039DTO> CMF046(String userId) {
		
		return sql.selectList("Movie.CMF046", userId);
	}
	//상영관시간,날짜 및 상영관 정보 가져오기
	public CMF047DTO CMF047(int bCode) {
		
		return sql.selectOne("Movie.CMF047", bCode);
	}

	// uuid로 바인딩된 좌석 구해오기
	public List<String> CMF048(String buuid) {
		return sql.selectList("Movie.CMF048", buuid);
	}

	// 예매순위로 가져오기
	public List<MOVIE> CMF049() {
		
		return sql.selectList("Movie.CMF049");
	}

	// 좋아요 순위 가져오기
	public List<MOVIE> CMF050() {
		return sql.selectList("Movie.CMF050");
	}








}
