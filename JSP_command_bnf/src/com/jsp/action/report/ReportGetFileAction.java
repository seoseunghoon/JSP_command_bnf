package com.jsp.action.report;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.controller.FileDownloadResolver;
import com.jsp.dto.ReportAttachVO;
import com.jsp.service.ReportBoardService;

public class ReportGetFileAction implements Action {

	private ReportBoardService reportBoardService;

	public void setReportBoardService(ReportBoardService reportBoardService) {
		this.reportBoardService = reportBoardService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String url = null;

		int ano = Integer.parseInt(request.getParameter("ano"));

		ReportAttachVO reportAttach = reportBoardService.getReportAttachByAno(ano);

		String fileName = reportAttach.getFileName();
		String savedPath = reportAttach.getUploadPath();

		FileDownloadResolver.sendFile(fileName, savedPath, request, response);

		return url;
	}

}
