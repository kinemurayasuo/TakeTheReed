package com.ebook.book.engcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ebook.book.service.UserService;
import com.ebook.book.vo.ReadVO;
import com.ebook.book.vo.UserVO;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
@RequestMapping(value = "/eng")
public class EngUserController {

	private static final Logger logger = LoggerFactory.getLogger(EngUserController.class);

	@Autowired
	private UserService service;
	
	@Inject    //서비스를 호출하기 위해서 의존성을 주입
    JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.

	/* NaverLoginBO */
	private NaverLoginBO2 naverLoginBO2;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO2 naverLoginBO2) {
		this.naverLoginBO2 = naverLoginBO2;
	}

	// 회원가입 jsp이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String moveTojoin() {
		logger.info("moveTojoin(GET)메소드 실행");

		return "eng/join";
	}

	// jsp로부터 회원가입 data받음=> DB저장시도 => 성공시 로그인.JSP이동
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(String userId, String userName, String userPw, String userNm, String userTel, String userEmail) {
		logger.info("join(POST)메소드 실행");

		logger.info("join 메소드 실행POST");
		logger.info("userId:{}", userId);
		logger.info("userName:{}", userName);
		logger.info("userPw:{}", userPw);
		logger.info("userNm:{}", userNm);
		logger.info("userTel:{}", userTel);
		logger.info("userEmail:{}", userEmail);

		boolean result = service.join(userId, userName, userPw, userNm, userTel, userEmail);
		String returnUrl;
		if (result) {
			System.out.println("회원가입 성공");
			returnUrl = "redirect:/eng/login";
		} else {
			System.out.println("회원가입 실패");
			returnUrl = "redirect:/eng/join";
		}

		return returnUrl;
	}

	// ID 유효성 검사
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.GET)
	public String idChk(String idChk) {
		logger.info("idChk 메소드 실행(GET)");

		logger.info("idChk: {}", idChk);

		String userId = service.idChk(idChk);
		logger.info("userId: {}", userId);

		if (userId == null) {
			logger.info("회원 가입 가능.");
			return "available";
		} else {
			logger.info("회원 가입 불가.");
			return null;
		}
	}

	// 닉네임 유효성 검사
	@ResponseBody
	@RequestMapping(value = "/nmChk", method = RequestMethod.GET)
	public String nmChk(String nmChk) {
		logger.info("nmChk 메소드 실행(GET)");

		logger.info("nmChk: {}", nmChk);

		String userNm = service.nmChk(nmChk);
		logger.info("userNm: {}", userNm);

		if (userNm == null) {
			logger.info("회원 가입 가능.");
			return "available";
		} else {
			logger.info("회원 가입 불가.");
			return null;
		}
	}

	// 로그인 jsp로이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String moveTologin(Model model, HttpSession session) {
		logger.info("moveTologin(GET)메소드 실행");

		String naverAuthUrl = naverLoginBO2.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("url", naverAuthUrl);
		return "eng/login";
	}

	// 로그인 시도
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpSession session, String userId, String userPw, Model model) {
		logger.info("login메소드 실행(POST)");
		logger.info("userId:{} ", userId);
		logger.info("userPw:{} ", userPw);

		String login = service.selectUserNm(userId, userPw);
		String returnUrl = null;
		logger.info("login:{} ", login);

		String errorMessage = "These ID and passwords don’t match.";

		// 로그인 실패시 에러메세지 출력
		if (login == null) {
			logger.info("로그인 실패");
			model.addAttribute("errorMessage", errorMessage);
			returnUrl = "/eng/login";

			// 로그인 성공시 jsp 저장
		} else {
			logger.info("로그인 성공");
			session.setAttribute("loginId", userId);
			session.setAttribute("loginName", login);

			returnUrl = "redirect:/2";
		}
		return returnUrl;
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session)throws
	  IOException {
		logger.info("logout 메소드 실행(GET)");
		session.removeAttribute("loginName"); 
		session.removeAttribute("loginId");
		return "redirect:/2";
	}
	
	// 마이페이지 이동(조회)
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		logger.info("myPage(GET)메소드 실행");

		// 로그인한 Id를 가져와서 마이리스트 조회
		String userId = (String) session.getAttribute("loginId");
		logger.info("loginId : {}", userId);

		// 소셜로그인한 경우 아이디
		ArrayList<UserVO> userList1 = new ArrayList<>();
		userList1 = service.getUserList1(userId);
		logger.info("userList1: {}", userList1);
		
		// 일반회원인 경우 아이디
		ArrayList<UserVO> userList = new ArrayList<>();
		userList = service.getUserList(userId);
		logger.info("userList: {}", userList);
		
		if(userList1.size() != 0) {
			if(userId.equals(userList1.get(0).getUserId())) {
				// 소셜리스트 조회
				if (userList1 != null) {
					logger.info("마이 리스트 조회 성공");
					model.addAttribute("userList1", userList1);
					
					// 과거 내가 본 책리스트 조회
					ArrayList<ReadVO> pastList = new ArrayList<>();
					pastList = service.getPastBook(userId);
					logger.info("pastList : {}", pastList);
					
					if(pastList != null) {
						logger.info("과거에 본 책 내역 조회 성공");
						model.addAttribute("pastList", pastList);
						System.out.println(pastList);
						return "eng/myPage";
						}
					else {
						logger.info("과거에 본 책 내역 조회 실패");
						return "redirect:/2";
					} 
				}
			}
		}
		
		if(userList.size() != 0) {
			if(userId.equals(userList.get(0).getUserId())) {
				// 일반리스트 조회
				if (userList != null) {
					logger.info("마이 리스트 조회 성공");
					model.addAttribute("userList", userList);
					
					// 과거 내가 본 책리스트 조회
					ArrayList<ReadVO> pastList = new ArrayList<>();
					pastList = service.getPastBook(userId);
					logger.info("pastList : {}", pastList);
					
					if(pastList != null) {
						logger.info("과거에 본 책 내역 조회 성공");
						model.addAttribute("pastList", pastList);
						System.out.println(pastList);
						return "eng/myPage";
						}
					else {
						logger.info("과거에 본 책 내역 조회 실패");
						return "redirect:/2";
					} 
				}
			}
		}
		return "redirect:/2";
	}

	// 정보수정 jsp이동
	@RequestMapping(value = "/userUpdate", method = RequestMethod.GET)
	public String userUpdate(HttpSession session, Model model) {
		logger.info("userUpdate(GET)메소드 실행");

		// 로그인한 Id를 가져와서 마이리스트 조회
		String userId = (String) session.getAttribute("loginId");
		logger.info("loginId : {}", userId);

		// 예약중인 리스트 조회
		ArrayList<UserVO> userList = new ArrayList<>();
		userList = service.getUserList(userId);
		logger.info("userList: {}", userList);

		if (userList != null) {
			logger.info("마이 리스트 조회 성공");
			model.addAttribute("userList", userList);
		}
		return "eng/userUpdate";
	}

	// jsp로부터 정보수정 data 받음 => db에 저장시도
	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public String userUpdate(HttpSession session, String userPw, String userNm, String userTel, String userEmail) {
		logger.info("userUpdate(POST)메소드 실행");

		// 회원 비밀번호, 회원닉네임, 전화번호
		logger.info("userUpdate 메소드 실행POST");
		logger.info("userPw:{}", userPw);
		logger.info("userNm:{}", userNm);
		logger.info("userTel:{}", userTel);
		logger.info("userEmail:{}", userEmail);

		String userId = (String) session.getAttribute("loginId"); // 사용자 ID
		logger.info(userId);

		boolean result = service.userUpdate(userId, userPw, userNm, userTel, userEmail);

		String returnUrl = null;

		if (result) {
			System.out.println("정보수정 성공");
			returnUrl = "redirect:/eng/myPage?userId=" + userId;

		} else {
			System.out.println("정보수정 실패");
			returnUrl = "redirect/eng/userUpdate";
		}

		return returnUrl;
	}

	// 비밀번호변경 jsp이동
	@RequestMapping(value = "/updatePw", method = RequestMethod.GET)
	public String updatePw() {
		logger.info("updatePw(GET)메소드 실행");

		return "eng/updatePw";
	}

	// jsp로부터 새로운 비밀번호 data 받음 => db에 저장시도
	@RequestMapping(value = "/updatePw", method = RequestMethod.POST)
	public String updatePw(HttpSession session, String userPw) {
		logger.info("updatePw(POST)메소드 실행");
		logger.info("userPw:{}", userPw);

		String userId = (String) session.getAttribute("loginId"); // 사용자 ID
		logger.info(userId);

		boolean result = service.updatePw(userId, userPw);

		String returnUrl = null;

		if (result) {
			System.out.println("비밀번호수정 성공");
			returnUrl = "redirect:/2";

		} else {
			System.out.println("비밀번호수정 실패");
			returnUrl = "redirect/eng/userUpdate";
		}

		return returnUrl;
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO2.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO2.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/

		 UserVO user = new UserVO();

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		
		// response의 ID(userId)값 파싱
		String userId = (String) response_obj.get("id");
		System.out.println(userId);
		// response의 이름(userName)값 파싱
		String userName = (String) response_obj.get("name");
		System.out.println(userName);
		// response의  닉네임(userNm)값 파싱
		String userNm = (String) response_obj.get("nickname");
		System.out.println(userNm);
		// response의 전화번호(userTel)값 파싱
		String userTel = (String) response_obj.get("mobile");
		System.out.println(userTel);
		// response의 이메일(userEmail)값 파싱
		String userEmail = (String) response_obj.get("email");
		System.out.println(userEmail);

		// 소셜아이디,이름,닉네임,전화번호 저장
		user.setUserId(userId);
		user.setUserName(userName);
		user.setUserNm(userNm);
		user.setUserTel(userTel);
		user.setUserEmail(userEmail);
				
		// 4.파싱 소셜닉네임 세션으로 저장
		model.addAttribute("userNm:{}", userNm);
		logger.info("userNm:{}", userNm);
		model.addAttribute("userId: {}", userId);
		logger.info("userId: {}", userId);
		model.addAttribute("result", apiResult);
		logger.info("apiResult:{}", apiResult);

		String userNm1 = service.userSelect(user);
		logger.info("userNm1: {}", userNm1);
		String returnUrl;  
		if (userNm1 != null) {
			System.out.println("기존에 존재하는 아이디 소셜로그인 성공");
			session.setAttribute("loginName", userNm1); // 소셜로그인시 홈화면에 닉네임 띄어줌
			session.setAttribute("loginId", userId);
			returnUrl = "redirect:/2";

		} else {
			boolean result = service.userNaverLogin(user);
			if (result) {
				System.out.println("소셜로그인 성공");
				// social로그인 default값 1로 변경시도
				boolean result1 = service.updateNaverLogin(userId);
				if (result1) {
					System.out.println("default 1수정 성공");
					session.setAttribute("loginName", userNm1); // 소셜로그인시 홈화면에 닉네임 띄어줌
					session.setAttribute("loginId", userId);
					returnUrl = "redirect:/2";
				} else {
					System.out.println("default 1수정  실패");
					returnUrl = "redirect:/eng/login";
				}
			} else {
				System.out.println("소셜로그인 실패");
				returnUrl = "redirect:/eng/login";
		}
	  }
		return returnUrl;
	}
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find() {
		logger.info("find(GET)메소드 실행");
			
		return "eng/find";
	}
	
	// ID찾기
	@RequestMapping(value = "/findingId" , method = RequestMethod.GET)
	public String findingId(@RequestParam("userName") String userName, Model model) {
		logger.info("findId 메소드 실행(GET)");
		logger.info("userName: {}", userName);

		ArrayList <UserVO> idList = service.findId(userName);
		logger.info("findId: {}", idList);
		model.addAttribute("findId", idList);
		/* String findId = "{'user_Id':'"+idList+"'}"; */
		
		return "eng/find";
	}
	
	// 비밀번호찾기jsp이동
	@RequestMapping(value = "/pwFind", method = RequestMethod.GET)
	public String pwFind(String mailChk) {
		logger.info("pwFind(GET)메소드 실행");
		
		return "eng/find/findPw";
	}
	
	// 비밀번호 찾기 기능
	@RequestMapping(value = "/pwFind", method = RequestMethod.POST)
	public ModelAndView mailSending(HttpServletRequest request,String userId, String userEmail, HttpServletResponse response_email, HttpSession session) throws IOException  {
		Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        logger.info("userId: {}", userId);
        logger.info("userEmail:{}", userEmail);
        UserVO pwFindChk = service.pwFindChk(userId, userEmail);
        if(pwFindChk != null){
	        session.setAttribute("userEmail", userEmail);
	        
	        String setfrom = "tina.rin.kim@gmail.com";
	        String tomail = request.getParameter("userEmail"); // 받는 사람 이메일 
	        String title = "This is a membership confirmation email."; // 제목
	        String content =
	        
	        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
	        
	        System.getProperty("line.separator")+
	                
	        "Hello. Thank you for visiting our homepage."
	        
	        +System.getProperty("line.separator")+
	        
	        System.getProperty("line.separator")+
	
	        "The verification code is" +dice
	        
	        +System.getProperty("line.separator")+
	        
	        System.getProperty("line.separator")+
	        
	        "If you enter the verification code you received on the homepage, it will go to the next step."; // 내용
	        
	        
	        try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
	                    true, "UTF-8");
	
	            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	            messageHelper.setTo(tomail); // 받는사람 이메일
	            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	            messageHelper.setText(content); // 메일 내용
	            
	            mailSender.send(message);
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        
	        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
	        mv.setViewName("/eng/find/findPw");     //뷰의이름
	        mv.addObject("dice", dice);
	        
	        System.out.println("mv : "+mv);
	        logger.info("mv:{}", mv);
	        
	        
	        response_email.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_email = response_email.getWriter();
	        out_email.println("<script>alert('An email has been sent. Please enter the verification code.');</script>");
	        out_email.flush();
	        
	        return mv;
        } else {
        	ModelAndView mv = new ModelAndView();
        	mv.setViewName("eng/find/findPw");
        	
        	return mv;
        }
    }
	
	//PW 확인 JSP 이동
	@RequestMapping(value = "/pwchk", method = RequestMethod.GET)
	public String pwchk(HttpSession session, Model model, String userPw) {
		logger.info("pwchk(GET)메소드 실행");
		
		//아이디 가져오기
		String userId = (String) session.getAttribute("userId");
		logger.info("userId : {}", userId);
		
		return "eng/pwchk";
	}
	
	//PW 확인 후 페이지 이동
	@RequestMapping(value = "/pwchk", method = RequestMethod.POST)
	public String pwchk(HttpSession session, Model model,String userId, String userPw) {
		logger.info("pwchk(POST)메소드 실행");
		logger.info("userPw:{} ",userPw);
		logger.info("userId:{} ",userId);
		
		String userId1 = (String) session.getAttribute("loginId");
		
		String pwchk = service.selectUserNm(userId1,userPw);
		
		String returnUrl = null;
		
		String errorMessage = "These passwords don’t match.";
		
		//비밀번호 틀릴 시
		if (pwchk == null) {
			logger.info("userPw:{} ",userPw);
			logger.info("userId:{} ",userId1);
			logger.info("비밀번호 다름");
			model.addAttribute("errorMessage",errorMessage);
			returnUrl = "eng/pwchk";
		}
		//비밀번호 확인 성공 시
		else {
			logger.info("비밀번호 같음");
			
			returnUrl = "redirect:/eng/userUpdate";
		}
		
		return returnUrl;
	}
	
	
	// 이메일jsp이동
	@RequestMapping(value = "/email", method = RequestMethod.GET)
	public String email(String mailChk) {
		logger.info("email(GET)메소드 실행");
		
		return "eng/email";
	}
	
	// mailSending 코드
	@RequestMapping(value = "/email", method = RequestMethod.POST)
	public ModelAndView mailSending(HttpServletRequest request, String userEmail, HttpServletResponse response_email, HttpSession session) throws IOException  {
		Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        logger.info("userEmail:{}", userEmail);
        session.setAttribute("userEmail", userEmail);
        
        String setfrom = "tina.rin.kim@gmail.com";
        String tomail = request.getParameter("userEmail"); // 받는 사람 이메일
        String title = "This is a membership confirmation email."; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "Hello. Thank you for visiting our homepage."
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        "The verification code is" +dice
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "If you enter the verification code you received on the homepage, it will go to the next step."; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mv.setViewName("/eng/emailChk");     //뷰의이름
        mv.addObject("dice", dice);
        
        System.out.println("mv : "+mv);
        logger.info("mv:{}", mv);
        
        
        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('An email has been sent. Please enter the verification code.');</script>");
        out_email.flush();
        
        return mv;
        
    }
	
	// 이메일체크(emailChk) jsp이동
	@RequestMapping(value = "/emailChk", method = RequestMethod.GET)
	public String emailChk() {
		logger.info("emailChk(GET)메소드 실행");
		

		return "eng/emailChk";
	}
	
	//이메일 인증 페이지 맵핑 메소드
    @RequestMapping("/member/email.do")
    public String email() {
        return "member/email";
    }
    
    
    // 이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
    // 내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
    // 틀리면 다시 원래 페이지로 돌아오는 메소드
    @RequestMapping(value = "/emailChk{dice}", method = RequestMethod.POST)
    public ModelAndView emailChk(String emailInjeung, @PathVariable String dice, HttpServletResponse response_equals, HttpSession session) throws IOException {
        System.out.println("마지막 : emailInjeung : "+ emailInjeung);
        
        System.out.println("마지막 : dice : "+dice);
        
        String userEmail1 = (String) session.getAttribute("userEmail");
        
        //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
         
        ModelAndView mv = new ModelAndView();
        
        mv.setViewName("eng/join");
        
        mv.addObject("userEmail",emailInjeung);
        
        if (emailInjeung.equals(dice)) {
            
            //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
            mv.setViewName("eng/join");
            mv.addObject("userEmail1",userEmail1);
            mv.addObject("userEmail",emailInjeung);
            
            //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
            //한번더 입력할 필요가 없게 한다.
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('The verification code matched. Go to the 'Create an account'page.');</script>");
            out_equals.flush();
    
            return mv;
            
            
        }else if (emailInjeung != dice) {
            ModelAndView mv2 = new ModelAndView(); 
            
            mv2.setViewName("eng/emailChk");
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('This verification code doesn’t match. Please enter the verification code again.'); history.go(-1);</script>");
            out_equals.flush();
    
            return mv2;
        }    
    
        return mv;
    }

}
