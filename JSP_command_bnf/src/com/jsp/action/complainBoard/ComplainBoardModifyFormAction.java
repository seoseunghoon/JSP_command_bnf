package com.jsp.action.complainBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.action.utils.MakeFileName;
import com.jsp.dto.ComplainAttachVO;
import com.jsp.dto.ComplainBoardVO;
import com.jsp.service.ComplainBoardService;

public class ComplainBoardModifyFormAction implements Action {
	
	public ComplainBoardService complainBoardService;
	
	public void setComplainBoardService(ComplainBoardService complainBoardService) {
		this.complainBoardService = complainBoardService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = "/board/complain/modify";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		try {
			
			ComplainBoardVO complainBoard = complainBoardService.getComplainBoard(bno);
			
			List<ComplainAttachVO> renamedAttachList = MakeFileName.parseFileNameFromComplainAttaches(complainBoard.getComplainAttachList(), "\\$\\$");
			complainBoard.setComplainAttachList(renamedAttachList);
			
			request.setAttribute("complainBoard", complainBoard);
			
			return url;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
