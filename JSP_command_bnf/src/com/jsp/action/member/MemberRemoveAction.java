package com.jsp.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.service.MemberService;

public class MemberRemoveAction implements Action{

	private MemberService service;
	public void setMemberService(MemberService service) {
		this.service = service;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url="/member/remove";
		
		String id = request.getParameter("id");
		
		try {
			/*
			 * MemberVO member = service.getMember(id); String picture =
			 * member.getPicture(); String savedPath =
			 * GetUploadPath.getUploadPath("member.picture.upload");
			 * 
			 * File deleteFile = new File(savedPath,picture); if(deleteFile.exists()) {
			 * deleteFile.delete(); } request.setAttribute("member", member);
			 */
			
			service.removeMember(id);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return url;
	}

}
