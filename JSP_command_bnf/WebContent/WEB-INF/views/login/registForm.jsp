<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<body>
			<!-- header :E -->

			<!-- 타이틀 :S -->
			<div class="login_txt">
						<h2>회원가입</h2>
			</div>
			<!-- 타이틀 :E -->

			<div class="member_join">
				
				<form id="frm" name="frm" method="post" action="regist.do">
					
							<!-- 회원기본정보 :S -->
							<div class="member_m_step01">
								<h3>회원기본정보</h3>
								<div class="b_table">
									<table>
										<caption>회원가입에 필요한 회원정보를 입력하는 폼입니다.</caption>
										<colgroup>
											<col style="width: 20%;" />
											<col style="width: 80%;" />
										</colgroup>
										<tbody>
											<tr>
												<th class="al_l" scope="row">
													성명<span class="color_d71010 ">*</span>
												</th>
												<td class="al_l">
													<input type="text" name="name" id="name" value="" >
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">
													회원ID<span class="color_d71010 ">*</span>
												</th>
												<td class="al_l">
													<input type="text" name="id" id="id" class="in" onchange="change_id();" style="width: 20%;" />
													<button type="button" onclick="idCheck_go();"  class="btn_type07">중복확인</button>
													<span class="text_2b74d9" id="msgId">※ 아이디 중복 여부 확인하세요.</span>
													<!-- <p class="text_red top_padd_10">※ 사용자 ID는 4~12자의 영문 소문자와 숫자만 가능하며, 연속된 문자나 숫자를 3개 이상 사용할 수 없습니다.</p> -->
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">
													비밀번호<span class="color_d71010 ">*</span>
												</th>
												<td class="al_l">
													<input type="password" name="pwd" id="pwd" class="in_pw top_padd_10" />
													<div>
														<ul class="h5_ul">
															<!-- <li class="text_red top_padd_10">※ 영문소문자,대문자, 숫자, 특수문자 중 3가지이상 혼합하여 8자리 이상 사용바랍니다.</li> -->
														</ul>
													</div>
												</td>
											</tr>
											<tr>
												
											</tr>
											<tr>	
												<th class="al_l" scope="row">
													휴대폰번호
												</th>
												<td class="al_l">
													<select name="mobile1" id="mobile1">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="018">018</option>
														<option value="019">019</option>
													</select> <span class="b_table_none">-</span>
													<input type="text" name="mobile2" class="in" id="mobile2" style="width: 35px;" maxlength="4">
													<span class="b_table_none">-</span>
													<input type="text" name="mobile3" class="in" id="mobile3" style="width: 35px;" maxlength="4">
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">
													주소
												</th>
												<td class="al_l">
													<div class="b_address">
														<input name="address" class="in" id="address" style="width: 96%;" type="text">
													</div>
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">이메일</th>
												<td class="al_l">
													
													<input name="email1" class="in" id="email1" style="width: 100px;" type="text">
													<span class="b_table_none">@</span> <select name="email_domain" id="email_domain"
														onchange="$('#email2').val($('#email_domain').val());if($('#email_domain').val() == ''){$('#email2').css('visibility','visible');}else{$('#email2').css('visibility','hidden')}">
														<option value="">직접입력</option>
														<option value="naver.com">naver.com</option>
														<option value="nate.com">nate.com</option>
														<option value="dreamwiz.com">dreamwiz.com</option>
														<option value="yahoo.co.kr">yahoo.co.kr</option>
														<option value="empal.com">empal.com</option>
														<option value="unitel.co.kr">unitel.co.kr</option>
														<option value="gmail.com">gmail.com</option>
														<option value="korea.com">korea.com</option>
														<option value="chol.com">chol.com</option>
														<option value="paran.com">paran.com</option>
														<option value="freechal.com">freechal.com</option>
														<option value="hanmail.net">hanmail.net</option>
														<option value="hotmail.com">hotmail.com</option>
													</select> 
													<input name="email2" class="in" id="email2" style="width: 96%;" type="text">
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 추가정보 :E -->
						
					
						</form>

					<div class="btn_area">
						<a href="regist.do" title="등록하기" class="login_join_btn01" onclick="javascript:regist_go();return false;">등록</a>
						<a href="javascript:void(0);" title="취소하기" class="login_join_btn03" onclick="document.detailForm.reset(); return false;" href="#link">취소</a>
					</div>
			</div>
		</div>
		<!-- //join_wrap_01 끝 -->




<script type="text/javascript">

	<!-- 아이디 중복체크 -->
	var checkedID ="";
	var check = 0;
	var input_ID=$('input[name="id"]');
	
	function change_id(){
		check = 0;
	}
	
	function idCheck_go(){
		//alert("id check btn click");
		
		
		if(!input_ID.val()){
	       alert("아이디를 입력하시오");
	       input_ID.focus();
	       return;
		}
		
		 $.ajax({
			 url : "idCheck.do?id="+input_ID.val().trim(),    	 	
	    	 success : function(result){
	    	
	    	  console.log(result);
	   		  if(result.toUpperCase() == "DUPLICATED"){
	                 alert("중복된 아이디 입니다.");
	                 check = 1;
	                 $('input[name="id"]').focus();
	   		  }else{
	              alert("사용가능한 아이디 입니다.");
	              check = 2;
	              checkedID=input_ID.val().trim();
	              $('input[name="id"]').val(input_ID.val().trim());             
	           }
	    	 },
	    	 error:function(error){
	    		 alert('다시시도해주세요');
	    		 /* AjaxErrorSecurityRedirectHandler(error.status); */	
	    	 }
		 });
	}
	
	function regist_go(){
		
		var input_ID=$('input[name="id"]');
		var check_phone2=$('input[name="mobile2"]').val()
		var check_phone3=$('input[name="mobile3"]').val()
		if(!$('input[name="id"]').val()){
		    alert("아이디는 필수입력 값입니다.");
		    return;
		}
		if(!$('input[name="pwd"]').val()){
		   alert("패스워드는 필수입력 값입니다.");
		   return;
	    }
		if(!$('input[name="name"]').val()){
	       alert("이름은 필수입력 값입니다.");
	       return;
	    }
		if(check_phone2||check_phone3){
			if(check_phone2.length<4 ||check_phone3.length<4){
			alert("전화번호 입력 값에 오류가 있습니다.");
		    return;
			}
		}
		/* if(!$('input[name="email"]').val()){
		   alert("이메일은 필수입니다.");
		   return;
		} */
	    if(check==2){
		document.frm.submit();
	    }else if(check==1){
			alert("중복아이디 입니다.");
			input_ID.focus();
		}else{
			alert("아이디 중복확인은 필수입니다.");
			input_ID.focus();
		}
	}

	</script>
	</div>
	<!-- //join_wrap 끝 -->
	</body>