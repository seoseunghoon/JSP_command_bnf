package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.ComplainBoardVO;

public class ComplainBoardDAOImpl implements ComplainBoardDAO {

	@Override
	public List<ComplainBoardVO> selectComplainBoardCriteria(SqlSession session, SearchCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<ComplainBoardVO> complainList = session.selectList("ComplainBoard-Mapper.selectSearchComplainBoardList", cri, rowBounds);
		
		return complainList;
		
	}

	@Override
	public int selectComplainBoardCriteriaTotalCount(SqlSession session, SearchCriteria cri) throws SQLException {
		
		int count = session.selectOne("ComplainBoard-Mapper.selectSearchComplainBoardListCount", cri);
		
		return count;
		
	}

	@Override
	public ComplainBoardVO selectComplainBoardByBno(SqlSession session, int bno) throws SQLException {
		
		ComplainBoardVO complainBoard = session.selectOne("ComplainBoard-Mapper.selectComplainBoardByBno", bno);
		
		return complainBoard;
		
	}

	@Override
	public void insertComplainBoard(SqlSession session, ComplainBoardVO complainBoard) throws SQLException {
		
		session.update("ComplainBoard-Mapper.insertComplainBoard", complainBoard);
		
	}

	@Override
	public void updateComplainBoard(SqlSession session, ComplainBoardVO complainBoard) throws SQLException {
		
		session.update("ComplainBoard-Mapper.updateComplainBoard", complainBoard);
		
	}

	@Override
	public void deleteComplainBoard(SqlSession session, int bno) throws SQLException {
		
		session.update("ComplainBoard-Mapper.deleteComplainBoard", bno);
		
	}

	@Override
	public int selectSeqNextValue(SqlSession session) throws SQLException {
		
		int bno = session.selectOne("ComplainBoard-Mapper.selectComplainBoardSeqNext");
		
		return 0;
		
	}

	@Override
	public void increasViewCnt(SqlSession session, int bno) throws SQLException {
		
		session.update("ComplainBoard-Mapper.increaseViewCnt", bno);
		
	}

}
