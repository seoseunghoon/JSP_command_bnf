<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- start:content -->
<div id="container">
   <div id="location">
      <div class="locationInner">
         <div class="lineMap">
            <span class="hidden">현재 본문 위치 :</span>
            <span>Home</span> &gt; <span>시민참여</span> &gt; <a href="/minwon/citizenboard01" class="colorBlack">신고합니다</a></div>
         <ul class="shareArea">
            <li class="share">
               <a href="#">공유하기 열기</a>
               <div class="shareBox">
                  <ul class="shareList">

                     <li class="naverband"><a href="#" onclick="f_share('band', '시민게시판'); return false;" title="새창열기" target="_blank">네이버 밴드</a></li>
                     <li class="kakaostory"><a href="#" onclick="f_share('kakao', '시민게시판'); return false;" title="새창열기" target="_blank">카카오 스토리</a></li>
                     <li class="twitter"><a href="#" onclick="f_share('twitter', '시민게시판'); return false;" title="새창열기" target="_blank">트위터</a></li>
                     <li class="facebook"><a href="#" onclick="f_share('facebook', '시민게시판'); return false;" title="새창열기" target="_blank">페이스북</a></li>
                  </ul>
               </div>
            </li>
            <li class="print"><a href="#" >프린트</a></li>
            <li class="bookmark"><a href="#" onclick="addBookMark('>Home>시민참여>시민게시판','부산민원120'); return false" title="클릭하시면 북마크에 등록됩니다">북마크</a></li>
         </ul>
      </div>
   </div>
   <h3 class="titPage">
      신고합니다</h3>


<div class="containerInnr">

</div><form id="frmNtt" name="frmNtt" method="post" enctype="multipart/form-data" >
         <input type="hidden" name="crud" id="crud" value=""/>
         <input type="hidden" name="bbsNo" id="bbsNo" value="360"/>
         <input type="hidden" name="nttNo" id="nttNo" value="1553455"/>
         <input type="hidden" name="srchYear" value="360"/>
         <input type="hidden" name="srchMonth" value="1553455"/>
      </form>
      
      <div class="boardView">
         <div class="form-group">
            <h4 class="form-data-subject">${ reportBoard.title }</h4>
         </div>
         
         <!-- 부서명 -->
            <!-- 전화번호 -->
         <!-- 첨부파일 -->
         <div class="form-group">
            <dl class="form-data-info">
               <dt><span>첨부파일</span></dt>
               <c:forEach items="${reportBoard.reportAttachList }" var="attach">
               <dd><a href="<%= request.getContextPath()%>/market/board/getFile.do?ano=${reportAttach.ano}">${reportAttach.fileName}</a></dd>
               </c:forEach>
               <dd>
                  <ul class="attfiles">
                     <li>
                           <a href="/comm/getFile?srvcId=BBSTY2&amp;upperNo=1553455&amp;fileTy=ATTACH&amp;fileNo=1" title="다운로드"></a>
                            (파일크기: 580 KB, 다운로드 : 1회)
                           <a href="javascript:f_filePreivew('BBSTY2', '1553455', 'ATTACH', '1');" class="btnTypeS btnColorType5" title="새창">미리보기</a>
                        </li>
                     </ul>
               </dd>
            </dl>
         </div>
         <div class="form-group">
            <dl class="form-data-content">
               <!-- 내용 -->
               <dt><span>내용</span></dt>
               <dd><p>${ reportBoard.content }</p></dd>
            </dl>
         </div>

      <div class="btnArea btnRt">
         <!-- 수정버튼 -->
         
         
         <div class="btnArea btnRt">
         <!-- 수정버튼 -->
        <a href="<%= request.getContextPath() %>/board/report/modify.do?bno=${reportBoard.bno}" class="btnTypeM btnLineType1" title="수정">수정</a>
         <a href="<%= request.getContextPath() %>/board/report/remove.do?bno=${reportBoard.bno}" class="btnTypeM btnLineType1" title="삭제">삭제</a>
         <a href="<%= request.getContextPath() %>/board/report/close.do" class="btnTypeM btnLineType1" title="수정">닫기</a>
     
      </div>
      </div>
      
</div>

   <!-- 비밀번호 입력 레이어  -->
   </div>
<!-- end:content -->