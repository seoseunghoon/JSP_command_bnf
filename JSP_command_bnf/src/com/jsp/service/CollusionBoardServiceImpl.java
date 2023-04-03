package com.jsp.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jsp.command.PageMaker;
import com.jsp.command.SearchCriteria;
import com.jsp.dao.CollusionAttachDAO;
import com.jsp.dao.CollusionBoardDAO;
import com.jsp.dto.CollusionAttachVO;
import com.jsp.dto.CollusionBoardVO;

public class CollusionBoardServiceImpl implements CollusionBoardService {
	
	private SqlSessionFactory sqlSessionFactory;
	private CollusionBoardDAO collusionBoardDAO;
	private CollusionAttachDAO collusionAttachDAO;
	
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	public void setCollusionBoardDAO(CollusionBoardDAO collusionBoardDAO) {
		this.collusionBoardDAO = collusionBoardDAO;
	}

	public void setCollusionAttachDAO(CollusionAttachDAO collusionAttachDAO) {
		this.collusionAttachDAO = collusionAttachDAO;
	}

	@Override
	public Map<String, Object> getList(SearchCriteria cri) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			List<CollusionBoardVO> boardList = collusionBoardDAO.selectCollusionBoardCriteria(session, cri);
			if(boardList != null)
				for(CollusionBoardVO board : boardList)
					addAttachList(session, board);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(collusionBoardDAO.selectCollusionBoardCriteriaTotalCount(session, cri));
			
			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("collusionList", boardList);
			dataMap.put("pageMaker", pageMaker);

			return dataMap;
			
		} finally {
			session.close();
		}
	}

	@Override
	public void regist(CollusionBoardVO board) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			int bno = collusionBoardDAO.selectSeqNextValue(session);
			board.setBno(bno);
			collusionBoardDAO.insertCollusionBoard(session, board);
			
			if(board.getCollusionAttachList()!=null)
				for(CollusionAttachVO attach : board.getCollusionAttachList()) {
					attach.setBno(bno);
					attach.setAttacher(board.getWriter());
					collusionAttachDAO.insertAttach(session, attach);
				}
			
		} finally {
			session.close();
		}
		
		
		
	}

	@Override
	public CollusionBoardVO read(int bno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			CollusionBoardVO board = collusionBoardDAO.selectCollusionBoardByBno(session, bno);
			collusionBoardDAO.increaseViewCnt(session, bno);
			
			addAttachList(session, board);
			
			return board;
		} finally {
			session.close();
		}
	}

	@Override
	public CollusionBoardVO getBoard(int bno) throws SQLException {
	SqlSession session = sqlSessionFactory.openSession();
	
	try {
		
		CollusionBoardVO board = collusionBoardDAO.selectCollusionBoardByBno(session, bno);
		
		addAttachList(session, board);
		return board;
	} finally {
		session.close();
	}
}

	@Override
	public void modify(CollusionBoardVO board) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			
			collusionBoardDAO.updateCollusionBoard(session, board);
			
		} finally {
			session.close();
		}
	}

	@Override
	public void remove(int pno) throws SQLException {
	}

	@Override
	public CollusionAttachVO getAttachByAno(int ano) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			
			CollusionAttachVO attach = collusionAttachDAO.selectAttachByAno(session, ano);
			return attach;
		} finally {
			session.close();
		}
	}

	private void addAttachList(SqlSession session, CollusionBoardVO board) throws SQLException {

		if (board == null)
			return;

		int bno = board.getBno();
		List<CollusionAttachVO> attachList = collusionAttachDAO.selectAttachesByBno(session, bno);

		board.setCollusionAttach(attachList);
	}
}
