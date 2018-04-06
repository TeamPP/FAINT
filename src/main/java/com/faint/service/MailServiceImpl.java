package com.faint.service;

import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private JavaMailSender mailSender;

	@Inject
	private com.faint.persistence.UserDAO dao;

	@Transactional


	@Override
	public void sendMail(HttpServletRequest req, Map<String, Object> map) {
		String from = "sosososo@nananana.com";
		String to = req.getParameter("to"); // 받는 사람 이메일
		String subject = req.getParameter("subject"); // 제목
		String content = req.getParameter("content"); // 내용
		
		System.out.println("to:"+to+"\nsubject:"+subject+"\ncontent:"+content);

		   // 메일을 전송합니다
		   
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(from); // 보내는 사람 생략시 작동안됨
			messageHelper.setTo(to); // 받는사람
			messageHelper.setSubject(subject); // 제목은 생략 가능
			//messageHelper.setText(content); // 내용
			
			 StringBuffer bodyBf = new StringBuffer();
			   bodyBf.append ("<html>");
			   bodyBf.append ("<body>");
			   bodyBf.append (content);
			   bodyBf.append ("</body>");
			   bodyBf.append ("</html>");
			   System.out.println("컨텐츠 내용 : " +bodyBf.toString ());
			   
			messageHelper.setText(bodyBf.toString (), true);

			mailSender.send(message);

			map.put("result", "success");

		} catch (Exception e) {
			map.put("result", "fail");
			e.printStackTrace();
		}

	}

}
