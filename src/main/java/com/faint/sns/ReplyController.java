package com.faint.sns;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.faint.domain.ReplyVO;
import com.faint.domain.UserVO;
import com.faint.dto.RelationDTO;
import com.faint.persistence.UserDAO;
import com.faint.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	private ReplyService service;
	
	@Inject
	private UserDAO userDao;
	
	/*댓글 등록 - rest방식*/
	@ResponseBody
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> rplRegister(@RequestBody ReplyVO vo, HttpServletRequest request, HttpServletResponse response){

		ResponseEntity<String> entity=null;
		
		int count = service.writeCount(vo);
		System.out.println(count);
		if(count>=3) {
			System.out.println("here is coming ");
			try {
				 response.setContentType("text/html; charset=UTF-8");
	             PrintWriter out = response.getWriter();
	             out.println("<script>alert('하루 글 작성 가능 개수는 5개까지입니다.');history.go(-1);</script>");
	             out.flush();
	             System.out.println(request.getRemoteAddr());
	             logger.info(request.getRemoteAddr());
	             //userDao.insert_ip_ban(request.getRemoteAddr()); --하면 정지먹음
	             
			}
			catch(Exception e) {
				System.out.println(e);
			}

		}
		else {
			
			System.out.println("댓글작성하러 왔");
		
			try{	
				service.regist(vo);
				entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}catch(Exception e){
				e.printStackTrace();
				entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
		}
		return entity;
	}
	
	/*댓글 삭제 - rest방식*/
	@ResponseBody
	@RequestMapping(value="/{replyid}", method=RequestMethod.DELETE)
	public ResponseEntity<String> rplRegister(@PathVariable("replyid") Integer id){
		ResponseEntity<String> entity=null;
		System.out.println(id);
		try{
			service.remove(id);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/*게시물에 대한 댓글 조회 - JSON객체(LIST배열에 담아서 던져줌)*/
	@ResponseBody
	@RequestMapping(value="/post/{postid}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> rplList(@PathVariable("postid") Integer postid, HttpServletRequest request){
		
		//차단or차단당한 유저일경우 빼기위해 로그인값 확인
		UserVO vo=(UserVO)request.getSession().getAttribute("login");
		RelationDTO dto=new RelationDTO();
		dto.setLoginid(vo.getId());
		dto.setPostid(postid);
	
		ResponseEntity<List<ReplyVO>> entity=null;
		try{
			entity=new ResponseEntity<>(service.read(dto), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}