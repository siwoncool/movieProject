package com.icia.kpl.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.kpl.dao.MovieDAO;
import com.icia.kpl.dao.SystemDAO;
import com.icia.kpl.dto.BRANCH;
import com.icia.kpl.dto.CMF023DTO;
import com.icia.kpl.dto.CMF024DTO;
import com.icia.kpl.dto.CMF026DTO;
import com.icia.kpl.dto.CMF032DTO;
import com.icia.kpl.dto.CMF033PASSDTO;
import com.icia.kpl.dto.CMF039DTO;
import com.icia.kpl.dto.CMF045DTO;
import com.icia.kpl.dto.CMF047DTO;
import com.icia.kpl.dto.LIKE;
import com.icia.kpl.dto.MEMBER;
import com.icia.kpl.dto.MOVIE;
import com.icia.kpl.dto.MOVIETIME;
import com.icia.kpl.dto.THEATER;

@Service
public class MovieService {

	// ModelAndView 객체 생성
	private ModelAndView mav = new ModelAndView();

	// DAO(Repository)연결
	@Autowired
	private MovieDAO mdao;
	

	// session 추가
	@Autowired
	private HttpSession session;

	// 영화 자동등록 메소드
	public ModelAndView CMF002(String url) throws IOException {

		MOVIE movie = new MOVIE();

		Document doc;

		doc = Jsoup.connect(url).get();

		// 영화 타이틀(제목)
		Elements elem = doc.select("#content > div.article > div.mv_info_area > div.mv_info > h3 > a:nth-child(1)");
		String result = elem.text();
		//System.out.println(result);
		movie.setMTitle(result);

		// 개봉일
		elem = doc.select(
				"#content > div.article > div.mv_info_area > div.mv_info > dl > dd:nth-child(2) > p > span:nth-child(4)");
		result = elem.text();
		//System.out.println(result);
		movie.setMOpen(result);

		// 상영시간
		elem = doc.select(
				"#content > div.article > div.mv_info_area > div.mv_info > dl > dd:nth-child(2) > p > span:nth-child(3)");
		result = elem.text();
		//System.out.println(result);
		movie.setMRunTime(result);

		// 장르
		elem = doc.select(
				"#content > div.article > div.mv_info_area > div.mv_info > dl > dd:nth-child(2) > p > span:nth-child(1)");
		result = elem.text();
		//System.out.println(result);
		movie.setMGenre(result);

		// 관람가
		elem = doc.select("#content > div.article > div.mv_info_area > div.mv_info > dl > dd:nth-child(8) > p");
		result = elem.text();
		//System.out.println(result);
		movie.setMAge(result);

		// 포스터
		elem = doc.select("#content > div.article > div.mv_info_area > div.poster > a > img");

		result = elem.toString();
		int index = result.indexOf("\"");
		int index2 = result.indexOf("?");
		result = result.substring(index + 1, index2);
		//System.out.println(result);
		movie.setMPoster(result);
		System.out.println(movie.getMAge());
		if(movie.getMAge().equals("")) {
			movie.setMAge("전체");
		}

		mav.addObject("movie", movie);
		mav.setViewName("movieSave");

		return mav;
	}

	// 영화 정보 DB넣기
	public ModelAndView CMF003(MOVIE movie) {
		
		int result = mdao.CMF003(movie);

		if (result > 0) {
			mav.setViewName("movieUrl");
		} else {
			mav.setViewName("movieSave");
		}

		return mav;
	}

	// 영화정보 상세보기
	public ModelAndView CMF004(int mCode) {

		MOVIE movie = mdao.CMF004(mCode);

		//System.out.println(movie);
		mav.addObject("movie", movie);
		mav.setViewName("movieView");
		return mav;
	}

	// 영화정보 리스트 불러오기
	public ModelAndView CMF005() {

		List<MOVIE> movieList = mdao.CMF005();

		mav.addObject("movieList", movieList);
		mav.setViewName("movieList");
		return mav;
	}

