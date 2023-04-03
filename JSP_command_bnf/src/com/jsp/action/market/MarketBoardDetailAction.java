package com.jsp.action.market;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.action.utils.MakeFileName;
import com.jsp.dto.MarketAttachVO;
import com.jsp.dto.MarketBoardVO;
import com.jsp.service.MarketBoardService;

public class MarketBoardDetailAction implements Action{

	MarketBoardService marketBoardService;
	
	
	
	public void setMarketBoardService(MarketBoardService marketBoardService) {
		this.marketBoardService = marketBoardService;
	}



	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/board/market/detail";
		int bno = Integer.parseInt(request.getParameter("bno"));
		String from = request.getParameter("from");
		MarketBoardVO board = null;
		try {
			
			if(from!=null && from.equals("list")) {
				board = marketBoardService.read(bno);
				
				url="redirect:/board/market/detail.do?bno="+bno;
			}else {				
				board = marketBoardService.getBoard(bno);
				
				List<MarketAttachVO> attachList = board.getAttachList();
				attachList= MakeFileName.parseFileNameFromMarketAttaches(attachList, "\\$\\$");
				board.setAttachList(attachList);
			}		
		}catch(Exception e) {
			
		}
		request.setAttribute("board", board);
		return url;
	}

}
