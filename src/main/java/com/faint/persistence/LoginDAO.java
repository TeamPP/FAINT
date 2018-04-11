package com.faint.persistence;

import com.faint.dto.LoginDTO;

public interface LoginDAO {
	public LoginDTO find_by_string_id(String email);
}
