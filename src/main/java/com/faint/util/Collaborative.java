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

	//생성자 - 로그인 유저에게 그냥 추천용
	public Collaborative(int loginUser){
		this.loginUser=loginUser;
	}
	
	//생성자 - 두 유저간의 유사도를 통해 추천용
	public Collaborative(int loginUser, int targetUser){
		this.loginUser=loginUser;
		this.targetUser=targetUser;
	}
	
	//전체 유저중 추천
	public void nonTargetCalc() throws Exception {
		

	}
	
	//두 유저의 유사도를 통해 추천
	public void targetCalc() throws Exception {

		
		
	}

}// class end