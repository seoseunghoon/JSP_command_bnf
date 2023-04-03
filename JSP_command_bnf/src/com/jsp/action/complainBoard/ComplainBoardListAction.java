package com.jsp.action.complainBoard;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.command.SearchCriteria;
import com.jsp.service.ComplainBoardService;

public class ComplainBoardListAction implements Action {
	
	private ComplainBoardService complainBoardService;
	public void setComplainBoardSevice(ComplainBoardService complainBoardService) {
		this.complainBoardService = complainBoardService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = "/board/complain/list";
		
		String page = request.getParameter("page");
		String perPageNum = request.getParameter("perPageNum");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		
		if (page == null) page = "1";
		if (perPageNum == null) perPageNum = "10";
		
		SearchCriteria cri = new SearchCriteria(page, perPageNum, searchType, keyword);
		
		Map<String, Object> dataMap = complainBoardService.getComplainBoardList(cri);
		
		request.setAttribute("dataMap", dataMap);
		
		return url;
		
	}

}
