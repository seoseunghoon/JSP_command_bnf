<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="complainList" value="${ dataMap.complainList }"></c:set>
    
<!DOCTYPE html>

<body>

<div id="skipNav"><a href="#contents">본문내용 바로가기</a></div>

<!-- start:header -->
<script>
function gologout(){
		alert("소셜 로그아웃되었습니다. \n(참고)페이스북/카카오톡/네이버에서도 로그아웃하시려면 \n각 웹사이트로 이동하여 로그아웃 하여 주십시오.");
		location.href = "http://www.busan.go.kr/member/logout";
	}
</script>

<!-- start:content -->
<div id="container">
	<div id="location">
		<div class="locationInner">
			<div class="lineMap">
				<span class="hidden">현재 본문 위치 :</span>
				<span>Home</span> &gt; <span>민원안내</span> &gt; <a href="/minwon/manual2" class="colorBlack">민원목록</a></div>
			<ul class="shareArea">
				<li class="share">
					<a href="#">공유하기 열기</a>
					<div class="shareBox">
						<ul class="shareList">

							<li class="naverband"><a href="#" onclick="f_share('band', '민원목록'); return false;" title="새창열기" target="_blank">네이버 밴드</a></li>
							<li class="kakaostory"><a href="#" onclick="f_share('kakao', '민원목록'); return false;" title="새창열기" target="_blank">카카오 스토리</a></li>
							<li class="twitter"><a href="#" onclick="f_share('twitter', '민원목록'); return false;" title="새창열기" target="_blank">트위터</a></li>
							<li class="facebook"><a href="#" onclick="f_share('facebook', '민원목록'); return false;" title="새창열기" target="_blank">페이스북</a></li>
						</ul>
					</div>
				</li>
				<li class="print"><a href="#" >프린트</a></li>
				<li class="bookmark"><a href="#" onclick="addBookMark('>Home>민원안내>민원목록','부산민원120'); return false" title="클릭하시면 북마크에 등록됩니다">북마크</a></li>
			</ul>
		</div>
	</div>
	<h3 class="titPage">
		민원목록</h3>


