package com.jsp.action.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.controller.FileDownloadResolver;
import com.jsp.dto.MarketAttachVO;
import com.jsp.service.MarketBoardService;

public class MarketGetFileAction implements Action{

	MarketBoardService marketBoardService;
	
	
	
	
	public void setMarketBoardService(MarketBoardService marketBoardService) {
		this.marketBoardService = marketBoardService;
	}




	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = null;
		
		
		
		int ano = Integer.parseInt(request.getParameter("ano"));
		MarketAttachVO attach = marketBoardService.getAttach(ano);
		String fileName = attach.getFileName();
		String savedPath =attach.getUploadPath();
		
		//파일이름과 경로는 주는 attach에서 받아오는게 더 정확하다.
		/*
		 * String fileName = request.getParameter("fileName"); String savedPath =
		 * GetUploadPath.getUploadPath("board.upload");
		 */
		FileDownloadResolver.sendFile(fileName, savedPath,request,response);
		
		
		
		
		return url;
	}

}
