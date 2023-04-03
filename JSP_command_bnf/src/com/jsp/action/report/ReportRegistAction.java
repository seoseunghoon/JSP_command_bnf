package com.jsp.action.report;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import com.josephoconnell.html.HTMLInputFilter;
import com.jsp.action.Action;
import com.jsp.action.utils.GetUploadPath;
import com.jsp.action.utils.MultipartHttpServletRequestParser;
import com.jsp.controller.FileUploadResolver;
import com.jsp.dto.ReportAttachVO;
import com.jsp.dto.ReportBoardVO;
import com.jsp.exception.NotMultipartFormDataException;
import com.jsp.service.ReportBoardService;

public class ReportRegistAction implements Action {

	private ReportBoardService reportBoardSerivce;

	public void setReportBoardSerivce(ReportBoardService reportBoardSerivce) {
		this.reportBoardSerivce = reportBoardSerivce;
	}

	final private int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	final private int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	final private int MAX_REQUEST_SIZE 	= 1024 * 1024 * 200; // 200MB

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("아나나나나나나난나나");
		String url = "/board/report/regist_success";

		MultipartHttpServletRequestParser multi = null;

		List<ReportAttachVO> reportAttachList = null;

		try {
			multi = new MultipartHttpServletRequestParser(request, MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);

			String uploadPath = GetUploadPath.getUploadPath("reportBoard.upload");

			FileItem[] fileItems = multi.getFileItems("uploadFile");
			List<File> fileList = FileUploadResolver.fileUpload(fileItems, uploadPath);

			if (fileList != null) {
				reportAttachList = new ArrayList<ReportAttachVO>();
				for (File file : fileList) {
					ReportAttachVO reportAttach = new ReportAttachVO();
					reportAttach.setFileName(file.getName());
					reportAttach.setUploadPath(uploadPath);
					reportAttach.setFileType(file.getName().substring(file.getName().lastIndexOf(".") + 1));
					reportAttachList.add(reportAttach);
				}
			}
		} catch (NotMultipartFormDataException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		ReportBoardVO reportBoard = new ReportBoardVO();
		String title = HTMLInputFilter.htmlSpecialChars(multi.getParameter("title"));
		reportBoard.setTitle(title);
		reportBoard.setWriter(multi.getParameter("writer"));
		reportBoard.setContent(multi.getParameter("content"));
		reportBoard.setReportAttachList(reportAttachList);
		reportBoardSerivce.ReportBoardRegist(reportBoard);
		
		System.out.println(title);
		System.out.println(reportBoard.getContent());
		
		return url;

	}

}
