package com.jsp.dto;

import java.util.Date;

public class MarketReplyVO {
	private int rno;
	private int bno;
	private String id;
	private String replyText;
	private Date regDate;
	private Date updateDate;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
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
	@Override
	public String toString() {
		return "MarketReplyVO [rno=" + rno + ", bno=" + bno + ", id=" + id + ", replyText=" + replyText + ", regDate="
				+ regDate + ", updateDate=" + updateDate + "]";
	}
	
	
}
