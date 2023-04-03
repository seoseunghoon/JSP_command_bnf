<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta name="robots" content="noindex">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-1.7.2.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/login/login_total.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/login/reset.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/login/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/global/assets/vendor/jquery-ui/jquery-ui.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/global/assets/css/global.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/theme/minwon/assets/css/common.css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/theme/minwon/assets/css/content.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/theme/minwon/assets/css/jquery.datetimepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/global/assets/css/print.css" media="print">
<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/jquery/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/jquery-ui/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/theme/minwon/assets/script/jquery.datetimepicker.js"></script>

<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/plugins/jquery.validate.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/plugins/jquery.validate.rule.js"></script>
<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/plugins/jquery.cookie.js"></script>
<!--
<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/netfunnel/netfunnel.js"></script>
<script src="<%=request.getContextPath() %>/resources/global/assets/script/global.js"></script>
  -->
<script src="<%=request.getContextPath() %>/resources/theme/minwon/assets/script/common.js"></script>

<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/plugins/localization/messages_ko.js"></script>
<script src="<%=request.getContextPath() %>/resources/theme/minwon/assets/script/date.js"></script>


<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>

</head>

<body>

<div id="skipNav"><a href="#contents">본문내용 바로가기</a></div>

<!-- start:header -->



<header id="header">
	<div class="header-top">
		<div class="header-inner">	
			<div class="header-logo">
				<div class="header-logo-area">
					<a href="<%=request.getContextPath() %>/index.do"><img src="<%=request.getContextPath() %>/image/logo_busan.png" alt="부산광역시"></a>
					<a href="<%=request.getContextPath() %>/index.do"><img src="<%=request.getContextPath() %>/image/logo_minwon.png" alt="부산민원120"></a>
				</div>
			</div>
			<div class="header-search">
				<button class="header-search-btn">통합검색</button>
				<div class="header-search-area">
					<form id="srchFrm" name="srchFrm" action="https://www.busan.go.kr/search/total" method="get">
						<fieldset>
							<legend>통합검색</legend>
							<input type="hidden" id="siteNo" name="siteNo" value="">
							<label for="searchText" class="hidden">검색어 입력</label>
							<input id="searchText" name="searchText" type="text" placeholder="검색어를 입력하세요.">
							<button class="search-btn">검색</button>
						</fieldset>
					</form>
				</div>
			</div>
			<div class="header-util">
				<ul class="header-util-area">
				
				
					
				</ul>
			</div>
		</div>
	</div>
	<div class="header-body">
		<div class="header-inner">
		<button type="button" class="btn-nav"><span>메뉴보기</span></button>
		<nav class="header-nav">
			<div class="header-nav-util">
				<c:if test="${empty loginUser}">
					<a href="https://www.busan.go.kr/member/register-step01">회원가입</a>
					<a href="https://www.busan.go.kr/member/login?referUrl=https://www.busan.go.kr/minwon/index">로그인</a>
				</c:if>
				<c:if test="${!empty loginUser}">
					<a href="">로그아웃</a>
				</c:if>
				</div>
			<ul class="header-nav-menu">
				<li>
						<a href="/minwon/myminwon" ><span>민원신청</span></a>
							<button type="button" class="dropdown">하위메뉴 열기</button>
						<ul class="header-nav-sub">
			        		<li>
						<a href="/minwon/myminwon"><span>민원신청</span></a>
							</li>
			            <li>
						<a href="/minwon/Information"><span>부산민원120 이용안내</span></a>
							</li>
			            <li>
						<a href="/minwon/monthlyminwon"><span>이달의 주요민원</span></a>
							</li>
			            <li>
						<a href="/minwon/traffic2"><span>교통불편 민원신청</span></a>
							</li>
			            <li>
						<a href="/minwon/minwoncase"><span>민원사례</span></a>
							</li>
			            <li>
						<a href="/minwon/photo-report"><span>스마트 현장사진신고</span></a>
							</li>
			            <li>
						<a href="/minwon/guide"><span>신고센터</span></a>
							</li>
			            <li>
						<a href="https://www.busan.go.kr/bshotline" target="_blank" rel="noopener noreferrer" title="새창"><span>공익제보센터</span></a>
							</li>
			            <li>
						<a href="http://www.gov.kr" target="_blank" rel="noopener noreferrer" title="새창"><span>정부24</span></a>
							</li>
			            </ul>
			            </li>
			        <li>
						<a href="/minwon/proguide" ><span>제안신청</span></a>
							<button type="button" class="dropdown">하위메뉴 열기</button>
						<ul class="header-nav-sub">
			        		<li>
						<a href="/minwon/proguide" ><span>일반제안</span></a>
							<button type="button" class="dropdown">하위메뉴 열기</button>
						<ul>
			        		<li>
						<a href="/minwon/proguide"><span>제안안내</span></a>
							</li>
			            <li>
						<a href="/minwon/propse"><span>제안신청</span></a>
							</li>
			            <li>
						<a href="/minwon/suggest"><span>제안목록</span></a>
							</li>
			            </ul>
			            </li>
			        <li>
						<a href="/minwon/suggest001"><span>공모제안</span></a>
							</li>
			            <li>
						<a href="/minwon/mysuggestion"><span>나의 제안</span></a>
							</li>
			            </ul>
			            </li>
			        <li>
						<a href="/minwon/survey" ><span>시민참여</span></a>
							<button type="button" class="dropdown">하위메뉴 열기</button>
						<ul class="header-nav-sub">
			        		<li>
						<a href="/minwon/survey"><span>설문조사</span></a>
							</li>
			            <li>
						<a href="<%= request.getContextPath() %>/board/market/list.do"><span>나눔장터</span></a>
							</li>
			            <li>
						<a href="/minwon/thinkbox001"><span>국민생각함</span></a>
							</li>
			            <li>
						<a href="/minwon/chmonitor" ><span>모니터</span></a>
							<button type="button" class="dropdown">하위메뉴 열기</button>
						<ul>
			        		<li>
						<a href="/minwon/chmonitor" ><span>시정모니터</span></a>
							</li>
			            <li>
						<a href="/minwon/greenmin01" ><span>그린환경 지킴이</span></a>
							</li>
			            <li>
						<a href="/minwon/citimoniter01" ><span>시민감사관</span></a>
							</li>
			            <li>
						<a href="/minwon/citizenload01" ><span>부산의 길 모니터</span></a>
							</li>
			            <li>
						<a href="/minwon/homemonitor01" ><span>홈페이지 모니터</span></a>
							</li>
			            </ul>
			            </li>
			        <li>
						<a href="/minwon/eventresult"><span>이벤트 통합안내</span></a>
							</li>
			            <li>
						<a href="<%= request.getContextPath() %>/board/eventBoard/list.do"><span>행사 모집</span></a>
							</li>
			            <li>
						<a href="<%= request.getContextPath() %>/board/citizen/list.do"><span>시민게시판</span></a>
							</li>
			            <li>
						<a href="http://www.busan.go.kr/yesan/" ><span>주민참여예산</span></a>
							</li>
			            <li>
						<a href="/minwon/gujeideaoffer01" ><span>민생규제혁신과제</span></a>
							<button type="button" class="dropdown">하위메뉴 열기</button>
						<ul>
			        		<li>
						<a href="/minwon/gujeideaoffer01"><span>공모 안내</span></a>
							</li>
			            <li>
						<a href="/minwon/gujeideaoffer02"><span>공모하기</span></a>
							</li>
			            </ul>
			            </li>
			        <li>
						<a href="<%=request.getContextPath() %>/board/report/list.do"><span>신고합니다</span></a>
							</li>
			            <li>
						<a href="/minwon/compliment"><span>칭찬합시다</span></a>
							</li>
			            <li>
						<a href="https://www.busan.go.kr/siminopen" target="_blank" rel="noopener noreferrer" title="새창"><span>시민열린마루</span></a>
							</li>
			            <li>
						<a href="http://www.busan.go.kr/gnance/" target="_blank" rel="noopener noreferrer" title="새창"><span>협치부산</span></a>
							</li>
			            </ul>
			            </li>
			        <li>
						<a href="/minwon/manual" ><span>민원안내</span></a>
							<button type="button" class="dropdown">하위메뉴 열기</button>
						<ul class="header-nav-sub">
			        		<li>
						<a href="/minwon/manual"><span>민원편람</span></a>
							</li>
			            <li>
						<a href="<%=request.getContextPath()%>/board/complain/list.do"><span>민원목록</span></a>
							</li>
			            <li>
						<a href="/minwon/minwonopen"><span>민원처리 확인</span></a>
							</li>
			            <li>
						<a href="/minwon/tmpassport01" ><span>여권안내</span></a>
							<button type="button" class="dropdown">하위메뉴 열기</button>
						<ul>
			        		<li>
						<a href="/minwon/tmpassport01"><span>여권안내</span></a>
							</li>
			            <li>
						<a href="/minwon/tmpassport023"><span>여권 온라인서비스</span></a>
							</li>
			            <li>
						<a href="http://www.passport.go.kr/issue/faq_01.php" target="_blank" rel="noopener noreferrer" title="새창"><span>자주묻는질문</span></a>
							</li>
			            <li>
						<a href="/minwon/tmpassport16"><span>여권발급문의</span></a>
							</li>
			            <li>
						<a href="http://www.passport.go.kr/issue/document.php" target="_blank" rel="noopener noreferrer" title="새창"><span>외교부여권안내</span></a>
							</li>
			            <li>
						<a href="/minwon/standbycount"><span>여권민원 대기현황</span></a>
							</li>
			            </ul>
			            </li>
			        <li>
						<a href="/minwon/info0202" ><span>편리한 민원서비스</span></a>
							<button type="button" class="dropdown">하위메뉴 열기</button>
						<ul>
			        		<li>
						<a href="/minwon/info0202"><span>원스톱 민원서비스</span></a>
							</li>
			            <li>
						<a href="/minwon/info0101" ><span>자격증교부(온라인서비스)</span></a>
							</li>
			            <li>
						<a href="/minwon/info0201"><span>어디서나 민원처리제</span></a>
							</li>
			            <li>
						<a href="/minwon/info0207"><span>구술민원 안내</span></a>
							</li>
			            <li>
						<a href="/minwon/info0206"><span>「정부24」 나의 생활정보 서비스 안내</span></a>
							</li>
			            <li>
						<a href="/minwon/info0209"><span>행정정보 공동이용</span></a>
							</li>
			            <li>
						<a href="/minwon/info0203"><span>구군별 전자민원창구</span></a>
							</li>
			            <li>
						<a href="/minwon/info0204"><span>무인민원발급기현황</span></a>
							</li>
			            <li>
						<a href="/minwon/info0205"><span>무료 상담 정보 안내</span></a>
							</li>
			            <li>
						<a href="/minwon/info0208"><span>공문 보낼 땐 문서24</span></a>
							</li>
			            </ul>
			            </li>
			        <li>
						<a href="/minwon/info0301" ><span>민원정보</span></a>
							<button type="button" class="dropdown">하위메뉴 열기</button>
						<ul>
			        		<li>
						<a href="/minwon/info0301" ><span>도로<span class="fontGothic">&middot;</span>하천 사용절차 안내</span></a>
							</li>
			            <li>
						<a href="/minwon/info0401" ><span>정보통신<span class="fontGothic">&middot;</span>건설엔지니어링업 등록 안내</span></a>
							</li>
			            </ul>
			            </li>
			        <li>
						<a href="/minwon/mwpolicy01" ><span>민원시책</span></a>
							<button type="button" class="dropdown">하위메뉴 열기</button>
						<ul>
			        		<li>
						<a href="/minwon/mwpolicy01"><span>민원처리기간 자체단축</span></a>
							</li>
			            <li>
						<a href="/minwon/mwpolicy02"><span>민원 1회방문처리제</span></a>
							</li>
			            <li>
						<a href="/minwon/mwpolicy03"><span>민원후견인제</span></a>
							</li>
			            <li>
						<a href="/minwon/mwpolicy04"><span>행정사무착오보상제</span></a>
							</li>
			            <li>
						<a href="/minwon/mwpolicy05"><span>민원처리지연보상제</span></a>
							</li>
			            <li>
						<a href="/minwon/mwinfo07"><span>사전심사청구제</span></a>
							</li>
			            <li>
						<a href="/minwon/mwinfo08"><span>민원처리 마일리지</span></a>
							</li>
			            </ul>
			            </li>
			        <li>
						<a href="/minwon/charter"><span>행정서비스헌장</span></a>
							</li>
			            </ul>
			            </li>
			        <li>
						<a href="/minwon/manual120" ><span>120콜센터</span></a>
							<button type="button" class="dropdown">하위메뉴 열기</button>
						<ul class="header-nav-sub">
			        		<li>
						<a href="/minwon/callguide01" ><span>이용안내</span></a>
							<button type="button" class="dropdown">하위메뉴 열기</button>
						<ul>
			        		<li>
						<a href="/minwon/callguide01"><span>전화상담</span></a>
							</li>
			            <li>
						<a href="/minwon/callguide02"><span>문자상담</span></a>
							</li>
			            <li>
						<a href="/minwon/callguide03"><span>수어상담</span></a>
							</li>
			            <li>
						<a href="/minwon/callguide04"><span>외국어상담(Foreign Language Services)</span></a>
							</li>
			            <li>
						<a href="/minwon/callconsult"><span>전화상담 예약신청</span></a>
							</li>
			            <li>
						<a href="/minwon/callguide05"><span>영상(이미지) 신고</span></a>
							</li>
			            </ul>
			            </li>
			        <li>
						<a href="/minwon/callinfo02" ><span>콜센터 소개</span></a>
							<button type="button" class="dropdown">하위메뉴 열기</button>
						<ul>
			        		<li>
						<a href="/minwon/callinfo02"><span>연혁</span></a>
							</li>
			            <li>
						<a href="/minwon/callinfo04"><span>찾아오시는길</span></a>
							</li>
				</ul>
			    </li>
				</ul>
			    </li>
				</ul>
			    </nav>
		</div>
	</div>
	<div class="header-nav-back"></div>
</header><!-- end:header -->

<!-- start:content -->
<div id="container">
	