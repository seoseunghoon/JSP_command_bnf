package com.jsp.action.citizenBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.CitizenBoardVO;
import com.jsp.service.CitizenBoardService;

public class CitizenBoardDetailAction implements Action {
	
	private CitizenBoardService citizenBoardService;
	public void setCitizenBoardService(CitizenBoardService citizenBoardService) {
		this.citizenBoardService = citizenBoardService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = "/board/citizen/detail";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String from = request.getParameter("from");
		
		try {
			
			CitizenBoardVO citizenBoard = null;
			
			if (from != null && from.equals("list")) {
				citizenBoard = citizenBoardService.readCitizenBoard(bno);
				url = "redirect:/citizen/detail.do?bno=" + bno;
			} else {
				citizenBoard = citizenBoardService.getCitizenBoard(bno);
			}
			
			request.setAttribute("citizenBoard", citizenBoard);
			
			return url;
			
		} catch (Exception e) {
			e.printStackTrace();
			url = null;
			throw e;
		}
		
	}
	
}
