package com.jsp.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.MarketAttachVO;
import com.jsp.dto.MarketBoardVO;

public interface MarketBoardService {
	
	
	
	
	
	Map<String, Object> getList(SearchCriteria cri) throws Exception;
	
	
	//리스트 형식이아니라. 맵형식을 만들어서 반환해준다.
	//List<MarketBoardVO> getList()throws SQLException;
	
	void regist(MarketBoardVO board) throws SQLException;
	
	void modify(MarketBoardVO board)throws SQLException;
	
	//read 읽을때 조회수 올리는경우, 서버에서 pds가 필요해서 가져오는경우.
	MarketBoardVO read(int bno) throws SQLException;
	MarketBoardVO getBoard(int bno) throws SQLException;
	
	
	
	void remove(int bno)throws SQLException;
	
	//첨부파일
	void registAttach(MarketAttachVO attach) throws SQLException;
	List<MarketAttachVO> getAttachList(int bno) throws SQLException;
	MarketAttachVO getAttach(int ano) throws SQLException;
	
	
	//댓글
	
	
}
