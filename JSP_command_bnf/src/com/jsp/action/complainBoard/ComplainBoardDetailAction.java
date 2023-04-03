package com.jsp.action.complainBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.ComplainBoardVO;
import com.jsp.service.ComplainBoardService;

public class ComplainBoardDetailAction implements Action {
	
	private ComplainBoardService complainBoardService;
	public void setComplainBoardService(ComplainBoardService complainBoardService) {
		this.complainBoardService = complainBoardService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = "/board/complain/detail";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String from = request.getParameter("from");
		
		try {
			
			ComplainBoardVO complainBoard = null;
			
			if (from != null && from.equals("list")) {
				complainBoard = complainBoardService.readComplainBoard(bno);
				url = "redirect:/complain/detail.do?bno=" + bno;
			} else {
				complainBoard = complainBoardService.getComplainBoard(bno);
			}
			
			request.setAttribute("complainBoard", complainBoard);
			
			return url;
			
		} catch (Exception e) {
			e.printStackTrace();
			url = null;
			throw e;
		}
		
	}
	
}
