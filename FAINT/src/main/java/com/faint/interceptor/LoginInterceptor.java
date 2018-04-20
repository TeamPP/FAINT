package com.faint.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.faint.domain.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN="login";
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);
//	//이전 세션 삭제
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
//		HttpSession session = request.getSession();
//		if(session.getAttribute(LOGIN)!=null){
//			logger.info("clear login data before====================================");
//			session.removeAttribute(LOGIN);
//		}
//		return true;
//	}
//	
//	//email,password값으로 받은 userVO검색하여 해당 객체 세션 객체에 저장
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
//		HttpSession session = request.getSession();
//		ModelMap modelMap = modelAndView.getModelMap();
//		Object userVO = modelMap.get("userVO");
//		System.out.println(userVO);
//		if(userVO != null){
//			logger.info("new login success====================================");
//			session.setAttribute(LOGIN, userVO); //세션 "login"속성에 userVO담아서 전달
//			//이전페이지로 목적지 설정
//			Object dest = session.getAttribute("dest");
//			response.sendRedirect(dest!=null ? (String)dest:"/");
//		}
//	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		System.out.println("Logininterceptor preHandle 진입");
		HttpSession session = request.getSession();
		//System.out.println("LOGIN :"+session.getAttribute(LOGIN));
		if(session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("LoginInterceptor postHandle 진입");
		System.out.println("로그인이 되는지한번 보자꾸나 ");
		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("userVO");
		//System.out.println("userVo"+userVO);
		//System.out.println(userVO);
		
		
		///userState  로 0 일 때 이메일 인증 대기 회원 
		//						1일 때인증 완료 서비스 가동
		//						2 탈 퇴 회원 
		//
		
		UserVO vo=(UserVO)userVO;
		System.out.println(vo);
	
		FlashMap flashMap = new FlashMap();
		if(vo == null) {
			flashMap.put("msg" , "아이디 또는 비밀번호가 일치하지 않습니다.");
			//System.out.println("아이디 비밀번호 실패");
			session.setAttribute("dest","/user/loginTest");
			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
			flashMapManager.saveOutputFlashMap(flashMap, request, response);
			return;
		}else if(vo.getPrilevel()==0){
			flashMap.put("msg" , "인증 대기 중인 아이디 입니다. 메일에 접속해 인증해주세요");
			//System.out.println("인증대기");
			session.setAttribute("dest","/user/loginTest");
			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
			flashMapManager.saveOutputFlashMap(flashMap, request, response);
			return;
		}else if(vo.getPrilevel()==2){
			flashMap.put("msg" , "탈퇴된 회원입니다. 관리자에게 문의해주세요");
			//System.out.println("탈퇴");
			session.setAttribute("dest","/user/loginTest");
			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
			flashMapManager.saveOutputFlashMap(flashMap, request, response);
			return;
		}
//		else if(vo.getUserState()==9){
//			flashMap.put("msg" , "너는 관리자다 좋겠");
//			System.out.println("관리자인데 바로 안넘어가니??");
//			session.setAttribute("dest","admin/admin_test");
//			System.out.println("===================넘어갔으면 좋겠다 ");
//			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
//			flashMapManager.saveOutputFlashMap(flashMap, request, response);
//			return;
//		}
		System.out.println("여기는 실행이 안된나봐 왜 ");
		if(vo.getPrilevel()==1||vo.getPrilevel()==9) {
			session.setAttribute(LOGIN, userVO);
			//response.sendRedirect("/");
			//System.out.println(userVO);
			System.out.println("결국 여기는 ");
			Object dest = session.getAttribute("dest");
			System.out.println(vo.getPrilevel());
			if(vo.getPrilevel()==9) {
				System.out.println("관리자로 좀 넘어가자 ");
				flashMap.put("msg" , "너는 관리자다 좋겠");
				session.setAttribute("dest","admin/admin_test");
				response.sendRedirect("/admin/admin_dashboard");
				System.out.println("관리자 +로그인 상태 유지");
				logger.info("관리자 +그인 상태 유지");
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				// 쿠키 수명 : 하루동안 브라우저에 보관
				loginCookie.setMaxAge(60 * 60 * 24);
				response.addCookie(loginCookie);
			}
			if(dest=="/user/loginTest"||dest==""||dest==null){
				System.out.println("기본회원인듯요 ");
				session.setAttribute("dest","/main");
				
				System.out.println("로그인 상태 유지");
				logger.info("로그인 상태 유지");
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				// 쿠키 수명 : 하루동안 브라우저에 보관
				loginCookie.setMaxAge(60 * 60 * 24);
				response.addCookie(loginCookie);
				
			}
			//System.out.println("postHandle dest: "+dest);

		}else{
			session.setAttribute("dest","/user/loginTest");
		}
	}
	
	
}

