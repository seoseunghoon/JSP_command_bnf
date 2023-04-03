<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h3 class="titPage">시민게시판</h3>
<div id="contents">
	<h3 class="titPage">시민게시판</h3>

	<!-- Start Code -->
	<div class="containerInnr">
		<main id="contents">
			<form enctype="multipart/form-data" id="frmNtt" name="frmNtt"
				action="<%=request.getContextPath()%>/board/citizen/regist.do"
				method="post">
				<!-- 버튼 -->
				<div class="btnArea btnRt">
					<span class="fC">
						<div class="btnTypeM btnLineType2">
							<!-- 취소버튼 -->
							<button onClick="history.back();">취소</button>
						</div>
					</span>
				</div>
				<input type="hidden" name="writer" value="${ loginUser.id }" />
				<table class="tableWriteForm mt10">
					<!--CAPTIONWORK[0317]-->
					<colgroup>
						<col style="width: 20%;">
						<col style="width: 80%;">
					</colgroup>
					<tbody>

						<!-- 제목 -->
						<tr>
							<th scope="row"><label for="sj">제목</label><span
								class="nbTxtTbRequired">*<span class="hidden">필수입력사항</span></span></th>
							<td><input id="title" name="title" class="textForm"
								style="width: 100%;" title="제목" type="text" value=""></td>
						</tr>
						<!-- 작성자 -->
						<tr>
							<th scope="row"><label for="writer">작성자</label><span
								class="nbTxtTbRequired">*<span class="hidden">필수입력사항</span></span></th>
							<td><input id="writer" name="writer" class="textForm"
								style="width: 31%; min-width: 110px;" title="작성자" type="text"
								value=""></td>
						</tr>
						<!-- 내용 -->
						<tr>
							<th scope="row"><label for="cn">내용</label><span
								class="nbTxtTbRequired">*<span class="hidden">필수입력사항</span></span></th>
							<td><textarea id="cn" name="cn" title="내용"
									style="height: 150px;"
									placeholder="비회원 및 소셜 로그인 시 게시글 작성은 가능하나, 수정 및 삭제가 불가합니다. 이용에 참고 바랍니다."></textarea></td>
						</tr>
						<!-- 첨부파일 -->
						<!-- 일반 첨부파일 -->
						<tr>
							<th scope="row">첨부파일<br> (최대 6MB)
							</th>
							<td>
								<ul class="textFormFile">
									<li id="attachFileInput0"><span class="cell"> <label
											for="file0" class="hidden">첨부파일1</label> <input type="text"
											class="textForm" id="file0" disabled="disabled"> <input
											id="attachFile0" name="attachFile0" type="file"
											class="hidden" onchange="f_FileCheck(this);">
									</span> <span class="cell btns"> <label for="attachFile0"
											class="btnFile btnColorType2">첨부파일선택</label>
									</span></li>
									
								</ul>
							</td>
						</tr>
						<!-- Q&A 첨부파일 -->
					</tbody>
				</table>
				<div class="btnArea btnRt">
					<!-- 저장버튼 -->
					<button type="button" class="btn btn-primary" id="registBtn" onclick="regist_go();">등 록</button>
					<!-- <button type="submit" class="btnTypeM btnLineType1">제출</button> -->
				</div>
			</form>
			<!-- 개인정보수집동의 -->
		</main>

	</div>
</div>

<script>
function regist_go(){
	
	var inputs = $('input[name="attachFile0"]');
	for(var input of inputs){
		//console.log(input.name+" : "+input.value);
		if(input.value==""){
			alert("파일을 선택하세요.");
			input.focus();
			input.click();
			return;
		}
	}	
	
	
	var formData = {
			writer : "작성자는 필수입니다.",
			title : "제목은 필수입니다."					
	}
	
	var flag=true;
	Object.keys(formData).forEach(function(name){			
		if($("input[name='"+name+"']").val()==""){ //form.title.value
			$("input[name='"+name+"']").attr("placeholder",formData[name]);
			$("input[name='"+name+"']").attr("class","form-control is-invalid");
			$("input[name='"+name+"']").focus();
			flag = flag && false; 
		}else{
			$("input[name='"+name+"']").attr("class","form-control");
		}			
	});
	
	if(flag) $("form[role='form']").submit();
	
}
</script>