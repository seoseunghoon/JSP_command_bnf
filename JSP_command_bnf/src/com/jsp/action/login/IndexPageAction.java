package com.jsp.action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;

public class IndexPageAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = request.getParameter("retUrl");
		
		if(url == null||url == "") {
			url = "/main/main";
		}
		return url;
	}

}
