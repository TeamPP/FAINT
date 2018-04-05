package com.faint.sns;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.faint.domain.UserVO;
import com.faint.service.UserService;
import com.faint.util.PageRank;

@Controller
public class PageRankController {

	@Inject
	private UserService service;
	
	@RequestMapping(value = "/pagerank", method = RequestMethod.GET)
	public void main(HttpServletRequest request, Model model)throws Exception{
		
		
		List<String> follow = service.rank();
		List<UserVO> allUser = service.listAll();
		String[][] userid=new String[allUser.size()][allUser.size()];
		PageRank p=new PageRank(allUser.size());
		
		for (int i = 0; i < allUser.size(); i++) {
			System.out.println("몇번째 유저인가?"+allUser.get(i).getName());
			for (int j = 0; j < allUser.size(); j++) {
				userid[i][j]=allUser.get(i).getId()+"-"+allUser.get(j).getId();
				if(follow.contains(userid[i][j])){
					p.path[i][j]=1;
				}else if(i==j){
					p.path[i][j]=0;
				}else{
					p.path[i][j]=0;
				}
				System.out.print(p.path[i][j]);
			}
			System.out.println();
		}
		int popular = p.calc(allUser.size());
		model.addAttribute(allUser.get(popular));
		
	}

}
