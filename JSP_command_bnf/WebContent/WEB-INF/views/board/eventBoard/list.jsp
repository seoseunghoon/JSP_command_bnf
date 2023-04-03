<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="eventBoardList" value="${dataMap.eventBoardList }"/>


		<div id="location">
			<div class="locationInner">
				<div class="lineMap">
					<span class="hidden">현재 본문 위치 :</span> <span>Home</span> &gt; <span>시민참여</span>
					&gt; <a href="/minwon/occation" class="colorBlack">행사 모집</a>
				</div>
				
			</div>
		</div>
		
<h3 class="titPage">행사 모집</h3>
										
		<div class="containerInnr">
		 

			<!-- content -->
			<main id="contents">
			<!-- 글쓰기 -->
         <a href="<%= request.getContextPath() %>/board/eventBoard/regist.do" class="btnTypeM btnLineType1" title="글씨기">글쓰기</a>
		
				<!-- Start Edit -->
				<!-- @콘텐츠 영역 -->
				<div class="content">
				
					<fieldset class="boardHead">
					
						<legend>목록 검색</legend>
						
						<div class="boardSearchForm">
							<form id="searchFrm" name="searchFrm" method="get"
								action="/minwon/occation/list">
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
											<select id="srchKey" name="srchKey" class="selectForm" style="width:12%;min-width:80px;">
												<option value="sj" >제목</option>
												<option value="cn" >내용</option>
												<option value="wrter" >작성자</option>
											</select>
										</span>
										<span class="cellInDvSearchCell srchKeyword">
											<label for="srchText" class="hidden">검색어 입력</label>
											<input name="srchText" id="srchText" type="search" class="textForm" style="width:33%;" placeholder="검색" value=""/>
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

				<p class="boardListTxt">총 <b class="totalNum">9</b>건 (<b>1</b>/1page)</p>
		
		
		

					<table class="boardList">
						<thead>
							<tr>
								<th scope="col" style="width:7%" class="pc_Y ta_Y mo_N">번호</th>
								<th scope="col" style="width:auto" class="pc_Y ta_Y mo_Y nowrap">모집명</th>
								<th scope="col" style="width:10%" class="pc_Y ta_Y mo_Y">대상</th>
								<th scope="col" style="width:15%" class="pc_Y ta_Y mo_Y">모집기간</th>
								<th scope="col" style="width:10%" class="pc_Y ta_N mo_N">전화번호</th>
								<th scope="col" style="width:15%" class="pc_Y ta_N mo_N">추진부서</th>
								<th scope="col" style="width:7%" class="pc_Y ta_Y mo_Y">진행상태</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty eventBoardList }">
								<td colspan="5">게시글이 없습니다.</td>
							</c:if>

						<c:forEach  var="board" items ="${eventBoardList}">
							<tr>
								<td class="pc_Y ta_Y mo_N">${board.bno }</td>
								<td class="pc_Y ta_Y mo_Y title"><a href="javascript:OpenWindow('<%=request.getContextPath()%>/board/eventBoard/detail.do?bno=${board.bno}','eventBoardDetail',1280,720);" >${board.title}</a></td>
								<td class="pc_Y ta_Y mo_Y">회원</td>
								<td class="pc_Y ta_Y mo_Y">
									<fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/> &nbsp;~&nbsp;<c:if test="${empty board.endDate }"></c:if></td>
								<td class="pc_Y ta_N mo_N">051-500-2121</td>
								<td class="pc_Y ta_N mo_N">운영팀</td>
								<td class="pc_Y ta_Y mo_Y">마감</td>
							</tr>
							</c:forEach>
						
						</tbody>
					</table>

					<!-- paging -->
				
					<div class="paginate">
						<a href="?curPage=1" class="pgFirst" title="처음 목록으로"><span>처음
								목록으로</span></a> <a href="#none" class="pgPrev" title="이전 목록으로"><span>이전
								목록으로</span></a>
						<div class="number">
							<strong title="현재페이지">1</strong> <a href="?curPage=2"
								title="2 페이지">2</a> <a href="?curPage=3" title="3 페이지">3</a> <a
								href="?curPage=4" title="4 페이지">4</a> <a href="?curPage=5"
								title="5 페이지">5</a> <a href="?curPage=6" title="6 페이지">6</a> <a
								href="?curPage=7" title="7 페이지">7</a> <a href="?curPage=8"
								title="8 페이지">8</a> <a href="?curPage=9" title="9 페이지">9</a> <a
								href="?curPage=10" title="10 페이지">10</a>
						</div>
						<a href="?curPage=11" class="pgNext" title="다음 목록으로"><span>다음
								목록으로</span></a> <a href="?curPage=13" class="pgEnd" title="마지막 목록으로"><span>마지막
								목록으로</span></a>

					</div>
				</div>

				<!-- //End Edit -->
			</main>
			<!-- //content -->
		</div>
	