package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.CitizenAttachVO;

public class CitizenAttachDAOImpl implements CitizenAttachDAO {

	@Override
	public List<CitizenAttachVO> selectCitizenAttachesByBno(SqlSession session, int bno) throws SQLException {
		
		List<CitizenAttachVO> citizenAttachList = session.selectList("CitizenAttach-Mapper.selectCitizenAttachesByBno", bno);
		
		return citizenAttachList;
		
	}

	@Override
	public CitizenAttachVO selectCitizenAttachByAno(SqlSession session, int ano) throws SQLException {
		
		CitizenAttachVO citizenAttach = session.selectOne("CitizenAttach-Mapper.selectCitizenAttachByAno", ano);
		
		return citizenAttach;
		
	}

	@Override
	public void insertCitizenAttach(SqlSession session, CitizenAttachVO citizenAttach) throws SQLException {
		
		session.update("CitizenAttach-Mapper.insertCitizenAttach", citizenAttach);
		
	}

	@Override
	public void deleteCitizenAttach(SqlSession session, int ano) throws SQLException {
		
		session.update("CitizenAttach-Mapper.deleteAttach", ano);
		
	}

	@Override
	public void deleteAllCitizenAttach(SqlSession session, int bno) throws SQLException {
		
		session.update("CitizenAttach-Mapper.deleteAllAttach", bno);
		
	}

}
