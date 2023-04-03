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

public class CitizenBoardModifyAction implements Action {
	
	private CitizenBoardService citizenBoardService;
	
	public void setCitizenBoardService(CitizenBoardService citizenBoardService) {
		this.citizenBoardService = citizenBoardService;
	}
	
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 200; // 200MB

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = "/board/citizen/modify_success";
		
		MultipartHttpServletRequestParser multi = null;
		
		List<CitizenAttachVO> citizenAttachList = null;
		
		try {
			
			multi = new MultipartHttpServletRequestParser(request, MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);
			
			String[] deleteFiles = multi.getParameterValues("deleteFile");
			
			if (deleteFiles != null && deleteFiles.length > 0) {
				
				for (String anoStr : deleteFiles) {
					
					int ano = Integer.parseInt(anoStr);
					CitizenAttachVO citizenAttach = citizenBoardService.getCitizenAttachByAno(ano);
					
					String filePath = citizenAttach.getUploadPath() + File.separator + citizenAttach.getFileName();
					File targetFile = new File(filePath);
					
					if (targetFile.exists()) {
						targetFile.delete();
					}
					
					citizenBoardService.removeCitizenAttachByAno(ano);
					
				}
				
			}
			
			FileItem[] fileItems = multi.getFileItems("uploadFile");
			
			if (fileItems != null && fileItems.length > 0) {
				
				String uploadPath = GetUploadPath.getUploadPath("citizenBoard.upload");
				List<File> fileList = FileUploadResolver.fileUpload(fileItems, uploadPath);
				
				citizenAttachList = new ArrayList<CitizenAttachVO>();
				
				if (fileList.size() > 0)
					
					for (File file : fileList) {
						
						CitizenAttachVO citizenAttach = new CitizenAttachVO();
						
						citizenAttach.setFileName(file.getName());
						citizenAttach.setUploadPath(uploadPath);
						citizenAttach.setFileType(file.getName().substring(file.getName().lastIndexOf(".") + 1));
						citizenAttachList.add(citizenAttach);
						citizenAttach.setBno(Integer.parseInt(multi.getParameter("bno")));
						citizenAttach.setAttacher(multi.getParameter("writer"));
						
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
		
		CitizenBoardVO citizenBoard = new CitizenBoardVO();
		
		citizenBoard.setBno(Integer.parseInt(multi.getParameter("bno")));
		
		String title = HTMLInputFilter.htmlSpecialChars(multi.getParameter("title"));
		
		citizenBoard.setTitle(title);
		citizenBoard.setWriter(multi.getParameter("writer"));
		citizenBoard.setContent(multi.getParameter("content"));
		citizenBoard.setCitizenAttachList(citizenAttachList);
		
		try {
			
			citizenBoardService.modifyCitizenBoard(citizenBoard);
			
			request.setAttribute("citizenBoard", citizenBoard);
			
			return url;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
