package com.faint.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.faint.dto.CustomUserDetails;
import com.faint.dto.LoginDTO;
import com.faint.persistence.LoginDAO;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	SqlSession sqlsession;
	
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		LoginDAO dao = sqlsession.getMapper(LoginDAO.class);
		LoginDTO dto = dao.find_by_string_id(email);

		if(dto == null)
			throw new UsernameNotFoundException(email);
		
		CustomUserDetails user = new CustomUserDetails();
		user.setEmail(dto.getEmail());
		user.setNickname(dto.getNickname());
		user.setbPass(dto.getPassword());
		user.setProfilephoto(dto.getProfilephoto());
		user.setEnabled(true);
		//user의 권한 정보는 항상 ROLR_USER를 반환하도록 되어있어서 여기서는 따로 설정해주지 않아도 됨.
		//권한정보도 마찬가지로 디비에서 읽어오게끔 할 수도 있으나 이 프로젝트에서는 그럴 필요가 없어서 무조건 ROLE_USER만 사용하게끔 했음.
		
		
		return user;
	}

	
}

