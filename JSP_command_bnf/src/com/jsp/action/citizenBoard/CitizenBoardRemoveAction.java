package com.jsp.action.citizenBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.service.CitizenBoardService;

public class CitizenBoardRemoveAction implements Action {
	
	private CitizenBoardService citizenBoardService;
	
	public void setCitizenBoardService(CitizenBoardService citizenBoardService) {
		this.citizenBoardService = citizenBoardService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = "/board/remove_success";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		try {
			
			citizenBoardService.removeCitizenBoard(bno);
			
			return url;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