<div class="containerInnr">
		<script type="text/javascript">
	

	$(function(){

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

		$("#srchBeginDt,#srchEndDt").change(
				function() {
					if ($(this).attr("id") == "srchBeginDt"
							&& $("#srchEndDt").val() != "") {
						if ($("#srchBeginDt").val() > $("#srchEndDt").val()) {
							alert("시작일이 종료일 보다 클 수 없습니다");
							$(this).val("");
						}
					} else if ($(this).attr("id") == "srchEndDt"
							&& $("#srchBeginDt").val() != "") {
						if ($("#srchBeginDt").val() > $("#srchEndDt").val()) {
							alert("종료일이 시작일 보다 작을 수 없습니다");
							$(this).val("");
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
<div id="contents">
	<div class="minwon_tablink">
	<ul>
		<li><a href="/minwon/manual">민원편람</a></li>
		<li class="active"><a href="/minwon/manual2">민원목록</a></li>
	</ul>
</div>
<br><!-- Start Code -->
	<fieldset class="boardHead">
			<legend>목록내 검색</legend>
			<!-- <h3 class="maunalTitle">민원사무 목록</h3> -->
			<p class="ctgryNo hidden"></p>
			<div class="boardSearchForm">
				<form id="searchFrm" name="searchFrm" class="form-search"
					method="post" action="/minwon/manual2">
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
										title="YYYY-MM-DD 형식으로 날짜를 입력해주세요"
										value=""> <span class="hyphen">-</span>
										<label for="srchEndDt" class="hidden">검색 종료일</label> <input
										id="srchEndDt" name="srchEndDt" type="text"
										class="textForm date jqdate-img" placeholder="검색종료일"
										title="YYYY-MM-DD 형식으로 날짜를 입력해주세요" value="">
									</span> <span class="cellInDv cellInDvSearch"> <span
										class="cellInDvSearchCell srchOption"> <label
											for="srchKey" class="hidden">검색조건 선택</label> <select
											id="srchKey" name="srchKey" class="selectForm"
											style="width: 12%; min-width: 80px;">
												<option value="sj"
															>제목</option>
														<option value="cn"
															>내용</option>
														<option value="wrter"
															>작성자</option>
														</select>
									</span> <span class="cellInDvSearchCell srchKeyword"> <label
											for="srchText" class="hidden">검색어 입력</label> <input
											name="srchText" id="srchText" type="search" class="textForm"
											style="width: 33%;" placeholder="검색"
											value="" />
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
			총 <b class="totalNum">15</b>건
			(<b>1</b>/2page)
		</p>
	<table class="boardList">
<caption>민원목록목록 : 순번,제목,첨부파일,부서명,작성일,조회수 구성된 표
    </caption>
	<thead>
		<tr>

<!-- 보조금내역 변경 추가 -->		
<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">순번</th>
			<th scope="col" class="pc_Y ta_Y mo_Y nowrap">제목</th>
			<th style="width:8%;" scope="col" class="pc_Y ta_Y mo_N">첨부파일</th>
			<th style="width:17%;" scope="col" class="pc_Y ta_Y mo_N nowrap">부서명</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_Y nowrap">작성일</th>
			<th style="width:6%;" scope="col" class="pc_Y ta_Y mo_N nowrap">조회수</th>
			</tr>
	</thead>

	<tbody>
		<!-- 공지사항 목록 -->
		<!-- 일반게시물 목록 -->
<!-- 보조금내역 변경 추가 -->		
<!-- 보조금내역 변경 추가 -->		
<tr>
				<!-- 순번 -->
							<td class="pc_Y ta_Y mo_N">
								15</td>
						<!-- 제목 -->
							<td class="pc_Y ta_Y mo_Y title">
								<a href="/minwon/manual2/1552160?curPage=&amp;srchBeginDt=2014-01-01&amp;srchEndDt=2023-01-14&amp;srchKey=&amp;srchText=">
									민원편람(목록) (&quot;22. 4분기)</a>
							</td>
						<!-- 첨부파일 -->
							<td class="pc_Y ta_Y mo_N">
							<img src="/humanframe/global/assets/img/ico_download_ai.png" alt="첨부파일" />
							</td>
						<!-- 나머지 -->
							<td class="pc_Y ta_Y mo_N">통합민원과</td>
						<!-- 작성일 -->
							<td class="pc_Y ta_Y mo_Y nowrap">2023-01-02</td>
						<!-- 나머지 -->
							<td class="pc_Y ta_Y mo_N">104</td>
						</tr>
						
						<c:forEach var="complain" items="${ complainList }">
							<tr>
								<td class="pc_Y_ta_Y_mo_Y">&nbsp;${ complain.bno }</td>
								<td class="pc_Y_ta_Y_mo_Y">&nbsp;<a href="javascript:OpenWindow('<%=request.getContextPath()%>/board/complain/detail.do?bno=${complain.bno}','complainDetail',1280,720);" >${complain.title}</a></td>
								<td class="pc_Y_ta_Y_mo_Y">첨부파일</td>
								<td class="pc_Y_ta_Y_mo_Y">&nbsp;${ complain.writer }</td>
								<td class="pc_Y_ta_Y_mo_Y nowrap">
									<fmt:formatDate value="${ complain.regDate }" pattern="yyyy-MM-dd"></fmt:formatDate>
								</td>
							</tr>
						</c:forEach>

		</tbody>
</table><div class="paginate">
			<a href="?curPage=1"   class="pgFirst" title="처음 목록으로"><span>처음 목록으로</span></a>
<a href="#none" class="pgPrev" title="이전 목록으로"><span>이전 목록으로</span></a>
<div class="number">
<strong title='현재페이지'>1</strong>
<a href="?curPage=2"  	title="2 페이지" >2</a>
</div>
<a href="#none" class="pgNext" title="다음 목록으로"><span>다음 목록으로</span></a>
<a href="?curPage=2"  class="pgEnd"  title="마지막 목록으로"><span>마지막 목록으로</span></a>

</div>
		<!-- 페이징 -->
	<div class="btnArea btnRt">
		<!-- 버튼 -->
		</div>
	<!-- 비밀번호 입력 레이어  -->
	<div id="inputPassword" style="display: none;">
		<form id="bbsPasswordChkFrm" method="post">
			<div>
				<input type="hidden" name="bbsNo" id="bbsNo" value="" /> <input
					type="hidden" name="nttNo" id="nttNo" value="" /> <label
					for="password" class="hidden">비빌번호</label> <input type="password"
					name="password" id="password"
					placeholder="비밀번호"
					title="비밀번호"
					class="form-control"
					onkeypress="javascript:if(event.keyCode==13){f_bbsPasswordChk();return false;}" />
				<a class="btn btn-default mr-xs mb-sm"
					title="확인"
					onclick="f_bbsPasswordChk(); return false;">확인</a>
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
				<dt>통합민원과</dt>
				<dd>강지혜&nbsp;(051-888-5327)</dd>
				<dt></dt>
				<dd></dd>
			</dl>
		</div>					
					<!-- //담당자 정보 -->
			
</div>

<div id="lv-container" data-id="busancity" data-uid="NjY2LzE2MzY0Lzc3NA==">
<script type="text/javascript">

	var current_url = location.href;
	var refer = current_url;
	
	if(current_url.indexOf('news.busan.go.kr') > -1){
		if(current_url.indexOf('dataNo') > -1){
			refer = "https://www.busan.go.kr/manual2/view?dataNo=";
		}else if("3" == "3"){
			refer = "https://www.busan.go.kr/manual2/";
		}else{
			refer = "https://www.busan.go.kr/manual2";
		}
	}else{
		if(current_url.indexOf('dataNo') > -1){
			refer = current_url + "/view?dataNo=";
		}else if("3" == "3"){
			refer = current_url + "/";
		}else{
			refer = current_url;
		}
	}
	
	refer = refer.replace("http://", "").replace("https://", "");
	
	window.livereOptions ={
		refer: refer
	} ;
	(function(d,s) {
	var j, e=d.getElementsByTagName(s)[0];

	if (typeof LivereTower === 'function') {return;}

	j=d.createElement(s);
	j.src='https://cdn-city.livere.com/js/embed.dist.js'; j.async=true;

	e.parentNode.insertBefore(j,e);
	})(document,'script');
	
</script>
<noscript>라이브리 댓글 작성을 위해 JavaScript를 활성화해주세요</noscript>
</div></div></div>
	</div>
<!-- end:content -->


<!-- Google Analytics -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-91362239-1', 'auto');
  ga('send', 'pageview');
</script>
<!-- LOGGER TRACKING SCRIPT V.31 FOR area.busan.go.kr/120 / 1071 : FAIL-SAFE TYPE / DO NOT ALTER THIS SCRIPT. -->
<!-- COPYRIGHT (C) 2002-2016 BIZSPRING INC. LOGGER(TM) ALL RIGHTS RESERVED. -->
<script type="text/javascript">/* LOGGER TRACKING SCRIPT V.31 : 1071 *//*X*//* COPYRIGHT 2002-2016 BIZSPRING INC. *//*X*//* DO NOT MODIFY THIS SCRIPT. *//*X*/var _TRK_DOMAIN="logger.busan.go.kr";var _trk_bMSIE=(document.all)?true:false;var _trk_bJS12=(window.screen)?true:false;function _trk_escape(_str) { var str, ch; var bEncURI = "N"; eval("try{bEncURI=encodeURI('Y');}catch(_e){ }" ); if( bEncURI == "Y" ) str=encodeURI(_str); else str = escape(_str); str=str.split("+").join("%2B"); str=str.split("/").join("%2F"); str=str.split("&").join("%26"); str=str.split("?").join("%3F"); str=str.split(":").join("%3A"); str=str.split("#").join("%23"); return str;}function _trk_setCookie(name,value,expire) { var today=new Date(); today.setTime(today.getTime()+ expire ); document.cookie=name+"="+value+"; path=/; expires="+today.toGMTString()+";";}function _trk_getCookie(name) { var cookieName=name+"="; var x=0; while(x<=document.cookie.length) { var y=(x+cookieName.length); if(document.cookie.substring(x,y)==cookieName) {  if((endOfCookie=document.cookie.indexOf(";",y))==-1) endOfCookie=document.cookie.length;  return unescape(document.cookie.substring(y,endOfCookie)); } x=document.cookie.indexOf(" ",x)+1; if(x == 0) break; } return "";}function _trk_getParameter(name) { var paraName=name+"="; var URL=""+self.document.location.search; var tURL=""; eval("try{ tURL=top.document.location.search; }catch(_e){}"); URL=URL+"&"+tURL; if(URL.indexOf(paraName)!=-1) { var x=URL.indexOf(paraName)+paraName.length; var y=URL.substr(x).indexOf("&"); if(y!=-1) return URL.substring(x,x+y); else return URL.substr(x); } return "";}function _trk_make_code(_TRK_SERVER,_TRK_U) { var dt=document.title.toString(); dt=dt.substr(0,128); var dr=self.document.referrer; var tdr=""; eval("try{ tdr=top.document.referrer; }catch(_e){}"); var tdu=""; eval("try{ tdu=top.document.location.href; }catch(_e){}"); var bFrm=false; if(dr==tdu) { dr=tdr; bFrm=true; } if(dr=="undefined") dr=""; var du=self.document.location.href; if(du.substr(0,4)=="file") return ""; var adKeyVal = ""; if(bFrm) { adKeyVal=_trk_getParameter("OVKEY"); if(adKeyVal!="" && du.indexOf("OVKEY=")<0) {  if(du.indexOf("?")!=-1) du=du+"&OVKEY="+adKeyVal; else du=du+"?OVKEY="+adKeyVal;  adKeyVal=_trk_getParameter("OVRAW");  if(adKeyVal!="" && du.indexOf("OVRAW=")<0 ) if(du.indexOf("?")!=-1) du=du+"&OVRAW="+adKeyVal; else du=du+"?OVRAW="+adKeyVal; } else {  adKeyVal=_trk_getParameter("netpia");  if(adKeyVal!="" && du.indexOf("netpia=")<0 ) if(du.indexOf("?")!=-1) du=du+"&netpia="+adKeyVal; else du=du+"?netpia="+adKeyVal; } adKeyVal=_trk_getParameter("logger_kw"); if(adKeyVal!="" && du.indexOf("logger_kw=")<0 )  if(du.indexOf("?")!=-1) du=du+"&logger_kw="+adKeyVal; else du=du+"?logger_kw="+adKeyVal; adKeyVal=_trk_getParameter("source"); if(adKeyVal!="" && du.indexOf("source=")<0 )  if(du.indexOf("?")!=-1) du=du+"&source="+adKeyVal; else du=du+"?source="+adKeyVal; adKeyVal=_trk_getParameter("keywd"); if(adKeyVal!="" && du.indexOf("keywd=")<0 )  if(du.indexOf("?")!=-1) du=du+"&keywd="+adKeyVal; else du=du+"?keywd="+adKeyVal; adKeyVal=_trk_getParameter("NVADID"); if(adKeyVal!="" && du.indexOf("NVADID=")<0 )  if(du.indexOf("?")!=-1) du=du+"&NVADID="+adKeyVal; else du=du+"?NVADID="+adKeyVal; adKeyVal=_trk_getParameter("NVAR"); if(adKeyVal!="" && du.indexOf("NVAR=")<0 )  if(du.indexOf("?")!=-1) du=du+"&NVAR="+adKeyVal; else du=du+"?NVAR="+adKeyVal; adKeyVal=_trk_getParameter("NVADKWD");  if(adKeyVal!="" && du.indexOf("NVADKWD=")<0)  if(du.indexOf("?")!=-1) du=du+"&NVADKWD="+adKeyVal; else du=du+"?NVADKWD="+adKeyVal;  adKeyVal=_trk_getParameter("NVKWD");  if(adKeyVal!="" && du.indexOf("NVKWD=")<0 )  if(du.indexOf("?")!=-1) du=du+"&NVKWD="+adKeyVal; else du=du+"?NVKWD="+adKeyVal;   adKeyVal=_trk_getParameter("DWIT");  if(adKeyVal!="" && du.indexOf("DWIT=")<0) if(du.indexOf("?")!=-1) du=du+"&DWIT="+adKeyVal; else du=du+"?DWIT="+adKeyVal;  adKeyVal=_trk_getParameter("DWIC");  if(adKeyVal!="" && du.indexOf("DWIC=")<0 )  if(du.indexOf("?")!=-1) du=du+"&DWIC="+adKeyVal; else du=du+"?DWIC="+adKeyVal;  adKeyVal=_trk_getParameter("gad"); if(adKeyVal!="" && du.indexOf("gad=")<0 )  if(du.indexOf("?")!=-1) du=du+"&gad="+adKeyVal; else du=du+"?gad="+adKeyVal; adKeyVal=_trk_getParameter("gclid"); if(adKeyVal!="" && du.indexOf("gclid=")<0 )  if(du.indexOf("?")!=-1) du=du+"&gclid="+adKeyVal; else du=du+"?gclid="+adKeyVal; adKeyVal=_trk_getParameter("gkw"); if(adKeyVal!="" && du.indexOf("gkw=")<0 )  if(du.indexOf("?")!=-1) du=du+"&gkw="+adKeyVal; else du=du+"?gkw="+adKeyVal; adKeyVal=_trk_getParameter("rcsite"); if(adKeyVal!="" && du.indexOf("rcsite=")<0 )  if(du.indexOf("?")!=-1) du=du+"&rcsite="+adKeyVal; else du=du+"?rcsite="+adKeyVal; adKeyVal=_trk_getParameter("rctype"); if(adKeyVal!="" && du.indexOf("rctype=")<0 )  if(du.indexOf("?")!=-1) du=du+"&rctype="+adKeyVal; else du=du+"?rctype="+adKeyVal; adKeyVal=_trk_getParameter("rc_code"); if(adKeyVal!="" && du.indexOf("rc_code=")<0 )  if(du.indexOf("?")!=-1) du=du+"&rc_code="+adKeyVal; else du=du+"?rc_code="+adKeyVal; adKeyVal=_trk_getParameter("_C_"); if(adKeyVal!="" && du.indexOf("_C_=")<0 )  if(du.indexOf("?")!=-1) du=du+"&_C_="+adKeyVal; else du=du+"?_C_="+adKeyVal; } var ce=navigator.cookieEnabled?"Y":"N"; var je=navigator.javaEnabled()?"Y":"N"; var ss=""; var cd = ""; if(_trk_bJS12) { ss=screen.width+"x"+screen.height; cd=screen.colorDepth; } if(!dt) dt=""; if(!dr) dr=""; if(!du) du=""; if(!ce) ce=""; if(!je) je=""; var t = new Date; var tye=(_trk_bMSIE)?(t.getYear()):(t.getFullYear()); var tmo=t.getMonth()+1; var tda=t.getDate(); var tho=t.getHours(); var tmi=t.getMinutes(); var tse=t.getSeconds(); var tzo=t.getTimezoneOffset(); var tc = ""; var prtcl="https://"; if(prtcl=="https://") _TRK_SERVER=""+_TRK_DOMAIN; tc=tc+prtcl+_TRK_SERVER; var bPNF=((typeof _TRK_PI)!="undefined" && _TRK_PI=="PNF")?true:false; if(bPNF) tc=tc+"/tracker_click.tsp"; else tc=tc+"/tracker.tsp"; tc=tc+"?u="+_TRK_U+"&XU=&EXEN="+_EXEN; if(bPNF) { tc=tc+"&rnd="+Math.random()+"&CKFL="+_TRK_PI+"&CKDATA="+_trk_escape(du); } else { tc=tc+"&dr="+_trk_escape(dr)+"&XDR="+"&dt="+_trk_escape(dt)+"&du="+_trk_escape(du); if((typeof _TRK_CP)!="undefined" && _TRK_CP!="") tc=tc+"&CP="+_trk_escape(_TRK_CP)+"&XCP="; if((typeof _TRK_PI)!="undefined" && _TRK_PI!="") tc=tc+"&PI="+_TRK_PI; if((typeof _TRK_PN)!="undefined" && _TRK_PN!="") tc=tc+"&PN="+_trk_escape(_TRK_PN); if((typeof _TRK_MF)!="undefined" && _TRK_MF!="") tc=tc+"&MF="+_trk_escape(_TRK_MF); if((typeof _TRK_OA)!="undefined" && _TRK_OA!="") tc=tc+"&OA="+_TRK_OA; if((typeof _TRK_OP)!="undefined" && _TRK_OP!="") tc=tc+"&OP="+_trk_escape(_TRK_OP); if((typeof _TRK_OE)!="undefined" && _TRK_OE!="") tc=tc+"&OE="+_TRK_OE; if((typeof _TRK_CC)!="undefined" && _TRK_CC!="") tc=tc+"&CC="+_TRK_CC; if((typeof _TRK_RK)!="undefined" && _TRK_RK!="") tc=tc+"&RK="+_trk_escape(_TRK_RK); if((typeof _TRK_SX)!="undefined" && _TRK_SX!="") tc=tc+"&SX="+_TRK_SX; if((typeof _TRK_AG)!="undefined" && _TRK_AG!="") tc=tc+"&AG="+_TRK_AG; if((typeof _TRK_IK)!="undefined" && _TRK_IK!="") tc=tc+"&IK="+_trk_escape(_TRK_IK); tc=tc+"&js=Y"+"&ss="+escape(ss)+"&cd="+cd+"&ce="+ce+"&je="+je+"&tzo="+tzo+"&tye="+tye+"&tmo="+tmo+"&tda="+tda+"&tho="+tho+"&tmi="+tmi+"&tse="+tse; } return tc;}var _TRK_LIFE=_trk_getParameter("_L_");if(_TRK_LIFE=="") _TRK_LIFE=14;_TRK_LIFE = parseInt(_TRK_LIFE)*24*60*60*1000;var _TRK_U="";var _TRK_U_P=_trk_getParameter("_U_");var _TRK_U_C= _trk_getCookie("_TRK_U");if(_TRK_U_C!="") _TRK_U=_TRK_U_C;if(_TRK_U_P!="") _TRK_U=_TRK_U_P;if(_TRK_U!="" && _TRK_U_P!="") _trk_setCookie("_TRK_U",_TRK_U,_TRK_LIFE);var _TRK_CC_C=_trk_getCookie("_TRK_CC");var _TRK_CC_P=_trk_getParameter("_C_");if((typeof _TRK_CC)!="undefined" && _TRK_CC!="") _TRK_CC_P=_TRK_CC;if(_TRK_CC_C!="") _TRK_CC=_TRK_CC_C;if(_TRK_CC_P!="") _TRK_CC=_TRK_CC_P;if((typeof _TRK_CC)!="undefined" && _TRK_CC!="" && _TRK_CC_P!="") _trk_setCookie("_TRK_CC",_TRK_CC,_TRK_LIFE);var _TRK_RK_C=_trk_getCookie("_TRK_RK");var _TRK_RK_P=_trk_getParameter("_R_");if((typeof _TRK_RK)!="undefined" && _TRK_RK!="") _TRK_RK_P=_TRK_RK;if(_TRK_RK_C!="") _TRK_RK=_TRK_RK_C;if(_TRK_RK_P!="") _TRK_RK=_TRK_RK_P;if((typeof _TRK_RK)!="undefined" && _TRK_RK!="" && _TRK_RK_P!="") _trk_setCookie("_TRK_RK",_TRK_RK,_TRK_LIFE);var _SS_LIFE = 30*60*1000;var _EXEN = _trk_getCookie("_EXEN");if( _EXEN == "" ) _EXEN = 0; _EXEN ++;_trk_setCookie("_EXEN",_EXEN,_SS_LIFE);var _trk_code_base=_trk_make_code("logger.busan.go.kr","1071");var _trk_code_chan="";if(_TRK_U!="") _trk_code_chan=_trk_code_base.replace(/\?u=1071&XU=/g,"?u="+_TRK_U+"&XU=");var _trk_img_base=new Image();var _trk_img_chan=new Image();var _trk_img_base_click=new Image();var _trk_img_chan_click=new Image();if(_trk_bJS12==true) { if(_trk_bMSIE) { _trk_img_base.src=_trk_code_base; if(_TRK_U!="") _trk_img_chan.src=_trk_code_chan; } else { setTimeout("_trk_img_base.src=_trk_code_base;",1); if(_TRK_U!="") setTimeout("_trk_img_chan.src=_trk_code_chan;",1); }} else { if(_trk_bMSIE) document.write('<div style=\"display: none\">'); document.write('<img src=\"'+_trk_code_base+'\" height=\"0\" width=\"0\" alt=\"\" >'); if(_TRK_U!="") document.write('<img src=\"'+_trk_code_chan+'\" height=\"0\" width=\"0\" alt=\"\" >'); if(_trk_bMSIE) document.write('</div>');}function _trk_flashEnvView(env1,env2,env3,env4,env5,env6,env7,env8,env9,env10,env11,env12){ var _trk_code_flash=_trk_code_base; for (var envCnt=1; envCnt< 13; envCnt++){ if((eval("env"+envCnt) != "") && (typeof eval("env"+envCnt) != "undefined" )){  var trk_str  = eval("env"+envCnt) ;  if(trk_str.indexOf("_TRK_CP")>=0){   var trk_cp = trk_str.split('=');   var _TRK_CP = trk_cp[1];   _trk_code_flash=_trk_code_flash.replace(/&CP=.*&XCP=/g,"&XCP=");   _trk_code_flash=_trk_code_flash.replace(/&dr=.*&XDR=/g,"&XDR=");   _trk_code_flash=_trk_code_flash+"&dr=&CP="+_trk_escape(_TRK_CP)+"&rnd="+Math.random();   if(_TRK_U!="") {    _trk_code_flash=_trk_code_flash.replace(/\?u=1071&XU=/g,"?u="+_TRK_U+"&XU=");   }  }  if((trk_str.indexOf("_TRK_PN")>=0) || (trk_str.indexOf("_TRK_MF")>=0) || (trk_str.indexOf("_TRK_RK")>=0) || (trk_str.indexOf("_TRK_OP")>=0) || (trk_str.indexOf("_TRK_IK")>=0)){   var trk_env = trk_str.split('=');   var _TRK_ENV = _trk_escape(trk_env[1]);   var tkr_env_name = trk_str.substring(trk_str.indexOf('_',1)+1,trk_str.lastIndexOf('='));   var _trk_envs = "&"+tkr_env_name+"="+ _TRK_ENV;   if( _trk_code_flash.indexOf("&"+tkr_env_name+"=") > 0) {    var regVal = "\&"+tkr_env_name+"\=(.*)(\&PN\=|\&MF\=|\&OA\=|\&OP\=|\&OE\=|\&CC\=|\&RK\=|\&SX\=|\&AG\=|\&IK\=|\&js\=)";    var envReg = new RegExp(regVal, 'gi');    var envRst = _trk_code_flash.match(envReg);    var envRst = envRst.toString();    var envArr = envRst.split('&');    var envVar = envArr[1];    _trk_code_flash=_trk_code_flash.replace("&"+envVar+"&", _trk_envs);   }else{    _trk_code_flash = _trk_code_flash+"&"+tkr_env_name+"="+_TRK_ENV;   }  }  if((trk_str.indexOf("_TRK_PI")>=0) || (trk_str.indexOf("_TRK_OA")>=0) || (trk_str.indexOf("_TRK_OE")>=0) || (trk_str.indexOf("_TRK_CC")>=0) || (trk_str.indexOf("_TRK_SX")>=0) || (trk_str.indexOf("_TRK_AG")>=0)){   var trk_env = trk_str.split('=');   var _TRK_ENV = trk_env[1];   var tkr_env_name = trk_str.substring(trk_str.indexOf('_',1)+1,trk_str.lastIndexOf('='));   var _trk_envs = "&"+tkr_env_name+"="+_TRK_ENV+"&";   if( _trk_code_flash.indexOf("&"+tkr_env_name+"=") > 0) {    var regVal = "\&"+tkr_env_name+"\=(.*)(\&PN\=|\&MF\=|\&OA\=|\&OP\=|\&OE\=|\&CC\=|\&RK\=|\&SX\=|\&AG\=|\&IK\=|\&js\=)";    var envReg = new RegExp(regVal, 'gi');    var envRst = _trk_code_flash.match(envReg);    var envRst = envRst.toString();    var envArr = envRst.split('&');    var envVar = envArr[1];    _trk_code_flash=_trk_code_flash.replace("&"+envVar+"&", _trk_envs);   }else{    _trk_code_flash = _trk_code_flash+"&"+tkr_env_name+"="+_TRK_ENV;   }  } } } _trk_img_base_click.src=_trk_code_flash ;}function _trk_flashContentsView(_TRK_PI, _TRK_CP) { var _trk_code_flash=_trk_code_base; var _trk_piv = "&PI="+_TRK_PI+"&"; _trk_code_flash=_trk_code_flash.replace(/&CP=.*&XCP=/g,"&XCP="); _trk_code_flash=_trk_code_flash.replace(/&dr=.*&XDR=/g,"&XDR="); if( _trk_code_flash.indexOf("&PI=") > 0) { var regVal = "\&PI\=(.*)(\&PN\=|\&MF\=|\&OA\=|\&OP\=|\&OE\=|\&CC\=|\&RK\=|\&SX\=|\&AG\=|\&IK\=|\&js\=)"; var envReg = new RegExp(regVal, 'gi'); var envRst = _trk_code_flash.match(envReg); var envRst = envRst.toString(); var envArr = envRst.split('&'); var envVar = envArr[1]; _trk_code_flash=_trk_code_flash.replace("&"+envVar+"&", _trk_piv ); }else{ _trk_code_flash = _trk_code_flash+"&PI="+_TRK_PI; } _trk_img_base_click.src=_trk_code_flash+"&dr=&CP="+_trk_escape(_TRK_CP)+"&rnd="+Math.random(); if(_TRK_U!="") { _trk_code_flash=_trk_code_flash.replace(/\?u=1071&XU=/g,"?u="+_TRK_U+"&XU="); _trk_img_chan_click.src=_trk_code_flash+"&dr=&CP="+_trk_escape(_TRK_CP)+"&rnd="+Math.random(); }}function _trk_clickTrace(_TRK_CKFL,_TRK_CKDATA) { var _trk_code_click=_trk_code_base.substr(0,_trk_code_base.indexOf("tracker.tsp")); _trk_code_click=_trk_code_click+"tracker_click.tsp?rnd="+Math.random()+"&CKFL="+_TRK_CKFL+"&CKDATA="+_trk_escape(_TRK_CKDATA); _trk_img_base_click.src=_trk_code_click+"&u=1071"; if(_TRK_U!="") _trk_img_chan_click.src=_trk_code_click+"&u="+_TRK_U;}function _trk_adClick( adSvr, svcCode, adCode ) { var ac = ""; var prtcl="https://"; if(prtcl=="https://") adSvr=""+_TRK_DOMAIN; ac=ac+prtcl+adSvr; _trk_img_base_click.src=ac+"/tracker_ad.tsp?u="+svcCode+"&mode=C&adCode="+adCode;}</script>
<noscript><img src="http://logger.busan.go.kr/tracker.tsp?u=1071&js=N" alt="logger" style="width:0px;height:0px" /></noscript>
<!-- END OF LOGGER TRACKING SCRIPT -->
</body>
</html>