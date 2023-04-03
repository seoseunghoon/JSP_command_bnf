package com.jsp.action.citizenBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.controller.FileDownloadResolver;
import com.jsp.dto.CitizenAttachVO;
import com.jsp.service.CitizenBoardService;

public class CitizenBoardGetFileAction implements Action {

	private CitizenBoardService citizenBoardService;
	
	public void setCitizenBoardService(CitizenBoardService citizenBoardService) {
		this.citizenBoardService = citizenBoardService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = null;
		
		int ano = Integer.parseInt(request.getParameter("ano"));
		
		CitizenAttachVO citizenAttach = citizenBoardService.getCitizenAttachByAno(ano);
		
		String fileName = citizenAttach.getFileName();
		String savedPath = citizenAttach.getUploadPath();
		
		FileDownloadResolver.sendFile(fileName, savedPath, request, response);
		
		return url;
		
	}
	
}
