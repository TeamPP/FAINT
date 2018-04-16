package com.faint.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.faint.domain.Authority;
import com.faint.domain.UsersException;

@Repository
public class AuthorityDaoImpl implements AuthorityDao {
	
	private static String namespace = "com.faint.mapper.authorityMapper";
	
	@Autowired
	private SqlSession session;
	
	public AuthorityDaoImpl() {}

	@Override
	public Authority select(Integer id) throws UsersException {
		Authority authority = null;
		System.out.println(id+"권한이란?? ");
		try {
			System.out.println(id+"권한 오류 ");
			authority = session.selectOne(namespace + ".select-authority", id);
			
		} catch (Exception e) {
			throw new UsersException(e.getMessage());
		}
		
		return authority;
	}

}
