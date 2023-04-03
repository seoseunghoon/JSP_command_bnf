package com.jsp.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jsp.action.utils.MakeFileName;
import com.jsp.command.PageMaker;
import com.jsp.command.SearchCriteria;
import com.jsp.dao.MarketAttachDAO;
import com.jsp.dao.MarketBoardDAO;
import com.jsp.dao.MarketReplyDAO;
import com.jsp.dao.MemberDAO;
import com.jsp.dto.MarketAttachVO;
import com.jsp.dto.MarketBoardVO;

public class MarketBoardServiceImpl implements MarketBoardService{

	MarketBoardDAO marketBoardDAO;
	MarketAttachDAO marketAttachDAO;
	MarketReplyDAO marketReplyDAO;
	
	MemberDAO memberDAO;
	SqlSessionFactory sqlSessionFactory;
	
	
	
	public void setMarketBoardDAO(MarketBoardDAO marketBoardDAO) {
		this.marketBoardDAO = marketBoardDAO;
	}
	
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	public void setMarketAttachDAO(MarketAttachDAO marketAttachDAO) {
		this.marketAttachDAO = marketAttachDAO;
	}

	public void setMarketReplyDAO(MarketReplyDAO marketReplyDAO) {
		this.marketReplyDAO = marketReplyDAO;
	}

	@Override
	public Map<String, Object> getList(SearchCriteria cri) throws Exception {
		
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		
		try {
			List<MarketBoardVO> marketBoardList = marketBoardDAO.selectBoardCriteria(session, cri);
			//첨부파일.
			
			if(marketBoardList != null) {
				for(MarketBoardVO board : marketBoardList) {
					List<MarketAttachVO> attachList = marketAttachDAO.selectAttachByBno(session, board.getBno());
					
					  if(!attachList.isEmpty()) {
						  board.setAttachList(attachList);
					  }
					 
					 					
					
					
//					List<MarketReplyVO> replyList = marketReplyDAO.selectReplyByBno(session, board.getBno());
//					board.setReplyList(replyList);
					
					board.setDepart(memberDAO.selectDepartById(session, board.getWriter()));
				}
			}
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(marketBoardDAO.selectBoardCriteriaTotalCount(session,cri));
			dataMap.put("marketBoardList",marketBoardList);
			dataMap.put("pageMaker",pageMaker);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return dataMap;
		
		
		
		
		
		
		
		//dataMap.put("PageMaker",pageMaker);
		
	}

	@Override
	public void regist(MarketBoardVO board) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			int bno = marketBoardDAO.selectSeqNextValue(session);
			board.setBno(bno);
			marketBoardDAO.insertBoard(session, board);
			
			if (board.getAttachList() != null)
				
				for (MarketAttachVO attach : board.getAttachList()) {
					attach.setBno(bno);
					attach.setAttacher(board.getWriter());
					marketAttachDAO.insertAttach(session, attach);
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		
	}

	@Override
	public void modify(MarketBoardVO board) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			marketBoardDAO.updateBoard(session, board);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		
	}

	@Override
	public MarketBoardVO read(int bno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			
			MarketBoardVO board = marketBoardDAO.selectBoardByBno(session, bno);
			
			marketBoardDAO.increaseViewCNT(session, bno);
			List<MarketAttachVO> attachList = marketAttachDAO.selectAttachByBno(session,board.getBno());
			 if(attachList!=null) {
				 board.setAttachList(attachList); 
			 }
			 
//			List<MarketReplyVO> replyList = marketReplyDAO.selectReplyByBno(session, board.getBno());
//			board.setReplyList(replyList);
//			
			
			return board;
		}finally{
			session.close();
		}
		
		
		
	}

	@Override
	public MarketBoardVO getBoard(int bno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			MarketBoardVO board = marketBoardDAO.selectBoardByBno(session, bno);
			
			  List<MarketAttachVO> attachList = marketAttachDAO.selectAttachByBno(session,board.getBno());
			 if(attachList!=null)
			  board.setAttachList(attachList); 
			 //List<MarketReplyVO>
			 // replyList = marketReplyDAO.selectReplyByBno(session, board.getBno());
			 // board.setReplyList(replyList);
			 
			return board;
		}finally{
			session.close();
		}
		
	}

	@Override
	public void remove(int bno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			marketBoardDAO.deleteBoard(session, bno);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		
	}

	@Override
	public void registAttach(MarketAttachVO attach) throws SQLException {
		
		SqlSession session = sqlSessionFactory.openSession();
		try {
			marketAttachDAO.insertAttach(session, attach);
		}finally {
			session.close();
		}
		
	}

	@Override
	public List<MarketAttachVO> getAttachList(int bno) throws SQLException {
		
		List<MarketAttachVO> attachList = null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			attachList= marketAttachDAO.selectAttachByBno(session, bno);
		}finally {
			session.close();
		}
		
		
		
		return attachList;
	}

	@Override
	public MarketAttachVO getAttach(int ano) throws SQLException {
		MarketAttachVO attach= null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			attach= marketAttachDAO.selectAttachByAno(session, ano);
		}finally {
			session.close();
		}
		
		
		return attach;
	}
	
	
	
	
}