	// 영화 좋아요 ajax
	public LIKE CMF006(String memId, int mCode, int click) {
		LIKE like = new LIKE();
		like.setMLMovie(mCode);
		like.setMLId(memId);

		// 전에 눌렀나 아닌가 판단
		// 0이면 안누름 1이면 누름
		int can = mdao.CMF006_1(like);

		// click이 0 이면 단순 불러오기, 1이면 클릭전과 후 바꿔서 보내주기
		if (click == 1) {

			// 이전에 눌렀으니까 누른거 삭제
			if (can == 1) {
				mdao.CMF006_3(like);
				can = 0;
			} else {// 이전에 안눌렀으니까 추가!
				mdao.CMF006_2(like);
				can = 1;
			}
		}

		int count = mdao.CMF006(mCode);
		like.setMLCount(count);
		like.setMLDo(can);
		// List<LIKE> result = mdao.CMF006(memId);
		return like;
	}

	// 지점 추가
	public ModelAndView CMF008(BRANCH branch) {

		// 주소 합체
		branch.setBAddr("(" + branch.getBAddr1() + ") " + branch.getBAddr2() + ", " + branch.getBAddr3());

		int result = mdao.CMF008(branch);

		if (result > 0) {
			mav.setViewName("movieBranch");
		} else {
			mav.setViewName("movieAddBranch");
		}

		return mav;
	}

	// 지점 정보 가져오는 ajax
	public List<BRANCH> CMF010(String bLocation) {

		List<BRANCH> result = mdao.CMF010(bLocation);

		return result;
	}

	// 지점에 상영관 추가하는 FORM이동, 지점이름 넣어주기
	public ModelAndView CMF011() {
		List<String> branchName = mdao.CMF011();

		// System.out.println(branchName);
		// System.out.println(branchName.get(0));

		// 맨처음 지점의 추가할 상영관 번호
		int count = mdao.CMF012(branchName.get(0));
		count += 1;

		// 상영관에 배당 가능한 정화 정보 데이터
		List<MOVIE> movie = mdao.CMF005();

		mav.addObject("movieList", movie);
		mav.addObject("count", count);
		mav.addObject("branchName", branchName);
		mav.setViewName("movieAddTheater");
		return mav;
	}

	// 지점의 추가할 상영관 번호
	public int CMF012(String tName) {
		int result = mdao.CMF012(tName);
		result += 1;
		return result;
	}

	// 상영관 추가
	public ModelAndView CMF013(THEATER theater) {
		int result = mdao.CMF013(theater);

		if (result > 0) {
			// 리다이렉트로 수정해야함
			mav.setViewName("redirect:/CMF021");
		} else {
			mav.setViewName("redirect:/CMF011");
		}

		return mav;
	}

	// CMF014: 상영시간표 생성폼 이동
	public ModelAndView CMF014() {

		mav.setViewName("movieAddTime");
		return mav;
	}

