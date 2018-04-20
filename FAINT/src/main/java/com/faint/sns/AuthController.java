package com.faint.sns;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/user/*")
public class AuthController {



	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

	
	@RequestMapping(value = "/login", method = RequestMethod.GET)

	public ModelAndView login(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout) {
		
		ModelAndView model = new ModelAndView();
		
		if (error != null) {
			model.addObject("error", "메일주소나 비밀번호를 확인하여주십시오");
		}

		if (logout != null) {
			model.addObject("msg", "로그아웃 되었습니다.");
		}
		
		model.setViewName("login");

		return model;

	}	

}