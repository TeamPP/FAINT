package com.faint.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.faint.domain.Authority;
import com.faint.domain.UserVO;
import com.faint.domain.UsersException;
import com.faint.dto.CustomUserDetails;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserService service;

	@Override
	public CustomUserDetails loadUserByUsername(String email) 
			throws UsernameNotFoundException {
		
		
		try {
			
			//이메일 값을 통해 유저정보 가져옴 UserVO형식
			UserVO users = service.detailByEmail(email);
			
			System.out.println(users.toString()+"이건뭐게??? ");
			/* *  해당 사용자가 존재하지 않으면
			 *  이미 정의된 UsernameNotFoundException을 이용하여
			 *  예외를 생성해서 던져주면 스프링이 알아서 예외처리를 하게 된다. 
			 */
			if (users == null) {
				throw new UsernameNotFoundException("해당 사용자를 찾지 못했습니다.");
			}
				
			return new CustomUserDetails(users.getEmail(),
					users.getPassword(),
					
					true, //enabled
					true, //accountNonExpired
					true, //credentialsNonExpired
					true, //accountNonLocked
			
					this.getGrantedAuthorities(users),
					users);
			
		} catch (UsersException e) {
			System.out.println(e.getMessage());
		}		
		
		return null;
	}
	
	// 사용자에게 권한을 부여하기위해 권한 목록을 리턴하는 메소드
	private List<GrantedAuthority> getGrantedAuthorities(UserVO users) {
		
		// 최종적으로 스프링에게 전달할 리스트 (리스트 타입은 GrantedAuthority)
		List<GrantedAuthority> auths = new ArrayList<>();
		
		/*
		 * 데이터베이스에 저장되어 있던 해당 사용자의 권한을 하나씩 끄집어 내어
		 * GrantedAuthority 리스트에 추가해주는 작업
		 * 
		 * 스프링 3버전에서는 "ROLE_" 이라는 문자열을 추가 안해도 되지만
		 * 스프링 4버전 이후부터는 "ROLE_" 이라는 문자열을 권한이름 앞에 붙여줘야
		 * 정상 동작합니다.
		 */
		for (Authority item : users.getAuthorities()) {
			auths.add(new SimpleGrantedAuthority("ROLE_" + item.getName()));
		}
		
		System.out.println(users.getEmail() + " 사용자의 권한: " + auths);
		
		return auths;
	}
	
	
}

