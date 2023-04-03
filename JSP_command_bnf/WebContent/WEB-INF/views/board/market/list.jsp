<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<c:set var="marketBoardList" value="${dataMap.marketBoardList}" />


<c:set var="pageMaker" value="${dataMap.pageMaker }"/>
<title> 나눔장터 : 대전민원120</title>


<div id= "location">
		<div class="locationInner">
			<div class="lineMap">
				<span class="hidden">현재 본문 위치 :</span>
				<span>Home</span> &gt; <span>시민참여</span> &gt;  <a href="#" class="colorBlack">나눔장터</a></div>
			
		</div>
	</div>
	<h3 class="titPage">
		나눔장터</h3>


<div class="containerInnr" >
		<script type="text/javascript">
	$(function() {
		$('#searchFrm').submit(function() {
			if($("#srchBeginDt").val() != "" || $("#srchEndDt").val() != "") {
				if($("#srchBeginDt").val() == "" || $("#srchEndDt").val() == "") {
					alert("검색일을 입력하세요.");
					return false;
				}
			}
 		});
	});

	function f_certification(){
		if(confirm("로그인이 필요합니다.")){
			location.href="http://www.busan.go.kr/member/login?referUrl="+location.href;
		}
	}
</script>
	<!-- content -->
	<main id="contents">
		<div class="content">
    
</div><!-- Start Code -->
		<fieldset class="boardHead">
			<legend>목록내 검색</legend>
			<div class="boardSearchForm">
				<form id="searchFrm" name="searchFrm" class="form-search" method="get" action="<%=request.getContextPath()%>/board/market/list.do">
				<div class="rowTable rowTableTypeSearchBar">
					<div class="row">
						<div class="group alone">

								<strong class="cellHeader txtCenter"><span class="cellHeaderInTxt">검색</span></strong>
								<div class="cell">
									<span class="cellInDv">
										<label for="srchBeginDt" class="hidden">검색 시작일</label>
										<input id="srchBeginDt" name="srchBeginDt" type="text" class="textForm date jqdate-img" placeholder="검색시작일" title="YYYY-MM-DD 형식으로 날짜를 입력해주세요" value="">
										<span class="hyphen">-</span>
										<label for="srchEndDt" class="hidden">검색 종료일</label>
										<input id="srchEndDt" name="srchEndDt" type="text" class="textForm date jqdate-img" placeholder="검색종료일" title="YYYY-MM-DD 형식으로 날짜를 입력해주세요" value="">
									</span>
									<span class="cellInDv cellInDvSearch">
										<span class="cellInDvSearchCell srchOption">
											<label for="srchKey" class="hidden">검색조건 선택</label>
											<select id="searchType" name="searchType" class="selectForm" style="width:12%;min-width:80px;">
												<option value="t" >제목</option>
												<option value="c" >내용</option>
												<option value="w" >작성자</option>
												<option value="a" >부서</option>
												<!-- <option value="tc" >내용/작성자</option> -->
												<option value="tcw" >제목/내용/작성자</option>
											</select>
										</span>
										<span class="cellInDvSearchCell srchKeyword">
											<label for="srchText" class="hidden">검색어 입력</label>
											<input name="keyword" id="keyword" type="search" class="textForm" style="width:33%;" placeholder="검색" value=""/>
											<button type="submit" class="btnTypeM btnColorType2 btnIcoSearch"><span class="hidden-mo hidden-ta">검색</span></button>
										</span>
									</span>
								</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</fieldset>
		<p class="boardListTxt">총 <b class="totalNum">${pageMaker.totalCount }</b>건 (<b>${pageMaker.cri.page }</b>/${pageMaker.realEndPage }page)</p>
		
		<c:if test="${loginUser.authority} == 'manager'">
			
		</c:if>
		<div class="btnArea btnRt">
			<!-- 수정버튼 -->
			<%-- <button class="btnTypeM btnLineType1" id="write" onclick="location.href='<%= request.getContextPath()%>/market/board/registForm.do'">글작성</button> --%>
			
			<button class="btnTypeM btnLineType1" id="write" onclick="OpenWindow('<%= request.getContextPath()%>/board/market/registForm.do','상세보기',800,600)">글작성</button>
		</div>
		
		<table class="boardList">
		
	<thead>
		<tr>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">순번</th>
			<th scope="col" class="pc_Y ta_Y mo_Y nowrap">제목</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">첨부파일</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">부서명</th>
			<th style="width:15%;" scope="col" class="pc_Y ta_Y mo_Y nowrap">작성일</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">조회수</th>
			</tr>
	</thead>

	<tbody>
		<!-- 공지사항 목록 -->
		<!-- 일반게시물 목록 -->
						
						
			<c:if test="${empty marketBoardList}">
				<td colspan="6">게시글이 없습니다.</td>
			</c:if>
			
			<c:forEach items="${marketBoardList}" var="board">
				<!-- 제목 -->
				<tr>
								<td class="pc_Y ta_Y mo_N">
								${board.bno}</td>
								<td class="pc_Y ta_Y mo_Y title">
									<a href="javascript:OpenWindow('<%= request.getContextPath()%>/board/market/detail.do?bno=${board.bno}&from=list','상세보기',800,600)"> ${board.title} </a>
								</td>
							<!-- 첨부파일-->	
								<td>
									<c:if test="${!empty board.attachList }">
										<img src="<%= request.getContextPath()%>/image/ico_download_ai.png" alt="첨부파일">
									</c:if>
								
								</td>
							<!-- 부서 -->	
								<td class="pc_Y ta_Y mo_N">${board.depart} </td>
							<!-- 작성일 -->
								<!--<td class="pc_Y ta_Y mo_Y nowrap">${board.regDate}</td> -->
								 <td><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
							<!-- 나머지 -->
								<!-- <td class="pc_Y ta_Y mo_N">${board.updateDate}</td> -->
								
								
							<!-- 뷰 카운트 -->	
								<td class="pc_Y ta_Y mo_N">${board.viewCNT}</td>
				</tr>
			</c:forEach>
		
		</tbody>
</table>


<!--  페이지 네이션. jsp -->

<div style="display:${!empty marketBoardList ? 'visible' : 'none'};">
	<%@ include file="/WEB-INF/module/pagination.jsp" %>
</div>

<!--  페이지 네이션. jsp -->

<div id="lv-container" data-id="busancity" data-uid="NjY2LzE2MzY0Lzc3NA==">

</div></main></div>
</div>
	