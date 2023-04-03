package com.jsp.dto;

import java.util.Date;
import java.util.List;

public class ReportBoardVO {

	private int bno; // 글번호
	private String writer;
	private String title; // 제목
	private String content; // 내용
	private Date updateDate; // 수정일자
	private int viewCnt; // 조회수
	private Date regDate; // 등록일자
	
	private List<ReportAttachVO>reportAttachList;
	
	
	public List<ReportAttachVO> getReportAttachList() {
		return reportAttachList;
	}

	public void setReportAttachList(List<ReportAttachVO> reportAttachList) {
		this.reportAttachList = reportAttachList;
	}

	@Override
	public String toString() {
		return "ReportVO [bno=" + bno + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", updateDate=" + updateDate + ", viewCnt=" + viewCnt + ", regDate=" + regDate + "]";
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

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	

}
