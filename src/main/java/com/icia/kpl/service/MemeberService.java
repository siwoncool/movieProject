package com.icia.kpl.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.kpl.dao.MemberDAO;
import com.icia.kpl.dto.MEMBER;
import com.icia.kpl.dto.PAGE;
import com.icia.kpl.dto.SEARCH;

@Service
public class MemeberService {

	// ModelAndView 객체 생성
	private ModelAndView mav = new ModelAndView();

	// DAO(Repository)연결
	@Autowired
	private MemberDAO mdao;

	// 비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder pwEnc;

	// session 추가
	@Autowired
	private HttpSession session;

	// 상대경로
	@Autowired
	private HttpServletRequest request;

	// 회원가입
	public ModelAndView MMF005(MEMBER member) throws IllegalStateException, IOException {
		//System.out.println("암호화 전 : " + member);

		// [2] 주소 결합
		// - (addr1) + addr2 + addr3

		String memAddr = "(" + member.getMAddr1() + ") " + member.getMAddr2() + ", " + member.getMAddr3();
		member.setMAddr(memAddr);

		// 비밀번호 암호화
		member.setMPw(pwEnc.encode(member.getMPw()));

		//System.out.println("암호화 후 : " + member);

		// 가입
		int result = mdao.MMF005(member);

		if (result > 0) {
			mav.setViewName("memberLogin");
		} else {
			mav.setViewName("memberJoin");
		}

		return mav;
	}

	// 아이디 중복체크
	public String MMF002(String memId) {

		String checkId = mdao.MMF002(memId);
		String result;

		if (checkId == null) {
			// 아이디 사용가능
			result = "OK";
		} else {
			// 이미 사용중인 아이디
			result = "NO";
		}

		return result;
	}

	// 로그인
	public ModelAndView MMF007(MEMBER member) {

		String encPw = mdao.MMF007(member);

		if (pwEnc.matches(member.getMPw(), encPw)) {

			// 로그인시 유저모드 가져오기
			String mMode = mdao.MMF013(member);

			session.setAttribute("loginId", member.getMId());
			session.setAttribute("MODE", mMode);
			mav.setViewName("index");
		} else {
			mav.setViewName("memberLogin");
		}

		return mav;
	}

	// 내 정보 보기
	public ModelAndView MMF009(String mId) {

		//System.out.println("서비스1");
		MEMBER member = mdao.MMF009(mId);
		//System.out.println("서비스2");

		mav.addObject("member", member);
		mav.setViewName("memberView");

		return mav;
	}

	// 회원수정 페이지
	public ModelAndView MMF010(String mId) {
		//System.out.println("회원 수정폼이동 controller -> service \n mId : " + mId);
		MEMBER member = mdao.MMF009(mId);
		//System.out.println("회원 수정폼이동 dao -> service \n member : " + member);

		// 주소 분리
		int index = member.getMAddr().indexOf(")");
		member.setMAddr1(member.getMAddr().substring(1, index));
		int index2 = member.getMAddr().indexOf(",");
		member.setMAddr2(member.getMAddr().substring(index + 1, index2));
		member.setMAddr3(member.getMAddr().substring(index2 + 1));

		mav.addObject("member", member);
		mav.setViewName("memberModify");
		return mav;
	}

	// 회원수정
	public ModelAndView MMF011(MEMBER member) throws IllegalStateException, IOException {
		//System.out.println("회원 수정 controller -> service \n member : " + member);
		MultipartFile memProfile = member.getMProFile();

		// 저장경로
		String savePath = request.getServletContext().getRealPath("/resources/profile/");
		// String savePath =
		// request.getSession().getServletContext().getRealPath("/resources/profile/");

		if (!memProfile.isEmpty()) {

			// 랜덤 식별문자
			UUID uuid = UUID.randomUUID();
			// 날짜
			LocalDate now = LocalDate.now();
			// 시간
			LocalTime now2 = LocalTime.now();
			// 파일 이름은 날짜와 시간 랜덤 식별문자를 파일이름과 합친것
			String profileName = now + "_" + now2.toString().replaceAll("[^\\w+]", "") + "_"
					+ uuid.toString().substring(0, 8) + "_" + memProfile.getOriginalFilename();

			// 기존 파일 삭제
			String deletePath = request.getServletContext().getRealPath("/resources/profile/")
					+ member.getMProFileName();

			File deleteFile = new File(deletePath);

			if (deleteFile.exists()) {
				deleteFile.delete();
				//System.out.println("기존 파일 삭제 성공!");
			} else {
				//System.out.println("기존 파일 삭제 실패!");
			}

			memProfile.transferTo(new File(savePath + profileName));
			member.setMProFileName(profileName);
		}

		System.out.println("암호화 전 : " + member);

		// [2] 주소 결합
		// - (addr1) + addr2 + addr3

		String memAddr = "(" + member.getMAddr1() + ") " + member.getMAddr2() + ", " + member.getMAddr3();
		member.setMAddr(memAddr);

		//System.out.println("MCP가 뭔데요? " + member.getMcPw());

		// 비밀번호 암호화(변경시)
		if (!member.getMcPw().trim().isEmpty()) {
			member.setMPw(pwEnc.encode(member.getMcPw()));
		}

		//System.out.println("암호화 후 : " + member);
		//System.out.println("회원 수정에서 파일, 암호화등 적용 후 service로 이동 \n member : " + member);

		// 수정실행
		int result = mdao.MMF011(member);
		//System.out.println("회원 수정 dao -> service \n member : " + member);

		// 결과
		if (result > 0) {
			mav.setViewName("index");
		} else {
			// 수정해야함
			mav.setViewName("memberJoin");
		}

		return mav;
	}

