package com.jsp.action.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.MarketBoardVO;
import com.jsp.service.MarketBoardService;

public class MarketBoardModifyFormAction implements Action {

	
	MarketBoardService marketBoardService;
	
	
	
	public void setMarketBoardService(MarketBoardService marketBoardService) {
		this.marketBoardService = marketBoardService;
	}



	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/board/market/modify";
		
		String Strbno = request.getParameter("bno");
		int bno=-1;
		if(Strbno != null) {
			bno = Integer.parseInt(Strbno);
		}
		
		
		MarketBoardVO board = marketBoardService.getBoard(bno);
		
		request.setAttribute("board", board);
		
		return url;
	}

}
