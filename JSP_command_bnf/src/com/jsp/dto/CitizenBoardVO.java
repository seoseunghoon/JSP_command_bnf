package com.jsp.dto;

import java.util.Date;
import java.util.List;

public class CitizenBoardVO {
	
	private int bno;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
	private Date updateDate;
	private int viewCNT;
	
	private List<CitizenAttachVO> attachList;
	
	public List<CitizenAttachVO> getCitizenAttachList() {
		return attachList;
	}

	public void setCitizenAttachList(List<CitizenAttachVO> attachList) {
		this.attachList = attachList;
	}

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

	@Override
	public String toString() {
		return "CitizenBoardVO [bno=" + bno + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", regDate=" + regDate + ", updateDate=" + updateDate + ", viewCNT=" + viewCNT + ", attachList="
				+ attachList + "]";
	}
	
	
	
}
