package com.icia.kpl.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.kpl.dao.SystemDAO;
import com.icia.kpl.dto.CUPON;
import com.icia.kpl.dto.CUSTOMER;
import com.icia.kpl.dto.MEMBER;
import com.icia.kpl.dto.OFFEVENT;
import com.icia.kpl.dto.PAGE;
import com.icia.kpl.dto.PRICE;

@Service
public class SystemService {

	// ModelAndView 객체 생성
	private ModelAndView mav = new ModelAndView();

	// DAO(Repository)연결
	@Autowired
	private SystemDAO sdao;

	// session 추가
	@Autowired
	private HttpSession session;

	// 상대경로
	@Autowired
	private HttpServletRequest request;
	

	// 고객센테 글 작성
	public ModelAndView SMF003(CUSTOMER customer) {

		int result = sdao.SMF003(customer);

		if (result > 0) {
			mav.setViewName("csList");
		} else {
			mav.setViewName("csWrite");
		}
		return mav;
	}

	// 고객센터 목록
	public ModelAndView SMF001(int page, int limit) {

		// 한 화면에 보여줄 페이지 번호 갯수
		int block = 5;

		// 한 화면에 보여줄 게시글 갯수
		// int limit = 5;

		// 전체 게시글 갯수 : 7
		int cCount = sdao.SMF005();
		if (cCount == 0) {
			cCount = 1;
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

		List<CUSTOMER> csList = sdao.SMF001(paging);

		mav.addObject("csList", csList);
		mav.addObject("paging", paging);

		mav.setViewName("csList");

		return mav;
	}

	// 고객센터 글 상세보기
	public ModelAndView SMF004(int cCode) {

		CUSTOMER customer = sdao.SMF004(cCode);

		// System.out.println("상세보기 : " + customer);
		mav.addObject("view", customer);
		mav.setViewName("csView");

		return mav;
	}

	// 고객센터 글 수정 폼
	public ModelAndView SMF006(int cCode) {

		CUSTOMER customer = sdao.SMF004(cCode);

		mav.addObject("modify", customer);
		mav.setViewName("csModify");

		return mav;
	}

	// 고객센터 글 수정
	public ModelAndView SMF007(CUSTOMER customer) {
		// System.out.println(customer);
		int result = sdao.SMF007(customer);

		if (result > 0) {
			mav.setViewName("redirect:/SMF001?cCode=" + customer.getCCode());
		} else {
			mav.setViewName("redirect:/SMF001");
		}

		return mav;
	}

	// 고객센터 글 삭제
	public ModelAndView SMF008(int cCode) {

		int result = sdao.SMF008(cCode);

		if (result > 0) {
			mav.setViewName("redirect:/SMF001");
		} else {
			mav.setViewName("redirect:/SMF004?cCode=" + cCode);
		}

		return mav;
	}

	// SMF009 : 이벤트 게시물 가져오기
	public ModelAndView SMF009() {
		List<OFFEVENT> offevent = sdao.SMF009();
		System.out.println("dao-> service 넘어온 offevent : " + offevent);
		mav.addObject("offevent", offevent);
		mav.setViewName("systemOffevent");
		return mav;
	}

	// SMF010 : 이벤트 게시물 상세보기
	public ModelAndView SMF010(int eNum) {
		System.out.println("이벤트 상세보기 controller -> service  eNum : " + eNum);
		OFFEVENT offevent = sdao.SMF010(eNum);
		System.out.println("이벤트게시물 뷰에 넘어온 offevent 값? :" + offevent);
		mav.addObject("offevent", offevent);
		mav.setViewName("systemOffeventView");
		return mav;
	}

	// SMF012 이벤트게시물 작성
	public ModelAndView SMF012(OFFEVENT offevent) throws IllegalStateException, IOException {
		MultipartFile imgFile = offevent.getEImgFile();
		MultipartFile contentFile = offevent.getEContentFile();

		UUID uuid = UUID.randomUUID();

		// 랜덤한 식별 문자 uuid.toString().substring(0,8)과 실제 파일이름을 합친 것
		String imgfileName = uuid.toString().substring(0, 8) + "_" + imgFile.getOriginalFilename();
		String confileName = uuid.toString().substring(0, 8) + "_" + contentFile.getOriginalFilename();

		// 저장 경로에 파일을 업로드한다.
		String savePath = request.getServletContext().getRealPath("/resources/eventimg/");
		// 만약에 업로드 파일이 없다면
		if (!imgFile.isEmpty() && !contentFile.isEmpty()) {

			imgFile.transferTo(new File(savePath + imgfileName));
			contentFile.transferTo(new File(savePath + confileName));
			// offevent객체에 생성한 업로드한 파일 이름을 저장한다
			offevent.setEImg(imgfileName);
			offevent.setEContent(confileName);

		}

		int result = sdao.SMF012(offevent);

		if (result > 0) {
			mav.setViewName("redirect:/SMF009");
		} else {
			mav.setViewName("systemOffeventWrite");
		}

		return mav;
	}

	// 쿠폰 발급하기
	public String SMF013(String cName, String cId) {
		CUPON cupon = new CUPON();
		UUID uuid = UUID.randomUUID();
		String cuponnum = uuid.toString().substring(0, 12);
		cupon.setCUuid(cuponnum);
		cupon.setCId(cId);
		cupon.setCName(cName);
		System.out.println(cupon);
		sdao.SMF013(cupon);
		String result = cupon.getCUuid();

		return result;
	}

	// 이벤트 게시물 삭제하기
	public ModelAndView SMF014(int eNum) {

		int result = sdao.SMF014(eNum);
		if (result > 0) {
			mav.setViewName("index");
		} else {
			mav.setViewName("systemOffeventView");
		}

		return mav;
	}

	// 가격설정 폼이동
	public ModelAndView SMF015() {

		List<String> pTypeList = sdao.SMF015();

		mav.addObject("pTypeList", pTypeList);
		System.out.println(pTypeList);
		mav.setViewName("systemAddPrice");
		return mav;
	}

	// 상품 등록
	public ModelAndView SMF016(PRICE price) throws IllegalStateException, IOException {

		MultipartFile pImgFile = price.getPImgFile();

		UUID uuid = UUID.randomUUID();

		// 랜덤한 식별 문자 uuid.toString().substring(0,8)과 실제 파일이름을 합친 것
		String pImgName = uuid.toString().substring(0, 8) + "_" + pImgFile.getOriginalFilename();

		// 저장 경로에 파일을 업로드한다.
		String savePath = request.getServletContext().getRealPath("/resources/menu/");
		// 만약에 업로드 파일이 없다면
		if (!pImgFile.isEmpty()) {

			pImgFile.transferTo(new File(savePath + pImgName));
			// offevent객체에 생성한 업로드한 파일 이름을 저장한다
			price.setPImgName(pImgName);

		}
		
		int result =0;
		
		System.out.println(price.getPType());
		
		// 기존에 예매 타입이 있나 확인후 있으면 삭제
		if(price.getPType().equals("예매")) {
			
			result = sdao.SMF024(price.getPType());
			
			if(result>0) {
				sdao.SMF025(price.getPType());
				}
		}
		
		
		result = sdao.SMF016(price);
		
		if (result > 0) {
			mav.setViewName("index");
		} else {
			mav.setViewName("systemAddPrice");
		}
		return mav;
	}

	// 상품이름 중복확인
	public String SMF017(String pName) {

		String check = sdao.SMF017(pName);
		String result;

		if (check == null) {
			result = "OK";

		} else {
			result = "NO";
		}
		return result;
	}

	// 상품리스트 보여주기
	public ModelAndView SMF018() {
		List<PRICE> price = sdao.SMF018();
		System.out.println("price 값 : " + price);
		mav.addObject("price", price);
		mav.setViewName("systemMenulist");
		return mav;
	}

	// 상품수정 페이지 이동
	public ModelAndView SMF019(String pName) {
		PRICE price = sdao.SMF019(pName);

		mav.addObject("price", price);
		mav.setViewName("systemMenumodify");

		return mav;
	}

	public ModelAndView SMF020(PRICE price) throws IllegalStateException, IOException {
		MultipartFile pImgFile = price.getPImgFile();

		UUID uuid = UUID.randomUUID();

		// 랜덤한 식별 문자 uuid.toString().substring(0,8)과 실제 파일이름을 합친 것
		String pImgName = uuid.toString().substring(0, 8) + "_" + pImgFile.getOriginalFilename();

		// 기존 파일 삭제
		String deletePath = request.getServletContext().getRealPath("/resources/menu/") + price.getPImgName();

		File deleteFile = new File(deletePath);

		if (deleteFile.exists()) {
			deleteFile.delete();
			// System.out.println("기존 파일 삭제 성공!");
		} else {
			// System.out.println("기존 파일 삭제 실패!");
		}
		// 저장 경로에 파일을 업로드한다.
		String savePath = request.getServletContext().getRealPath("/resources/menu/");
		// 만약에 업로드 파일이 없다면
		if (!pImgFile.isEmpty()) {

			pImgFile.transferTo(new File(savePath + pImgName));
			// offevent객체에 생성한 업로드한 파일 이름을 저장한다
			price.setPImgName(pImgName);

		}

		int result = sdao.SMF020(price);

		if (result > 0) {
			mav.setViewName("redirect:/SMF018");
		} else {
			mav.setViewName("systemMenumodify");
		}
		return mav;
	}

	// 상품삭제
	public ModelAndView SMF021(String pName) {
		int result = sdao.SMF021(pName);

		if (result > 0) {
			mav.setViewName("redirect:/SMF018");
		} else {
			mav.setViewName("index");
		}
		return mav;
	}
	
	public ModelAndView SMF022() {
		List<PRICE> price = sdao.SMF018();
		System.out.println("price 값 : " + price);
		mav.addObject("price", price);
		mav.setViewName("systemMenulistClient");
		return mav;
	}

	public ModelAndView SMF023(String pName) {
		PRICE price = sdao.SMF019(pName);

		mav.addObject("price", price);
		mav.setViewName("systemProductView");
		return mav;
	}

	
	// 결제 정보
		public ModelAndView SMF026(String pName, int sum, String userId) {
			int point = sdao.SMF026(userId);
			
			mav.addObject("point",point);
			mav.addObject("sum",sum);
			mav.addObject("pName",pName);
			
			mav.setViewName("systemPayment");
			return mav;
		}

		// 포인트 적립후 인덱스 이동
		public ModelAndView SMF027(int point, String userId) {
			MEMBER member = new MEMBER();
			member.setMId(userId);
			member.setMPoint(point);
			sdao.SMF027(member);
			
			mav.setViewName("redirect:/index");
			return mav;
		}


}