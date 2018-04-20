package com.faint.sns;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.faint.domain.AdminReportVO;
import com.faint.domain.UserVO;
import com.faint.service.AdminService;
import com.faint.service.UserService;

import util.AdminCriteria;
import util.AdminPageMaker;

@RequestMapping("/admin/*")
@Controller
public class AdminController {
	
	@Inject
	private UserService service;
	@Inject
	private AdminService aService;
	
	@RequestMapping(value= {"admin", "admin/","admin_dashboard"})
	public String adminMain(HttpServletRequest req, Model model) {
			System.out.println("==============");
			System.out.println("여기는 관리자 메인페이지 ");
			
		return "admin/admin_dashboard";
	}
	@RequestMapping(value="admin/login", method = RequestMethod.GET)
	public String adminLogin(HttpServletRequest req, Model model,HttpSession session) {
		System.out.println("어드민 로그인 페이지");
		
		String referer_url = req.getHeader("referer");
		System.out.println("리퍼러 = " + referer_url);
		String contextPath = req.getContextPath();
		// System.out.println("contextPath = "+contextPath);
		String command = null;
		String auth_prev_url = (String) session.getAttribute("auth_prev_url");

		// auth인터셉터로 타고온 로그인 처리인 경우
		if (auth_prev_url != null && auth_prev_url.length() != 0) {
			System.out.println("auth인터셉터 타고온 로그인");
			session.removeAttribute("auth_prev_url");
			session.setAttribute("prev_url", auth_prev_url);
			return "admin/admin_login";
		}

		// 직접 경로로 들어오는 경우 메인 페이지로 설정
		if (referer_url == null || referer_url.length() == 0) {
			String prev_url = (String) session.getAttribute("prev_url");
			if (prev_url == null || prev_url.length() == 0) {
				referer_url = "http://" + req.getServerName() + ":" + req.getServerPort() + contextPath;
				session.setAttribute("prev_url", referer_url);
			}
			return "admin/admin_login";
		}

		// command = prev_url.substring(contextPath.length());
		int start = referer_url.indexOf(contextPath) + contextPath.length();
		int end = referer_url.length();
		command = referer_url.substring(start, end);

		session.setAttribute("prev_url", referer_url);

		System.out.println("요청 주소 추출 : " + command + "\n이전 주소 : " + referer_url);

		if (command.equals("/member/join")) {
			// 회원가입 페이지에서 로그인시 메인 페이지로 그외는 이전 페이지를 넘김
			referer_url = "http://" + req.getServerName() + ":" + req.getServerPort() + contextPath;
			session.setAttribute("prev_url", referer_url);

		}

		return "admin/admin_login";
	}
	
