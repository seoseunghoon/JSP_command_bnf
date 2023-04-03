package com.jsp.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jsp.command.PageMaker;
import com.jsp.command.SearchCriteria;
import com.jsp.dao.ReportAttachDAO;
import com.jsp.dao.ReportBoardDAO;
import com.jsp.dto.ReportAttachVO;
import com.jsp.dto.ReportBoardVO;

public class ReportBoardServiceImpl implements ReportBoardService {

	private SqlSessionFactory sqlSessionFactory;
	private ReportBoardDAO reportBoardDAO;
	private ReportAttachDAO reportAttachDAO;

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	public void setReportBoardDAO(ReportBoardDAO reportBoardDAO) {
		this.reportBoardDAO = reportBoardDAO;
	}

	public void setReportAttachDAO(ReportAttachDAO reportAttachDAO) {
		this.reportAttachDAO = reportAttachDAO;
	}

	@Override
	public Map<String, Object> ReportBoardgetList(SearchCriteria cri) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			List<ReportBoardVO> reportBoardList = reportBoardDAO.selectReportBoardCriteria(session, cri);
			if (reportBoardList != null)
				for (ReportBoardVO reportBoard : reportBoardList)
					
			addReportAttachList(session, reportBoard);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(reportBoardDAO.selectReportBoardCriteriaTotalCount(session, cri));

			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("reportBoardList", reportBoardList);
			dataMap.put("pageMaker", pageMaker);

			return dataMap;
		} finally {
			session.close();
		}
	}

	@Override
	public void ReportBoardRegist(ReportBoardVO report) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			int bno = reportBoardDAO.selectSeqNextValue(session);
			report.setBno(bno);
			System.out.println(bno);
			if (report.getReportAttachList() != null)
				for (ReportAttachVO reportAttach : report.getReportAttachList()) {
					reportAttach.setPno(bno);
					reportAttach.setAttacher(report.getWriter());
					reportAttachDAO.insertReportAttach(session, reportAttach);
				}
			reportBoardDAO.insertReportBoard(session, report);

		} finally {
			session.close();
		}
	}

	@Override
	public ReportBoardVO ReportBoardRead(int bno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			ReportBoardVO reportBoard = reportBoardDAO.selectReportBoardByBno(session, bno);
			reportBoardDAO.increaseViewCnt(session, bno);

			addReportAttachList(session, reportBoard);

			return reportBoard;

		} finally {
			session.close();
		}
	}

	@Override
	public ReportBoardVO getReportBoard(int bno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			ReportBoardVO reportBoard = reportBoardDAO.selectReportBoardByBno(session, bno);

			addReportAttachList(session, reportBoard);

			return reportBoard;
		} finally {
			session.close();
		}
	}

	@Override
	public void ReportBoardModify(ReportBoardVO report) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			reportBoardDAO.updateReportBoard(session, report);

			if (report.getReportAttachList() != null)
				for (ReportAttachVO reportAttach : report.getReportAttachList()) {
					reportAttachDAO.insertReportAttach(session, reportAttach);
				}

		} finally {
			session.close();
		}
	}

	private void addReportAttachList(SqlSession session, ReportBoardVO reportBoard) throws SQLException {

		if (reportBoard == null)
			return;

		int pno = reportBoard.getBno();
		List<ReportAttachVO> reportAttachList = reportAttachDAO.selectReportAttachesByPno(session, pno);

		reportBoard.setReportAttachList(reportAttachList);
	}

	@Override
	public void ReportBoardRemove(int bno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			reportBoardDAO.deleteReportBoard(session, bno);

		} finally {
			session.close();
		}
	}

	@Override
	public ReportAttachVO getReportAttachByAno(int ano) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			ReportAttachVO reportAttach = reportAttachDAO.selectReportAttachByAno(session, ano);

			return reportAttach;
		} finally {
			session.close();
		}
	}

	@Override
	public void removeReportAttachAno(int ano) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			reportAttachDAO.deleteReportAttach(session, ano);

		} finally {
			session.close();
		}

	}

}
