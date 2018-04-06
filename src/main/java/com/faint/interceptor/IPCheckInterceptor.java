package com.faint.interceptor;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.faint.persistence.UserDAOImpl;

public class IPCheckInterceptor implements HandlerInterceptor {
	private static final Logger logger = Logger.getLogger(IPCheckInterceptor.class);
	
	@Inject
	UserDAOImpl dao;
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)throws Exception{
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)throws Exception{
		
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object arg2) throws Exception {
		logger.info("client ip " + req.getRemoteAddr());
		List<String> list = dao.find_ip_ban_list(); //오늘 IP밴 당한 사람의 IP만 가져온다.
		for(String li : list)
		{
			logger.info("ban ip " + li);
			if(req.getRemoteAddr().matches(li))
			{
				 res.setContentType("text/html; charset=UTF-8");
			      PrintWriter out = res.getWriter();
			      out.println("<script>alert('도배 때문에 글작성이 하루동안 제한됩니다.');history.go(-1);</script>");
			      out.flush();
				return false;
			}
		}
		return true;
	}

}