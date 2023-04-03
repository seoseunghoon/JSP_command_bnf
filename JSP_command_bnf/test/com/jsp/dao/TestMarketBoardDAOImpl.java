package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;

import com.jsp.command.SearchCriteria;
import com.jsp.datasource.MySqlSessionFactory;
import com.jsp.dto.MarketBoardVO;

public class TestMarketBoardDAOImpl {

	
	
	MarketBoardDAO marketBoardDAO = new MarketBoardDAOImpl();
	SqlSessionFactory fac = new MySqlSessionFactory();
	
	
	@Before
	public void init() {
		
	}
	
	@Test
	public void insertVO() {
			for(int i = 12 ; i<20 ; i++) {
			SqlSession session = fac.openSession();
			MarketBoardVO board = new MarketBoardVO();
			board.setBno(i);
			board.setWriter("test");
			board.setTitle("title");
			board.setContent("content");
			SearchCriteria cri = new SearchCriteria();
			cri.setPage(1);
			cri.setPerPageNum(10);
			
			try {
				marketBoardDAO.insertBoard(session, board);
				List<MarketBoardVO> boardList = marketBoardDAO.selectBoardCriteria(session, cri);
				System.out.println(boardList);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				session.close();
			}
		
			}
	}
	
	
	
	public void getListTest() {
		SqlSession session = fac.openSession();
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		try {
			List<MarketBoardVO> boardList = marketBoardDAO.selectBoardCriteria(session, cri);
			System.out.println(boardList);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	
	
	
}
