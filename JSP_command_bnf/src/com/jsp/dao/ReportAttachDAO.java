package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.ReportAttachVO;

public interface ReportAttachDAO {

	public List<ReportAttachVO> selectReportAttachesByPno(SqlSession session, int pno) throws SQLException;

	public ReportAttachVO selectReportAttachByAno(SqlSession session, int ano) throws SQLException;

	public void insertReportAttach(SqlSession session, ReportAttachVO reportAttach) throws SQLException;

	public void deleteReportAttach(SqlSession session, int ano) throws SQLException;

	public void deleteReportAllAttach(SqlSession session, int pno) throws SQLException;
}
