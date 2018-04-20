package com.faint.sns;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.faint.domain.PostVO;
import com.faint.domain.SearchCriteria;
import com.faint.service.PostService;
import com.faint.service.UserService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/search/*")
public class SearchListController {

	private static final Logger logger = LoggerFactory.getLogger(SearchListController.class);

	@Inject
	private PostService postService;

	// 검색초기화면
	@RequestMapping(value = "/userPage2", method = RequestMethod.GET)
	public String searchlist() {
		return "userPage2";
	}
	
	// list.jsp에서 키워드를 받아서 키워드와 일치하는 유저목록 출력
	// 리다이렉트(redirect)시 값(parameter) 전달: RedirectAttributes redirectAttributes
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String listUserPage(HttpServletRequest httpServletRequest, RedirectAttributes redirectAttributes)
			throws Exception {

		String inputKeyword = httpServletRequest.getParameter("inputKeyword");
		
		inputKeyword = inputKeyword.replaceAll(" ", "");

		// 특수문자빼오기-->searchType
		String type = inputKeyword.substring(0, 1);

		// 특수문자 제거한 키워드-->keyword
		String keyword = inputKeyword.substring(1, inputKeyword.length());

		System.out.println("앞한자빼기 type: " + type);
		System.out.println("앞한자빼기 keyword: " + keyword);

		// type이 @이라면 유저
		// type이 #이라면 태그
		// type이 %이라면 위치
		// 나머지는 그냥 통합

		if (type.equals("@")) {
			System.out.println("유저검색..");
			redirectAttributes.addAttribute("nickname", keyword);
			return "redirect:/member/profile";

		} else if (type.equals("#")) {
			System.out.println("태그검색..");
			redirectAttributes.addAttribute("name", keyword);
			return "redirect:/search/tags";

		} else if (type.equals("%")) {
			System.out.println("위치검색..");
			redirectAttributes.addAttribute("location", keyword);
			return "redirect:/search/locations";

		} else {
			System.out.println("통합검색..");
			return "";
		}

	}

	/*-----------------------------------------------태그---------------------------------------------------------------*/

	// 키워드받는 태그 게시물목록 무한스크롤 (처음 10개 목록)
	@RequestMapping(value = "/tags", method = RequestMethod.GET)
	public String tagsSearch(@RequestParam("name") String name, Model model) throws Exception {

		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword(name);
		JSONArray jsonArray=new JSONArray();
		List<PostVO> taglist=postService.tagsAjax(cri);
		
		if(taglist.size()>0){
			model.addAttribute("tagList", taglist);
			model.addAttribute("jsonList", jsonArray.fromObject(taglist));
			model.addAttribute("keyword", "#"+name);
			return "/search/tags";
		}else{
			return "forward:/empty";
		}
		
	}

	
	// 태그검색 게시물목록 무한스크롤 JSON넘기기
	@ResponseBody
	@RequestMapping(value = "/ScrollTags", method = RequestMethod.POST)
	public List<PostVO> infiniteScrollTags(@RequestParam("keyword") String keyword, @RequestParam("row") int row)
			throws Exception {
		logger.info("infiniteScrollTags is called........");

		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword(keyword);

		return postService.infiniteScrollTags(cri, row);
	}

	
	/*-----------------------------------------------위치---------------------------------------------------------------*/

	
	// 키워드받는 위치목록 무한스크롤 (처음 10개 목록)
	@RequestMapping(value = "/locations", method = RequestMethod.GET)
	public String locationsSearch(@RequestParam("location") String location, Model model) throws Exception {
		logger.info("locationsSearch is called........");

		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword(location);
		
		JSONArray jsonArray=new JSONArray();
		List<PostVO> locationList=postService.locationsAjax(cri);
		
		if(locationList.size()>0){
			model.addAttribute("locationList", locationList);
			model.addAttribute("jsonList", jsonArray.fromObject(locationList));
			model.addAttribute("keyword", location);
			return "/search/locations";
		}else {
			return "forward:/empty";
		}
	}

	
	// 위치 게시물목록 무한스크롤 JSON넘기기
	@ResponseBody
	@RequestMapping(value = "/ScrollLocations", method = RequestMethod.POST)
	public List<PostVO> infiniteScrollLocations(@RequestParam("keyword") String keyword, @RequestParam("row") int row)
			throws Exception {
		logger.info("infiniteScrollLocations is called........");

		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword(keyword);

		return postService.infiniteScrollLocations(cri, row);
	}
	
	
	
	/*-----------------------------------------------카테고리 필터---------------------------------------------------------------*/
	
	// 키워드받는 태그 게시물목록 무한스크롤 (처음 10개 목록)
		@RequestMapping(value = "/category", method = RequestMethod.GET)
		public String cateSearch(@RequestParam("cateid") Integer cateid, Model model) throws Exception {

			JSONArray jsonArray=new JSONArray();
			List<PostVO> catelist=postService.cateAjax(cateid);
			
			if(catelist.size()>0){
				model.addAttribute("cateList", catelist);
				model.addAttribute("jsonList", jsonArray.fromObject(catelist));
				model.addAttribute("keyword", "category."+cateid);
				return "/search/cateFilter";
			}else{
				return "forward:/empty";
			}
			
		}

}
