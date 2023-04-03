package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.MemberVO;

public interface MemberDAO {
	
	List<MemberVO> selectSearchMemberList(SqlSession session, SearchCriteria cri)throws SQLException;
	
	int selectSearchMemberListCount(SqlSession session, SearchCriteria cri) throws SQLException;
	
	MemberVO selectMemberById(SqlSession session, String id) throws SQLException;
	
	void insertMember(SqlSession session, MemberVO member) throws SQLException;
	
	void updateMember(SqlSession session, MemberVO member) throws SQLException;
	
	void deleteMember(SqlSession session, String id) throws SQLException;

	String selectDepartById(SqlSession session, String writer)throws SQLException;
	

	void changeAuthority(SqlSession session, String id, String authority)throws SQLException;
}
