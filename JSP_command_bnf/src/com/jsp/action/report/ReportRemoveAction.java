package com.jsp.action.report;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.service.ReportBoardService;

public class ReportRemoveAction implements Action {

	private ReportBoardService reportBoardService;

	public void setReportBoardService(ReportBoardService reportBoardService) {
		this.reportBoardService = reportBoardService;
	}	

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String url = "/board/report/remove";

		int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println(bno);

		try {
			reportBoardService.ReportBoardRemove(bno);
			return url;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return url;
	}

}