	@RequestMapping(value = "admin/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest req, HttpServletResponse resp, HttpSession session)
			throws Exception {

	  	Object obj = session.getAttribute("login");

    	if(obj !=null){
    		UserVO vo=(UserVO) obj;

    		session.removeAttribute("login");
    		session.invalidate();

    		Cookie loginCookie = WebUtils.getCookie(req,"loginCookie");
    		if(loginCookie !=null){
    			loginCookie.setPath("/");
    			loginCookie.setMaxAge(0);
    			resp.addCookie(loginCookie);
    			service.keepLogin(vo.getEmail(), session.getId(), new Date());
			}
		}

		// 로그아웃처리
	//	 session.removeAttribute("login");

		// return "redirect:login";
		return "user/loginTest";
	}
	
	@RequestMapping(value="admin/member" ,method=RequestMethod.GET)
	public String adminMember(HttpServletRequest req, Model model) throws Exception {
		System.out.println("회원 관리 페이지");
		System.out.println(" #############");
		System.out.println("회원관리 목록 리스트 페이지 ");
		
		model.addAttribute("list",aService.listAll());
		
		return "admin/admin_member_list";
	}
	@RequestMapping(value="admin/charts")
	public String adminCharts(HttpServletRequest req, Model model) {
		System.out.println("통계(차트) 화면 보기");
		return "admin/admin_charts";
	}
	
	@RequestMapping(value="admin/lockscreen")
	public String adminLockScreen(HttpServletRequest req, Model model) {
		System.out.println("관리자 화면 자금");
		return "admin/admin_lockscreen";
	}
	
	@RequestMapping(value="admin/message")
	public String adminMessage(HttpServletRequest req, Model model) {
		System.out.println("메시지 페이지");
		return "admin/admin_message_list";
	}
	

	@RequestMapping(value="admin/email")
	public String adminEmail(HttpServletRequest req, Model model) {
		System.out.println("이메일 발송");
		return "admin/admin_email";
	}
	
	@RequestMapping(value="admin/regist")
	public String adminRegist(HttpServletRequest req, Model model) {
		System.out.println("관리자 계정 생성");
		return "admin/admin_regist";
	}
	//관리자 계정 설정
		@RequestMapping(value="admin/profile/edit")
		public String adminEdit(HttpServletRequest req, Model model) {
			System.out.println("관리자 계정 설정(수정)");
			return "admin/admin_profile_modify";
		}
		
		//관리자 계정 생성
		@RequestMapping(value="admin/profile/new")
		public String adminModify(HttpServletRequest req, Model model) {
			System.out.println("관리자 아이디 생성");
			return "admin/admin_profile_modify";
		}
		//관리자 프로필
		@RequestMapping(value="admin/profile")
		public String adminProfile(HttpServletRequest req, Model model) {
			System.out.println("프로필 페이지");
			return "admin/admin_profile";
		}
		
		@RequestMapping(value="admin/session_timeout")
		public String adminSessionTimeOut(HttpServletRequest req, Model model) {
			System.out.println("관리자 계정 생성");
			return "admin/admin_session_timeout";
		}
		
		// 유저 관리
		
		// 유저 관리 리스트
		@RequestMapping(value = "/user", method = RequestMethod.GET)
		public String AdminUserList(@ModelAttribute("ac") AdminCriteria ac, Model model) throws Exception {
			
		  model.addAttribute("AUList", aService.AUList(ac));
		  
		  AdminPageMaker pageMaker = new AdminPageMaker();
		  pageMaker.setCri(ac);
		  pageMaker.setTotalCount(aService.AULCount(ac));
		  model.addAttribute("pageMaker", pageMaker);
		  	
		  	return "admin/admin_user_list";
		}
		
		// 유저 관리 리스트 삭제
		@RequestMapping(value = "/user/delete", method = RequestMethod.POST)
		public ResponseEntity<String> AdminUserDelete(@RequestParam(value = "check[]")List<String> id, RedirectAttributes rttr) throws Exception {
			 System.out.println(id);
			ResponseEntity<String> entity = null;
			try {
				aService.AUDelete(id);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		// 유저 영구 정지
		@RequestMapping(value = "/user/pstop", method = RequestMethod.POST)
		public ResponseEntity<String> AdminUserPStop(@RequestParam(value = "check[]")List<String> id, RedirectAttributes rttr) throws Exception {
			 System.out.println(id);
			ResponseEntity<String> entity = null;
			try {
				aService.AUPStop(id);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		// 유저 정지
		@RequestMapping(value = "/user/stop", method = RequestMethod.POST)
		public ResponseEntity<String> AdminUserStop(@RequestParam(value = "check[]")List<String> id, RedirectAttributes rttr) throws Exception {
			 System.out.println(id);
			ResponseEntity<String> entity = null;
			try {
				aService.AUStop(id);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		
		
		// 게시물 관리
		
		// 게시물 관리자 리스트
		@RequestMapping(value = "/post", method = RequestMethod.GET)
		public String AdminPostList(@ModelAttribute("ac") AdminCriteria ac, Model model) throws Exception {
			
		  model.addAttribute("APList", aService.APList(ac));
		  
		  AdminPageMaker pageMaker = new AdminPageMaker();
		  pageMaker.setCri(ac);
		  pageMaker.setTotalCount(aService.APLCount(ac));
		  model.addAttribute("pageMaker", pageMaker);
		  	
		  	return "admin/admin_post_list";
		}

		// 게시물 관리 리스트 삭제
		@RequestMapping(value = "/post/delete", method = RequestMethod.POST)
		public ResponseEntity<String> AdminPostDelete(@RequestParam(value = "check[]")List<String> id, RedirectAttributes rttr) throws Exception {

			ResponseEntity<String> entity = null;
			try {
				aService.APDelete(id);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		
		// 게시물 관리자 외 비공개 처리
		@RequestMapping(value = "/post/block", method = RequestMethod.POST)
		public ResponseEntity<String> AdminPostBlock(@RequestParam(value = "check[]")List<String> id, RedirectAttributes rttr) throws Exception {
			 System.out.println(id);
			ResponseEntity<String> entity = null;
			try {
				aService.APBlock(id);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		

		      
		// 댓글 관리
		
		//댓글 관리자 리스트
		@RequestMapping(value = "/reply", method = RequestMethod.GET)
		public String AdminReplyList(@ModelAttribute("ac") AdminCriteria ac, Model model) throws Exception {
			
		  model.addAttribute("ARList", aService.ARList(ac));
		  
		  AdminPageMaker pageMaker = new AdminPageMaker();
		  pageMaker.setCri(ac);
		  pageMaker.setTotalCount(aService.ARLCount(ac));
		  model.addAttribute("pageMaker", pageMaker);
		  	
		  	return "admin/admin_reply_list";
		}	
		
		
		// 댓글 관리 리스트 삭제
		@RequestMapping(value = "/reply/delete", method = RequestMethod.POST)
		public ResponseEntity<String> AdminReplyDelete(@RequestParam(value = "check[]")List<String> id, RedirectAttributes rttr) throws Exception {

			ResponseEntity<String> entity = null;
			try {
				aService.ARDelete(id);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		
		
		// 유저 신고
		
		//유저 신고 게시물 작성
		@RequestMapping(value = "/report/user/register", method = RequestMethod.POST)
		public ResponseEntity<String> AdminReportUserCreate(@RequestBody AdminReportVO vo) {

			ResponseEntity<String> entity = null;
			try {
				aService.ARUCreate(vo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		// 유저 신고 리스트
		@RequestMapping(value = "/report/user", method = RequestMethod.GET)
		public String AdminReportUserList(@ModelAttribute("ac") AdminCriteria ac, HttpServletRequest request,  Model model) throws Exception {
			HttpSession session = request.getSession();
			UserVO vo=(UserVO)session.getAttribute("login");
			ac.setLoginid(vo.getId());
		  model.addAttribute("ARUList", aService.ARUList(ac));
		  
		  AdminPageMaker pageMaker = new AdminPageMaker();
		  pageMaker.setCri(ac);
		  pageMaker.setTotalCount(aService.ARULCount(ac));
		  model.addAttribute("pageMaker", pageMaker);
		  	
		  	return "admin/admin_report_user_list";
		}
		
		// 유저 신고 게시물 삭제
		@RequestMapping(value = "/report/user/delete", method = RequestMethod.POST)
		public ResponseEntity<String> AdminReportUserDelete(@RequestParam(value = "check[]")List<String> id, RedirectAttributes rttr) throws Exception {

			ResponseEntity<String> entity = null;
			try {
				aService.ARUDelete(id);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		// 유저 신고 게시물 상세보기
		@ResponseBody
		@RequestMapping(value = "/report/user/read/{id}", method = RequestMethod.GET)
		public ResponseEntity<AdminReportVO> AdminReportUserRead(@PathVariable("id") int id) throws Exception {
			
			AdminReportVO vo = new AdminReportVO();
			vo.setId(id);
			
			ResponseEntity<AdminReportVO> entity = null;
			try {
				entity = new ResponseEntity<AdminReportVO>(aService.ARURead(id), HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<AdminReportVO>(HttpStatus.BAD_REQUEST);
				
			}
			return entity;
		}
		
		// 유저 신고 게시물 읽은 관리자 체크
		@RequestMapping(value = "/report/user/read/check", method = RequestMethod.POST)
		public ResponseEntity<String> AdminReportUserCheck(@RequestBody AdminReportVO vo) {
				System.out.println(1234);
				System.out.println(vo);
			ResponseEntity<String> entity = null;
			try {
				aService.ARUCheck(vo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		
		// 게시물 신고
		
		// 게시물 신고 게시물 작성
		@RequestMapping(value = "/report/post/register", method = RequestMethod.POST)
		public ResponseEntity<String> AdminReportPostCreate(@RequestBody AdminReportVO vo) {

			ResponseEntity<String> entity = null;
			try {
				aService.ARPCreate(vo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		// 게시물 신고 리스트
		@RequestMapping(value = "/report/post", method = RequestMethod.GET)
		public String AdminReportPostList(@ModelAttribute("ac") AdminCriteria ac, Model model) throws Exception {
			
		  model.addAttribute("ARPList", aService.ARPList(ac));
		  
		  AdminPageMaker pageMaker = new AdminPageMaker();
		  pageMaker.setCri(ac);
		  pageMaker.setTotalCount(aService.ARPLCount(ac));
		  model.addAttribute("pageMaker", pageMaker);
		  	
		  	return "admin/admin_report_post_list";
		}
		
		// 게시물 신고 게시물 삭제
		@RequestMapping(value = "/report/post/delete", method = RequestMethod.POST)
		public ResponseEntity<String> AdminReportPostDelete(@RequestParam(value = "check[]")List<String> id, RedirectAttributes rttr) throws Exception {

			ResponseEntity<String> entity = null;
			try {
				aService.ARPDelete(id);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		// 게시물 신고 게시물 상세보기
		@ResponseBody
		@RequestMapping(value = "/report/post/read/{id}", method = RequestMethod.GET)
		public ResponseEntity<AdminReportVO> AdminReportPostRead(@PathVariable("id") int id) throws Exception {
			
			AdminReportVO vo = new AdminReportVO();
			vo.setId(id);
			
			ResponseEntity<AdminReportVO> entity = null;
			try {
				entity = new ResponseEntity<AdminReportVO>(aService.ARPRead(id), HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<AdminReportVO>(HttpStatus.BAD_REQUEST);
				
			}
			return entity;
		}
		
		// 게시물 신고 게시물 읽은 관리자 체크
		@RequestMapping(value = "/report/post/read/check", method = RequestMethod.POST)
		public ResponseEntity<String> AdminReportPostCheck(@RequestBody AdminReportVO vo) {

			ResponseEntity<String> entity = null;
			try {
				aService.ARPCheck(vo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
}


