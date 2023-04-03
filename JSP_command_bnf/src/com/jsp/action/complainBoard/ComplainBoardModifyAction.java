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

public class ComplainBoardModifyAction implements Action {
	
	private ComplainBoardService complainBoardService;
	
	public void setComplainBoardService(ComplainBoardService complainBoardService) {
		this.complainBoardService = complainBoardService;
	}
	
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 200; // 200MB

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = "/board/complain/modify_success";
		
		MultipartHttpServletRequestParser multi = null;
		
		List<ComplainAttachVO> complainAttachList = null;
		
		try {
			
			multi = new MultipartHttpServletRequestParser(request, MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);
			
			String[] deleteFiles = multi.getParameterValues("deleteFile");
			
			if (deleteFiles != null && deleteFiles.length > 0) {
				
				for (String anoStr : deleteFiles) {
					
					int ano = Integer.parseInt(anoStr);
					ComplainAttachVO complainAttach = complainBoardService.getComplainAttachByAno(ano);
					
					String filePath = complainAttach.getUploadPath() + File.pathSeparator + complainAttach.getFileName();
					File targetFile = new File(filePath);
					
					if (targetFile.exists()) {
						targetFile.delete();
					}
					
					complainBoardService.removeComplainAttachByAno(ano);
					
				}
				
			}
			
			FileItem[] fileItems = multi.getFileItems("uploadFile");
			
			if (fileItems != null && fileItems.length > 0) {
				
				String uploadPath = GetUploadPath.getUploadPath("complainBoard.upload");
				List<File> fileList = FileUploadResolver.fileUpload(fileItems, uploadPath);
				
				complainAttachList = new ArrayList<ComplainAttachVO>();
				
				if (fileList.size() > 0)
					
					for (File file : fileList) {
						
						ComplainAttachVO complainAttach = new ComplainAttachVO();
						
						complainAttach.setFileName(file.getName());
						complainAttach.setUploadPath(uploadPath);
						complainAttach.setFileType(file.getName().substring(file.getName().lastIndexOf(".") + 1));
						
						complainAttachList.add(complainAttach);
						
						complainAttach.setBno(Integer.parseInt(multi.getParameter("bno")));
						complainAttach.setAttacher(multi.getParameter("writer"));
						
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
		
		complainBoard.setBno(Integer.parseInt(multi.getParameter("bno")));
		
		String title = HTMLInputFilter.htmlSpecialChars(multi.getParameter("title"));
		
		complainBoard.setTitle(title);
		complainBoard.setWriter(multi.getParameter("writer"));
		complainBoard.setContent(multi.getParameter("content"));
		complainBoard.setComplainAttachList(complainAttachList);
		
		try {
			
			complainBoardService.modifyComplainBoard(complainBoard);
			
			request.setAttribute("complainBoard", complainBoard);
			
			return url;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
}
