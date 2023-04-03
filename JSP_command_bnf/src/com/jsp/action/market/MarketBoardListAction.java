package com.jsp.action.market;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.command.SearchCriteria;
import com.jsp.service.MarketBoardService;
import com.jsp.service.MemberService;

public class MarketBoardListAction implements Action{

	
	private MarketBoardService marketBoardService;
	

	public void setMarketBoardService(MarketBoardService marketBoardService) {
		this.marketBoardService = marketBoardService;
	}




	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String url = "/sharingMarket/list_bootstrap";
		//1.화면결정. 
		String url = "/board/market/list";
		
		
		String page = request.getParameter("page");
		
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		
		String srchBeginDt = request.getParameter("srchBeginDt");
		String srchEndDt = request.getParameter("srchEndDt");
		
		SearchCriteria cri = null;
		if(page==null) page="1";
		String perPageNum="10";
		
		
		//그냥 검색은 ""이게 들어오고
		//그냥 do는 null이 들어온다.
		
		
		if(srchBeginDt!=null && srchEndDt!=null && srchBeginDt!="" && srchEndDt!=null) {
			cri = new SearchCriteria(page,perPageNum,searchType,keyword,srchBeginDt,srchEndDt);
		}else
			cri = new SearchCriteria(page,perPageNum,searchType,keyword);
		
		
		Map<String,Object> dataMap = marketBoardService.getList(cri);
		request.setAttribute("dataMap", dataMap);
		
		
		
		
		return url;
	}

	
}
