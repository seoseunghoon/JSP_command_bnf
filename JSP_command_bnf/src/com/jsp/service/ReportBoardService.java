package com.jsp.service;

import java.sql.SQLException;
import java.util.Map;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.ReportAttachVO;
import com.jsp.dto.ReportBoardVO;

public interface ReportBoardService {

	// 리스트조회
	Map<String, Object> ReportBoardgetList(SearchCriteria cri) throws SQLException;

	// 글작성
	void ReportBoardRegist(ReportBoardVO report) throws SQLException;

	// 글읽기(조회수증가)
	ReportBoardVO ReportBoardRead(int bno) throws SQLException;

	// 글조회
	ReportBoardVO getReportBoard(int bno) throws SQLException;

	// 글수정
	void ReportBoardModify(ReportBoardVO report) throws SQLException;

	// 글삭제
	void ReportBoardRemove(int bno) throws SQLException;

	// 첨부파일 조회
	ReportAttachVO getReportAttachByAno(int ano) throws SQLException;

	// 파일 정보 삭제
	void removeReportAttachAno(int ano) throws SQLException;
}
