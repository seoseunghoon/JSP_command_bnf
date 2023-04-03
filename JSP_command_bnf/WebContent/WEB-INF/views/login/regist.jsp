<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



			<!-- header :E -->

			<!-- 타이틀 :S -->
			<div class="login_txt">
						<h2>회원가입</h2>
			</div>
			<!-- 타이틀 :E -->

			<div class="member_join">
				
				<form id="detailForm" name="detailForm" method="post" action="/integ/registerMember/integMemberJoinProc.do">
					<input type="hidden" name="dupkey" id="dupkey" value="MC0GCCqGSIb3DQIJAyEAwwnkfk0U/IlyxA1C0eCXFwWdp1Ss0AXk1DjunbHZcl8=" />
					<input type="hidden" name="phone" id="phone" />
					<input type="hidden" name="jobPhone" id="jobPhone" />
					<input type="hidden" name="mobile" id="mobile" />
					<input type="hidden" name="email" id="email" />
					<input type="hidden" name="birthday" id="birthday"/>
					
					
					<input type="hidden" name="isForeigner" id="isForeigner" value="N" />
					
					<input type="hidden" name="loginMethod" id="loginMethod" value="1" />
					<input type="hidden" name="siteCd" value="drh">
					<input type="hidden" name="interPrfrmCodeList" id="interPrfrmCodeList" />
					<input type="hidden" name="emailRcvYnList" id="emailRcvYnList" />
					<input type="hidden" name="smsRcvYnList" id="smsRcvYnList" />
					<input type="hidden" name="leafletRcvYnList" id="leafletRcvYnList" />
					
						

						
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
													<label for="memId">회원ID<span class="color_d71010 ">*</span></label>
												</th>
												<td class="al_l">
													<input type="text" name="memId" id="memId" class="in" style="width: 20%;" onkeypress="if(event.keyCode == 13) { chkDupId(); return false; }" onchange="G_CHKDUPID = false;" />
													<a class="btn_type07" onclick="chkDupId();return false;" href="#">아이디중복조회</a>
													<span class="text_2b74d9" id="msgId">※ 아이디 중복 여부 확인하세요.</span>
													<p class="text_red top_padd_10">※ 사용자 ID는 4~12자의 영문 소문자와 숫자만 가능하며, 연속된 문자나 숫자를 3개 이상 사용할 수 없습니다.</p>
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">
													<label for="passwd">비밀번호<span class="color_d71010 ">*</span></label>
												</th>
												<td class="al_l">
													<input type="password" name="passwd" id="passwd" class="in_pw top_padd_10" />
													<div>
														<ul class="h5_ul">
															<li class="text_red top_padd_10">※ 영문소문자,대문자, 숫자, 특수문자 중 3가지이상 혼합하여 8자리 이상 사용바랍니다.</li>
														</ul>
													</div>
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">
													<label for="passwd_confirm">비밀번호확인<span class="color_d71010 ">*</span></label>
												</th>
												<td class="al_l">
													<input type="password" name="passwd_confirm" class="in_pw" id="passwd_confirm" />
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">
													휴대폰번호<span class="color_d71010 ">*</span>
												</th>
												<td class="al_l">
													<label class="invisible" for="mobile1">휴대전화 앞자리 선택</label> <select name="mobile1" id="mobile1">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="018">018</option>
														<option value="019">019</option>
													</select> <span class="b_table_none">-</span> <label class="invisible" for="mobile2">국번</label>
													<input type="text" name="mobile2" class="in" id="mobile2" style="width: 35px;" maxlength="4">
													<span class="b_table_none">-</span> <label class="invisible" for="mobile3">뒷자리 번호</label>
													<input type="text" name="mobile3" class="in" id="mobile3" style="width: 35px;" maxlength="4">
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">
													생년월일<span class="color_d71010 ">*</span>
												</th>
												<td class="al_l">
													<input name="birthday1" id="birthday1" value="1996" disabled="disabled" style="width:36px">&nbsp;-
													
													&nbsp;
		                                    		<input name="birthday2" id="birthday2" value="03" disabled="disabled" style="width:22px">&nbsp;-
													
													&nbsp;
													<input name="birthday3" id="birthday3" value="12" disabled="disabled" style="width:22px">
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">
													주소<span class="color_d71010 ">*</span>
												</th>
												<td class="al_l">
													<div class="b_address">
														<label class="invisible" for="zipCd">우편번호</label>
														<input type="text" name="zipCd" id="zipCd" class="in" style="width: 100px;">
														<a class="btn_type07" onclick="return openRoadAddrPopup1('defaultAddress','detailAddress','zipCd','');" href="#none">우편번호검색</a>
														<label class="invisible" for="defaultAddress">기본주소</label>
														<input name="defaultAddress" id="defaultAddress" class="in" style="width: 96%;" type="text">
														<label class="invisible" for="detailAddress">상세주소</label>
														<input name="detailAddress" class="in" id="detailAddress" style="width: 96%;" type="text">
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 회원기본정보 :E -->

							<!-- 추가정보 :S -->
							<div class="member_m_step02">
								<h3>추가정보</h3>
								<div class="b_table">
									<table summary="회원가입에 필요한 회원정보를 입력하는 폼입니다.">
										<caption>회원정보 입력 폼입니다.</caption>
										<colgroup>
											<col style="width: 20%;">
											<col style="width: 80%;">
										</colgroup>
										<tbody>
											<tr>
												<th class="al_l" scope="row">일반전화번호</th>
												<td class="al_l">
													<label class="invisible" for="phone1">지역번호 선택</label> <select name="phone1" id="phone1">
														<option value="02">02</option>
														<option value="031">031</option>
														<option value="032">032</option>
														<option value="033">033</option>
														<option value="041">041</option>
														<option selected="selected" value="042">042</option>
														<option value="043">043</option>
														<option value="044">044</option>
														<option value="051">051</option>
														<option value="052">052</option>
														<option value="053">053</option>
														<option value="054">054</option>
														<option value="055">055</option>
														<option value="061">061</option>
														<option value="062">062</option>
														<option value="063">063</option>
														<option value="064">064</option>
														<option value="070">070</option>

													</select><span class="b_table_none">-</span> <label class="invisible" for="phone2">국번</label>
													<input name="phone2" class="in" id="phone2" style="width: 35px;" type="text" maxlength="4">
													<span class="b_table_none">-</span> <label class="invisible" for="phone3">번호</label>
													<input name="phone3" class="in" id="phone3" style="width: 35px;" type="text" maxlength="4">
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">이메일</th>
												<td class="al_l">
													<label class="invisible" for="email1">아이디</label>
													<input name="email1" class="in" id="email1" style="width: 100px;" type="text">
													<span class="b_table_none">@</span> <label class="invisible" for="email_domain">메일 계정 주소 선택</label> <select name="email_domain" id="email_domain"
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
													</select> <label class="invisible" for="email2">메일 계정 주소</label>
													<input name="email2" class="in" id="email2" style="width: 96%;" type="text">
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">성별</th>
												<td class="al_l">
													<input type="radio" name="sex" id="sex1" value="1">
													<label for="sex1" class="detail_info_label mr30"><span class="mr5"></span>남</label>
													<input type="radio" name="sex" id="sex2" value="2">
													<label for="sex2" class="detail_info_label"><span class="mr5"></span>여</label>
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">대전시립연정국악원</th>
												<td class="al_l">
													<p>
														<strong class="mr30">관심정보</strong>
														<input type="checkbox" name="interPrfrmCode" id="KMS_P11" value="KMS_P11">
														<label for="KMS_P11" class="detail_info_label mr10"><span class="mr5"></span>국악</label>
														<input type="checkbox" name="interPrfrmCode" id="KMS_P12" value="KMS_P12">
														<label for="KMS_P12" class="detail_info_label mr10"><span class="mr5"></span>한국무용</label> <span class="long"><label for="KMS_P99" class="detail_info_label">기타&nbsp;</label></span>
														<input type="text" name="interPrfrmEtc_KMS" id="KMS_P99" value="">
													</p>
													<p class="mt10">
														<strong class="mr30">서비스정보 수신여부</strong>
														<input type="checkbox" name="emailRcvYn" id="emailRcvYn_KMS" value="KMS_Y">
														<label for="emailRcvYn_KMS" class="detail_info_label mr10"><span class="mr5"></span>e-mail</label>
														<input type="checkbox" name="smsRcvYn" id="smsRcvYn_KMS" value="KMS_Y">
														<label for="smsRcvYn_KMS" class="detail_info_label mr10"><span class="mr5"></span>SMS</label>
													</p>
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">대전시립미술관</th>
												<td class="al_l">
													<p>
														<strong class="mr30">관심정보</strong>
														<input type="checkbox" name="interPrfrmCode" id="DMA_P21" value="DMA_P21">
														<label for="DMA_P21" class="detail_info_label mr10"><span class="mr5"></span>전시</label>
														<input type="checkbox" name="interPrfrmCode" id="DMA_P22" value="DMA_P22">
														<label for="DMA_P22" class="detail_info_label mr10"><span class="mr5"></span>교육</label> <span class="long"><label for="DMA_P99" class="detail_info_label">기타&nbsp;</label></span>
														<input type="text" name="interPrfrmEtc_DMA" id="DMA_P99" value="">
													</p>
													<p class="mt10">
														<strong class="mr30">서비스정보 수신여부</strong>
														<input type="checkbox" name="emailRcvYn" id="emailRcvYn_DMA" value="DMA_Y">
														<label for="emailRcvYn_DMA" class="detail_info_label mr10"><span class="mr5"></span>e-mail</label>
														<input type="checkbox" name="smsRcvYn" id="smsRcvYn_DMA" value="DMA_Y">
														<label for="smsRcvYn_DMA" class="detail_info_label mr10"><span class="mr5"></span>SMS</label>
													</p>
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">대전예술의전당</th>
												<td class="al_l">
													<!--<p>
														<strong class="mr30">관심정보</strong>
														<input type="checkbox" name="interPrfrmCode" id="DJAC_P31" value="DJAC_P31"><label for="DJAC_P31" class="detail_info_label mr10"><span class="mr5"></span>오페라</label>
														<input type="checkbox" name="interPrfrmCode" id="DJAC_P32" value="DJAC_P32"><label for="DJAC_P32" class="detail_info_label mr10"><span class="mr5"></span>뮤지컬</label>
														<input type="checkbox" name="interPrfrmCode" id="DJAC_P33" value="DJAC_P33"><label for="DJAC_P33" class="detail_info_label mr10"><span class="mr5"></span>연극</label>
														<input type="checkbox" name="interPrfrmCode" id="DJAC_P34" value="DJAC_P34"><label for="DJAC_P34" class="detail_info_label mr10"><span class="mr5"></span>무용</label>
														<input type="checkbox" name="interPrfrmCode" id="DJAC_P35" value="DJAC_P35"><label for="DJAC_P35" class="detail_info_label mr10"><span class="mr5"></span>음악회</label>
														<span class="long"><label for="DJAC_P99" class="detail_info_label">기타&nbsp;</label></span><input type="text" name="interPrfrmEtc_DJAC" id="DJAC_P99" value="">
													</p> -->
													<p>
														<strong class="mr30">서비스정보 수신여부</strong>
														<input type="checkbox" name="emailRcvYn" id="emailRcvYn_DJAC" value="DJAC_Y">
														<label for="emailRcvYn_DJAC" class="detail_info_label mr10"><span class="mr5"></span>e-mail</label>
														<input type="checkbox" name="smsRcvYn" id="smsRcvYn_DJAC" value="DJAC_Y">
														<label for="smsRcvYn_DJAC" class="detail_info_label mr10"><span class="mr5"></span>SMS</label>
														<input type="checkbox" name="leafletRcvYn" id="leafletRcvYn_DJAC" value="DJAC_Y">
														<label for="leafletRcvYn_DJAC" class="detail_info_label mr10"><span class="mr5"></span>우편(리플릿)</label>
													</p>
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">대전한밭도서관</th>
												<td class="al_l">
													<p>
														<strong class="mr30">서비스정보 수신여부</strong>
														<input type="checkbox" name="emailRcvYn" id="emailRcvYn_HAN" value="HAN_Y">
														<label for="emailRcvYn_HAN" class="detail_info_label mr10"><span class="mr5"></span>e-mail</label>
														<input type="checkbox" name="smsRcvYn" id="smsRcvYn_HAN" value="HAN_Y">
														<label for="smsRcvYn_HAN" class="detail_info_label mr10"><span class="mr5"></span>SMS</label>
													</p>
												</td>
											</tr>
											<tr>
												<th class="al_l" scope="row">대전시립박물관</th>
												<td class="al_l">
													<p>
														<strong class="mr30">서비스정보 수신여부</strong>
														<input type="checkbox" name="smsRcvYn" id="smsRcvYn_HIS" value="HIS_Y"><label for="smsRcvYn_HIS" class="detail_info_label mr10"><span class="mr5"></span>SMS</label>
													</p>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 추가정보 :E -->
						
					

					<div class="btn_area">
						<a href="javascript:void(0);" title="저장하기" class="login_join_btn01" onclick="javascript:fn_Save(); return false;">저장</a>
						<a href="javascript:void(0);" title="취소하기" class="login_join_btn03" onclick="document.detailForm.reset(); return false;" href="#link">취소</a>
					</div>
				</form>
			</div>
		</div>
		<!-- //join_wrap_01 끝 -->

	<script type="text/javascript">
		
	</script>
	</div>
	<!-- //join_wrap 끝 -->
	