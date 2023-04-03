<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<body>




	<!-- div id="location">
		<div class="locationInner">
			<div class="lineMap">
				<span class="hidden">현재 본문 위치 :</span> <span>Home</span> &gt; <span>시민참여</span>
				&gt; <a href="/minwon/nanum" class="colorBlack">나눔장터</a>
			</div>

		</div>
	</div> -->
	<h3 class="titPage">나눔장터</h3>


	<div class="containerInnr">
		<main id="contents">
			<form encType="multipart/form-data" id="frmNtt" name="modifyForm" action="<%=request.getContextPath()%>/board/market/regist.do" method="post">
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
							<th scope="row"><label for="title">제목</label><span
								class="nbTxtTbRequired">*<span class="hidden">필수입력사항</span></span></th>
							<td><input id="title" name="title" class="textForm"
								style="width: 100%;" title="제목" type="text" value="" /></td>

						</tr>
						<!-- 작성자 
            <tr>
               
               <td>
                  
            </tr>-->

						<!-- 내용 -->
						<!-- <tr>
							<th scope="row"><label for="cn">내용</label><span
								class="nbTxtTbRequired">*<span class="hidden">필수입력사항</span></span></th>
							<td><textarea id="content" name="content" title="내용"
									style="height: 400px;" placeholder=""></textarea></td>
						</tr> -->
						<tr>
							<th>
								<label for="content">내 용</label>
								</th>
								<td>
								<textarea class="form-control" name="content" id="content" rows="5"
									placeholder="1000자 내외로 작성하세요."></textarea>
							</td>
						</tr>
						
						
						
						
						<!-- 첨부파일 -->
						<!-- 일반 첨부파일 -->
						<tr>
							<th scope="row">첨부파일<br> (최대 6MB)
							</th>
							<td>
								<ul class="textFormFile">
									<li id="attachFileInput0"><span class="cell"> <label
											for="file0" class="hidden">첨부파일1</label>
											 <input type="text" class="textForm" id="file0" disabled="disabled">
											  <input id="fileInput" name="fileInput" type="file" class="hidden" onchange="f_FileCheck(this);">
									</span> <span class="cell btns">
										 <label for="fileInput" class="btnFile btnColorType2">첨부파일선택</label>
									</span></li>

								</ul>
							</td>
						</tr>
						<!-- Q&A 첨부파일 -->
					</tbody>

				</table>
				<div class="btnArea btnRt">
					<!-- 수정버튼 -->
					<input type=submit class="btnTypeM btnLineType1">
				</div>
			</form>





		</main>

		<!-- 비밀번호 입력 레이어  -->
		<!-- end:content -->

		<!-- start:footer -->
<style>
@font-face {
    font-family: 'NotoSans';
    font-style: normal;
    font-weight: 100;
    src: 
        url('NotoSans-Thin.woff2') format('woff2'), 
        url('NotoSans-Thin.woff') format('woff'),
        url('NotoSans-Thin.ttf') format('truetype'),
        url('NotoSans-Thin.otf') format('opentype'),
        url('NotoSans-Thin.eot') format('embedded-opentype');
}</style>
		<!-- LOGGER TRACKING SCRIPT V.31 FOR area.busan.go.kr/120 / 1071 : FAIL-SAFE TYPE / DO NOT ALTER THIS SCRIPT. -->
		<!-- COPYRIGHT (C) 2002-2016 BIZSPRING INC. LOGGER(TM) ALL RIGHTS RESERVED. -->
		<script type="text/javascript">
		window.onload=function(){
			summernote_go($('#content'),'<%=request.getContextPath()%>');
	}
		</script>
		
	<!-- summernote -->
	
		<noscript>
			<img src="http://logger.busan.go.kr/tracker.tsp?u=1071&js=N"
				alt="logger" style="width: 0px; height: 0px" />
		</noscript>
		<!-- END OF LOGGER TRACKING SCRIPT -->
</body>
