package com.jsp.action.citizenBoard;

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
import com.jsp.dto.CitizenAttachVO;
import com.jsp.dto.CitizenBoardVO;
import com.jsp.exception.NotMultipartFormDataException;
import com.jsp.service.CitizenBoardService;

public class CitizenBoardRegistAction implements Action {
	
	private CitizenBoardService citizenBoardService;
	
	public void setCitizenBoardService(CitizenBoardService citizenBoardService) {
		this.citizenBoardService = citizenBoardService;
	}
	
	final private int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	final private int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	final private int MAX_REQUEST_SIZE = 1024 * 1024 * 200; // 200MB
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = "/board/citizen/regist_success";
		
		MultipartHttpServletRequestParser multi = null;
		
		List<CitizenAttachVO> citizenAttachList = null;
		
		try {
			
			multi = new MultipartHttpServletRequestParser(request, MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);
			
			String uploadPath = GetUploadPath.getUploadPath("citizenBoard.upload");
			
			FileItem[] fileItems = multi.getFileItems("uploadFile");
			List<File> fileList = FileUploadResolver.fileUpload(fileItems, uploadPath);
			
			if (fileList != null) {
				
				citizenAttachList = new ArrayList<CitizenAttachVO>();
				
				for (File file : fileList) {
					
					CitizenAttachVO citizenAttach = new CitizenAttachVO();
					
					citizenAttach.setFileName(file.getName());
					citizenAttach.setUploadPath(uploadPath);
					citizenAttach.setFileType(file.getName().substring(file.getName().lastIndexOf(".") + 1));
					
					citizenAttachList.add(citizenAttach);
					
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
		
		CitizenBoardVO citizenBorad = new CitizenBoardVO();
		
		citizenBorad.setContent(multi.getParameter("content"));
		citizenBorad.setWriter(multi.getParameter("writer"));
		
		String title = HTMLInputFilter.htmlSpecialChars(multi.getParameter("title"));
		
		citizenBorad.setTitle(title);
		citizenBorad.setCitizenAttachList(citizenAttachList);
		
		System.out.println(title);
		System.out.println(multi.getParameter("content"));
		citizenBoardService.registCitizenBoard(citizenBorad);
		
		return url;
		
	}
	
}
