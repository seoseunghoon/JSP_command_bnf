<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- footer :S -->
    <div class="login_footer">
		<div>
			<ul>
				<li><a href="/drh/DrhContentsHtmlView.do?menuSeq=2062">개인정보처리방침</a></li>
				<li><a href="/drh/DrhContentsHtmlView.do?menuSeq=1757">영상정보처리기기 운영·관리방침</a></li>
				<li><a href="/drh/DrhContentsHtmlView.do?menuSeq=3274">이용안내</a></li>
				<li><a href="/drh/board/boardNormalList.do?boardId=homepage_0001&menuSeq=1507">누리집 개선의견</a></li>
				<li>문의(<span class="fred">042-120</span>)</li>
			</ul>
			<p class="foot_copy">COPYRIGHT 2019 ⓒ DAEJEON METROPOLITAN CITY. ALL RIGHTS RESERVED.</p>
		</div>
	</div>
<!-- footer :E -->  

</div>
</div>
<script>

function login(){
	if($("#id").val() == ""){
		alert("아이디를 입력하세요.");
		$("#id").focus();
		return false;
	}
	if($("#pwd").val() == ""){
		alert("비밀번호를 입력하세요.");
		$("#pwd").focus();
		return false;
	}
	
	document.frm.submit();
}

</script>


</html>