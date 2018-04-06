package com.faint.service;

import java.util.ArrayList;
import java.util.Collection;

import javax.inject.Inject;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.faint.domain.UserVO;
import com.faint.dto.RelationDTO;

public class AuthServiceImpl implements AuthService{
	
	@Inject
	UserService service;
	
	public UserDetails loadUserByUsername(String username) throws Exception{
		
		RelationDTO dto=new RelationDTO();
		dto.setNickname(username);
		dto.setLoginid(1);
		
		UserVO userVO = service.read(service.userRead(dto).getId());

		if(userVO==null){
			throw new UsernameNotFoundException("No user found with username" + userVO.getName());
		}
	
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
	
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
	
		UserDetails user = new User(username, userVO.getPassword(), roles);
	
		return user;
	}
	
}
