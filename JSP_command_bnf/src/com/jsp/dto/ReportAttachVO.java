package com.jsp.dto;

import java.util.Date;

public class ReportAttachVO {

	private int ano;
	private String uploadPath;
	private String fileName;
	private String fileType;
	private int pno;
	private Date regDate;
	private String Attacher;
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
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
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getAttacher() {
		return Attacher;
	}
	public void setAttacher(String attacher) {
		Attacher = attacher;
	}
	@Override
	public String toString() {
		return "ReportAttachVO [ano=" + ano + ", uploadPath=" + uploadPath + ", fileName=" + fileName + ", fileType="
				+ fileType + ", pno=" + pno + ", regDate=" + regDate + ", Attacher=" + Attacher + "]";
	}



}
