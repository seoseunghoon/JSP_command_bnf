<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>






  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!-- main_header -->


<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/global/assets/vendor/jquery-ui/jquery-ui.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/global/assets/css/global.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/theme/minwon/assets/css/common.css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/global/assets/vendor/slick/slick.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/theme/minwon/assets/css/main.css">
<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/jquery/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/jquery-ui/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/theme/minwon/assets/script/jquery.datetimepicker.js"></script>


<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/plugins/jquery.validate.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/plugins/jquery.validate.rule.js"></script>
<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/plugins/jquery.cookie.js"></script>
<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/netfunnel/netfunnel.js"></script>
<script src="<%=request.getContextPath() %>/resources/global/assets/script/global.js"></script>
<script src="<%=request.getContextPath() %>/resources/theme/minwon/assets/script/common.js"></script>

<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/plugins/localization/messages_ko.js"></script>
<script src="<%=request.getContextPath() %>/resources/global/assets/vendor/slick/slick.js"></script>
<script src="<%=request.getContextPath() %>/resources/theme/minwon/assets/script/main.js"></script>
<script src="<%=request.getContextPath() %>/resources/theme/minwon/assets/script/date.js"></script>


<style>
	.image{
		
	}

</style>

</head>


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
				
				
					<li><a href="<%= request.getContextPath() %>/manage.do">관리자 메뉴</a></li>
					<li><a href="<%= request.getContextPath() %>/login/registForm.do">회원가입</a></li>
					<li>${loginUser.id }</li>
						<li><a href="<%= request.getContextPath() %>/login/loginForm.do">로그인</a></li>
					<!-- 					<li><a href="/covid19" title="새창열림" target="_blank" class="btn-covid">코로나19</a></li> -->
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
						<a href="<%= request.getContextPath() %>/board/collusion/list.do"><span>공모제안</span></a>
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
<body>
<!-- start:content -->
<div id="container">

<title>Home : 부산민원120</title>

	<div id="contents">
	
	<section class="main-visual">
		<div class="main-visual-inner">
			
			<div class="main-visual-slogan">
				<img src="/JSP_command_bnf/image/txt_slogan.png" alt="부산시 온라인 민원제안은 부산민원120으로 통합니다"/>
			</div>
			<div class="main-content">
				<article>
					<div class="top-banner">
	<div class="banner">
				<a href="https://www.busan.go.kr/minwon/tmpassport01?tabNum=17" target="_self"  >
				<div class="banner-img">
						<img src="/JSP_command_bnf/image/getImage1.png" alt="여권접수 온라인 사전예약제" />
					</div>
					<div class="banner-txt">
						여권접수 온라인 사전예약제</div>
				</a>
				</div>
		<div class="banner">
				<a href="https://www.passport.go.kr/new/board/data.php?idx=6907&sel=1" target="_blank"  rel="noopener noreferrer" title="새창열림" >
				<div class="banner-img">
						<img src="/JSP_command_bnf/image/getImage2.png" alt="차세대 전자여권
2021년 12월 21일부터 발급 받으실 수 있습니다.
※ 출처 : 외교부" />
					</div>
					<div class="banner-txt">
						차세대 전자여권</div>
				</a>
				</div>
		<div class="banner">
				<a href="https://www.busan.go.kr/nbnews/1459601?curPage=&srchBeginDt=2019-10-08&srchEndDt=2020-10-08&srchKey=&srchText=" target="_blank"  rel="noopener noreferrer" title="새창열림" >
				<div class="banner-img">
						<img src="/JSP_command_bnf/image/getImage3.png" alt="코로나19 극복을 위한 비대면 민원서비스는 사회적 거리두기 실천입니다." />
					</div>
					<div class="banner-txt">
						[카드뉴스] 비대면 민원서비스</div>
				</a>
				</div>
		<div class="banner">
				<a href="https://www.busan.go.kr/minwon/mwpolicy05" target="_self"  >
				<div class="banner-img">
						<img src="/JSP_command_bnf/image/getImage4.png" alt="민원처리 지연보상 안내
