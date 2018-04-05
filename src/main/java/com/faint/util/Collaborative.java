package com.faint.util;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.faint.domain.UserVO;
import com.faint.service.UserService;

public class Collaborative {

	@Inject
	private UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(Collaborative.class);
	
	public int loginUser;
	public int targetUser;

	//로그인 유저에게 그냥 추천용 생성자
	public Collaborative(int loginUser){
		this.loginUser=loginUser;
	}
	
	//두 유저간의 유사도를 통해 추천용 생성자
	public Collaborative(int loginUser, int targetUser){
		this.loginUser=loginUser;
		this.targetUser=targetUser;
	}
	
	//전체 유저중 추천
	public void nonTargetCalc() throws Exception {
		
		//전체유저
		List<String> follow = service.rank();
		List<UserVO> allUser = service.listAll();
		
		//전체유저 팔로우 관계 매핑
		HashMap<Integer, HashMap> userMap=new HashMap<Integer, HashMap>();
		
		for (int i = 0; i < allUser.size(); i++) {
			
			logger.info(i+" 유저?"+allUser.get(i).getName());
			HashMap<Integer, Integer> individual=new HashMap<Integer, Integer>();
			
			for (int j = 0; j < allUser.size(); j++) {
				if(follow.contains(allUser.get(i).getId()+"-"+allUser.get(j).getId())){
					individual.put(allUser.get(j).getId(), 1);
				}else if(i==j){
					individual.put(allUser.get(j).getId(), 0);
				}else{
					individual.put(allUser.get(j).getId(), 0);
				}
			}
			
			userMap.put(allUser.get(i).getId(), individual);
			logger.info(allUser.get(i).getId()+""+allUser.get(i).getName()+":  "+userMap.get(allUser.get(i).getId()) );
		}
		
	}
	
	//두 유저의 유사도를 통해 추천
	public void targetCalc() throws Exception {
		
		//전체유저
		//List<String> follow = service.rank();
		//List<UserVO> allUser = service.listAll();
		
	}

}// class end