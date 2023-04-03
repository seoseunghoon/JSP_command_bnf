package com.jsp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.jsp.command.SearchCriteria;
import com.jsp.datasource.MySqlSessionFactory;
import com.jsp.dto.CollusionBoardVO;

public class TestCollusionBoardDAOImpl{
	private MySqlSessionFactory sqlSessionFactory = new MySqlSessionFactory(); 
	private CollusionBoardDAO collusionBoardDAO = new CollusionBoardDAOImpl();
	private SqlSession session;
	
	@Before
	public void init() {
		session = sqlSessionFactory.openSession(false);
		session.commit();
	}
	
	@After
	public void destroy() {
		if(session!=null) {
			session.rollback();
			session.close();
		}	
	}
	
	@Test
	public void testList()throws Exception{
		
		SearchCriteria cri = new SearchCriteria(1,100,"p","7");
		
		List<CollusionBoardVO> coList = collusionBoardDAO.selectCollusionBoardCriteria(session, cri);
		
		
		
		Assert.assertEquals(1, coList.size());
		
	}
	
	@Test
	public void testSelect() throws Exception{
		
		int bno = 1;
		CollusionBoardVO board = collusionBoardDAO.selectCollusionBoardByBno(session, bno);
		
		Assert.assertEquals(bno, board.getBno());
	}
	
	@Test
	public void testInsert() throws Exception{
		CollusionBoardVO board = new CollusionBoardVO();
		board.setBno(2);
		board.setTitle("Test");
		board.setContent("TestContent");
		board.setOpenner(1);
		board.setWriter("kiki");
		
		int bno = 2;
		collusionBoardDAO.insertCollusionBoard(session, board);
		
		CollusionBoardVO target = collusionBoardDAO.selectCollusionBoardByBno(session, bno);
		
		
		
		
	}
	

}
