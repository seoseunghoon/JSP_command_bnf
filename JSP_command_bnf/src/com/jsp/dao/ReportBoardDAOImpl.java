package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.ReportBoardVO;

public class ReportBoardDAOImpl implements ReportBoardDAO {

	@Override
	public List<ReportBoardVO> selectReportBoardCriteria(SqlSession session, SearchCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<ReportBoardVO> reportList = session.selectList("ReportBoard-Mapper.selectSearchReportBoardList", cri,
				rowBounds);

		return reportList;

	}

	@Override
	public int selectReportBoardCriteriaTotalCount(SqlSession session, SearchCriteria cri) throws SQLException {
		int count = session.selectOne("ReportBoard-Mapper.selectSearchReportBoardListCount", cri);
		return count;
	}

	@Override
	public ReportBoardVO selectReportBoardByBno(SqlSession session, int bno) throws SQLException {
		ReportBoardVO report = session.selectOne("ReportBoard-Mapper.selectReportBoardByBno", bno);
		return report;
	}

	@Override
	public void insertReportBoard(SqlSession session, ReportBoardVO report) throws SQLException {
		session.update("ReportBoard-Mapper.insertReportBoard", report);
	}

	@Override
	public void updateReportBoard(SqlSession session, ReportBoardVO report) throws SQLException {
		session.update("ReportBoard-Mapper.updateReport", report);
	}

	@Override
	public void deleteReportBoard(SqlSession session, int bno) throws SQLException {
		session.update("ReportBoard-Mapper.deleteReportBoard", bno);

	}

	@Override
	public int selectSeqNextValue(SqlSession session) throws SQLException {
		int bno = session.selectOne("ReportBoard-Mapper.selectReportBoardSeqNext");
		return bno;
	}

	@Override
	public void increaseViewCnt(SqlSession session, int bno) throws SQLException {
		session.update("ReportBoard-Mapper.increaseViewCnt", bno);
	}

}