1일 이상 유기한 민원사무 대상" />
					</div>
					<div class="banner-txt">
						민원처리 지연보상 안내</div>
				</a>
				</div>
		<div class="banner">
				<a href="https://www.mois.go.kr/video/bbs/type019/commonSelectBoardArticle.do?bbsId=BBSMSTR_000000000255&nttId=68175" target="_blank"  rel="noopener noreferrer" title="새창열림" >
				<div class="banner-img">
						<img src="/JSP_command_bnf/image/getImage5.png" alt="아직도 모르시나요? 인감증명서와 동일한 본인서명사실확인서!
1 인감증명서와 효력이 동일
2 전국 어디서나 편리한 발급
3 인감사고 사전예방
4 전자본인서명 확인서 발급
행전안전부" />
					</div>
					<div class="banner-txt">
						읍면동 주민센터, 정부24(www.gov.kr) 통해 발급</div>
				</a>
				</div>
		<div class="banner">
				<a href="https://www.busan.go.kr/nbnews/1439115?curPage=&srchBeginDt=2019-06-17&srchEndDt=2020-06-17&srchKey=&srchText=" target="_blank"  rel="noopener noreferrer" title="새창열림" >
				<div class="banner-img">
						<img src="/JSP_command_bnf/image/getImage6.png" alt="국민과 가장 가까운 곳에 민원 공무원이 있습니다.
민원공무원의 안전과 인권을 적극 보호하겠습니다." />
					</div>
					<div class="banner-txt">
						[카드뉴스] 안전한 민원환경 조성</div>
				</a>
				</div>
		<div class="banner">
				<a href="https://www.gov.kr/portal/service/serviceInfo/126200000030" target="_blank"  rel="noopener noreferrer" title="새창열림" >
				<div class="banner-img">
						<img src="/JSP_command_bnf/image/getImage7.png" alt="여권재발급
온라인으로 신청하세요!
※ 출처 : 외교부" />
					</div>
					<div class="banner-txt">
						여권재발급 온라인신청가능</div>
				</a>
				</div>
		<div class="banner">
				<a href="https://www.busan.go.kr/minwon/manual120" target="_self"  >
				<div class="banner-img">
						<img src="/JSP_command_bnf/image/getImage8.png" alt="120콜센터
