package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.ReportBoardVO;

public interface ReportBoardDAO {

	List<ReportBoardVO> selectReportBoardCriteria(SqlSession session, SearchCriteria cri) throws SQLException;

	int selectReportBoardCriteriaTotalCount(SqlSession session, SearchCriteria cri) throws SQLException;

	ReportBoardVO selectReportBoardByBno(SqlSession session, int bno) throws SQLException;

	void insertReportBoard(SqlSession session, ReportBoardVO report) throws SQLException;

	void updateReportBoard(SqlSession session, ReportBoardVO report) throws SQLException;

	void deleteReportBoard(SqlSession session, int bno) throws SQLException;

	// pds_seq.nextval 가져오기
	int selectSeqNextValue(SqlSession session) throws SQLException;

	// viewcnt 증가
	void increaseViewCnt(SqlSession session, int bno) throws SQLException;

}
