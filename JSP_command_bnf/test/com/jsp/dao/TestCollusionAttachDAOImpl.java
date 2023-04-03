package com.jsp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.jsp.datasource.MySqlSessionFactory;
import com.jsp.dto.CollusionAttachVO;


public class TestCollusionAttachDAOImpl {
	private MySqlSessionFactory sqlSessionFactory = new MySqlSessionFactory(); 
	private SqlSession session;
	private CollusionAttachDAO attachDAO = new CollusionAttachDAOImpl();
	
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
	public void selectTest() throws Exception{
		int bno=1;
		List<CollusionAttachVO> attachList = attachDAO.selectAttachesByBno(session, bno);
		
		
		Assert.assertEquals(1, attachList.size());
	
	}
	
	@Test
	public void insertTest() throws Exception{
		
		
	}
	
}
