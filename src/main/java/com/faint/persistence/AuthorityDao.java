package com.faint.persistence;

import com.faint.domain.Authority;
import com.faint.domain.UsersException;

public interface AuthorityDao {
	public Authority select(Integer id) throws UsersException;
}
