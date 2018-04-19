package com.faint.persistence;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Inject
	private SqlSession session;

	private static String namespace = "com.faint.mapper.messageMapper";

	//=================알림 관련=================
	
	
	//=================메신저 관련=================
	
}
