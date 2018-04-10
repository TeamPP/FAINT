package com.faint.sns;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.faint.service.PostService;
import com.faint.service.SearchService;
import com.faint.service.TagService;
import com.faint.service.UserService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/explore/*")
public class ExploreController {

	private static final Logger logger = LoggerFactory.getLogger(ExploreController.class);
	@Inject
	private TagService tagservice;

	@Inject
	private PostService postservice;

	@Inject
	private UserService userservice;

	@Inject
	private SearchService searchservice;

	// 인기검색어, 인기게시글 출력
	@RequestMapping(value = "/expage", method = RequestMethod.GET)
	public void getPost(Model model) throws Exception {

		// model.addAttribute("topTag", tagservice.topTag()); // 상위10개 태그목록 출력
		List<PostVO> topPostList = postservice.topPost();
		model.addAttribute("topPost", postservice.topPost()); // 좋아요랑 댓글이 없어서 일단
																// 게시글 전체목록 출력

		JSONArray jsonArray = new JSONArray();
		model.addAttribute("jsonList", jsonArray.fromObject(topPostList));
	}

	// 인기검색어, 인기게시글 출력
	@RequestMapping(value = "/getTag", method = RequestMethod.POST)
	public ResponseEntity<List<TagVO>> getTag(Model model) throws Exception {

		ResponseEntity<List<TagVO>> entity = null;
		model.addAttribute("topTag", tagservice.topTag()); // 상위10개 태그목록 출력

		try {
			entity = new ResponseEntity<List<TagVO>>(tagservice.topTag(), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		System.out.println(entity);
		return entity;
	}

	// 실시간으로 keyword값 받아서 띄우기 => 이름, 닉네임, 태그 모두 다
	@ResponseBody
	@RequestMapping(value = "/searchData", method = RequestMethod.POST)
	public ResponseEntity<List<SearchDTO>> searchList(@RequestBody String words, HttpServletRequest request)
			throws Exception {

		SearchCriteria cri = new SearchCriteria();
		ResponseEntity<List<SearchDTO>> entity = null;

		UserVO vo = (UserVO) request.getSession().getAttribute("login");
		int loginid = vo.getId();
		cri.setLoginid(loginid);

		// 입력받은 값이 #, @로 시작할 경우 단어를 잘라서 검색
		if (words.substring(0, 1).equals("#") && words.length() > 1) {
			cri.setKeyword(words.substring(1, words.length()));
		} else if (words.substring(0, 1).equals("@") && words.length() > 1) {
			cri.setKeyword(words.substring(1, words.length()));
		}
		// 아닌 경우 그냥 검색
		else {
			cri.setKeyword(words);
		}

		System.out.println(cri.getLoginid());
		System.out.println(">>>>>" + cri.toString());

		try {
			entity = new ResponseEntity<List<SearchDTO>>(searchservice.listKeyword(cri), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

}