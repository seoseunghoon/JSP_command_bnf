<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<c:set var="cri" value="${dataMap.pageMaker }" />
	<c:set var="reportList" value="${dataMap.reportBoardList}" />


	<div id="skipNav">
		<a href="#contents">본문내용 바로가기</a>
	</div>

	<!-- start:header -->



	<!-- start:content -->
	<h3 class="titPage">신고합니다</h3>


	<div class="containerInnr">
		<script type="text/javascript">
			$(function() {
				$('#searchFrm').submit(
						function() {
							if ($("#srchBeginDt").val() != ""
									|| $("#srchEndDt").val() != "") {
								if ($("#srchBeginDt").val() == ""
										|| $("#srchEndDt").val() == "") {
									alert("검색일을 입력하세요.");
									return false;
								}
							}
						});
			});

			function f_certification() {
				if (confirm("로그인이 필요합니다.")) {
					location.href = "http://www.busan.go.kr/member/login?referUrl="
							+ location.href;
				}
			}
		</script>
		<!-- content -->
		<main id="contents">
			<h4 class="h4Bl mb30 txtCenter">
				<span style="font-size: 1.5em">규제 신고(제안)하기</span>
			</h4>
			<div class="content">
				<div class="security_box">
					<p class="txt01">
						<span>보안과 관련되어, 홈페이지에 접속하신 후 화면이동없이 30분이 경과되면 자동으로 로그아웃되오니
							작업시간에 유의하여 주시기 바랍니다. </span>
					</p>
					<p class="txt02">특히, 게시판 글쓰기를 하실 때, 세션 종료로 작성하신 글이 모두 삭제 될 수
						있으니 반드시 다른 곳에서 먼저 글을 작성 하신 후 복사 하여 붙여넣기 해서 글쓰기를 완료 하시기 바랍니다.</p>
				</div>
				<div class="boxStyle">
					<ul class="listStyle">
						<li>이 게시판은 <span class="colorRed">찾아가는 현장규제신고센터의 온라인
								신고(제안) 게시판이며, 자율과 책임이 공존하는 사이버문화 정착을 위해 실명으로 운영되고</span> 있습니다.
						</li>
						<li>시정관련 건의사항 또는 답변을 원하는 사항은 『민원신청』 코너를 이용하시기 바랍니다. <a
							title="민원신청 새창에 열기" class="button small color jump"
							href="https://www.busan.go.kr/minwon/myminwon" target="_blank">바로가기</a></li>
						<li><span class="colorBlack">상업성 광고, 저속한 표현, 특정인에 대한
								비방, 정치적 목적이나 성향, 반복적 게시물</span> 등은 관리자에 의해 통보 없이 삭제될 수 있습니다.</li>
						<li><span class="colorBlack">특히, 게시물을 통한 명예훼손 및
								주민등록번호, 계좌번호, 전화번호 등 개인정보 유출</span>은 법적 문제로 확대될 수 있으며, 불법 유해 정보를 게시하거나
							<span class="colorBlue">배포하면 정보통신망 이용촉진 및 정보보호 등에 관한 법률에
								따라 벌칙(징역 또는 벌금)</span>을 받을 수 있습니다.</li>
					</ul>

				</div>
			</div>
			<!-- Start Code -->
			<fieldset class="boardHead">
				<legend>목록내 검색</legend>
				<div class="boardSearchForm">
					<form id="searchFrm" name="searchFrm" class="form-search"
						method="post" action="/minwon/gujereportcenter">
						<div class="rowTable rowTableTypeSearchBar">
							<div class="row">
								<div class="group alone">

									<strong class="cellHeader txtCenter"><span
										class="cellHeaderInTxt">검색</span></strong>
									<div class="cell">
										<span class="cellInDv"> <label for="srchBeginDt"
											class="hidden">검색 시작일</label> <input id="srchBeginDt"
											name="srchBeginDt" type="text"
											class="textForm date jqdate-img" placeholder="검색시작일"
											title="YYYY-MM-DD 형식으로 날짜를 입력해주세요" value=""> <span
											class="hyphen">-</span> <label for="srchEndDt" class="hidden">검색
												종료일</label> <input id="srchEndDt" name="srchEndDt" type="text"
											class="textForm date jqdate-img" placeholder="검색종료일"
											title="YYYY-MM-DD 형식으로 날짜를 입력해주세요" value="">
										</span> <span class="cellInDv cellInDvSearch"> <span
											class="cellInDvSearchCell srchOption"> <label
												for="srchKey" class="hidden">검색조건 선택</label> <select
												id="srchKey" name="srchKey" class="selectForm"
												style="width: 12%; min-width: 80px;">
													<option value="sj">제목</option>
													<option value="cn">내용</option>
													<option value="wrter">작성자</option>
											</select>
										</span> <span class="cellInDvSearchCell srchKeyword"> <label
												for="srchText" class="hidden">검색어 입력</label> <input
												name="srchText" id="srchText" type="search" class="textForm"
												style="width: 33%;" placeholder="검색" value="" />
												<button type="submit"
													class="btnTypeM btnColorType2 btnIcoSearch">
													<span class="hidden-mo hidden-ta">검색</span>
												</button>
										</span>
										</span>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</fieldset>
			<p class="boardListTxt">
				총 <b class="totalNum">${cri.totalCount} </b>건( <b>${cri.startPage }
				</b>${cri.realEndPage }page)
			</p>


			<table class="boardList">
				<caption>찾아가는 현장규제신고센터목록순번,공개여부,제목,첨부파일,작성자,작성일,조회수 구성된 표
				</caption>
				<thead>
					<tr>
						<th style="width: 10%;" scope="col" class="pc_Y ta_Y mo_N">순번</th>
						<th scope="col" class="pc_Y ta_Y mo_Y nowrap">제목</th>
						<th style="width: 10%;" scope="col" class="pc_Y ta_Y mo_N">첨부파일</th>
						<th style="width: 10%;" scope="col" class="pc_Y ta_Y mo_N">작성자</th>
						<th style="width: 15%;" scope="col" class="pc_Y ta_Y mo_Y nowrap">작성일</th>
						<th style="width: 10%;" scope="col" class="pc_Y ta_Y mo_N">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="report" items="${reportList}">
						<tr>
							<td class="pc_Y ta_Y mo_Y title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${report.bno }</td>
							<td class="pc_Y ta_Y mo_Y title"><a
								href="javascript:OpenWindow('<%=request.getContextPath()%>/board/report/detail.do?bno=${report.bno}','reportDetail',800,800);">${report.title}</a>&nbsp;</td>
							<td class="pc_Y ta_Y mo_N"><c:if
									test="${!empty report.reportAttachList}">
								</c:if> <c:if test="${empty report.reportAttachList }">
								</c:if></td>


							<td class="pc_Y ta_Y mo_Y">${report.writer }</td>
							<td class="pc_Y ta_Y mo_Y nowrap"><fmt:formatDate
									value="${report.regDate}" pattern="yyyy-MM-dd" /></td>
							<td class="pc_Y ta_Y mo_Y">${report.viewCnt}</td>
						</tr>
					</c:forEach>
					<c:if test="${empty reportList}">
						<td colspan="6">게시글이 없습니다.</td>
					</c:if>
				</tbody>
			</table>

			<!--  페이지 네이션. jsp -->

			<div id="lv-container" data-id="busancity"
				data-uid="NjY2LzE2MzY0Lzc3NA=="></div>

			
			<!-- 페이징 -->

			<%-- <c:set var="cri" value="${dataMap.pageMaker.cri }" />
			<c:set var="pageMaker" value="${dataMap.pageMaker }" />

			<div class="paginate">
				<a href="javascript:list_go(1);" class="pgFirst" title="처음 목록으로">
				</a> <a
					href="javascript:list_go(${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page});"
					class="pgPrev" title="이전 목록으로"><span>이전 목록으로</span></a>

				<div class="number">

					<c:forEach var="pageNum" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<a class="page-link" href="javascript:list_go('${pageNum}');">${pageNum }</a>
					</c:forEach>
				</div>
				<a
					href="javascript:list_go(${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page});"
					class="pgNext" title="다음 목록으로"><span>다음 목록으로</span></a> <a
					href="javascript:list_go('${pageMaker.realEndPage}');"
					class="pgEnd" title="마지막 목록으로"><span>마지막 목록으로</span></a>

			</div>
 --%>

	<div style="display:${!empty reportList ? 'visible' : 'none'};">
	<%@ include file="/WEB-INF/module/pagination.jsp" %>
</div>



			<!-- 페이징 -->

			<div class="btnArea btnRt">
				<!-- 버튼 -->

				<a
					href="javascript:OpenWindow('<%=request.getContextPath()%>/board/report/registForm.do','Regist',800,800);"
					${report.bno} class="btnTypeM btnColorType1" title="본인인증-새창">글쓰기
				</a>
			</div>



			<!-- 비밀번호 입력 레이어  -->
			<div id="inputPassword" style="display: none;">
				<form id="bbsPasswordChkFrm" method="post">
					<div>
						<input type="hidden" name="bbsNo" id="bbsNo" value="" /> <input
							type="hidden" name="nttNo" id="nttNo" value="" /> <input
							type="password" name="password" id="password" placeholder="비밀번호"
							title="비밀번호" class="form-control"
							onkeypress="javascript:if(event.keyCode==13){f_bbsPasswordChk();return false;}" />
						<a class="btn btn-default mr-xs mb-sm" title="확인"
							onclick="f_bbsPasswordChk(); return false;">확인</a>
					</div>
				</form>
			</div>
	</div>
	<!-- 만족도 평가 및 의견쓰기 -->

	<!-- end:content -->

</body>
</html>