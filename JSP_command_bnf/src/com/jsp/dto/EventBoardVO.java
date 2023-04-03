//행사모집 //https://www.busan.go.kr/minwon/occation#none

package com.jsp.dto;

import java.util.Date;


public class EventBoardVO {
	
	private int bno; 			 //글번호
	private String title;	     //제목
	private String writer;       //작성자
	private String target;       //대상
	private String content;      //글내용
	private Date endDate;        //마감일
	private Date regDate;    	 //등록일
	private Date updateDate;     //수정일
	private int viewCNT;         //조회수
	

	
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public int getViewCNT() {
		return viewCNT;
	}
	public void setViewCNT(int viewCNT) {
		this.viewCNT = viewCNT;
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

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
	
	
}
