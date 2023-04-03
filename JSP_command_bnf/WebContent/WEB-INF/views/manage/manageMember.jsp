
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="memberList" value="${dataMap.memberList }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />


<title> 관리창 : 부산민원120</title>


<div id= "location">
		<div class="locationInner">
			<div class="lineMap">
				<span class="hidden">현재 본문 위치 :</span>
				<span>Home</span> &gt; <span>시민참여</span> &gt;  <a href="#" class="colorBlack">관리자</a></div>
			
		</div>
	</div>
	<h3 class="titPage">
		관리자 페이지</h3>


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
		<fieldset class="manageHead">
			<legend>목록내 검색</legend>
			<div class="manageSearchForm">
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
		<p class="MemberListTxt">총 <b class="totalNum"></b>명 (<b>1</b>/1page)</p>
		
		<table class="boardList">
		
	<thead>
		<tr>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">선택</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">아이디</th>
			<th scope="col" class="pc_Y ta_Y mo_Y nowrap">이름</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">부서명</th>
			<th style="width:15%;" scope="col" class="pc_Y ta_Y mo_Y nowrap">전화번호</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">권한</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">등록일자</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">등록자</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">수정</th>
			<th style="width:10%;" scope="col" class="pc_Y ta_Y mo_N">삭제</th>
			</tr>
	</thead>

	<tbody>
		<!-- 공지사항 목록 -->
		<!-- 일반게시물 목록 -->
						
					
			<c:if test="${empty memberList}">
				<td colspan="5">게시글이 없습니다.</td>
			</c:if>
			<tr>
			
			<c:forEach items="${memberList}" var="member">
				<!-- 제목 -->
				<tr>
								<td><label><input type="checkbox" name="color" value="${member.id}" onchange="checkBoxChange('${member.id}')" ></label></td>
				
								<td class="pc_Y ta_Y mo_N">
								${member.id}</td>
								<td class="pc_Y ta_Y mo_Y title"><a href="<%=request.getContextPath() %>/member/detail.do?id=${member.id}">
								${member.name}</a>
								</td>
								
								<td class="pc_Y ta_Y mo_Y title">
								${member.depart}
								</td>
								<td class="pc_Y ta_Y mo_Y title">
								${member.phone}
								</td>
								
								<td class="pc_Y ta_Y mo_Y title">
								${member.authority }
								
								</td>
								
								
								
								<td class="pc_Y ta_Y mo_Y title">
								
								</td>
								
								
								<td class="pc_Y ta_Y mo_Y title">
								
								</td>
								<td><button onclick="location.href='<%=request.getContextPath()%>/member/modifyForm.do?id=${member.id}'">수정</button></td>
								<td><button onclick="location.href='<%=request.getContextPath()%>/member/remove.do?id=${member.id}'">삭제</button></td>
							<!-- 첨부파일-->	
								<!-- <td></td>
							부서	
								<td class="pc_Y ta_Y mo_N"> </td>
							작성일
								<td class="pc_Y ta_Y mo_Y nowrap">${manage.regDate}</td> 
							나머지
								<td class="pc_Y ta_Y mo_N">${manage.updateDate}</td>
								
								
							뷰 카운트	
								<td class="pc_Y ta_Y mo_N"></td> -->
				</tr>
				
			</c:forEach>
			<td colspan="10"><button onclick="FormSend()">블랙리스트 등록</button> </td>
		</tbody>
</table>

<form id="idForm" action="<%= request.getContextPath()%>/manage/blackList.do" method="post">
	<input id="idInput" type="hidden" value="" name="id">
</form>


<c:if test="${!empty memberList}">
			<%@ include file="/WEB-INF/module/pagination.jsp" %>
</c:if>	



<script>
function checkBoxChange(data){
	
	$('#idInput').val(data);
}
</script>

<script>

function FormSend(){
	$('#idForm').submit();
}

</script>

<div id="lv-container" data-id="busancity" data-uid="NjY2LzE2MzY0Lzc3NA==">

<noscript>라이브리 댓글 작성을 위해 JavaScript를 활성화해주세요</noscript>
</div></main></div>
</div>

  


