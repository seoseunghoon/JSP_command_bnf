package com.jsp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jsp.command.PageMaker;
import com.jsp.command.SearchCriteria;
import com.jsp.dao.MemberDAO;
import com.jsp.dto.MemberVO;

public class MemberServiceImpl implements MemberService {

	private SqlSessionFactory sqlSessionFactory;
	private MemberDAO memberDAO;

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public Map<String, Object> getMemberListForPage(SearchCriteria cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		SqlSession session = sqlSessionFactory.openSession(false);

		try {
			List<MemberVO> memberList = memberDAO.selectSearchMemberList(session, cri);
			dataMap.put("memberList", memberList);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(memberDAO.selectSearchMemberListCount(session, cri));
			dataMap.put("pageMaker", pageMaker);
			
			session.commit();
			return dataMap;
		} finally {
			if (session != null)
				session.close();
		}
	}

	@Override
	public MemberVO getMember(String id) throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			MemberVO member = memberDAO.selectMemberById(session, id);
			return member;
		} finally {
			if (session != null)
				session.close();
		}
	}

	@Override
	public void registMember(MemberVO member) throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			memberDAO.insertMember(session, member);
		} finally {
			if(session!=null)
				session.close();
		}
	}

	@Override
	public void modifyMember(MemberVO member) throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			memberDAO.updateMember(session, member);
		} finally {
			if(session!=null)
				session.close();
		}
	}

	@Override
	public void removeMember(String id) throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			memberDAO.deleteMember(session, id);
		} finally {
			if(session!=null)
				session.close();
		}
	}

	@Override
	public void updateAuthority(String id, String authority) throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			memberDAO.changeAuthority(session, id, authority);
		} finally {
			if(session!=null)
				session.close();
		}
	}

}
