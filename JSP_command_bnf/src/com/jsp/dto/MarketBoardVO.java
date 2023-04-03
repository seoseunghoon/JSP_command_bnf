package com.jsp.dto;

import java.util.Date;
import java.util.List;

public class MarketBoardVO {
		
	private int bno;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
	private Date updateDate;
	private int viewCNT;
	///db에 없는 값.
	private List<MarketAttachVO> attachList;
	private List<MarketReplyVO> replyList;
	private String depart;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public int getViewCNT() {
		return viewCNT;
	}
	public void setViewCNT(int viewCNT) {
		this.viewCNT = viewCNT;
	}
	public List<MarketAttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<MarketAttachVO> attachList) {
		this.attachList = attachList;
	}
	
	
	public List<MarketReplyVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<MarketReplyVO> replyList) {
		this.replyList = replyList;
	}
	
	public String getDepart() {
		return depart;
	}
	public void setDepart(String depart) {
		this.depart = depart;
	}
	
	
	
	
	
}
