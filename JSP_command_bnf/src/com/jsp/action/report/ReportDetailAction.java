package com.jsp.action.report;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.action.utils.MakeFileName;
import com.jsp.dto.ReportAttachVO;
import com.jsp.dto.ReportBoardVO;
import com.jsp.service.ReportBoardService;

public class ReportDetailAction implements Action {

	private ReportBoardService reportBoardService;

	public void setReportBoardService(ReportBoardService reportBoardService) {
		this.reportBoardService = reportBoardService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String url = "/board/report/detail";

		int bno = Integer.parseInt(request.getParameter("bno"));

		String from = request.getParameter("from");

		try {
			ReportBoardVO reportBoard = null;
			if (from != null && from.equals("list")) {
				reportBoard = reportBoardService.ReportBoardRead(bno);

				url = "redirect:/report/detail.do?bno="+bno;
			} else {
				reportBoard = reportBoardService.getReportBoard(bno);
				System.out.println(reportBoard.getTitle());
			}

			List<ReportAttachVO> renamedAttachList = MakeFileName.reportFileNameFromAttaches(reportBoard.getReportAttachList(), "\\$\\$");
			if(renamedAttachList!=null) {
			reportBoard.setReportAttachList(renamedAttachList);
			}
			request.setAttribute("reportBoard", reportBoard);

			return url;

		} catch (Exception e) {
			e.printStackTrace();
			url = null;
			throw e;
		}

	}

}
