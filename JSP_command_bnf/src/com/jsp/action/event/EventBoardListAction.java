package com.jsp.action.event;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.command.SearchCriteria;
import com.jsp.service.EventBoardService;

public class EventBoardListAction implements Action {

	private EventBoardService eventBoardService;
	
	
	public void setSEventBoardService(EventBoardService eventBoardService) {
		this.eventBoardService = eventBoardService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//화면결정
		
		String url = "/board/eventBoard/list";//view안에서의 경로
		
		SearchCriteria cri = new SearchCriteria();
		
		Map<String,Object> dataMap = eventBoardService.getList(cri);
		
		request.setAttribute("dataMap", dataMap);
		
		return url;
	}

}
