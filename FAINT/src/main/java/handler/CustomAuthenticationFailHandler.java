package handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomAuthenticationFailHandler implements AuthenticationFailureHandler {
	
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse res, AuthenticationException exception)
			throws IOException, ServletException {
		
		
		System.out.println(exception.getClass().getSimpleName());
		System.out.println(exception.getClass().getName());

		req.setAttribute("loginid", req.getParameter("email"));
		
		if(exception.getClass().getSimpleName().equals("BadCredentialsException")){
			req.setAttribute("error", "login");
		}else if(exception.getClass().getSimpleName().equals("SessionAuthenticationException")){
			req.setAttribute("error", "duplicate");
		}else if(exception.getClass().getSimpleName().equals("UsernameNotFoundException")){
			req.setAttribute("error", "not found");
		}
		//System.out.println(exception.getClass()==SessionAuthenticationException);
		System.out.println("error: "+req.getAttribute("error"));
		
		req.getRequestDispatcher("/user/loginTest").forward(req, res);
	}

}
//For example, if you receive your request on http://example.com/myapp/subdir,
//
//    RequestDispatcher dispatcher = 
//        request.getRequestDispatcher("index.jsp");
//    dispatcher.forward( request, response ); 
//Will forward the request to the page http://example.com/myapp/subdir/index.jsp.
//
//In any case, you can't forward request to a resource outside of the context.