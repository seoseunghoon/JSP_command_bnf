package com.jsp.action.report;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.action.utils.MakeFileName;
import com.jsp.dto.ReportAttachVO;
import com.jsp.dto.ReportBoardVO;
import com.jsp.service.ReportBoardService;

public class ReportModifyFormAction implements Action {

	private ReportBoardService reportBoardService;

	public void setReportBoardService(ReportBoardService reportBoardService) {
		this.reportBoardService = reportBoardService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/board/report/modify";

		int bno = Integer.parseInt(request.getParameter("bno"));

		try {
		    ReportBoardVO reportBoard = reportBoardService.getReportBoard(bno);

			List<ReportAttachVO> renamedReportAttachList = MakeFileName.reportFileNameFromAttaches(reportBoard.getReportAttachList(),"\\$\\$");
			reportBoard.setReportAttachList(renamedReportAttachList);

			request.setAttribute("reportBoard", reportBoard);

			return url;
		} catch (Exception e) {
			// error 작성
			e.printStackTrace();
			throw e;
		}
	}

}
