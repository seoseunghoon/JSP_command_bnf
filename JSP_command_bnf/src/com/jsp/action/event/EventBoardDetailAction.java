package com.jsp.action.event;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.EventBoardVO;
import com.jsp.service.EventBoardService;

public class EventBoardDetailAction implements Action{

	private EventBoardService eventBoardService;
	public void setEventService(EventBoardService eventBoardService) {
		this.eventBoardService = eventBoardService;
	}
	
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url="/board/eventBoard/detail";

		int bno = Integer.parseInt(request.getParameter("bno"));
		String from = request.getParameter("from");
		
		try {
			EventBoardVO eventBoard = null;
			if(from!=null && from.equals("list")) {
				eventBoard = eventBoardService.read(bno);
				
				url="redirect:/event/detail.do?bno="+bno;
			}else {				
				eventBoard = eventBoardService.getEventBoard(bno);
		}			
			
			
//			  List<AttachVO> renamedAttachList=
//			  MakeFileName.parseFileNameFromAttaches(pds.getAttachList(), "\\$\\$");
//			  pds.setAttachList(renamedAttachList);
//			  
//			  request.setAttribute("pds", pds);
			  request.setAttribute("eventBoard",eventBoard);
			  System.out.println(eventBoard.getContent());
			  return url;
			 
			
		} catch (Exception e) {			
			e.printStackTrace();			
			url=null;
			throw e;
		}	
	}

}






