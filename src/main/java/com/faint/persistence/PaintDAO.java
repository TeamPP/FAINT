package com.faint.persistence;

import com.faint.domain.Answer;

public interface PaintDAO {
	
	public Answer getAnswer();
	
	public void insertAnswer(Answer answer);
	public void deleteAnswer();
	
}