	// 상영 시간표 새로 생성하기 -> 기존 데이터 삭제
	public ModelAndView CMF015() {

		// 기존 상영표 삭제 -> 검색해서 있으면?
		int result = mdao.CMF018();
		if (result == 0) {
			// 검색 결과 0개이니까 바로 생성절차에 들어감
			result = 1;
		} else {
			// 검색결과 있으니까 삭제
			result = mdao.CMF016();
		}

		// 시간표 생성 절차
		if (result > 0) {
			List<THEATER> theater = mdao.CMF017();
			int btCode;
			int bSeat;
			int tmCode;
			String runtime;
			int index;
			int runningTime;
			int startTime;
			int endTime;
			String bTime;
			
			String startTime2;	// 분
			String endTime2;
			
			// 시
			String startTime3;
			String endTime3;
			MOVIETIME movietime = new MOVIETIME();

			// 각 상영관별로 시간표 생성
			for (int i = 0; i < theater.size(); i++) {
				List<String> bTimeList = new ArrayList<>();// -> 상영시간표 리스트
				// 상영관 식별코드와 전체 좌석수
				btCode = theater.get(i).getTCode();
				bSeat = theater.get(i).getTSize();

				// 영화 정보 코드로 영화 러닝 타임 가져오기
				tmCode = theater.get(i).getTMCode();
				runtime = mdao.CMF019(tmCode);
				index = runtime.indexOf("분");
				runtime = runtime.substring(0, index);
				runningTime = Integer.parseInt(runtime);

				//System.out.println("btCode : " + btCode + " 전체 좌석수: " + bSeat + " 러닝타임: " + runningTime + " 분");

				index = 0; // 인덱스가 더 사용되지 않아서 0으로 초기화해준뒤 상영시간 리스트 넘버링에 사용

				// 리스트에 러닝타임을 먼저 만들어 주기! -> 9시~22시 사이에만 상영시작 가능
				for (int k = (60 * 9); k <= (60 * 22);) {
					startTime = k; // 시작시간
					endTime = k + runningTime; // 끝시간
					if (startTime % 60 < 10) {
						startTime2 = "0" + Integer.toString((int) (startTime % 60));
					} else {
						startTime2 = Integer.toString((int) (startTime % 60));
					}
					if (endTime % 60 < 10) {
						endTime2 = "0" + Integer.toString((int) (endTime % 60));
					} else {
						endTime2 = Integer.toString((int) (endTime % 60));
					}
					if((startTime / 60)<10) {
						startTime3 = "0" + Integer.toString((startTime / 60));
					}else {
						startTime3 = Integer.toString((startTime / 60));
					}
					if((endTime / 60)<10) {
						endTime3 = "0" + Integer.toString((endTime / 60));
					}else {
						endTime3 = Integer.toString((endTime / 60));
					}

					bTime = startTime3 + ":" + startTime2 + " ~ " + endTime3 + ":" + endTime2;
					bTimeList.add(index, bTime);
					// System.out.println(bTimeList.get(index));
					index += 1;

					endTime = (int) (Math.ceil(endTime / 10) * 10);
					k = endTime + 60;
				}

				// 각 날짜 별로 시간표 생성하고 DB에 넣기(1주일)
				for (int j = 0; j <= 6; j++) {
					// db에 접속하기 위해서 result값 초기화
					
					// 날짜 계산
					Calendar cal = Calendar.getInstance();
					String format = "yyyy-MM-dd";
					SimpleDateFormat sdf = new SimpleDateFormat(format);
					cal.add(cal.DATE, j);
					String date = sdf.format(cal.getTime());
					//System.out.println(date);

					for (int m = 0; m < bTimeList.size(); m++) {
						result=0;
						//System.out.println(bTimeList.get(m));
						movietime.setBDate(date);
						movietime.setBSeat(bSeat);
						movietime.setBTCode(btCode);
						movietime.setBTime(bTimeList.get(m));
						result = mdao.CMF020(movietime);
						if(result>0) {
							//System.out.println("DB넣기 성공");
						}else {
							System.out.println("DB넣기 실패");							
						}
					}

				}
			}

			
			mav.setViewName("redirect:/CMF021");
		} else {
			mav.setViewName("movieAddTime");
		}

		return mav;
	}

	//상영시간표 폼으로 이동 - > 날짜 가지고
	public ModelAndView CMF021() {
		List<String> dateList = new ArrayList<>();
		
		for (int j = 0; j <= 6; j++) {
			
			Calendar cal = Calendar.getInstance();
			String format = "yyyy-MM-dd";
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			cal.add(cal.DATE, j);
			String date = sdf.format(cal.getTime());
			dateList.add(j, date);
		}
		//System.out.println(dateList);
		
		mav.addObject("today",dateList.get(0));
		mav.addObject("dateList", dateList);
		mav.setViewName("movieTime");
		return mav;
	}
	
	// 상영시간표 지점에 상영중인 영화 가져오기 ajax
	public List<String> CMF022(String branchName) {
		List<String> result = mdao.CMF022(branchName);
		//System.out.println(result);
		
		return result;
	}

	// 해당 지점에 해당 상영관 영화를 상영하는 관정보
	public List<String> CMF023(String movieName, String branchName) {
		CMF023DTO dto = new CMF023DTO();
		dto.setTName(branchName);
		dto.setMTitle(movieName);
		List<String> result = mdao.CMF023(dto);
		return result;
	}

