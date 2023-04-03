package com.jsp.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.MemberVO;
import com.jsp.service.MemberService;

public class MemberModifyAction implements Action{

	
	final private int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	final private int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	final private int MAX_REQUEST_SIZE = 1024 * 1024 * 200; // 200MB
	
	private MemberService service;
	public void setMemberService(MemberService service) {
		this.service = service;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url="/member/modify_success";
		
		/*
		 * MultipartHttpServletRequestParser multi = null; try { multi = new
		 * MultipartHttpServletRequestParser(request, MEMORY_THRESHOLD, MAX_FILE_SIZE,
		 * MAX_REQUEST_SIZE); }catch(NotMultipartFormDataException e) {
		 * response.sendError(response.SC_BAD_REQUEST); return null; }
		 * 
		 * 
		 * MemberVO member = new MemberVO(); member.setId(multi.getParameter("id"));
		 * member.setPwd(multi.getParameter("pwd"));
		 * member.setName(multi.getParameter("name"));
		 * member.setEmail(multi.getParameter("email"));
		 * 
		 * member.setAuthority(multi.getParameter("authority"));
		 * member.setPhone(multi.getParameter("phone"));
		 * 
		 * 
		 * //파일 변경 유무 확인이 필요하다. inputFile을 확인한다. FileItem picture =
		 * multi.getFileItem("picture"); //input태그가 있기때문에 item이 없을리는없다/ File로 경로만들어서
		 * 있나없나 확인하는거랑 다르다. if(picture.getSize()>0) { String uploadPath =
		 * GetUploadPath.getUploadPath("member.picture.upload");
		 * 
		 * String oldPicture = multi.getParameter("oldPicture"); File deleteFile = new
		 * File(uploadPath,oldPicture); if(deleteFile.exists()) { deleteFile.delete(); }
		 * 
		 * //최근이미지 저장 List<File> fileList =
		 * FileUploadResolver.fileUpload(multi.getFileItems("picture"), uploadPath);
		 * 
		 * File saveFile = fileList.get(0);
		 * 
		 * member.setPicture(saveFile.getName()); }else {
		 * 
		 * member.setPicture(multi.getParameter("oldPicture")); }
		 */
		 String id = request.getParameter("id");
		 MemberVO member = service.getMember(id);
		 
		 member.setPwd(request.getParameter("pwd"));
		 member.setName(request.getParameter("name"));
		 member.setEmail(request.getParameter("email"));
			
		
			
		try {
			service.modifyMember(member);
			request.setAttribute("member", service.getMember(member.getId()));
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return url;
	}

}
