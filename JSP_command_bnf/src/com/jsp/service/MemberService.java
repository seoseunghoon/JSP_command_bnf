package com.jsp.service;

import java.util.Map;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.MemberVO;

public interface MemberService {
	
	Map<String, Object> getMemberListForPage(SearchCriteria cri) throws Exception;
	
	MemberVO getMember(String id) throws Exception;
	
	void registMember(MemberVO member) throws Exception;
	
	void modifyMember(MemberVO member) throws Exception;
	
	void removeMember(String id) throws Exception;
	
	void updateAuthority(String id, String authority) throws Exception;
	
}
