package com.faint.sns;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.faint.domain.PostVO;
import com.faint.domain.SearchCriteria;
import com.faint.domain.TagVO;
import com.faint.domain.UserVO;
import com.faint.dto.RelationDTO;
import com.faint.dto.SearchDTO;
import com.faint.service.ActivityService;
import com.faint.service.PostService;
import com.faint.service.SearchService;
import com.faint.service.TagService;
import com.faint.service.UserService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/recommend/*")
public class RecommendController {

	private static final Logger logger = LoggerFactory.getLogger(RecommendController.class);


	@Inject
	private ActivityService activityservice;
	
	// 인기검색어, 인기게시글 출력
	//친구추천 및 추천친구들의 게시글
	@RequestMapping(value = "/recompage", method = RequestMethod.GET)
	public String getPost(Model model , HttpServletRequest request) throws Exception {		
		
		//친구추천 계정
		UserVO vo = (UserVO) request.getSession().getAttribute("login");
		int loginid = vo.getId();
		List<UserVO> recommList=activityservice.recomm(loginid);  
		model.addAttribute("recommList",recommList);
		
		
		//친구추천 계정들의 post
		JSONArray jsonArray=new JSONArray();
		List<PostVO> recomPostList=activityservice.RecommPost(loginid);
		
		if(recomPostList.size()>0){
			model.addAttribute("recomPostList", recomPostList);
			model.addAttribute("jsonList", jsonArray.fromObject(recomPostList));
		
			return "/recommend/recompage";
		}else{
			return "forward:/empty";
		}
		
		

		
	}

	
}