package com.faint.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.faint.domain.Answer;

public class PaintDAOImpl  implements PaintDAO {

	
	@Inject
	private SqlSession session;

	private static String namespace = "com.faint.paintMapper";
	@Override
	public Answer getAnswer() {
		return 	session.selectOne(namespace + ".getAnswer");
	}

	@Override
	public void insertAnswer(Answer answer) {
		session.update(namespace + ".insertAnswer",answer);
	}

	@Override
	public void deleteAnswer() {
		session.update(namespace + ".deleteAnswer");
	}

}
