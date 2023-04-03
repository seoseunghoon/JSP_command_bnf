<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta name="robots" content="noindex">
<title>시민게시판 : PROJECT BNF</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/global/assets/vendor/jquery-ui/jquery-ui.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/global/assets/css/global.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/theme/minwon/assets/css/common.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/theme/minwon/assets/css/content.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/theme/minwon/assets/css/jquery.datetimepicker.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/global/assets/css/print.css"
	media="print">

<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>

</head>

<!-- start:content -->
<div id="container">

	<div class="containerInnr">

		<div id="contents">
			<!-- <div class="content">
				<!-- <div class="security_box">
        <p class="txt01"><span>보안과 관련되어, 홈페이지에 접속하신 후 화면이동없이 30분이 경과되면 자동으로 로그아웃되오니 작업시간에 유의하여 주시기 바랍니다. </span></p>
        <p class="txt02">특히, 게시판 글쓰기를 하실때, 세션 종료로 작성하신 글이 모두 삭제 될 수 있으니 반드시 다른곳에서 먼저 글을 작성 하신 후 복사 하여 붙여넣기 해서 글쓰기를 완료
            하시기 바랍니다. </p>
    </div> -->
				<!-- <div class="boxStyle">
        <ul class="listStyle">
            <li>이 게시판은 <span class="colorBlue">자유롭게 의견을 게시 할 수 있는 열린공간</span>이며, 자율과 책임이 공존하는 사이버문화 정착을 위하여 실명으로 운영되고
                있습니다.</li>
            <li>부산시에 대한 신고, 제안, 건의 등 <span class="colorBlue">답변이나 개선이 필요한 사항에 대해서는<a title="민원신청 새창 바로가기" class="button small color icon jump" href="/minwon/myminwon" target="_blank"> 부산민원120-민원신청</a>을 이용</span>해 주시고, <span class="colorBlue">내용 입력시 주민등록번호, 연락처 등 개인정보가 노출되지 않도록 주의</span>하시기 바랍니다.</li>
            <li><span class="colorBlack">상업성 광고, 저속한 표현, 특정인에 대한 비방, 정치적 목적이나 성향, 반복적 게시물, 개인정보</span>&nbsp;등은 관리자에 의해
                통보 없이 삭제 될 수 있으며, <span class="colorBlack">특히, 게시물을 통한 명예훼손 및 주민등록번호, 계좌번호, 전화번호 등 개인정보유출</span>은 법적
                문제로 확대될 수 있으며, 불법유해정보를 게시하거나 <span class="colorBlue">배포하면 정보통신망이용촉진 및 정보보호 등에 관한 법률에 따라 벌칙(징역 또는 벌금)</span>을
                받을 수 있습니다.</li>
        </ul>
    </div> -->

<!-- 			</div>-->
			<form id="frmNtt" name="frmNtt" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="crud" id="crud" value="" /> <input
					type="hidden" name="bbsNo" id="bbsNo" value="360" /> <input
					type="hidden" name="nttNo" id="nttNo" value="1553455" /> <input
					type="hidden" name="srchYear" value="360" /> <input type="hidden"
					name="srchMonth" value="1553455" />
			</form>

			<div class="boardView">

				<div class="btnArea btnRt">
					<!-- 수정버튼 -->
					<a href="<%=request.getContextPath()%>/board/citizen/detail.do"
						class="btnTypeM btnLineType1" title="수정">수정</a>
					<!-- 삭제버튼 -->
					<a href="<%=request.getContextPath()%>/board/citizen/detail.do"
						class="btnTypeM btnLineType1" title="삭제" onClick="<%=request.getContextPath()%>/board/citizen/remove_success.do">삭제</a>
					<!-- 닫기버튼 -->
					<a href="<%=request.getContextPath()%>/board/citizen/detail.do"
						class="btnTypeM btnLineType1" title="닫기" onClick="CloseWindow();">닫기</a>
				</div>

				<div class="form-group">
					<h4 class="form-data-subject">${ citizenBoard.title }</h4>
				</div>

				<!-- 부서명 -->
				<!-- 전화번호 -->
				<!-- 첨부파일 -->
				<div class="form-group">
					<dl class="form-data-info">

						<!-- 작성자 -->
						<dt>
							<span>작성자</span>
						</dt>
						<dd>${ citizenBoard.writer }</dd>
						<!-- 작성일 -->
						<dt>
							<span>작성일</span>
						</dt>
						<dd>
							<fmt:formatDate value="${ citizenBoard.regDate }"
								pattern="yyyy-MM-dd" />
						</dd>
						<!-- 수정일 -->
						<dt>
							<span>수정일</span>
						</dt>
						<dd>
							<fmt:formatDate value="${ citizenBoard.updateDate }"
								pattern="yyyy-MM-dd" />
						</dd>
						<!-- 조회수 -->
						<dt>
							<span>조회수</span>
						</dt>
						<dd>${ citizenBoard.viewCNT }</dd>

					</dl>
				</div>

				<div class="form-group">
					<dl class="form-data-info">
						<dt>
							<span>첨부파일</span>
						</dt>
						<dd>
							<ul class="attfiles">
								<li><a href="<%= request.getContextPath()%>/board/citizen/getFile.do?ano=${citizenAttach.ano}">${citizenAttach.fileName}</a></li>
							</ul>
						</dd>
					</dl>
				</div>

				<div class="form-group">
					<dl class="form-data-content">
						<!-- 내용 -->
						<dt>
							<span>내용</span>
						</dt>
						<dd>
							<p>${ citizenBoard.content }</p>
						</dd>
					</dl>
				</div>

			</div>

		</div>

		<!-- 비밀번호 입력 레이어  -->
		<!-- <div id="inputPassword" style="display: none;">
			<form id="bbsPasswordChkFrm" method="post">
				<div>
					<input type="hidden" name="crud" id="crud1" value="" /> <input
						type="hidden" name="actionTy" id="actionTy" value="" /> <input
						type="hidden" name="bbsNo" id="bbsNo1" value="360" /> <input
						type="hidden" name="nttNo" id="nttNo1" value="1553455" /> <label
						for="password" class="hidden">비밀번호</label> <input type="password"
						name="password" id="password" placeholder="비밀번호" title="비밀번호"
						class="form-control"
						onkeypress="javascript:if(event.keyCode==13){f_bbsPasswordChk();return false;}" />
					<a class="btn btn-default mr-xs mb-sm" title="확인"
						onclick="f_bbsPasswordChk(); return false;">확인</a>
				</div>
			</form>
		</div> -->
	</div>
</div>
<!-- end:content -->