	// 회원 탈퇴
	public ModelAndView MMF012(String mId) {

		int result = mdao.MMF012(mId);

		if (result > 0) {
			mav.setViewName("index");
		} else {
			mav.setViewName("redirect:/MMF009?mId=" + mId);
		}

		return mav;

	}

	// MMF015: 회원계정 확인
	public String MMF015(String mId, String mName, String mPhone) {
		MEMBER member = new MEMBER();
		member.setMId(mId);
		member.setMName(mName);
		member.setMPhone(mPhone);

		int check = mdao.MMF015(member);
		String result;
		//System.out.println(check);
		if (check != 0) {
			// 아이디 사용가능
			result = mId;
		} else {
			// 이미 사용중인 아이디
			result = "NO";
		}

		return result;
	}

	// MMF016: 비밀번호 수정페이지 이동
	public ModelAndView MMF016(String mId) {
		//System.out.println(mId);
		mav.addObject("mId", mId);
		mav.setViewName("memberRepw");
		return mav;
	}

	// MMF017 : 비밀번호수정
	public ModelAndView MMF017(MEMBER member) {
		//System.out.println("controller -> service member : " + member);
		member.setMPw(pwEnc.encode(member.getMPw()));

		//System.out.println("암호화 후 : " + member);

		// 수정실행
		int result = mdao.MMF017(member);
		//System.out.println("회원 수정 dao -> service \n member : " + member);

		// 결과
		if (result > 0) {
			mav.setViewName("memberLogin");
		} else {
			// 수정해야함
			mav.setViewName("memPwsearch");
		}
		return mav;
	}
	
	// MMF018 : 회원목록 페이징 처리
	public ModelAndView MMF018(int page, int limit) {
		
		// 한 화면에 보여줄 페이지 번호 갯수
		int block = 5;

		// 한 화면에 보여줄 게시글 갯수
		// int limit = 5;

		// 전체 게시글 갯수 : 7
		// MMF019 : 회원목록 갯수
		int cCount = mdao.MMF019();
		if(cCount == 0) {
			cCount=1;
		}

		int maxPage = (int) (Math.ceil((double) cCount / limit));

		if (page > maxPage) {
			page = maxPage;
		}

		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;

		int startPage = (((int) (Math.ceil((double) page / block))) - 1) * block + 1;
		int endPage = startPage + block - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		// 페이징 객체 생성
		PAGE paging = new PAGE();

		paging.setPage(page);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setLimit(limit);

		List<MEMBER> memberList = mdao.MMF018(paging);

		mav.addObject("memberList", memberList);
		mav.addObject("paging", paging);
			
		mav.setViewName("memberList");
		
		return mav;
	}

	// MMF020 : 회원 검색
	public ModelAndView MMF020(SEARCH search, int page, int limit) {
		
		// 한 화면에 보여줄 페이지 번호 갯수
		int block = 5;

		// 한 화면에 보여줄 게시글 갯수
		// int limit = 5;

		// 전체 게시글 갯수 : 7
		// MMF021 : 회원목록 검색시 회원목록 갯수
		int cCount = mdao.MMF021(search);
		if(cCount == 0) {
			cCount=1;
		}

		int maxPage = (int) (Math.ceil((double) cCount / limit));

		if (page > maxPage) {
			page = maxPage;
		}

		int startRow = 1;
		int endRow = 10;

		int startPage = (((int) (Math.ceil((double) page / block))) - 1) * block + 1;
		int endPage = startPage + block - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		search.setPage(page);
		search.setStartRow(startRow);
		search.setEndRow(endRow);
		search.setMaxPage(maxPage);
		search.setStartPage(startPage);
		search.setEndPage(endPage);
		search.setLimit(limit);
		
		List<MEMBER> memberList = mdao.MMF020(search);
				
		mav.addObject("memberList", memberList);
		mav.setViewName("searchList");
		mav.addObject("search", search);
		
		return mav;
	}
	
	// 관리자 변경
	public ModelAndView MMF022(MEMBER member) {
		
		int result = mdao.MMF022(member);
		
		if (result > 0) {
			mav.setViewName("index");
		} else {
			mav.setViewName("redirect:/MMF009?mId=" + member);
		}
		
		return mav;
	}

}