	//상영시간표3 ajax 상영시간정보
	public List<CMF024DTO> CMF024(String tName, String bDate, int mCode, int tNum) {
		CMF024DTO dto = new CMF024DTO();
		dto.setTName(tName);
		dto.setBDate(bDate);
		dto.setMCode(mCode);
		dto.setTNum(tNum);
		
		List<CMF024DTO> result = mdao.CMF024(dto);
		
		// 오늘날짜
		String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		//System.out.println("오늘날짜:"+date);
		
		// 오늘날짜 상영표는 시간이 지난건 삭제한다. ->뷰에서 자바스크립트로 설정해줘도 되지만 (내 기준) 자바가 더 쉽다...
		if(date.equals(bDate)) {
			//System.out.println("오늘이면 시간 지난건 삭제해야지");
			LocalTime now = LocalTime.now();	// 현재 시간은?
			int size = result.size();			// 리스트 사이즈
			int hour = now.getHour();			// 현재시간에 몇시인가?
			int choice = 0;
			for(int i=0; i<size;i++) {
				
				// 가져온 리스트에서 상영시간의 시(hour)를 구하는 과정
				int index =result.get(choice).getBTime().indexOf(":");
				int check =Integer.parseInt(result.get(choice).getBTime().substring(0, index)) ;
				//System.out.println("상영하는 시간"+check);
				//System.out.println("현재시간"+hour);
				
				// 어멋 시간이 지나버렸네
				if(hour>check) {
						result.remove(0);
					}else if(hour==check) {// 시간이 동일하면 몇분 영화인지 봐야지?
						
						// 가져온 리스트에서 상영시간의 분(minute)을 구하는 과정 
						int index2 = result.get(choice).getBTime().indexOf("~")-1;
						int check2 =Integer.parseInt(result.get(choice).getBTime().substring(index+1, index2)) ;
						//System.out.println("상영하는 분:"+check2);						
						int minute = now.getMinute();
						
						if(minute>=check2) { // 어멋 분이 초과하여 이미 상영시작해버렸네?
							result.remove(0);
						}else { // 무사통과하면 다음 리스트 인덱스로 넘어가서 검사해야지 ㅋ
							choice += 1; 
						}
					} else {// 무사통과하면 다음 리스트 인덱스로 넘어가서 검사해야지 ㅋ
						choice += 1; 
					}

				}
				
			}
			
		
		
		return result;
	}

	// 예매폼이동
	public ModelAndView CMF025(int mCode, int bCode) {
		System.out.println("무비 코드: "+mCode);
		System.out.println("예매 코드: "+bCode);
		
		// 영화 리스트 가져오기(타이틀, 코드)
		List<MOVIE> movie = mdao.CMF005();
		
		if(bCode!=0) {
			CMF032DTO result = mdao.CMF032(bCode);
			mCode = result.getMCode();
			mav.addObject("result", result);
		}
		
		mav.addObject("movieList", movie);
		mav.addObject("mCode", mCode);
		mav.addObject("bCode", bCode);
		
		mav.setViewName("movieBook");
		return mav;
	}

	// 상영하는 상영관 표시ajax
	public List<CMF026DTO> CMF026(int mCode) {
		List<CMF026DTO> result = mdao.CMF026(mCode);
		
		return result;
	}

	// 고른 영화 정보 ajax
	public MOVIE CMF027(int mCode) {
		MOVIE result = mdao.CMF004(mCode);
		return result;
	}