051-120 전화상담 08:30~18:30" />
					</div>
					<div class="banner-txt">
						120콜센터</div>
				</a>
				</div>
		</div></article>
				<article>
					<div class="main-content-minwon">
						<h4 class="main-content-tit">민원</h4>
						<ul class="main-content-minwon-list">
							<li>
								<a href="/minwon/myminwon">
									<div class="img"><img src="/JSP_command_bnf/image/ico_minwon_01.png" alt=""></div>
									<div class="tit">민원신청</div>
								</a>
							</li>
							<li>
								<a href="/minwon/myminwon/list">
									<div class="img"><img src="/JSP_command_bnf/image/ico_minwon_02.png" alt=""></div>
									<div class="tit">나의 민원</div>
								</a>
							</li>
							<li>
								<a href="/minwon/manual">
									<div class="img"><img src="/JSP_command_bnf/image/ico_minwon_03.png" alt=""></div>
									<div class="tit">민원편람</div>
								</a>
							</li>
							<li>
								<a href="/minwon/traffic2">
									<div class="img"><img src="/JSP_command_bnf/image/ico_minwon_04.png" alt=""></div>
									<div class="tit">교통불편 민원신청</div>
								</a>
							</li>
							<li>
								<a href="/minwon/monthlyminwon">
									<div class="img"><img src="/JSP_command_bnf/image/ico_minwon_05.png" alt=""></div>
									<div class="tit">이달의 주요민원</div>
								</a>
							</li>
							<li>
								<a href="https://www.busan.go.kr/bshotline/index" title="새창열림" target="_blank" rel="noreferrer noopener">
									<div class="img"><img src="/JSP_command_bnf/image/ico_minwon_06.png" alt=""></div>
									<div class="tit">공익제보 센터</div>
								</a>
							</li>
						</ul>
					</div>
					<div class="main-content-etc">
						<div class="main-content-etc-top">
							<h4 class="main-content-tit">시민참여공간</h4>
							<ul class="main-content-etc-list">
								<li><a href="/minwon/propse"><span>제안신청</span></a></li>
								<li><a href="/minwon/survey"><span>설문조사</span></a></li>
								<li><a href="/minwon/eventresult"><span>이벤트 통합</span></a></li>
								<li><a href="/minwon/occation"><span>행사/모집</span></a></li>
							</ul>
						</div>
						<div class="main-content-etc-bottom">
							<h4 class="main-content-tit">모니터</h4>
							<ul class="main-content-etc-list">
								<li><a href="/minwon/chmonitor"><span>시정모니터</span></a></li>
								<li><a href="/minwon/greenmin01"><span>그린환경지킴이</span></a></li>
								<li><a href="/minwon/citizenload01"><span>부산의 길 모니터</span></a></li>
								<li><a href="/minwon/citimoniter01"><span>시민감사관</span></a></li>
							</ul>
						</div>
					</div>
				</article>
			</div>
		</div>
	</section>
	<section class="main-link">
		<div class="main-link-inner">
			<ul class="main-link-list">
				<li>
					<a href="/minwon/standbycount">
						<div class="txt">여권민원 대기현황</div>
					</a>
				</li>
				<li>
					<a href="/minwon/tmpassport023" title="새창열림" target="_blank" rel="noreferrer noopener">
						<div class="txt">여권온라인서비스</div>
					</a>
				</li>
				<li>
					<a href="/minwon/tmpassport01?tabNum=17">
						<div class="txt">여권접수 온라인<br>사전예약제</div>
					</a>
				</li>
				<li>
					<a href="https://www.safetyreport.go.kr/" title="새창열림" target="_blank" rel="noreferrer noopener">
						<div class="txt">안전신문고</div>
					</a>
				</li>
<li>
					<a href="/minwon/environment">
						<div class="txt">환경신문고</div>
					</a>
				</li>
				<li>
					<a href="/yesan">
						<div class="txt">주민참여예산</div>
					</a>
				</li>
				<li>
					<a href="https://www.gov.kr/portal/main" title="새창열림" target="_blank" rel="noreferrer noopener">
						<div class="img"><img src="<%=request.getContextPath() %>/image/ico_link_07.png" alt="정부24"/></div>
					</a>
				</li>
			</ul>
		</div>
	</section>
	<section class="main-notice">
		<div class="main-notice-inner">
			<article>
				<div class="main-notice-instance">
	<h3 class="main-notice-tit">민원사례</h3>
	<p class="main-notice-txt">시민이 공개 신청한 유사 민원 사례를 조회하실 수 있습니다.</p>
	<ul class="main-notice-list">
		<li>
 			<a href="/minwon/minwoncase/1552246" class="tit">신혼부부 주택융자 및 대출이자 지원사업 관련 질의 </a>
		</li>
		<li>
 			<a href="/minwon/minwoncase/1552604" class="tit">음식물처리기 지원사업 진행 문의</a>
		</li>
		<li>
 			<a href="/minwon/minwoncase/1552590" class="tit">2023년도 청년디딤돌카드</a>
		</li>
		<li>
 			<a href="/minwon/minwoncase/1552601" class="tit">제로페이 활성화해주세요 </a>
		</li>
		<li>
 			<a href="/minwon/minwoncase/1552596" class="tit">노후차량지원사업 </a>
		</li>
		</ul>
	<a href="/minwon/minwoncase" class="main-notice-more"><span class="hidden">민원사례 더보기</span><img src="<%=request.getContextPath() %>/image/ico_more.png" alt="MORE+"></a>
