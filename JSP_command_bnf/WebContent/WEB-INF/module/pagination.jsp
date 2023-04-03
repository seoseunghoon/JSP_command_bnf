<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	   
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />    
    
	<style>
	.paginate a:hover{
		background-color:skyblue !important;
	}
</style>
	
<div class="paginate"><a href="javascript:list_go(1);" class="pgFirst" title="처음 목록으로"> </a>
<a href="javascript:list_go(${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page});" class="pgPrev" title="이전 목록으로"><span>이전 목록으로</span></a>

<div class="number">

<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
		<a class="page-link" href="javascript:list_go('${pageNum}');" >${pageNum }</a>
</c:forEach>
</div>
<a href="javascript:list_go(${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page});" class="pgNext" title="다음 목록으로"><span>다음 목록으로</span></a>
<a href="javascript:list_go('${pageMaker.realEndPage}');"  class="pgEnd"  title="마지막 목록으로"><span>마지막 목록으로</span></a>

</div><!-- 페이징 -->


  
<form id="jobForm">	
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
</form>


