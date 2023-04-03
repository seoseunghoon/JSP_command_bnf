<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	alert("${newBook.newTitle}님의 정보가 삭제되었습니다.");
	
	window.onload=function(){
		CloseWindow();	
	window.opener.location.reload(true);
	}
</script>
    