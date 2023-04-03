package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.CollusionBoardVO;

public class CollusionBoardDAOImpl implements CollusionBoardDAO {

	@Override
	public List<CollusionBoardVO> selectCollusionBoardCriteria(SqlSession session, SearchCriteria cri)
			throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<CollusionBoardVO> boardList= session.selectList("CollusionBoard-Mapper.selectSearchCollusionBoardList", cri, rowBounds);
		return boardList;
	}

	@Override
	public int selectCollusionBoardCriteriaTotalCount(SqlSession session, SearchCriteria cri) throws SQLException {
		int count=session.selectOne("CollusionBoard-Mapper.selectSearchCollusionBoardListCount",cri);
		return count;
	}

	@Override
	public CollusionBoardVO selectCollusionBoardByBno(SqlSession session, int bno) throws SQLException {
		CollusionBoardVO board = session.selectOne("CollusionBoard-Mapper.selectCollusionBoardByBno", bno);
		return board;
	}

	@Override
	public void insertCollusionBoard(SqlSession session, CollusionBoardVO board) throws SQLException {
		session.update("CollusionBoard-Mapper.insertCollusionBoard", board);
	}

	@Override
	public void updateCollusionBoard(SqlSession session, CollusionBoardVO board) throws SQLException {
		session.update("CollusionBoard-Mapper.updateCollusionBoard", board);
	}

	@Override
	public void deleteCollusionBoard(SqlSession session, int bno) throws SQLException {
		session.update("CollusionBoard-Mapper.deleteCollusionBoard", bno);
	}

	@Override
	public int selectSeqNextValue(SqlSession session) throws SQLException {
		int count = session.selectOne("CollusionBoard-Mapper.selectCollusionBoardSeqNext");
		return count;
	}

	@Override
	public void increaseViewCnt(SqlSession session, int bno) throws SQLException {
		session.update("CollusionBoard-Mapper.increaseViewCnt", bno);
	}

}
