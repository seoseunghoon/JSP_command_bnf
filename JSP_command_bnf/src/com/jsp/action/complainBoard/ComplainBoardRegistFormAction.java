package com.jsp.action.complainBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;

public class ComplainBoardRegistFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = "/board/complain/regist";
		
		return url;
		
	}
	
}
