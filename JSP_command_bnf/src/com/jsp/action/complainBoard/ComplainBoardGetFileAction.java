package com.jsp.action.complainBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.controller.FileDownloadResolver;
import com.jsp.dto.ComplainAttachVO;
import com.jsp.service.ComplainBoardService;

public class ComplainBoardGetFileAction implements Action {
	
	private ComplainBoardService complainBoardService;
	
	public void setComplainBoardService(ComplainBoardService complainBoardService) {
		this.complainBoardService = complainBoardService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = null;
		
		int ano = Integer.parseInt(request.getParameter("ano"));
		
		ComplainAttachVO complainAttach = complainBoardService.getComplainAttachByAno(ano);
		
		String fileName = complainAttach.getFileName();
		String savedPath = complainAttach.getUploadPath();
		
		FileDownloadResolver.sendFile(fileName, savedPath, request, response);
		
		return url;
		
	}

}
