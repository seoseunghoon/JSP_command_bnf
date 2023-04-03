package com.jsp.action.collusion;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.command.SearchCriteria;
import com.jsp.service.CollusionBoardService;

public class CollusionBoardFormAction implements Action {
	
	private CollusionBoardService collusionBoardService;
	public void setCollusionBoardService(CollusionBoardService collusionBoardService) {
		this.collusionBoardService = collusionBoardService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/board/collusion/list";
		
		/*
		 * String page = request.getParameter("page"); String perPageNum =
		 * request.getParameter("perPageNum"); String searchType =
		 * request.getParameter("searchType"); String keyword =
		 * request.getParameter("keyword");
		 * 
		 * if(page==null) page="1"; if(perPageNum==null) perPageNum="10";
		 * 
		 * SearchCriteria cri = new SearchCriteria(page,perPageNum,searchType,keyword);
		 */
		SearchCriteria cri = new SearchCriteria();
		Map<String, Object> dataMap = collusionBoardService.getList(cri);
		 
		request.setAttribute("dataMap", dataMap);
		return url;
	}

}