	// 티켓 구매자 나이구해오기 ajax
	public int CMF028(String user) {
		
		// 유저 나이 구해오기
		String age = mdao.CMF028(user);
		//System.out.println(age);
		int index = age.indexOf("-");
		int result = Integer.parseInt(age.substring(0, index));
		//System.out.println(result);
		
		// 올해 구해오기
		int date = Integer.parseInt(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy")));
		//System.out.println(date-result);
		
		// 나이구해오기
		result = date-result+1;
		
		return result;
	}

	// 상영하는 상영관 표시 ajax
	public List<CMF026DTO> CMF029(int mCode, String bLocation) {
		CMF026DTO dto = new CMF026DTO();
		dto.setMCode(mCode);
		dto.setBLocation(bLocation);
		List<CMF026DTO> result = mdao.CMF029(dto);
		
		return result;
	}

	// 상영하는 상영일 표시 ajax
	public List<CMF026DTO> CMF030(int mCode, String tName) {
		CMF026DTO dto = new CMF026DTO();
		dto.setMCode(mCode);
		dto.setTName(tName);
		List<CMF026DTO> result = mdao.CMF030(dto);
		return result;
	}

	// 상영관 좌석 폼이동
	public ModelAndView CMF033(CMF033PASSDTO passDTO) {
		int bCode = passDTO.getBCode();
		
		// 관 행 열 사이즈
		THEATER theater = mdao.CMF034(bCode);
		//System.out.println(theater);
		
		// 저장된 시간표, 즉 예매 정보 가져오기
		MOVIETIME movietime = mdao.CMF035(bCode);
		System.out.println(movietime);
		
		// 티켓 가격 가져오기
		int price = mdao.CMF036();
		
		System.out.println(passDTO.getUserId());
		
		int point = mdao.CMF037(passDTO.getUserId());
		
		System.out.println("포인트: "+point);
		System.out.println(price);
		
		mav.addObject("point", point);
		mav.addObject("price", price);
		mav.addObject("movietime", movietime);
		mav.addObject("theater",theater);
		mav.addObject("passDTO", passDTO);
		mav.setViewName("movieBookSEAT");
		return mav;
	}

	// 이미 예매된 좌석 구해오는 리스트
	public List<String> CMF038(int bCode) {
		List<String> result = mdao.CMF038(bCode);
		return result;
	}

	// 선택한 좌석을 예매하기
	public String CMF039(int bCode, String bSeat, String bId,String bUUID) {
		CMF039DTO dto = new CMF039DTO();
		dto.setBCode(bCode);
		dto.setBId(bId);
		dto.setBSeat(bSeat);
		dto.setBUUID(bUUID);
		
		int result = mdao.CMF039(dto);
		
		
		return bUUID;
	}

	// 결제취소
	public String CMF040(String bUUID) {
		int result = mdao.CMF040(bUUID);
		String result2="NO";
		
		if(result>0) {
			result2 ="OK";
		}
		
		return result2;
	}

	// 결제 완료시
	public String CMF043(int point, String userId, int price) {
		MEMBER member = new MEMBER();
		member.setMId(userId);
		member.setMPoint(point);
		int result = mdao.CMF043(member);
		String result2="NO";
		if(result>0) {
			result2="YES";
		}
		System.out.println(result2);
		return result2;
	}

	// 내 예매 정보 확인
	public ModelAndView CMF045(String userId) {
		// 결과로 보낼 리스트 생성
		List<CMF045DTO> movieList = new ArrayList<CMF045DTO>();
		
		// 해당유저가 예매한 표의 고유값 uuid와 bCode구하기 -> DB에서는 좌석이 분리되어있기에 uuid가 고유값이 아니지만 
		// 한번에 예매된 좌석을 바인딩 하는 역활이 uuid이다. bau is bCode and uuid bCode는 상영시간표테이블에서 매칭된 bt코드를 가져오기 위해 필요하다.
		List<CMF039DTO> bau = mdao.CMF046(userId);
		
		for (int i = 0; i < bau.size(); i++) {
			//System.out.println(bau.get(i));
			
			// 리스트에 넣을 객체 dto(CMF045타입) 생성
			CMF045DTO dto = new CMF045DTO();
			
			// 받아온 bau의 i번째 객체에서 dto에 넣기
			dto.setUuid(bau.get(i).getBUUID());
			
			// 지점 타입 관 상영시간 상영날짜 가져오기 배정된영화코드
			CMF047DTO cmf047 = mdao.CMF047(bau.get(i).getBCode());
			
			// 지점 타입 관
			String btn = cmf047.getTName() +"|"+cmf047.getTType()+"|"+cmf047.getTNum()+"관";
			dto.setBtn(btn);
			
			//날짜 및 시간
			String date =cmf047.getBDate();
			String time =cmf047.getBTime();
			dto.setDate(date);
			dto.setTime(time);
			
			// 영화 포스터와 이름 과 코드 넣기
			dto.setPoster(cmf047.getMPoster());
			dto.setTitle(cmf047.getMTitle());
			dto.setCode(cmf047.getMCode());
			
			//좌석 구해오기 uuid와 bcode가 같이 들어 있는 테이블 이지만 시트별로 분리되어있기에 따로 불러온다.
			List<String> seatList =  mdao.CMF048(bau.get(i).getBUUID());
			
			// 받아온 시트 데이터 처리
			String seat="";
			for (int j = 0; j < seatList.size(); j++) {
				seat += seatList.get(j);
				if(j<seatList.size()-1) {
					seat +=", ";
				}
			}
			dto.setSeat(seat);
			
			// dto를 movieList에 넣기
			movieList.add(dto);
			
		}
		
		System.out.println(movieList);
		mav.addObject("movieList", movieList);	
		mav.setViewName("movieBookTicket");
		return mav;
	}

	
	// 박스오피스 가져오기(예매순위)
	public List<MOVIE> CMF049() {
		List<MOVIE> result = mdao.CMF049();
		return result;
	}

	// 좋아요 순위
	public List<MOVIE> CMF050() {
		List<MOVIE> result = mdao.CMF050();
		return result;
	}

	// UUID생성기
	public String CMF051() {
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid);
		String uuid2 = uuid.toString();
		 String result =uuid2.substring(0, 4)+"-"+uuid2.substring(4, 13);
		System.out.println(result);
		return result;
	}

	

}