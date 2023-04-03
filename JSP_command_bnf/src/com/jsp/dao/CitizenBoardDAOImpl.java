package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.CitizenBoardVO;

public class CitizenBoardDAOImpl implements CitizenBoardDAO {

	@Override
	public List<CitizenBoardVO> selectCitizenBoardCriteria(SqlSession session, SearchCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<CitizenBoardVO> citizenBoardList = session.selectList("CitizenBoard-Mapper.selectSearchCitizenBoardList", cri, rowBounds);	
			
		return citizenBoardList;
		
	}

	@Override
	public int selectCitizenBoardCriteriaTotalCount(SqlSession session, SearchCriteria cri) throws SQLException {
		
		int count = session.selectOne("CitizenBoard-Mapper.selectSearchCitizenBoardListCount", cri);
		
		return count;
		
	}

	@Override
	public CitizenBoardVO selectCitizenBoardByBno(SqlSession session, int bno) throws SQLException {
		
		CitizenBoardVO citizenBoard = session.selectOne("CitizenBoard-Mapper.selectCitizenBoardByBno", bno);
		
		return citizenBoard;
		
	}

	@Override
	public void insertCitizenBoardVO(SqlSession session, CitizenBoardVO citizenBoard) throws SQLException {
		
		session.update("CitizenBoard-Mapper.insertCitizenBoard", citizenBoard);
		
	}

	@Override
	public void updateCitizenBoardVO(SqlSession session, CitizenBoardVO citizenBoard) throws SQLException {
		
		session.update("CitizenBoard-Mapper.updateCitizenBoard", citizenBoard);
		
	}

	@Override
	public void deleteCitizenBoardVO(SqlSession session, int bno) throws SQLException {
		
		session.update("CitizenBoard-Mapper.deleteCitizenBoard", bno);
		
	}

	@Override
	public int selectSeqNextValue(SqlSession session) throws SQLException {
		
		int bno = session.selectOne("CitizenBoard-Mapper.selectCitizenBoardSeqNext");
		
		return bno;
		
	}

	@Override
	public void increaseViewCnt(SqlSession session, int bno) throws SQLException {
		
		session.update("CitizenBoard-Mapper.increaseViewCnt", bno);
		
	}
	
}
