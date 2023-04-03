package com.jsp.action.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.service.EventBoardService;

public class EventBoardRemoveAction implements Action {

	private EventBoardService eventBoardService;
	
	
	
	
	
	public void setEventBoardService(EventBoardService eventBoardService) {
		this.eventBoardService = eventBoardService;
	}





	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String url = "/board/eventBoard/remove";

		int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println(bno);

		try {
			eventBoardService.remove(bno);
			return url;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return url;
	}

}
