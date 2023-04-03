package com.jsp.action.market;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import com.jsp.action.Action;
import com.jsp.action.utils.GetUploadPath;
import com.jsp.action.utils.MakeFileName;
import com.jsp.action.utils.MultipartHttpServletRequestParser;
import com.jsp.controller.FileUploadResolver;

import com.jsp.dto.MarketAttachVO;
import com.jsp.dto.MarketBoardVO;
import com.jsp.exception.NotMultipartFormDataException;
import com.jsp.service.MarketBoardService;

public class MarketBoardRegistAction implements Action {

	
	private MarketBoardService marketBoardService;
	
	
	
	final private int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	final private int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	final private int MAX_REQUEST_SIZE = 1024 * 1024 * 200; // 200MB
	
	
	
	
	public void setMarketBoardService(MarketBoardService marketBoardService) {
		this.marketBoardService = marketBoardService;
	}



	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url ="/board/market/regist_success";
		
		///멀티파트 사용.
		String writer = null;
		String title = null;
		String content = null;
		List<MarketAttachVO> attachList = null;
		
		try {
			MultipartHttpServletRequestParser multi = new MultipartHttpServletRequestParser(request,MEMORY_THRESHOLD,MAX_FILE_SIZE,MAX_REQUEST_SIZE);
			
			writer = multi.getParameter("writer");
			title = multi.getParameter("title");
			content = multi.getParameter("content");
			
			
			
			//파일을 가져온다. 
			FileItem[] fileItemList = multi.getFileItems("fileInput");
			//경로정해준다.
			String savedfilePath = GetUploadPath.getUploadPath("board.upload");
			//파일업로드
			
			List<File> fileList = FileUploadResolver.fileUpload(fileItemList, savedfilePath);
			
			if (fileList != null) {
				System.out.println("파일들어오나");
				attachList = new ArrayList<MarketAttachVO>();
				for (File file : fileList) {
					MarketAttachVO attach = new MarketAttachVO();
					// DB에 저장할 attach에 file 내용 추가.
					attach.setFileName(file.getName());
					attach.setUploadPath(savedfilePath);
					attach.setFileType(file.getName().substring(file.getName().lastIndexOf(".") + 1));
					attachList.add(attach);
				}
			}
		}catch(NotMultipartFormDataException e) {
			throw e;
		}
		
		
		
		//AttachVO를 완성,db에 등록. 글에 List<AttachVO>를 붙여주고. 
	
			MarketBoardVO board = new MarketBoardVO();
			board.setTitle(title);
			board.setWriter(writer);
			board.setContent(content);

			if(attachList!=null) {
				System.out.println("왜 널이아니지");
				board.setAttachList(attachList);
			}

			marketBoardService.regist(board);
		
			
		
		
		
		return url;
	}

}
