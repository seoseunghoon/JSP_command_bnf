package com.jsp.action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.MemberVO;
import com.jsp.service.MemberService;

public class LoginRegistAction implements Action {
	
	private MemberService service;
	public void setMemberService(MemberService service) { 
		this.service = service;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url ="redirect:/login/loginForm.do";
		String emailset="";
		String mobile="";
		
		String mobile1 = request.getParameter("mobile1");
		String mobile2 = request.getParameter("mobile2");
		String mobile3 = request.getParameter("mobile3");
		if(!mobile2.equals("") && !mobile3.equals("")) {
			mobile = mobile1+"-"+mobile2+"-"+mobile3;
		}else {
			mobile="";
		}
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		if(!email1.equals("") && !email2.equals("")) {
		emailset = email1+"@"+email2;
		}
		
		MemberVO member = new MemberVO();
		member.setId(request.getParameter("id"));
		member.setPwd(request.getParameter("pwd"));
		member.setName(request.getParameter("name"));
		member.setPhone(mobile);
		member.setAddress(request.getParameter("address"));
		member.setEmail(emailset);
		member.setAuthority("일반회원");
		
		member.setDepart("");
		member.setEnabled(0);
		member.setPicture("");
		member.setRegister("");
		
		try {
			service.registMember(member);			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
		return url;
	}

}
