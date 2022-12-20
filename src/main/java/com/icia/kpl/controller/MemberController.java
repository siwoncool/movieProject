package com.icia.kpl.controller;

import java.io.IOException;
import java.lang.reflect.Member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.kpl.service.MemeberService;
import com.icia.kpl.dto.MEMBER;
import com.icia.kpl.dto.SEARCH;

@Controller
public class MemberController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	MemeberService msvc = new MemeberService();

	// 세션
	@Autowired
	private HttpSession session;

	// MMF001 : 회원가입페이지로 이동!
	@RequestMapping(value = "/MMF001", method = RequestMethod.GET)
	public String memberJoinForm() {
		return "memberJoin";
	}

	// MMF005 : 회원가입
	@RequestMapping(value = "/MMF005", method = RequestMethod.POST)
	public ModelAndView memberJoin(@ModelAttribute MEMBER member) throws IllegalStateException, IOException {

		mav = msvc.MMF005(member);

		return mav;
	}

	// MMF002 : 아이디 중복체크 ajax
	@RequestMapping(value = "/MMF002", method = RequestMethod.POST)
	public @ResponseBody String idoverlap(@RequestParam("memId") String memId) {
		//System.out.println("ajax로 넘어온 memId : " + memId);
		String result = msvc.MMF002(memId);

		//System.out.println("db에서 확인한 result메세지 : " + result);
		return result;
	}

	// MMF006: 로그인 폼 이동
	@RequestMapping(value = "/MMF006", method = RequestMethod.GET)
	public String MMF006() {
		return "memberLogin";
	}

	// MMF007 : 로그인
	@RequestMapping(value = "/MMF007", method = RequestMethod.POST)
	public ModelAndView MMF007(@ModelAttribute MEMBER member) {
		mav = msvc.MMF007(member);
		return mav;
	}

	// MMF008 : 로그아웃
	@RequestMapping(value = "/MMF008", method = RequestMethod.GET)
	public String MMF008() {
		session.invalidate();
		return "index";
	}

	// MMF009 : 내 정보 보기
	@RequestMapping(value = "/MMF009", method = RequestMethod.GET)
	public ModelAndView MMF009(@RequestParam("mId") String mId) {
		//System.out.println("내정보 보기 controler");
		mav = msvc.MMF009(mId);
		return mav;
	}

	// MMF010 : 회원수정 폼 이동
	@RequestMapping(value = "/MMF010", method = RequestMethod.GET)
	public ModelAndView MMF010(@RequestParam("mId") String mId) {
		//System.out.println("회원 수정폼이동 jsp -> controller \n mId : " + mId);
		mav = msvc.MMF010(mId);
		return mav;
	}

	// MMF011 :회원 수정
	@RequestMapping(value = "/MMF011", method = RequestMethod.POST)
	public ModelAndView MMF011(@ModelAttribute MEMBER member) throws IllegalStateException, IOException {
		//System.out.println("회원 수정 jsp -> controller \n member : " + member);
		mav = msvc.MMF011(member);
		return mav;
	}

	// MMF012 : 회원 탈퇴
	@RequestMapping(value = "/MMF012", method = RequestMethod.GET)
	public ModelAndView mDelete(@RequestParam("mId") String mId) {

		session.invalidate();
		mav = msvc.MMF012(mId);

		return mav;
	}

	// MMF014 : 비밀번호찾기폼 이동
	@RequestMapping(value = "/MMF014", method = RequestMethod.GET)
	public String MMF014() {

		return "memberPwsearch";
	}

	// MMF015: 회원계정 확인
	@RequestMapping(value = "/MMF015", method = RequestMethod.POST)
	public @ResponseBody String MMF015(@RequestParam("mId") String mId, @RequestParam("mName") String mName,
			@RequestParam("mPhone") String mPhone) {
		//System.out.println("ajax로 넘어온 memId : " + mId);
		String result = msvc.MMF015(mId, mName, mPhone);
		//System.out.println("db에서 확인한 result메세지 : " + result);
		return result;
	}

	// MMF016 : 비빌번호 변경페이지 이동
	@RequestMapping(value = "/MMF016", method = RequestMethod.GET)
	public ModelAndView MMF016(@RequestParam("mId") String mId) {
		//System.out.println("넘어온 mId값 : " + mId);
		mav = msvc.MMF016(mId);
		return mav;
	}

	// MMF017 : 비밀번호변경
	@RequestMapping(value = "/MMF017", method = RequestMethod.POST)
	public ModelAndView MMFMMF017(@ModelAttribute MEMBER member) throws IllegalStateException, IOException {
		//System.out.println("회원 비밀번호 변경 jsp -> controller \n member : " + member);

		mav = msvc.MMF017(member);
		return mav;
	}
	
	// MMF018 : 회원목록 및 검색
	@RequestMapping(value = "/MMF018", method = RequestMethod.GET)
	public ModelAndView MMF018(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "5") int limit) {

		mav = msvc.MMF018(page, limit);

		return mav;
	}
	
	// MMF020 : 회원 검색
	@RequestMapping(value = "/MMF020", method = RequestMethod.GET)
	public ModelAndView MMF020(@ModelAttribute SEARCH search, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "5") int limit) {

		mav = msvc.MMF020(search, page, limit);

		return mav;
	}
	
	// MMF022 : 회원 관리자 변경
	@RequestMapping(value = "/MMF022", method = RequestMethod.GET)
	public ModelAndView MMF022(@ModelAttribute MEMBER member) {

		mav = msvc.MMF022(member);

		return mav;
	}

}
