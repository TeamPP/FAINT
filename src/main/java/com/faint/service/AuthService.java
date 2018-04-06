package com.faint.service;

import org.springframework.security.core.userdetails.UserDetails;

public interface AuthService {
	
	public UserDetails loadUserByUsername(String username) throws Exception;
}
