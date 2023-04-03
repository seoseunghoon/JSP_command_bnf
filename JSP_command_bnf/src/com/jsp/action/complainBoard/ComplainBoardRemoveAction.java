package com.jsp.action.complainBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.service.ComplainBoardService;

public class ComplainBoardRemoveAction implements Action {
	
	private ComplainBoardService complainBoardService;
	
	public void setComplainBoardService(ComplainBoardService complainBoardService) {
		this.complainBoardService = complainBoardService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = "/board/remove_success";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		try {
			
			complainBoardService.removeComplainBoard(bno);
			
			return url;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
