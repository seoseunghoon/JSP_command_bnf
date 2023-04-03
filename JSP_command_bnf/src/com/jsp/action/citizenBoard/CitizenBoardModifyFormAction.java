package com.jsp.action.citizenBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.action.utils.MakeFileName;
import com.jsp.dto.CitizenAttachVO;
import com.jsp.dto.CitizenBoardVO;
import com.jsp.service.CitizenBoardService;

public class CitizenBoardModifyFormAction implements Action {
	
	public CitizenBoardService citizenBoardService;
	
	public void setCitizenBoardService(CitizenBoardService citizenBoardService) {
		this.citizenBoardService = citizenBoardService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = "/board/citizen/modify";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		try {
			
			CitizenBoardVO citizenBoard = citizenBoardService.getCitizenBoard(bno);
			
			List<CitizenAttachVO> renamedAttachList = MakeFileName.parseFileNameFromCitizenAttaches(citizenBoard.getCitizenAttachList(), "\\$\\$");
			citizenBoard.setCitizenAttachList(renamedAttachList);
			
			request.setAttribute("citizenBoard", citizenBoard);
			
			return url;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
