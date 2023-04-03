<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${ dataMap.pageMaker }" />

<c:set var="citizenList" value="${ dataMap.citizenList }" />

<body>
	<div id="location">
		<div class="locationInner">
			<div class="lineMap">
				<span class="hidden">현재 본문 위치 :</span> <span>Home</span> &gt; <span>시민참여</span>
				&gt; <a href="/minwon/citizenboard01" class="colorBlack">시민게시판</a>
			</div>

		</div>
	</div>
	<h3 class="titPage">시민게시판</h3>


	<div class="containerInnr">
		<script type="text/javascript">
			/* if (confirm("로그인이 필요합니다.")) {
				location.href = "http://www.busan.go.kr/member/login?referUrl="
						+ location.href;
			} */
		</script>
		<form id="excelFrm" name="searchFrm" class="form-search" method="get"
			action="./list">
			<input type="hidden" name="bbsNo" id="bbsNo" value="360" /> <input
				type="hidden" name="srchCtgry" value="" /> <input type="hidden"
				name="srchBeginDt" value="" /> <input type="hidden"
				name="srchEndDt" value="" /> <input type="hidden" name="srchKey"
				value="" /> <input type="hidden" name="srchText" value="" />
		</form>
	</div>

	<!-- content -->
	<div id="contents">
		<h3 class="titPage">시민게시판</h3>
		<div class="content">

			<!-- 버튼 -->
			<span style="float: right;">
				<button type="button" class="btnTypeM btnColorType1"
					onClick="location.href='<%=request.getContextPath()%>/board/citizen/registForm.do'">글쓰기</button>
			</span>


			<!-- Start Code -->

			<p class="boardListTxt">
				총 <b class="totalNum">${pageMaker.totalCount}</b>건 (<b>${pageMaker.cri.page}</b>/${pageMaker.realEndPage}page)
			</p>

			<table class="boardList">
				<caption>시민게시판목록 : 번호,제목,첨부파일,작성자,작성일 구성된 표</caption>
				<thead>
					<tr>
						<th style="width: 10%;" scope="col" class="pc_Y ta_Y mo_N">번호</th>
						<th scope="col" class="pc_Y ta_Y mo_Y nowrap">제목</th>
						<th style="width: 10%;" scope="col" class="pc_Y ta_Y mo_N">첨부파일</th>
						<th style="width: 10%;" scope="col" class="pc_Y ta_Y mo_N">작성자</th>
						<th style="width: 15%;" scope="col" class="pc_Y ta_Y mo_Y nowrap">작성일</th>
						<th style="width: 15%;" scope="col" class="pc_Y ta_Y mo_Y">조회수</th>
					</tr>
				</thead>
				<tbody>
					<!-- 공지사항 목록 -->
					<!-- 일반게시물 목록 -->

					<c:if test="${empty citizenList}">
						<td colspan="6">게시된 글 없음.</td>
					</c:if>

					<tr>
						<!-- 순번 -->

						<c:forEach var="citizen" items="${ citizenList }">
							<tr>
								<td class="pc_Y ta_Y mo_Y ">&nbsp;${citizen.bno }</td>
								<td class="pc_Y ta_Y mo_Y "><a
									href="javascript:OpenWindow('<%=request.getContextPath()%>/board/citizen/detail.do?bno=${citizen.bno}','citizenDetail',1280,720);">${citizen.title}</a>&nbsp;</td>
								<td class="pc_Y ta_Y mo_Y "><c:if
										test="${!empty citizen.citizenAttachList}">
										<img src="" alt="첨부파일" />
									</c:if></td>
								<td class="pc_Y ta_Y mo_Y ">&nbsp;${citizen.writer }</td>
								<td class="pc_Y ta_Y mo_Y nowrap"><fmt:formatDate
										value="${citizen.regDate }" pattern="yyyy-MM-dd"></fmt:formatDate>
								</td>
								<td class="pc_Y ta_Y mo_N">${citizen.viewCNT}</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>

		</div>
		<!-- 페이징 -->

		<div style="display:${!empty citizenList ? 'visible' : 'none'};">
			<%@ include file="/WEB-INF/module/pagination.jsp"%>
		</div>

		<!--  페이지 네이션. jsp -->

		<div id="lv-container" data-id="busancity"
			data-uid="NjY2LzE2MzY0Lzc3NA=="></div>

	</div>
</body>