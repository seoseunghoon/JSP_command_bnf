package com.jsp.action.manage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.service.MemberService;

public class ManageMemberAuthorityAction implements Action{

	MemberService memberService;
	
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}


	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = null;
		
		String authority = request.getParameter("authority");
		
		
		memberService.updateAuthority("",authority);
		
		
		
		return url;
	}

}
