package com.icia.kpl.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.kpl.dto.BRANCH;
import com.icia.kpl.dto.CMF024DTO;
import com.icia.kpl.dto.CMF026DTO;
import com.icia.kpl.dto.CMF033PASSDTO;
import com.icia.kpl.dto.LIKE;
import com.icia.kpl.dto.MOVIE;
import com.icia.kpl.dto.THEATER;
import com.icia.kpl.service.MovieService;

@Controller
public class MovieController {
	
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	MovieService msvc = new MovieService();
	
	// 세션
	@Autowired
	private HttpSession session;
	
	// CMF001: 영화정보 입력 폼 이동
	@RequestMapping(value = "/CMF001", method = RequestMethod.GET)
	public String CMF001() {
		
		return "movieUrl";
	}
	
	// CMF002: 입력한 주소의 내용 가져오기
	@RequestMapping(value = "/CMF002", method = RequestMethod.GET)
	public ModelAndView CMF002(@RequestParam("URL") String url) throws IOException {	
		mav = msvc.CMF002(url);
		return mav;
	}
	
	// CMF003 : DB에 가져온 정보 넣기
	@RequestMapping(value = "/CMF003", method = RequestMethod.POST)
	public ModelAndView CMF003(@ModelAttribute MOVIE movie) {

		mav = msvc.CMF003(movie);

		return mav;
	}
	
	// CMF004: 영화정보 보기
	@RequestMapping(value = "/CMF004", method = RequestMethod.GET)
	public ModelAndView CMF004(@RequestParam("mCode") int mCode) throws IOException {	
		mav = msvc.CMF004(mCode);
		return mav;
	}
	
	// CMF005: 영화정보 리스트보기
	@RequestMapping(value = "/CMF005", method = RequestMethod.GET)
	public ModelAndView CMF005() {	
		mav = msvc.CMF005();
		return mav;
	}
	
	// CMF006: 영화 좋아요 하기 ajax
	@RequestMapping(value = "/CMF006", method = RequestMethod.POST)
	public @ResponseBody LIKE CMF006(@RequestParam("memId") String memId, @RequestParam("mCode") int mCode, @RequestParam("click") int click) {
		System.out.println("컨트롤러로 넘어온 좋아요"+memId + mCode + click);
		
		LIKE result = msvc.CMF006(memId, mCode, click);
		//System.out.println("db에서 확인한 result메세지 : " + result);
		return result;
	}
	
	// CMF007: 지점추가 폼이동
	@RequestMapping(value = "/CMF007", method = RequestMethod.GET)
	public String CMF007() {
		
		return "movieAddBranch";
	}
	
	// CMF008: 지점추가
	@RequestMapping(value = "/CMF008", method = RequestMethod.POST)
	public ModelAndView CMF008(@ModelAttribute BRANCH branch) {

		mav = msvc.CMF008(branch);

		return mav;
	}
	
	// CMF009: 지점 리스트 지점 정보는 CMF010 ajax로 가져옴
	@RequestMapping(value = "/CMF009", method = RequestMethod.GET)
	public String CMF009() {
		
		return "movieBranch";
	}
	
	// CMF010: 지점정보 가져오기 ajax
	@RequestMapping(value = "/CMF010", method = RequestMethod.POST)
	public @ResponseBody List<BRANCH> CMF010(@RequestParam("bLocation") String bLocation) {
		
		//System.out.println("ajax로 넘어온 로케이션 : " + bLocation);
		List<BRANCH> result = msvc.CMF010(bLocation);

		//System.out.println("db에서 가져온 리스트 : " + result);
		return result;
	}
	
	// CMF011: 지점에 상영관 추가하는 FORM이동
	@RequestMapping(value = "/CMF011", method = RequestMethod.GET)
	public ModelAndView CMF011() {

		mav = msvc.CMF011();

		return mav;
	}
	
