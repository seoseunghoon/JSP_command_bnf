package com.jsp.service;

import java.sql.SQLException;
import java.util.Map;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.EventBoardVO;

public interface EventBoardService {

	// 리스트조회
	Map<String, Object> getList(SearchCriteria cri) throws SQLException;

	// 글작성
	void regist(EventBoardVO eventBoard) throws SQLException;

	// 글읽기(조회수증가)
	EventBoardVO read(int bno) throws SQLException;

	// 글조회
	EventBoardVO getEventBoard(int bno) throws SQLException;

	// 글수정
	void modify(EventBoardVO eventBoard) throws SQLException;

	// 글삭제
	void remove(int bno) throws SQLException;
	
	
}







