package com.jsp.action.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.command.SearchCriteria;

public class MainFormAction implements Action {

	


	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/main/main";
		

		SearchCriteria cri = new SearchCriteria(1, 5, "", "");
		
		/*
		 * Map<String, Object> dataMap = praiseBoardService.PraiseBoardgetList(cri);
		 * request.setAttribute("DataMap", dataMap);
		 */
		
		
		return url;
	}

}
