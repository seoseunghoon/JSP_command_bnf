package com.jsp.action.citizenBoard;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.command.SearchCriteria;
import com.jsp.service.CitizenBoardService;

public class CitizenBoardListAction implements Action {
	
	private CitizenBoardService citizenBoardService;
	public void setCitizenBoardService(CitizenBoardService citizenBoardService) {
		this.citizenBoardService = citizenBoardService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String url = "/board/citizen/list";
		
		
		String page = request.getParameter("page"); 
		String perPageNum = request.getParameter("perPageNum");
		String searchType =	request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		
		if (page == null) page = "1";
		if (perPageNum == null) perPageNum = "10";
		
		SearchCriteria cri = new SearchCriteria(page, perPageNum, searchType, keyword);
		System.out.println("test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		Map<String, Object> dataMap = citizenBoardService.getCitizenBoardList(cri);
		request.setAttribute("dataMap", dataMap);
		
		
		return url;
		
	}
	
}
