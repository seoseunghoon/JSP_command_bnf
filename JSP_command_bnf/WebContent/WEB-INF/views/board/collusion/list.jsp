<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="collusionList" value="${dataMap.collusionList }" />

<div id="location">
		<div class="locationInner">
			<div class="lineMap">
				<span class="hidden">현재 본문 위치 :</span>
				<span>Home</span> &gt; <span>시민참여</span> &gt; <span>민생규제혁신과제</span> &gt; <a href="#" class="colorBlack">공모하기</a></div>
			
		</div>
	</div>
	<h3 class="titPage">
		공모하기</h3>


<div class="containerInnr">

	<!-- content -->
	<main id="contents">
		<div class="content">
    <div class="security_box">
        <p class="txt01"><span>보안과 관련되어, 홈페이지에 접속하신 후 화면이동없이 30분이 경과되면 자동으로 로그아웃되오니 작업시간에 유의하여 주시기 바랍니다. </span></p>
        <p class="txt02">특히, 게시판 글쓰기를 하실 때, 세션 종료로 작성하신 글이 모두 삭제 될 수 있으니 반드시 다른 곳에서 먼저 글을 작성 하신 후 복사 하여 붙여넣기 해서 글쓰기를 완료 하시기 바랍니다. </p>
    </div>
    <div class="boxStyle">
        <ul class="listStyle">
            <li>이 게시판은 민생규제 혁신 과제 공모를&nbsp;<span class="colorBlue">게시하는 공간</span>이며, 자율과 책임이 공존하는 사이버문화 정착을 위하여 실명으로 운영되고 있습니다.</li>
            <li>시정관련 건의사항 또는 답변을 원하는 사항은 『민원신청』 코너를 이용하시기 바랍니다.
            <a title="민원신청 새창에 열기" class="button small color jump" href="https://www.busan.go.kr/minwon/myminwon" target="_blank">바로가기</a></li>
            <li><span class="colorBlack">상업성 광고, 저속한 표현, 특정인에 대한 비방, 정치적 목적이나 성향, 반복적 게시물</span> 등은 관리자에 의해 통보 없이 삭제될 수 있습니다.</li>
            <li><span class="colorBlack">특히, 게시물을 통한 명예훼손 및 주민등록번호, 계좌번호, 전화번호 등 개인정보 유출</span>은 법적 문제로 확대될 수 있으며, 불법 유해 정보를 게시하거나 <span class="colorBlue">배포하면 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 벌칙(징역 또는 벌금)</span>을 받을 수 있습니다.</li>
        </ul>
        <h4 class="h4Bl">
            <span class="colorRed"><strong>※ 제안서 서식을 다운받아 내용을 작성하신 후 반드시 첨부하여 주시기 바랍니다.</strong></span><br>
            <span class="colorRed"><strong>※ 제안서 서식을&nbsp;작성하여&nbsp;첨부하지 않은 경우에는 응모하지 않은 것으로 간주합니다. </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>	<br></span>
        </h4>
    
    <div class="btn-box-group">
        <a title="제안서 서식 다운로드" class="button icon down large color" href="/comm/getFile?srvcId=MEDIA&amp;upperNo=11207&amp;fileTy=MEDIA&amp;fileNo=1">제안서 서식 다운로드</a>
        <a title="제안서 작성예시 다운로드" class="button icon down large color" href="/comm/getFile?srvcId=MEDIA&amp;upperNo=11246&amp;fileTy=MEDIA&amp;fileNo=1">제안서 작성예시 다운로드</a>
    </div>
    
    </div>
</div>
<!-- Start Code -->
		<fieldset class="boardHead">
			<legend>목록내 검색</legend>
			<div class="boardSearchForm">
				<form id="searchFrm" name="searchFrm" class="form-search" method="post" action="/minwon/gujeideaoffer02">
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
<caption>공모하기목록순번,공개여부,제목,첨부파일,작성자,작성일,조회수 구성된 표
    </caption>
	<thead>
		<tr>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">순번</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">공개여부</th>
			<th scope="col" class="pc_Y ta_Y mo_Y nowrap">제목</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">첨부파일</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">작성자</th>
			<th style="width:15%;" scope="col" class="pc_Y ta_Y mo_Y nowrap">작성일</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">조회수</th>
			</tr>
	</thead>

	<tbody>
		<!-- 공지사항 목록 -->
		<!-- 일반게시물 목록 -->
		<c:if test="${empty collusionList}">
		<tr>
				<td colspan="5">게시글이 없습니다.</td>
				</tr>
			</c:if>
		<c:forEach items="${collusionList }" var="board">
		<tr>
				<!-- 순번 -->
							<td class="pc_Y ta_Y mo_N">
								${board.bno}</td>
						<!-- 공개여부 -->
								<td class="pc_Y ta_Y mo_N">
									<img src="${ board.openner eq 1 ? '/JSP_command_bnf/image/ico_lock_on.png' : '/JSP_command_bnf/image/ico_lock_off.png' };" >
								</td>
								
								<%-- <img src="<%=request.getContextPath() %>/image/ico_lock_off.png" alt="비공개"> --%>
							</td>
						<!-- 제목 -->
							<td class="pc_Y ta_Y mo_Y title">
								<a href="#" onclick="f_showPasswordDialog('/minwon/gujeideaoffer02/1522962', '721', '1522962'); return false;">
											${board.title }</a>
							</td>
						<!-- 첨부파일 -->
							<td class="pc_Y ta_Y mo_N">
							</td>
						<!-- 작성자 -->
							<td class="pc_Y ta_Y mo_N">
								${board.writer }</td>
						<!-- 작성일 -->
							<td class="pc_Y ta_Y mo_Y nowrap">
								<fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/>
							</td>
						<!-- 조회수 -->
							<td class="pc_Y ta_Y mo_N">${board.viewCNT }</td>
						</tr>
		</c:forEach>
		
		</tbody>
