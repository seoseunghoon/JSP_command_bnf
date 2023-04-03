package com.jsp.action.report;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.command.SearchCriteria;
import com.jsp.service.ReportBoardService;

public class ReportListAction implements Action {

	private ReportBoardService reportBoardService;

	public void setReportBoardService(ReportBoardService reportBoardService) {
		this.reportBoardService = reportBoardService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/board/report/list";

		String page = request.getParameter("page");
		String perPageNum = request.getParameter("perPageNum");

		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");

		if (page == null)
			page = "1";
		if (perPageNum == null)
			perPageNum = "10";
		SearchCriteria cri = new SearchCriteria(page, perPageNum, searchType, keyword);
		Map<String, Object> dataMap = reportBoardService.ReportBoardgetList(cri);
		request.setAttribute("dataMap", dataMap);

		return url;
	}

}
