package com.jsp.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jsp.command.PageMaker;
import com.jsp.command.SearchCriteria;
import com.jsp.dao.ComplainAttachDAO;
import com.jsp.dao.ComplainBoardDAO;
import com.jsp.dto.ComplainAttachVO;
import com.jsp.dto.ComplainBoardVO;

public class ComplainBoardServiceImpl implements ComplainBoardService {
	
	private SqlSessionFactory sqlSessionFactory;
	private ComplainBoardDAO complainBoardDAO;
	private ComplainAttachDAO complainAttachDAO;
	
	public void setComplainAttachDAO(ComplainAttachDAO complainAttachDAO) {
		this.complainAttachDAO = complainAttachDAO;
	}
	
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	public void setComplainBoardDAO(ComplainBoardDAO complainBoardDAO) {
		this.complainBoardDAO = complainBoardDAO;
	}
	
	@Override
	public Map<String, Object> getComplainBoardList(SearchCriteria cri) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			
			List<ComplainBoardVO> complainList = complainBoardDAO.selectComplainBoardCriteria(session, cri);
			
			if (complainList != null)
				for (ComplainBoardVO complain : complainList)
					addComplainAttachList(session, complain);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(complainBoardDAO.selectComplainBoardCriteriaTotalCount(session, cri));
			
			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("complainList", complainList);
			dataMap.put("pageMaker", pageMaker);
			
			return dataMap;
			
		} finally {
			session.close();
		}
		
	}

	@Override
	public void registComplainBoard(ComplainBoardVO complainBoard) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			
			int bno = complainBoardDAO.selectSeqNextValue(session);
			complainBoard.setBno(bno);
			complainBoardDAO.insertComplainBoard(session, complainBoard);
			
			if (complainBoard.getComplainAttachList() != null)
			
				for (ComplainAttachVO complainAttach : complainBoard.getComplainAttachList()) {
					complainAttach.setBno(bno);
					complainAttach.setAttacher(complainBoard.getWriter());
					complainAttachDAO.insertComplainAttach(session, complainAttach);
				}
			
		} finally {
			session.close();
		}
		
	}

	@Override
	public ComplainBoardVO readComplainBoard(int bno) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			
			ComplainBoardVO complainBoard = complainBoardDAO.selectComplainBoardByBno(session, bno);
			complainBoardDAO.increasViewCnt(session, bno);
			
			addComplainAttachList(session, complainBoard);
			
			return complainBoard;
			
		} finally {
			session.close();
		}
		
	}

	@Override
	public ComplainBoardVO getComplainBoard(int bno) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			
			ComplainBoardVO complainBoard = complainBoardDAO.selectComplainBoardByBno(session, bno);
			
			addComplainAttachList(session, complainBoard);
			
			return complainBoard;
			
		} finally {
			session.close();
		}
		
	}

	@Override
	public void modifyComplainBoard(ComplainBoardVO complainBoard) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		
	}

	@Override
	public void removeComplainBoard(int bno) throws SQLException {
		
		
		
	}
	
	private void addComplainAttachList(SqlSession session, ComplainBoardVO complainBoard) throws SQLException {

		if (complainBoard == null)
			return;

		int bno = complainBoard.getBno();
		List<ComplainAttachVO> complainAttachList = complainAttachDAO.selectComplainAttachesByBno(session, bno);

		complainBoard.setComplainAttachList(complainAttachList);
		
	}

	@Override
	public ComplainAttachVO getComplainAttachByAno(int ano) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			
			ComplainAttachVO complainAttach = complainAttachDAO.selectComplainAttachByAno(session, ano);
			
			return complainAttach;
			
		} finally {
			session.close();
		}
		
	}

	@Override
	public void removeComplainAttachByAno(int ano) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			
			complainAttachDAO.deleteComplainAttach(session, ano);
			
		} finally {
			session.close();
		}
		
	}
	
}
