package com.faint.sns;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.faint.domain.UserVO;
import com.faint.service.AdminService;
import com.faint.service.UserService;

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
		
		

}


