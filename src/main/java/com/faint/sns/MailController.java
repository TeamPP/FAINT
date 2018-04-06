package com.faint.sns;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.faint.service.MailService;

@Controller
public class MailController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject
	private MailService service;
	
	@ResponseBody
	
	@RequestMapping(value = "/mail/mail_send.json")
	public Map<String, Object> mailSend(HttpServletRequest req) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		service.sendMail(req, map);
		return map;
	}
	
	@RequestMapping(value = "/customercenter/email")
	public String mailForm(HttpServletRequest req,Model model) {
		
		
		return "/customercenter/email/email_compose";
	}
	

}
