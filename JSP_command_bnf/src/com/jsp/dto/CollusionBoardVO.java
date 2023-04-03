package com.jsp.dto;

import java.util.Date;
import java.util.List;

public class CollusionBoardVO {
	
	private int bno;
	private String title;
	private String content;
	private Date regDate;
	private Date updateDate;
	private int viewCNT;
	private int openner;
	private String writer;
	
	private List<CollusionAttachVO> collusionAttachList;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public int getOpenner() {
		return openner;
	}
	public void setOpenner(int openner) {
		this.openner = openner;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public List<CollusionAttachVO> getCollusionAttachList() {
		return collusionAttachList;
	}
	public void setCollusionAttach(List<CollusionAttachVO> collusionAttachList) {
		this.collusionAttachList = collusionAttachList;
	}
	
	
}
