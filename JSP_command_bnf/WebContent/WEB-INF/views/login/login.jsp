<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


 

<!DOCTYPE html>
<body>
		<!-- 타이틀 :S -->
		<div class="login_txt type02">
			<h2>로그인</h2>
			<div class="com_ment">
			</div>	
		</div>
		<!-- 타이틀 :E -->

        
        
		<!-- 로그인 입력 :S -->
		<div class="login_form type02">
			<div class="login_entry">
            		<fieldset>
					<legend>로그인</legend>
					<form id="frm" name="frm" action="login.do" method="post">
						<input type="hidden" id="siteCd" name="siteCd" value="drh">
						<input type="hidden" id="subSiteCd" name="subSiteCd" value="">
						<input type="hidden" id="rtUrl" name="rtUrl" value="">
						<input type="hidden" id="afterIntegVal" name="afterIntegVal" value="">
						<div class="entry_id_pw">
	                    	<ul class="text">
								<li><input placeholder="아이디" autocomplete="off" type="text"  id="id" name="id" maxlength="30" value="" title="아이디를 입력해주세요." onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);" onkeydown="javascript:if(event.keyCode == 13){login();}" style="ime-mode:inactive"><p class="id_ex">*ID는 영문,숫자 포함 4~12자까지 가능합니다.</p></li>
								<li><input placeholder="비밀번호" autocomplete="off" type="password" maxlength="30" id="pwd" name="pwd" value="" title="비밀번호를 입력해주세요." onkeydown="javascript:if(event.keyCode == 13){login();}"></li>
							</ul>
							
							<span class="entry_btn">
								
									<a href="login.do" onclick="javascript:login();return false;" title="로그인" id="logincheck">로그인</a>
									
							</span>
						</div>
                    </form>
					</fieldset>
			</div>
			
			<div class="login_join type02">
				<a href="<%= request.getContextPath() %>/login/registForm.do" title="회원가입" class="login_join_btn00">회원가입</a>
				
			</div>
		</div>
		
		<div class="pop_modal_djac bd_vote_result_layer_djac">
			<div class="djac_member_modal">
				<div class="djac_member_modal_view">
					<h4>회원님은 <strong>미통합회원</strong>입니다.</h4>
					<p><strong>2023년 6월 14일부터 미통합회원</strong>은<br />
					대전예술의전당 <strong>홈페이지 서비스 이용이 불가</strong>합니다.</p>
					<span>대전광역시 통합회원으로 전환하시고 편리하게 서비스를 받아보세요!</span>
					<div class="djac_member_modal_btn">
						<a href="" onclick="javascript:agreeInteg();return false;" title="클릭시 대전광역시 통합회원전환이 진행됩니다." class="login_join_btn04">통합회원 진행하기</a>
					</div>
					<p class="djac_member_modal_bottom"><strong>※ 자세한 사항은 공지사항을 확인해주시기 바랍니다.</strong><br />
					문의 전화 042)270-8114, 8154</p>
				</div>
			</div>
		</div>
		
		<div class="pop_modal bd_vote_result_layer">
			<div class="bd_vote_view_layer_area">
				<div class="bd_vote_result">
					<h4><strong>통합회원 전환 안내</strong></h4>
					<p>대전광역시 통합회원으로 전환하시면<br /><strong>하나의 아이디</strong>로 대전시패밀리 사이트 및 문화시설<br />(대전시립연정국악원, 예술의전당, 시립미술관) 사이트를 동시에 이용 가능합니다.</p>
					<div class="btn_area_layer mt30">
						<a href="" onclick="javascript:agreeInteg();return false;" title="통합회원 전환하기"  class="login_join_btn04">통합회원 전환하기</a>
					</div>
					<span class="btn_txt"><a href="" id="beforeAlert" onclick="javascript:afterInteg();return false;" title="다음에 하기" class="login_join_btn03">다음에 하기</a></span>
					<p class="bottom_txt">* 추후 통합회원전환은<br /><strong>[대전시청홈페이지-마이페이지-통합회원전환]</strong>에서<br />진행하실 수 있습니다.</p>
				</div>
			</div>
		</div>
		<div class="pop_modal_bg" style="display: none; top: 0px; height: 100%;"></div>
	</div>
</div>




</body>

