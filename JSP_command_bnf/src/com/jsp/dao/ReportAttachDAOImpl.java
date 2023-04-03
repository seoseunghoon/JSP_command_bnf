package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.ReportAttachVO;

public class ReportAttachDAOImpl implements ReportAttachDAO {

	@Override
	public List<ReportAttachVO> selectReportAttachesByPno(SqlSession session, int pno) throws SQLException {
		List<ReportAttachVO> reportAttachList = session.selectList("ReportAttach-Mapper.selectReportAttachesByPno", pno);
		return reportAttachList;
	}

	@Override
	public ReportAttachVO selectReportAttachByAno(SqlSession session, int ano) throws SQLException {
		ReportAttachVO reportAttach = session.selectOne("ReportAttach-Mapper.selectReportAttachByAno", ano);
		return reportAttach;
	}

	@Override
	public void insertReportAttach(SqlSession session, ReportAttachVO reportAttach) throws SQLException {
		session.update("ReportAttach-Mapper.insertReportAttach", reportAttach);

	}

	@Override
	public void deleteReportAttach(SqlSession session, int ano) throws SQLException {
		session.update("ReportAttach-Mapper.deleteReportAttach", ano);
	}

	@Override
	public void deleteReportAllAttach(SqlSession session, int pno) throws SQLException {
		session.update("ReportAttach-Mapper.deleteReportAttachAllAttach", pno);
	}

}
