package com.faint.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface MailService {


	public void sendMail(HttpServletRequest req, Map<String, Object> map);
	
}
