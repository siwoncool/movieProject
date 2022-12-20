package com.icia.kpl.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.kpl.dto.CUSTOMER;
import com.icia.kpl.dto.OFFEVENT;
import com.icia.kpl.dto.PRICE;
import com.icia.kpl.service.SystemService;

@Controller
public class SystemController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	SystemService ssvc = new SystemService();

	// 세션
	@Autowired
	private HttpSession session;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "indexIntro";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {

		return "index";
	}

	// SMF001 : 고객센터 리스트 이동
	@RequestMapping(value = "/SMF001", method = RequestMethod.GET)
	public ModelAndView SMF001(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "5") int limit) {

		mav = ssvc.SMF001(page, limit);

		return mav;
	}

	// SMF002 : 고객센터 작성폼 이동
	@RequestMapping(value = "/SMF002", method = RequestMethod.GET)
	public String SMF002() {

		return "csWrite";

	}

	// SMF003 : 고객센터 작성
	@RequestMapping(value = "/SMF003", method = RequestMethod.POST)
	public ModelAndView SMF003(@ModelAttribute CUSTOMER customer) {

		mav = ssvc.SMF003(customer);

		return mav;
	}

	// SMF004 : 고객센터 글 상세보기
	@RequestMapping(value = "/SMF004", method = RequestMethod.GET)
	public ModelAndView SMF004(@RequestParam("cCode") int cCode) {

		mav = ssvc.SMF004(cCode);

		return mav;
	}

	// SMF006 : 고객센터 글 수정폼 이동
	@RequestMapping(value = "/SMF006", method = RequestMethod.GET)
	public ModelAndView SMF006(@RequestParam("cCode") int cCode) {
		mav = ssvc.SMF006(cCode);

		return mav;
	}

	// SMF007 : 고객센터 글 수정
	@RequestMapping(value = "/SMF007", method = RequestMethod.POST)
	public ModelAndView SMF007(@ModelAttribute CUSTOMER customer) {

		mav = ssvc.SMF007(customer);

		return mav;
	}

	// SMF008 : 고객센터 글 삭제
	@RequestMapping(value = "/SMF008", method = RequestMethod.GET)
	public ModelAndView SMF008(@RequestParam("cCode") int cCode) {
		mav = ssvc.SMF008(cCode);

		return mav;

	}

	// SMF009 : 오프라인 이벤트 페이지 이동
	@RequestMapping(value = "/SMF009", method = RequestMethod.GET)
	public ModelAndView SMF009() {

		mav = ssvc.SMF009();
		return mav;
	}

	// SMF010 : 이벤트 게시물 상세보기
	@RequestMapping(value = "/SMF010", method = RequestMethod.GET)
	public ModelAndView SMF010(@RequestParam("eNum") int eNum) {
		System.out.println("이벤트 상세보기 jsp -> 컨트롤러 mNum" + eNum);
		mav = ssvc.SMF010(eNum);
		return mav;
	}

	// SMF011 : 이벤트 게시물 작성하기페이지 이동
	@RequestMapping(value = "/SMF011", method = RequestMethod.GET)
	public String SMF011() {

		return "systemOffeventWrite";
	}

	// SMF012 : 이벤트 게시물 작성
	@RequestMapping(value = "/SMF012", method = RequestMethod.POST)
	public ModelAndView SMF012(@ModelAttribute OFFEVENT offevent) throws IllegalStateException, IOException {
		System.out.println("이벤트게시물 jsp -> controller : " + offevent);
		mav = ssvc.SMF012(offevent);

		return mav;
	}

	// SMF013 : 이벤트 쿠폰 발급
	@RequestMapping(value = "/SMF013", method = RequestMethod.POST)
	public @ResponseBody String SMF013(@RequestParam("cName") String cName, @RequestParam("cId") String cId) {
		System.out.println("넘어온 값들!!! : " + cName + "  " + cId);

		String result = ssvc.SMF013(cName, cId);

		return result;
	}

	// SMF014 : 이벤트 게시물 삭제
	@RequestMapping(value = "/SMF014", method = RequestMethod.GET)
	public ModelAndView SMF014(@RequestParam("eNum") int eNum) {
		System.out.println("이벤트 삭제하기 jsp -> 컨트롤러 eTitle" + eNum);
		mav = ssvc.SMF014(eNum);
		return mav;
	}

	// SMF015 : 가격설정폼이동
	@RequestMapping(value = "/SMF015", method = RequestMethod.GET)
	public ModelAndView SMF015() {
		mav = ssvc.SMF015();
		return mav;
	}

	// SMF016 : 가격설정
	@RequestMapping(value = "/SMF016", method = RequestMethod.POST)
	public ModelAndView SMF016(@ModelAttribute PRICE price) throws IllegalStateException, IOException {
		mav = ssvc.SMF016(price);
		return mav;
	}

	// SMF017 : 상품이름 중복확인
	@RequestMapping(value = "/SMF017", method = RequestMethod.POST)
	public @ResponseBody String SMF017(@RequestParam("pName") String pName) {
		System.out.println("넘어온 값!!! pName : " + pName);

		String result = ssvc.SMF017(pName);

		return result;
	}

	// SMF018 : 상품리스트 이동
	@RequestMapping(value = "/SMF018", method = RequestMethod.GET)
	public ModelAndView SMF018() {
		mav = ssvc.SMF018();
		return mav;
	}

	// SMF019 : 상품 수정페이지 이동
	@RequestMapping(value = "/SMF019", method = RequestMethod.GET)
	public ModelAndView SMF019(@RequestParam("pName") String pName) {
		System.out.println(" 상품수정 jsp -> 컨트롤러 pName" + pName);
		mav = ssvc.SMF019(pName);
		return mav;
	}

	// SMF020 : 상품수정
	@RequestMapping(value = "/SMF020", method = RequestMethod.POST)
	public ModelAndView SMF020(@ModelAttribute PRICE price) throws IllegalStateException, IOException {
		mav = ssvc.SMF020(price);
		return mav;
	}

	// SMF021 : 상품 삭제
	@RequestMapping(value = "/SMF021 ", method = RequestMethod.GET)
	public ModelAndView SMF021(@RequestParam("pName") String pName) {
		mav = ssvc.SMF021(pName);
		return mav;
	}

	// SMF022 : 상품리스트(고객)
	@RequestMapping(value = "/SMF022", method = RequestMethod.GET)
	public ModelAndView SMF022() {
		mav = ssvc.SMF022();
		return mav;
	}

	// SMF023: 상품자세히보기
	@RequestMapping(value = "/SMF023", method = RequestMethod.GET)
	public ModelAndView SMF023(@RequestParam("pName") String pName) {
		mav = ssvc.SMF023(pName);
		return mav;
	}

	// SMF026 : 결제정보창
	@RequestMapping(value = "/SMF026", method = RequestMethod.GET)
	public ModelAndView SMF026(@RequestParam("sum") int sum, @RequestParam("pName") String pName,
			@RequestParam("userId") String userId) {
		System.out.println("결제정보 넘어오는 값들 : " + pName + " " + sum + userId);
		mav = ssvc.SMF026(pName, sum, userId);
		return mav;
	}

	// SMF027: 결제후 인덱스 이동
	@RequestMapping(value = "/SMF027", method = RequestMethod.GET)
	public ModelAndView SMF027(@RequestParam("point") int point, @RequestParam("userId") String userId) {
		System.out.println("결제정보 넘어오는 값들 :" + point + userId);
		mav = ssvc.SMF027(point, userId);
		return mav;
	}
}