</div></article>
			<article>
				<div class="main-notice-compliment">
	<h3 class="main-notice-tit">칭찬합시다</h3>
	<p class="main-notice-txt">시민의 칭찬한마디는 힘이됩니다.</p>
	<ul class="main-notice-list">
		<li>
			<a href="/minwon/compliment/view?petition_id=12478904" class="tit">15번버스 기사님을 칭찬합니다.</a>
			</li>
		<li>
			<a href="/minwon/compliment/view?petition_id=12478538" class="tit">친절한 169 버스기사님(70자1717)을 칭찬합니다!</a>
			</li>
		<li>
			<a href="/minwon/compliment/view?petition_id=12466459" class="tit">부전2동 적극행정을 칭찬합니다.</a>
			</li>
		<li>
			<a href="/minwon/compliment/view?petition_id=12462617" class="tit">115번 버스기사님을 칭찬합니다</a>
			</li>
		<li>
			<a href="/minwon/compliment/view?petition_id=12461702" class="tit">148-1(자 1579) 시내버스 기사님께 감사드립니다</a>
			</li>
		</ul>
	<a href="/minwon/compliment" class="main-notice-more"><span class="hidden">칭찬합시다  더보기</span><img src="<%=request.getContextPath() %>/image/ico_more.png" alt="MORE+"></a>
</div></article>
		</div>
	</section>
</div>

</div>
<!-- start:footer -->
<footer id="footer">
	<div class="footer-inner">
		<div class="footer-logo">
			<a href="http://www.busan.go.kr"><img src="<%=request.getContextPath() %>/image/logo_busan.png" alt="부산광역시"></a>
		</div>
		<div class="footer-copyright">
			<div class="footer-minwon">
				<a href="https://www.busan.go.kr/minwon/manual120" target="_blank" title="새창열기">
					<p class="tit">부산시 120 콜센터 (지역번호 051)</p>
					<p class="txt">평일 08:30 ~ 18:30<br>야간․공휴일 당직실 전환</p>
				</a>
			</div>
			<div class="footer-address">
				<p>(우 47545) 부산광역시 연제구 중앙대로 1001(연산동)</p>
				<div class="link">
					<a href="https://www.busan.go.kr/bhintro02" target="_blank" title="새창열기">시청 찾아오시는길</a>
					<a href="https://www.busan.go.kr/bhintro03" target="_blank" title="새창열기">주차안내</a>
					<a href="https://www.busan.go.kr/opgude" target="_blank" title="새창열기">이용안내</a>
				</div>
				<p class="copy">Copyright © Busan Metropolitan City. All rights reserved.</p>
			</div>
		</div>
		<div class="footer-menu">
			<ul>
				<li><a href="https://www.busan.go.kr/terms" target="_blank" title="새창열기">약관</a></li>
				<li><a href="https://www.busan.go.kr/cright" target="_blank" title="새창열기">홈페이지 저작권 보호정책</a></li>
				<li><a href="https://www.busan.go.kr/vprivacy1" target="_blank" title="새창열기"><span>개인정보 처리방침</span></a></li>
				<li><a href="https://www.busan.go.kr/minwon/mdidsms" target="_blank" title="새창열기">행정서비스헌장</a></li>
				<li><a href="https://www.busan.go.kr/viewdn" target="_blank" title="새창열기">뷰어다운로드</a></li>
				<li><a href="https://www.busan.go.kr/minwon/homemonitor01" target="_blank" title="새창열기">홈페이지 모니터</a></li>
			</ul>
		</div>
		<div class="footer-qr">
			<img src="<%=request.getContextPath() %>/image/img_qr.jpg" alt="부산시 통합민원서비스 qr코드"/>
		</div>
	</div>
</footer><!-- end:footer -->