package com.jsp.action.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.service.MarketBoardService;

public class MarketBoardRemoveAction implements Action{

	
	private MarketBoardService marketBoardService;
	
	
	
	
	public void setMarketBoardService(MarketBoardService marketBoardService) {
		this.marketBoardService = marketBoardService;
	}



	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/board/market/remove_success";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		marketBoardService.remove(bno);
		
		return url;
	}

	
	
}
