package com.jsp.action.report;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import com.jsp.action.Action;
import com.jsp.action.utils.GetUploadPath;
import com.jsp.action.utils.MultipartHttpServletRequestParser;
import com.jsp.controller.FileUploadResolver;
import com.jsp.dto.ReportAttachVO;
import com.jsp.dto.ReportBoardVO;
import com.jsp.exception.NotMultipartFormDataException;
import com.jsp.service.ReportBoardService;

public class ReportModifyAction implements Action {

	private ReportBoardService reportBoardService;

	public void setReportBoardService(ReportBoardService reportBoardService) {
		this.reportBoardService = reportBoardService;
	}

	// 업로드 파일 환경 설정
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 200; // 200MB

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String url = "/board/report/modify_success";

		MultipartHttpServletRequestParser multi = null;
		List<ReportAttachVO> reportAttachList = null;

		try {
			multi = new MultipartHttpServletRequestParser(request, MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);

			// 파일 삭제 및 DB삭제
			String[] deleteFiles = multi.getParameterValues("deleteFile");
			if (deleteFiles != null && deleteFiles.length > 0) {
				for (String anoStr : deleteFiles) {
					int ano = Integer.parseInt(anoStr);
					ReportAttachVO reportAttach = reportBoardService.getReportAttachByAno(ano);
					String filePath = reportAttach.getUploadPath() + File.separator + reportAttach.getFileName();
					File targetFile = new File(filePath);
					if (targetFile.exists()) {
						targetFile.delete(); // 파일 삭제
					}
					reportBoardService.removeReportAttachAno(ano);
				}
			}

			// 추가된 파일 저장
			FileItem[] fileItems = multi.getFileItems("uploadFile");
			if (fileItems != null && fileItems.length > 0) {
				// 파일저장
				String uploadPath = GetUploadPath.getUploadPath("report.upload");
				List<File> fileList = FileUploadResolver.fileUpload(fileItems, uploadPath);

				// attaches
				reportAttachList = new ArrayList<ReportAttachVO>();
				if (fileList.size() > 0)
					for (File file : fileList) {
						ReportAttachVO reportAttach = new ReportAttachVO();
						reportAttach.setFileName(file.getName());
						reportAttach.setUploadPath(uploadPath);
						reportAttach.setFileType(file.getName().substring(file.getName().lastIndexOf(".") + 1));
						reportAttachList.add(reportAttach);
						reportAttach.setPno(Integer.parseInt(multi.getParameter("pno")));
						reportAttach.setAttacher(multi.getParameter("writer"));
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
		reportBoard.setBno(Integer.parseInt(multi.getParameter("bno")));
		reportBoard.setTitle(multi.getParameter("title"));
		reportBoard.setWriter(multi.getParameter("writer"));
		reportBoard.setContent(multi.getParameter("content"));
		reportBoard.setReportAttachList(reportAttachList);

		try {

			// DB 수정
			reportBoardService.ReportBoardModify(reportBoard);

			request.setAttribute("reportBoard", reportBoard);

			return url;

		} catch (Exception e) {
			// Exception 처리
			e.printStackTrace();
			throw e;
		}

	}

}
