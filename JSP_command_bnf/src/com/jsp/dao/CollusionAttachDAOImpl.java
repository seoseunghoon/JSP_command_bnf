package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.CollusionAttachVO;

public class CollusionAttachDAOImpl implements CollusionAttachDAO {

	@Override
	public List<CollusionAttachVO> selectAttachesByBno(SqlSession session, int bno) throws SQLException {
		List<CollusionAttachVO> attachList = session.selectList("CollusionAttach-Mapper.selectAttachByBno",bno);
		return attachList;
	}

	@Override
	public CollusionAttachVO selectAttachByAno(SqlSession session, int ano) throws SQLException {
		CollusionAttachVO attach = session.selectOne("CollusionAttach-Mapper.selectAttachByAno", ano);
		return attach;
	}

	@Override
	public void insertAttach(SqlSession session, CollusionAttachVO attach) throws SQLException {
		session.update("CollusionAttach-Mapper.insertAttach", attach);
	}

	@Override
	public void deleteAttach(SqlSession session, int ano) throws SQLException {
		session.update("CollusionAttach-Mapper.deleteAttach",ano);
	}

	@Override
	public void deleteAllAttach(SqlSession session, int bno) throws SQLException {
		session.update("CollusionAttach-Mapper.deleteAllAttach",bno);
	}

}
