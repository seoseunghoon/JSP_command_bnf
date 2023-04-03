package com.jsp.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jsp.command.PageMaker;
import com.jsp.command.SearchCriteria;
import com.jsp.dao.CitizenAttachDAO;
import com.jsp.dto.CitizenAttachVO;
import com.jsp.dao.CitizenBoardDAO;
import com.jsp.dto.CitizenBoardVO;

public class CitizenBoardServiceImpl implements CitizenBoardService {

	private SqlSessionFactory sqlSessionFactory;
	private CitizenBoardDAO citizenBoardDAO;
	private CitizenAttachDAO citizenAttachDAO;

	public void setCitizenAttachDAO(CitizenAttachDAO citizenAttachDAO) {
		this.citizenAttachDAO = citizenAttachDAO;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	public void setCitizenBoardDAO(CitizenBoardDAO citizenBoardDAO) {
		this.citizenBoardDAO = citizenBoardDAO;
	}

	@Override
	public Map<String, Object> getCitizenBoardList(SearchCriteria cri) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			
			List<CitizenBoardVO> citizenBoardList = citizenBoardDAO.selectCitizenBoardCriteria(session, cri);
			
			if (citizenBoardList != null)
				
				for (CitizenBoardVO citizenBoard : citizenBoardList) {addCitizenAttachList(session, citizenBoard);}
			    System.out.println("test!!!!!!!!!!!!!!!!!!!!!!");
			    PageMaker pageMaker = new PageMaker();
			    pageMaker.setCri(cri);
			    pageMaker.setTotalCount(citizenBoardDAO.selectCitizenBoardCriteriaTotalCount(session, cri));

			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("citizenList", citizenBoardList);
			dataMap.put("pageMaker", pageMaker);

			return dataMap;
			
		} finally {
			session.close();
		}
		
	}

	@Override
	public void registCitizenBoard(CitizenBoardVO citizenBoard) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		
		try {

			int bno = citizenBoardDAO.selectSeqNextValue(session);
			citizenBoard.setBno(bno);
			citizenBoardDAO.insertCitizenBoardVO(session, citizenBoard);

			if (citizenBoard.getCitizenAttachList() != null)
				for (CitizenAttachVO citizenAttach : citizenBoard.getCitizenAttachList()) {
					citizenAttach.setBno(bno);
					citizenAttach.setAttacher(citizenBoard.getWriter());
					citizenAttachDAO.insertCitizenAttach(session, citizenAttach);
				}

		} finally {
			session.close();
		}

	}

	@Override
	public CitizenBoardVO readCitizenBoard(int bno) throws SQLException {

		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			CitizenBoardVO citizenBoard = citizenBoardDAO.selectCitizenBoardByBno(session, bno);
			citizenBoardDAO.increaseViewCnt(session, bno);
			addCitizenAttachList(session, citizenBoard);
			return citizenBoard;
		} finally {
			session.close();
		}
		
	}

	@Override
	public CitizenBoardVO getCitizenBoard(int bno) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			CitizenBoardVO citizenBoard = citizenBoardDAO.selectCitizenBoardByBno(session, bno);
			addCitizenAttachList(session, citizenBoard);
			return citizenBoard;
		} finally {
			session.close();
		}
		
	}

	@Override
	public void modifyCitizenBoard(CitizenBoardVO citizenBoard) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			citizenBoardDAO.updateCitizenBoardVO(session, citizenBoard);
		} finally {
			session.close();
		}
		
	}

	@Override
	public void removeCitizenBoard(int bno) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			citizenBoardDAO.deleteCitizenBoardVO(session, bno);
		} finally {
			session.close();
		}
		
	}

	private void addCitizenAttachList(SqlSession session, CitizenBoardVO citizenBoard) throws SQLException {

		if (citizenBoard == null)
			return;

		int bno = citizenBoard.getBno();
		List<CitizenAttachVO> citizenAttachList = citizenAttachDAO.selectCitizenAttachesByBno(session, bno);

		citizenBoard.setCitizenAttachList(citizenAttachList);
		
	}

	@Override
	public CitizenAttachVO getCitizenAttachByAno(int ano) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			CitizenAttachVO citizenAttach = citizenAttachDAO.selectCitizenAttachByAno(session, ano);
			return citizenAttach;
		} finally {
			session.close();
		}
		
	}
	
	public void removeCitizenAttachByAno(int ano) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			citizenAttachDAO.deleteAllCitizenAttach(session, ano);
		} finally {
			session.close();
		}
		
	}
	
}
