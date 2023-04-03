package com.jsp.action.complainBoard;

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
import com.jsp.dto.ComplainAttachVO;
import com.jsp.dto.ComplainBoardVO;
import com.jsp.exception.NotMultipartFormDataException;
import com.jsp.service.ComplainBoardService;

public class ComplainBoardRegistAction implements Action {
	
	private ComplainBoardService complainBoardService;
	
	public void setComplainBoardService(ComplainBoardService complainBoardService) {
		this.complainBoardService = complainBoardService;
	}
	
	final private int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	final private int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	final private int MAX_REQUEST_SIZE = 1024 * 1024 * 200; // 200MB

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = "/board/complain/regist_success";
		
		MultipartHttpServletRequestParser multi = null;
		
		List<ComplainAttachVO> complainAttachList = null;
		
		try {
			
			multi = new MultipartHttpServletRequestParser(request, MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);
			
			String uploadPath = GetUploadPath.getUploadPath("complainBoard.upload");
			
			FileItem[] fileItems = multi.getFileItems("uploadFile");
			List<File> fileList = FileUploadResolver.fileUpload(fileItems, uploadPath);
			
			if (fileList != null) {
				
				complainAttachList = new ArrayList<ComplainAttachVO>();
				
				for (File file : fileList) {
					
					ComplainAttachVO complainAttach = new ComplainAttachVO();
					
					complainAttach.setFileName(file.getName());
					complainAttach.setUploadPath(uploadPath);
					complainAttach.setFileType(file.getName().substring(file.getName().lastIndexOf(".") + 1));
					
					complainAttachList.add(complainAttach);
					
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
		
		ComplainBoardVO complainBoard = new ComplainBoardVO();
		
		complainBoard.setContent(multi.getParameter("content"));
		complainBoard.setWriter(multi.getParameter("writer"));
		
		String title = HTMLInputFilter.htmlSpecialChars(multi.getParameter("title"));
		
		complainBoard.setTitle(title);
		complainBoard.setComplainAttachList(complainAttachList);
		
		complainBoardService.registComplainBoard(complainBoard);
		
		return url;
		
	}

}
