package com.jsp.action.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.jsp.dto.CitizenAttachVO;
import com.jsp.dto.ComplainAttachVO;
import com.jsp.dto.MarketAttachVO;
import com.jsp.dto.ReportAttachVO;

public class MakeFileName {

	public static String toUUIDFileName(String fileName, String delimiter) {
		String uuid = UUID.randomUUID().toString().replace("-", "");
		return uuid + delimiter + fileName;
	}

	public static String parseFileNameFromUUID(String fileName, String delimiter) {
		String[] uuidFileName = fileName.split(delimiter);
		return uuidFileName[uuidFileName.length - 1];
	}

	public static List<MarketAttachVO> parseFileNameFromMarketAttaches(List<MarketAttachVO> attachList,
															String delimiter) {

		List<MarketAttachVO> renamedMarketAttachList = new ArrayList<MarketAttachVO>();

		if (attachList != null) {
			for (MarketAttachVO attach : attachList) {
				String fileName = attach.getFileName(); // DB상의 fileName
				fileName = parseFileNameFromUUID(fileName, delimiter); // uuid가 제거된
				// fileName
				attach.setFileName(fileName);

				renamedMarketAttachList.add(attach);
			}
		}
		return renamedMarketAttachList;
	}
	
	public static List<ReportAttachVO> reportFileNameFromAttaches(List<ReportAttachVO> reportAttachList,
			String delimiter) {

		List<ReportAttachVO> renamedReportAttachList = new ArrayList<ReportAttachVO>();

		if (reportAttachList != null) {
			for (ReportAttachVO reportAttach : reportAttachList) {
				String fileName = reportAttach.getFileName(); // DB상의 fileName
				fileName = parseFileNameFromUUID(fileName, delimiter); // uuid가 제거된
				// fileName
				reportAttach.setFileName(fileName);

				renamedReportAttachList.add(reportAttach);
			}
		}
		return renamedReportAttachList;
	}
	
public static List<CitizenAttachVO> parseFileNameFromCitizenAttaches(List<CitizenAttachVO> attachList, String delimiter) {
		
		List<CitizenAttachVO> renamedAttachList = new ArrayList<CitizenAttachVO>();
		
		if (attachList != null) {
			
			for (CitizenAttachVO citizenAttach : attachList) {
				
				String fileName = citizenAttach.getFileName();
				fileName = parseFileNameFromUUID(fileName, delimiter);
				
				citizenAttach.setFileName(fileName);
				
				renamedAttachList.add(citizenAttach);
				
			}
			
		}
		
		return renamedAttachList;
		
	}
	
	public static List<ComplainAttachVO> parseFileNameFromComplainAttaches(List<ComplainAttachVO> attachList, String delimiter) {
		
		List<ComplainAttachVO> renamedAttachList = new ArrayList<ComplainAttachVO>();
		
		if (attachList != null) {
			
			for (ComplainAttachVO complainAttach : attachList) {
				
				String fileName = complainAttach.getFileName();
				fileName = parseFileNameFromUUID(fileName, delimiter);
				
				complainAttach.setFileName(fileName);
				
				renamedAttachList.add(complainAttach);
				
			}
			
		}
		
		return renamedAttachList;
		
	}
}
