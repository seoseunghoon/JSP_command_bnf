jQuery.fn.serializeObject = function() {
	var obj = null;
	try {
		// this[0].tagName이 form tag일 경우
		if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) {
			var arr = this.serializeArray();
			if(arr){
				obj = {};    
				jQuery.each(arr, function() {
					obj[this.name] = this.value;
				});				
			}
		}
	}catch(e) {
		alert(e.message);
	}finally  {}
	return obj;
};

/**
 * 트랙백 URL 클립보드에 복사
 */
function f_ClipUrl(loc){
	var IE=(document.all) ? true : false;
	if (IE) {
    	window.clipboardData.setData('Text',loc);
    	alert("트랙백 URL이 클립보드에 복사되었습니다!\n트랙백을 지원하는 모든 블로그에 트랙백 또는 엮인글에 주소를 넣고 작성하시면 됩니다.");
	}
	else {
		temp = prompt("이 글의 트랙백 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요", loc);
	}
}

/**
 * 비밀번호 입력 Dialog
 */
function f_showPasswordDialog(goUrl, bbsNo, nttNo, actionTy) {

	$('#actionTy').val(actionTy);
	$('#bbsNo').val(bbsNo);
	$('#nttNo').val(nttNo);
	$('#bbsPasswordChkFrm').attr('action', goUrl);
	$('#password').val('');

	$("#inputPassword").dialog({
    	modal: true
    	, title: "비밀번호 입력"
    	, resizable : false
    	, draggable: false
    	, width : 270
    });
}

/**
 * 비밀번호 입력 Dialog
 * goUrl,bbsNo,dataNo,secretUseAt,crud
 */
function f_showIdentificationDialog(goUrl,dataNo,secretUseAt,crud,bbsNo) {

	// default value 설정
	if (crud == null || typeof crud == 'undefined') crud = "";
	if (bbsNo == null || typeof bbsNo == 'undefined') bbsNo = "0";
	if (dataNo == null || typeof dataNo == 'undefined') dataNo = "0";
	if (secretUseAt == null || typeof secretUseAt == 'undefined') secretUseAt = "N";

	// dialog element 구성 (div>form>inputs)
	var dialogDiv = document.createElement("DIV");
	$(dialogDiv).attr({id:"inputPassword",style:"display: none;"});

	var frm = document.createElement("FORM");
	$(frm).attr({
		id:"bbsPasswordChkFrm",
		name:"bbsPasswordChkFrm",
		action: goUrl,
		method: "post"
	});
	
	$(frm).append('<input type="hidden" name="crud" value="'+crud+'"/>');
	$(frm).append('<input type="hidden" name="bbsNo" value="'+bbsNo+'"/>');
	$(frm).append('<input type="hidden" name="dataNo" value="'+dataNo+'"/>');
	$(frm).append('<input type="hidden" name="secretUseAt" value="'+secretUseAt+'"/>');
	
	var lang = $('html').attr('lang');
	var type = "hidden";
	var onkeypress = "";
	var option = "";
	if (lang != 'ko' && crud != 'CREATE') {
		$(frm).append('<p>You can modify or delete your post by using the name and email address you entered when you submit the post.</p>');
		type = "text";
		onkeypress = 'onkeypress="javascript:if(event.keyCode==13){f_bbsIdentificationChk();return false;}"';
		option = 'data-rules="required"';
	}

	$(frm).append('<input type="'+type+'" name="wrter" id="wrter" value="" title="Name" class="form-control" '+onkeypress+' '+option+'/>');
	$(frm).append('<input type="'+type+'" name="wrterEmail" id="wrterEmail" value="" title="Email" class="form-control" '+onkeypress+' '+option+'/>');

	if (lang != 'ko' && crud != 'CREATE')
		$(frm).append('<button type="button" class="btn btn-default mr-xs mb-sm" onclick="f_bbsIdentificationChk();return false;">confirm</button>');

	$(dialogDiv).html(frm);
	document.body.appendChild(dialogDiv);

	if (lang != 'ko' && crud != 'CREATE') {
		$("#inputPassword").dialog({
			modal: true
			, title: "Checking Identification"
			, resizable : false
			, draggable: false
			, width : 500
			, close : function() {
				$('#inputPassword').remove();
			}
		});
	} else {
		f_bbsIdentificationChk();
	}
}