</table><div class="paginate"><a href="?curPage=1"   class="pgFirst" title="처음 목록으로"><span>처음 목록으로</span></a>
<a href="#none" class="pgPrev" title="이전 목록으로"><span>이전 목록으로</span></a>
<div class="number">
<strong title='현재페이지'>1</strong>
</div>
<a href="#none" class="pgNext" title="다음 목록으로"><span>다음 목록으로</span></a>
<a href="?curPage=1"  class="pgEnd"  title="마지막 목록으로"><span>마지막 목록으로</span></a>

</div><!-- 페이징 -->
		<div class="btnArea btnRt"><!-- 버튼 -->
				<a href="javascript:f_certification();" class="btnTypeM btnColorType1" title="본인인증-새창">글쓰기</a></div>
		<!-- 비밀번호 입력 레이어  -->
		<div id="inputPassword" style="display: none;">
			<form id="bbsPasswordChkFrm" method="post">
				<div>
					<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
					<input type="hidden" name="nttNo" id="nttNo" value=""/>
					<input type="password" name="password" id="password" placeholder="비밀번호" title="비밀번호" class="form-control" onkeypress="javascript:if(event.keyCode==13){f_bbsPasswordChk();return false;}"/>
					<a class="btn btn-default mr-xs mb-sm" title="확인" onclick="f_bbsPasswordChk(); return false;">확인</a>
				</div>
			</form>
		</div>

		<!-- 만족도 평가 및 의견쓰기 -->
		<div id="pageSatisfy">
			<h2 class="invisible">페이지 만족도 조사 및 자료관리 담당자</h2>
			
			<!-- 담당자 정보 -->
<!-- 콘텐츠외에 전부 예외로 -->
				<div class=" manager aftB">
		    <h3>자료관리 담당자</h3>
		    <dl>
				<dt>규제혁신추진단</dt>
				<dd>주현호&nbsp;(051-888-2601)</dd>
				<dt></dt>
				<dd></dd>
			</dl>
		</div>					
					<!-- //담당자 정보 -->
			
			<!-- 만족도 평가 및 의견쓰기 -->
			<form id="satisfactionForm" name="satisfactionForm" method="post">
				<input type="hidden" name="crud" value="">
				<input type="hidden" name="menuNo" value="9658" title="메뉴번호">
			    <fieldset>
			        <legend class="invisible">만족도 조사 및 의견</legend>
			        <section>
			        	<h2 style="display: none;">페이지만족도</h2>
			            <article class="article_h">
			                <header>
			                	<h2 style="display:none;">페이지만족도</h2>
			                    <p>이 페이지에서 제공하는 정보에 만족하십니까?</p>
			                    <div class="point"><span>평균 : <span id="stsfdg_avgScore">0</span>점</span><span>참여 : <span id="stsfdg_totCnt">0</span>명</span></div>
			                </header>
			                <div class="satisfyInner">
			                	<span>
				                    <input id="score1" name="score" type="radio" value="5" checked="checked">
				                    <label for="score1">매우만족</label>
			                    </span>
			                    <span>
				                    <input id="score2" name="score" type="radio" value="4">
				                    <label for="score2">만족</label>
			                    </span>
			                    <span>
				                    <input id="score3" name="score" type="radio" value="3">
				                    <label for="score3">보통</label>

			                    </span>
			                    <span>
				                    <input id="score4" name="score" type="radio" value="2">
				                    <label for="score4">불만</label>
			                    </span>
			                    <span>
				                    <input id="score5" name="score" type="radio" value="1">
				                    <label for="score5">매우불만</label>
			                    </span>
			                    <div class="comment">
			                        <input type="button" value="평점주기" class="button" onclick="saveStsfdy('CREATE',0);return false;">
			                    </div>
			                </div>
			            </article>
			        </section>
			    </fieldset>
			</form>
			<!-- //만족도 평가 및 의견쓰기 -->
		</div><div class="boxStyle" id="replyNotice">
	<p class="fsNone mb20">댓글은 자유로운 의견 공유를 위한 장이므로 부산시에 대한 신고, 제안, 건의 등 답변이나 개선이 필요한 사항에 대해서는<br><span class="bold"><a href="https://www.busan.go.kr/minwon/myminwon" target="blank" title="새창열림" >부산민원 120 - 민원신청<img src="<%=request.getContextPath() %>/image/ico_newin.png" alt="새창열림 아이콘"></a></span> 을 이용해 주시고, 내용 입력시 주민등록번호, 연락처 등 개인정보가 노출되지 않도록 주의하여 주시기 바랍니다.</p>
 	<p class="fsNone">상업광고, 저속한 표현, 정치적 내용, 개인정보 노출 등은 별도의 통보없이 삭제될 수 있습니다.</p>
</div>

<div id="lv-container" data-id="busancity" data-uid="NjY2LzE2MzY0Lzc3NA==">

<noscript>라이브리 댓글 작성을 위해 JavaScript를 활성화해주세요</noscript>
</div></main></div>
	