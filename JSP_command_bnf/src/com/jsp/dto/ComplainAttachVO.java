package com.jsp.dto;

import java.util.Date;

public class ComplainAttachVO {
	
	private int ano;
	private String attacher;
	private int pno;
	private String uploadPath;
	private String fileName;
	private String fileType;
	private Date regDate;
	private int bno;
	
	public int getAno() {
		return ano;
	}
	
	public void setAno(int ano) {
		this.ano = ano;
	}
	
	public String getAttacher() {
		return attacher;
	}
	
	public void setAttacher(String attacher) {
		this.attacher = attacher;
	}
	
	public int getPno() {
		return pno;
	}
	
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public String getUploadPath() {
		return uploadPath;
	}
	
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getFileType() {
		return fileType;
	}
	
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
