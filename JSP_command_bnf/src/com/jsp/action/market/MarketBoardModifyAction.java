package com.jsp.action.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.MarketBoardVO;
import com.jsp.service.MarketBoardService;

public class MarketBoardModifyAction implements Action{

	
	MarketBoardService marketBoardService;
	
	
	
	
	public void setMarketBoardService(MarketBoardService marketBoardService) {
		this.marketBoardService = marketBoardService;
	}




	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/board/market/modify_success";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content =request.getParameter("content");
		MarketBoardVO board = marketBoardService.getBoard(bno);
		board.setTitle(title);
		board.setContent(content);
		marketBoardService.modify(board);
		request.setAttribute("board", board);
		return url;
	}

}
