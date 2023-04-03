package com.jsp.command;



import java.text.ParseException;
import java.text.SimpleDateFormat;


import com.jsp.exception.NotNumberException;

public class SearchCriteria {
	
	private int page=1;
	private int perPageNum=10;
	private String searchType="";
	private String keyword="";
	private java.sql.Date srchBeginDt;
	private java.sql.Date srchEndDt;
	private int startRowNum=0;
	
	
	public SearchCriteria() {}
	public SearchCriteria(int page, int perPageNum, String searchType, String keyword) {
		parseSearchCriteria(page,perPageNum,searchType,keyword);
	}
	
	public SearchCriteria(String page, String perPageNum, String searchType, String keyword)throws NotNumberException {
		try {		
			parseSearchCriteria(Integer.parseInt(page),Integer.parseInt(perPageNum),
				 searchType, keyword);		
		}catch(NumberFormatException e) {
			throw new NotNumberException();
		}
	}
	
	private void parseSearchCriteria(int page, int perPageNum, String searchType, String keyword) {
		
		this.page = page;
		this.perPageNum = perPageNum;
		this.searchType = searchType;
		this.keyword = keyword;		
		
		setStartRowNum();
	}
	
	
	
	
	
	public SearchCriteria(String page, String perPageNum, String searchType, String keyword, String srchBeginDt, String srchEndDt)throws NotNumberException {
		try {
			/*
			 * SimpleDateFormat sdfBegin=new SimpleDateFormat(srchBeginDt); SimpleDateFormat
			 * sdfEnd=new SimpleDateFormat(srchEndDt);
			 * 
			 * String BeginFormat=sdfBegin.format(new java.util.Date()); String EndFormat =
			 * sdfEnd.format(new java.util.Date());
			 * 
			 * java.sql.Date SqlBeginDt = java.sql.Date.valueOf(BeginFormat); java.sql.Date
			 * SqlEndDt = java.sql.Date.valueOf(EndFormat);
			 * 
			 * new java.sql.Date(new java.util.Date(srchBeginDt).getTime());
			 */
			
			
			SimpleDateFormat sdfBegin = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date Begindate = null;
			java.util.Date Enddate = null;
			try {
				Begindate = sdfBegin.parse(srchBeginDt);
				Enddate = sdfBegin.parse(srchEndDt);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			java.sql.Date SqlBegin = new java.sql.Date(Begindate.getTime());
			java.sql.Date SqlEnd = new java.sql.Date(Enddate.getTime()+86400000);
			//1 일 = 86400000 밀리초
			
			
			this.srchBeginDt = SqlBegin;
			this.srchEndDt = SqlEnd;
			
			
			
			
			
			
			  
			  
			parseSearchCriteria(Integer.parseInt(page),Integer.parseInt(perPageNum),
				 searchType, keyword);
			 

		}catch(NumberFormatException e) {
			throw new NotNumberException();
		}
	}
	
	
	
	
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {		
		if(page>0) {
			this.page = page;
		}
		setStartRowNum();
	}
	
	
	
	
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum > 0 && perPageNum<101) {
			this.perPageNum = perPageNum;
		}
		setStartRowNum();
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	

	
	
	
	public java.sql.Date getSrchBeginDt() {
		return srchBeginDt;
	}
	public void setSrchBeginDt(java.sql.Date srchBeginDt) {
		this.srchBeginDt = srchBeginDt;
	}
	public java.sql.Date getSrchEndDt() {
		return srchEndDt;
	}
	public void setSrchEndDt(java.sql.Date srchEndDt) {
		this.srchEndDt = srchEndDt;
	}
	private void setStartRowNum() {
		this.startRowNum = (this.page-1)* this.perPageNum;	
	}
	
	public int getStartRowNum() {
		return this.startRowNum;
	}
	
	
}
