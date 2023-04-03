package com.jsp.dao;


import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.jsp.command.SearchCriteria;
import com.jsp.datasource.MySqlSessionFactory;
import com.jsp.dto.MemberVO;


public class TestMemberDAOImpl {

   private MySqlSessionFactory sqlSessionFactory = new MySqlSessionFactory();
   private MemberDAO memberDAO = new MemberDAOImpl();
   private SqlSession session;
   
   @Before
   public void init() {
      session = sqlSessionFactory.openSession(false);
      session.commit();
   }
   
   @After
   public void destroy() {
      if(session!=null) {
         session.rollback();
         session.close();
      }
      
   }
   
	/*
	 * @Test public void testSelectDepart(){ try {
	 * System.out.println(memberDAO.selectDepartById(session, "test")); } catch
	 * (SQLException e) { e.printStackTrace(); } }
	 */
   
   public void testMemberList()throws Exception{
      
      SearchCriteria cri = new SearchCriteria(1,100,"p","7");//1부터 100까지 불러오는거 그중에 phone 에 숫자 7들어가는거 찾는거
      
      List<MemberVO> memberList 
         = memberDAO.selectSearchMemberList(session, cri);
      
      Assert.assertEquals(1, memberList.size());//기대값 2개
      
   }
   
   
   public void testSelectMemberById()throws Exception {
      
      String id = "kiki";      
      
      MemberVO member = memberDAO.selectMemberById(session, id);
      
      Assert.assertEquals(id, member.getId());
   }
   
  
   public void testInsertMember()throws Exception{
      MemberVO insertMember = new MemberVO();
      insertMember.setId("mimi2");
      insertMember.setPwd("mimi2");
      insertMember.setPhone("01055556666");
      insertMember.setEmail("mimi2@naver.com");
      insertMember.setPicture("da");
      insertMember.setAuthority("ROLE_USER");
      insertMember.setName("mimi2");
      insertMember.setEnabled(1);
      insertMember.setRegister("test");
      insertMember.setAddress("test");
      insertMember.setDepart("test");
      memberDAO.insertMember(session, insertMember);
      
      MemberVO getMember 
            = memberDAO.selectMemberById(session, insertMember.getId());
      
      Assert.assertEquals(insertMember.getId(), getMember.getId());
      
   }
   
  
      public void testUpdateMember() throws Exception {
         session = sqlSessionFactory.openSession();
         
            String targetID = "kiki";
            
            MemberVO targetMember = memberDAO.selectMemberById(session, targetID);
            System.out.println(targetMember.getPwd());
            
            targetMember.setPwd("testtest");
            System.out.println(targetMember.getPwd());
            targetMember.setPicture("cdrive");
            memberDAO.updateMember(session, targetMember);
            
            
            
            MemberVO getMember = memberDAO.selectMemberById(session, targetID);
            Assert.assertEquals(targetMember.getName(), getMember.getName());		
    		Assert.assertEquals(targetMember.getPwd(), getMember.getPwd());
            
      }
   
  
   public void testDeleteMember()throws Exception {
      String target = "kiki";
      
      MemberVO deleteMember = memberDAO.selectMemberById(session, target);      
      Assert.assertNotNull(deleteMember);
      
      memberDAO.deleteMember(session, target);
      
      MemberVO getMember =memberDAO.selectMemberById(session, target);
      Assert.assertNull(getMember);
   }
   
}