/**
 * 비밀번호 조회
 */
function f_bbsPasswordChk() {
	var password = $('#password').val();
	if($.trim(password) == "") {
		alert($("#password").prop("title") + "은(는) 필수 입력값입니다.");
		return false;
	}

	$.ajax({
    	url: '/ajax/bbs/bbsPasswordChk.json',
		data : $('#bbsPasswordChkFrm').serialize(),
		type : 'POST',
        success: function(result) {
			if(result) {
				var actionTyVal = $('#actionTy').val();
				// 삭제일 경우 삭제 ajax 한번 더 호출
				if(actionTyVal == 'DELETE') {
					f_deleteNtt();
				} else {
					$('#bbsPasswordChkFrm').submit();
				}
			} else {
				$("#password").focus();
				alert("비밀번호가 일치 하지 않습니다.");
			}
        }
    });
}

/**
 * 비밀번호 조회
 */
function f_bbsIdentificationChk() {

	var bValid = true;
	$('#bbsPasswordChkFrm').find("input[data-rules]").each(function(){
		var rules = $(this).attr("data-rules");
		var value = $(this).val();
		if (rules.search("required") >= 0 && value == "" ) {
			alert($.validator.messages.required + ":" + $(this).attr("title"));
			bValid = false;
			return false;
		}
	});
	
	if (!bValid) return false;

	var url = $('#bbsPasswordChkFrm').attr("action");
	url = url.split("?");

	$.ajax({
    	url: url[0] + "/chkMberAuth",
		data : $('#bbsPasswordChkFrm').serialize(),
		contentType: "application/x-www-form-urlencoded",
		type : "POST",
		dataType:"json",
        success: function(result) {
			if (typeof result === 'string') {
				result = result.replace(/\\'/g, "'");
				result = JSON.parse(result);
			}
			if(result.rCode == "0") {
				var actionTyVal = $('#bbsPasswordChkFrm input[name="crud"]').val();
				// 삭제일 경우 삭제 ajax 한번 더 호출
				if(actionTyVal == 'DELETE') {
					$('#bbsPasswordChkFrm').attr({
						action : url[0]+"/action",
						enctype : "multipart/form-data"
					}).submit();
				} else {
					var action = url[0]+"/form";
					if (actionTyVal == 'UPDATE' && url.length > 1) action = action+"?"+url[1];
					$('#bbsPasswordChkFrm').attr("action",action).submit();
				}
			} else {
				alert(result.rMsg);
				if ($('html').attr('lang') != 'ko') $('#bbsPasswordChkFrm input[name="wrter"]').focus();
				if (result.locationUrl != null) document.location.href = result.locationUrl; //"${globalSiteDomain}/member/login";
			}
        },
		error: function(xhr){
			alert("[error] " + xhr);
		}
    });
}

/**
* 게시글 삭제
*/
function f_deleteNtt() {
	$.ajax({
    	url: '/ajax/bbs/deleteNtt.json',
		data : $('#bbsPasswordChkFrm').serialize(),
		type : 'POST',
        success: function(result) {
			alert(result.message);
			$('#bbsPasswordChkFrm').submit();
        }
    });
}

/**
* 게시글 삭제(회원)
*/
function f_deleteNttMber() {
	if( confirm("삭제 하시겠습니까?") ) {
		$("#frmNtt > #crud").val("DELETE");
		$("#frmNtt").attr("action", "action").submit();
	}
}

/**
 * 문서변환 스크립트
 */
function f_filePreivew(srvcId, upperNo, fileTy, fileNo){
	$.ajax({
		type : "POST",
		url : "/comm/docPreview",
		data : {
			"srvcId" : srvcId,
			"upperNo" : upperNo,
			"fileTy" : fileTy,
			"fileNo" : fileNo
		},
		success: function(resultMap) {
			if(resultMap){

				// 문서 변환 성공
				if(resultMap.resultCode == 0){
					window.open(resultMap.resultPage);

				// 파일이 없을 경우
				}else if(resultMap.resultCode == 999){
					alert("첨부파일이 존재하지 않습니다.");
				}else{
					alert("지원하지 않는 파일입니다.");
				}


			}else{
				alert("문서변환중 오류가 발생하였습니다.");
			}
		}
	});
}