	// CMF012: 상영관 추가할때 해당 지점의 몇관인지 자동으로 가져오기 ajax
	@RequestMapping(value = "/CMF012", method = RequestMethod.POST)
	public @ResponseBody int CMF012(@RequestParam("tName") String tName) {
		
		//System.out.println("ajax로 넘어온 이름 : " + tName);
		int result = msvc.CMF012(tName);
		//System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	
	// CMF013: 상영관 추가
	@RequestMapping(value = "/CMF013", method = RequestMethod.POST)
	public ModelAndView CMF013(@ModelAttribute THEATER theater) {

		mav = msvc.CMF013(theater);

		return mav;
	}
	
	// CMF014: 상영시간표 생성폼 이동
	@RequestMapping(value = "/CMF014", method = RequestMethod.GET)
	public ModelAndView CMF014() {
		mav = msvc.CMF014();
		return mav;
	}
	
	// CMF015: 상영시간표 생성(새로 생성하기 - > 기존 데이터 삭제)
	@RequestMapping(value = "/CMF015", method = RequestMethod.GET)
	public ModelAndView CMF015() {
		mav = msvc.CMF015();
		return mav;
	}
	
	// CMF021: 상영시간표 폼으로 이동
	@RequestMapping(value = "/CMF021", method = RequestMethod.GET)
	public ModelAndView CMF021() {
		
		mav = msvc.CMF021();
		
		return mav;
	}
	
	// CMF022: 상영시간표 - 지점에 상영중인 영화 가져오기 ajax
	@RequestMapping(value = "/CMF022", method = RequestMethod.POST)
	public @ResponseBody List<String> CMF022(@RequestParam("branchName") String branchName) {
		
		//System.out.println("ajax로 넘어온 이름 : " + branchName);
		List<String> result = msvc.CMF022(branchName);
		//System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	
	//CMF023: 상영시간표 - 해당 하는 영화의 상영관 정보 가져오기
	@RequestMapping(value = "/CMF023", method = RequestMethod.POST)
	public @ResponseBody List<String> CMF023(@RequestParam("branchName") String branchName,
											@RequestParam("movieName") String movieName) {
		
		//System.out.println("ajax로 넘어온 이름 : " + branchName);
		List<String> result = msvc.CMF023(movieName,branchName);
		//System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	
	//CMF024: 상영시간표3 ajax 상영시간정보
	@RequestMapping(value = "/CMF024", method = RequestMethod.POST)
	public @ResponseBody List<CMF024DTO> CMF024(@RequestParam("tName") String tName,
											@RequestParam("bDate") String bDate, @RequestParam("mCode") int mCode, @RequestParam("tNum") int tNum) {
		
		//System.out.println("ajax로 넘어온 tName : " + tName+", bDate: "+bDate+", mCode: "+mCode+", tNum:"+tNum);
		List<CMF024DTO> result = msvc.CMF024(tName,bDate,mCode,tNum);
		//System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	
	//CMF025: 예매폼이동
	@RequestMapping(value = "/CMF025", method = RequestMethod.GET)
	public ModelAndView CMF025(@RequestParam(value = "mCode", required = false, defaultValue = "0") int mCode,
			@RequestParam(value = "bCode", required = false, defaultValue = "0") int bCode) {
		
		mav = msvc.CMF025(mCode,bCode);
		
		return mav;
	}
	
	//CMF026: 상영하는 상영관 지역 표시ajax
	@RequestMapping(value = "/CMF026", method = RequestMethod.POST)
	public @ResponseBody List<CMF026DTO> CMF026(@RequestParam("mCode") int mCode) {
		
		//System.out.println("ajax로 넘어온  mCode: "+mCode);
		List<CMF026DTO> result = msvc.CMF026(mCode);
		//System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	
	//CMF027: 고른 영화 정보표시 ajax
	@RequestMapping(value = "/CMF027", method = RequestMethod.POST)
	public @ResponseBody MOVIE CMF027(@RequestParam("mCode") int mCode) {
		
		//System.out.println("ajax로 넘어온  mCode: "+mCode);
		MOVIE result = msvc.CMF027(mCode);
		//System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	//CMF028: 티켓구매자 나이구해오기 ajax 
	@RequestMapping(value = "/CMF028", method = RequestMethod.POST)
	public @ResponseBody int CMF028(@RequestParam("user") String user) {
		
		//System.out.println("ajax로 넘어온  user: "+user);
		int result = msvc.CMF028(user);
		//System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	
	//CMF029: 상영하는 상영관 표시 ajax
	@RequestMapping(value = "/CMF029", method = RequestMethod.POST)
	public @ResponseBody List<CMF026DTO> CMF029(@RequestParam("mCode") int mCode,
											@RequestParam("bLocation") String bLocation) {
		
		//System.out.println("ajax로 넘어온  mCode: "+mCode);
		List<CMF026DTO> result = msvc.CMF029(mCode,bLocation);
		//System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	
	//CMF030: 상영하는 날짜 표시 ajax
	@RequestMapping(value = "/CMF030", method = RequestMethod.POST)
	public @ResponseBody List<CMF026DTO> CMF030(@RequestParam("mCode") int mCode,
											@RequestParam("tName") String tName) {
		
		//System.out.println("ajax로 넘어온  mCode: "+mCode+" tName:"+tName);
		List<CMF026DTO> result = msvc.CMF030(mCode,tName);
		//System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	
	//CMF033: 좌석선택 폼으로 이동
	@RequestMapping(value = "/CMF033", method = RequestMethod.POST)
	public ModelAndView CMF033(@ModelAttribute CMF033PASSDTO passDTO) {
		//System.out.println(passDTO);
		mav = msvc.CMF033(passDTO);
		return mav;
	}
	
	//CMF038: 해당 상영관에 이미 예매된 좌석 리스트
	@RequestMapping(value = "/CMF038", method = RequestMethod.POST)
	public @ResponseBody List<String> CMF038(@RequestParam("bCode") int bCode) {
		
		//System.out.println("ajax로 넘어온  bCode: "+bCode);
		List<String> result = msvc.CMF038(bCode);
		//System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	
	
	//CMF039: 선택한 좌석을 예매에 넣기
	@RequestMapping(value = "/CMF039", method = RequestMethod.POST)
	public @ResponseBody String CMF039(@RequestParam("bCode") int bCode,
										@RequestParam("bSeat") String bSeat,@RequestParam("bId") String bId,@RequestParam("bUUID") String bUUID){
		
		//System.out.println("ajax로 넘어온  bCode: "+bCode+", bSeat: "+bSeat+", bId:"+bId+", bUUID: "+bUUID);
		String result = msvc.CMF039(bCode,bSeat,bId,bUUID);
		//System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	
	//CMF040: 결제취소
	@RequestMapping(value = "/CMF040", method = RequestMethod.POST)
	public @ResponseBody String CMF040(@RequestParam("bUUID") String bUUID){
		
		//System.out.println("ajax로 넘어온 bUUID: "+bUUID);
		String result = msvc.CMF040(bUUID);
		//System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	
	//CMF043: 예매시 포인트 적립하고, 매출정보에 추가(매출정보는 아직 미구현)
	@RequestMapping(value = "/CMF043", method = RequestMethod.POST)
	public @ResponseBody String CMF043(@RequestParam("point") int point,@RequestParam("userId") String userId,@RequestParam("price") int price){
		
		System.out.println("ajax로 넘어온 point: "+point+", userId: "+userId+", price: "+price);
		String result = msvc.CMF043(point,userId,price);
		System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	
	//CMF045: 내예매 정보 확인
	@RequestMapping(value = "/CMF045", method = RequestMethod.GET)
	public ModelAndView CMF045(@RequestParam("userId") String userId) {
		
		mav = msvc.CMF045(userId);
		
		return mav;
	}
	
	//CMF049: 예매갯수로 순위구해오기 ajax 굳이 ajax로 하는이유 : 인덱스 컨트롤러를 건들이면 수정해야할 부분이 너무 많다.
	@RequestMapping(value = "/CMF049", method = RequestMethod.POST)
	public @ResponseBody List<MOVIE> CMF049(@RequestParam("connect") String connect){
		
		System.out.println("연될됬나? "+connect);
		List<MOVIE> result = msvc.CMF049();
		System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	//CMF050: 예매갯수로 순위구해오기 ajax 굳이 ajax로 하는이유 : 인덱스 컨트롤러를 건들이면 수정해야할 부분이 너무 많다.
	@RequestMapping(value = "/CMF050", method = RequestMethod.POST)
	public @ResponseBody List<MOVIE> CMF050(@RequestParam("connect") String connect){
		
		System.out.println("연될됬나? "+connect);
		List<MOVIE> result = msvc.CMF050();
		System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	//CMF051: uuid 생성기
	@RequestMapping(value = "/CMF051", method = RequestMethod.POST)
	public @ResponseBody String CMF051(@RequestParam("connect") String connect){
		
		System.out.println("연될됬나? "+connect);
		String result = msvc.CMF051();
		System.out.println("db에서 가져온 갯수 : " + result);
		return result;
	}
	
	
}