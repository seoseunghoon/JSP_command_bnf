<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>신고합니다 -  : 부산민원120</title>
      <link rel="stylesheet" href="/humanframe/global/assets/vendor/jquery-ui/jquery-ui.min.css">
<link rel="stylesheet" href="/humanframe/global/assets/css/global.css">
<link rel="stylesheet" href="/humanframe/theme/minwon/assets/css/common.css?v=202201251040">

<link rel="stylesheet" href="/humanframe/theme/minwon/assets/css/content.css?v=202209231740">
<link rel="stylesheet" href="/humanframe/theme/minwon/assets/css/jquery.datetimepicker.css">
<link rel="stylesheet" href="/humanframe/global/assets/css/print.css" media="print">
<script src="/humanframe/global/assets/vendor/jquery/jquery.min.js"></script>
<script src="/humanframe/global/assets/vendor/jquery/jquery-migrate-1.2.1.min.js"></script>
<script src="/humanframe/global/assets/vendor/jquery-ui/jquery-ui.min.js"></script>
<script src="/humanframe/theme/minwon/assets/script/jquery.datetimepicker.js"></script>

<!--[if lte IE 9]>
<link rel="stylesheet" href="/humanframe/global/assets/css/common_ie9.css">
<![endif]-->
<!--[if lt IE 9]>
<script src="/humanframe/global/assets/vendor/plugins/html5shiv.min.js"></script>
<script src="/humanframe/global/assets/vendor/plugins/respond.min.js"></script>
<![endif]-->

<script src="/humanframe/global/assets/vendor/plugins/jquery.validate.min.js"></script>
<script src="/humanframe/global/assets/vendor/plugins/jquery.validate.rule.js"></script>
<script src="/humanframe/global/assets/vendor/plugins/jquery.cookie.js"></script>
<script src="/humanframe/global/assets/vendor/netfunnel/netfunnel.js"></script>
<script src="/humanframe/global/assets/script/global.js?v=202112091720"></script>
<script src="/humanframe/theme/minwon/assets/script/common.js?v=2"></script>

<script src="/humanframe/global/assets/vendor/plugins/localization/messages_ko.js"></script>
<script src="/humanframe/theme/minwon/assets/script/content.js?v=202112091720"></script>
<script src="/humanframe/global/assets/script/busan.bbs.js"></script>
<script src="/humanframe/theme/minwon/assets/script/date.js"></script>

</head>
<body>


<!-- start:header -->
<script>
function gologout(){
      alert("소셜 로그아웃되었습니다. \n(참고)페이스북/카카오톡/네이버에서도 로그아웃하시려면 \n각 웹사이트로 이동하여 로그아웃 하여 주십시오.");
      location.href = "http://www.busan.go.kr/member/logout";
   }
</script>

   <h3 class="titPage">
      신고합니다</h3>


<div class="containerInnr">
      <script type="text/javascript">
   $(function(){
      
      $("#wrter").attr("readonly", true);
      

      $("#frmNtt").validate({
         onkeyup: false,
         onclick: false,
         onfocusout: false,
         showErrors:function(errorMap, errorList){
                if(!$.isEmptyObject(errorList)){
                    alert(errorList[0].message);
                    return;
                }
            },
          rules : {
               ctgryNo : { required : true}
             , sj : {required : true}
             , wrter : {required : true}
//             , password : {required : true}
//             , passwordCheck : {required : true, equalTo:"#password"}
          },
          messages : {
               ctgryNo : { required : "" + $("#ctgryNo").prop("title") + "은(는) 필수 입력값입니다."}
             , sj : { required : "" + $("#sj").prop("title") + "은(는) 필수 입력값입니다."}
             , wrter : { required : "" + $("#wrter").prop("title") + "은(는) 필수 입력값입니다."}
//              , password : {required : "" + $("#password").prop("title") + "은(는) 필수 입력값입니다."}
//              , passwordCheck : {
//                 required : "" + $("#passwordCheck").prop("title") + "은(는) 필수 입력값입니다.",
//                 equalTo:"비밀번호가 일치 하지 않습니다."
//              }
          },
          submitHandler: function (frm) {
            
             var sjv = frm.sj.value;
             sjv = sjv.replace(/(\s*)/g,"");
             var sjcnt = sjv.length;
             if(sjcnt == 0){
                alert("제목은 필수 입력 값입니다.");
                frm.sj.value = "";
                frm.sj.focus();
                return;
             }
             
             
            

          }
      });

      $(".save").click(function(){
           if(f_save()){
              $("#frmNtt").submit();
           }
        });
      
   });

   function f_save(){

      
      return true;
   }

   function delFile(fileNo, type, idx){
      if( confirm("삭제 하시겠습니까?") ) {
         if(type == "ATTACH"){
            if($("#delAttachFileNo").val()==""){
               $("#delAttachFileNo").val(fileNo);
            }else{
               $("#delAttachFileNo").val($("#delAttachFileNo").val()+","+fileNo);
            }
            $("#attachFileView"+fileNo).remove();
            $("#attachFileInput"+idx).show();
         }
      }
   }

   function f_FileCheck(obj) {

      if(obj.value != ""){

         
         /* 첨부파일 확장자 체크*/
         var atchmnflExtsnArr = new Array();
         
         atchmnflExtsnArr.push("jpg");
         
         atchmnflExtsnArr.push("gif");
         
         atchmnflExtsnArr.push("png");
         
         atchmnflExtsnArr.push("hwp");
         
         atchmnflExtsnArr.push("xls");
         
         atchmnflExtsnArr.push("xlsx");
         
         atchmnflExtsnArr.push("doc");
         
         atchmnflExtsnArr.push("docx");
         
         atchmnflExtsnArr.push("ppt");
         
         atchmnflExtsnArr.push("pptx");
         
         atchmnflExtsnArr.push("pdf");
         
         atchmnflExtsnArr.push("txt");
         

         var file = obj.value;
         var fileExt = file.substring(file.lastIndexOf('.') + 1, file.length).toLowerCase();
         var isFileExt = false;

         for (var i = 0; i < atchmnflExtsnArr.length; i++) {
            if (atchmnflExtsnArr[i] == fileExt) {
               isFileExt = true;
               break;
            }
         }

         if (!isFileExt) {
            alert("허가되지 않은 파일형식입니다.\n확장자가 " + atchmnflExtsnArr + "인 파일만 첨부가능합니다.");
            obj.value = "";
            return false;
         }
         /* 첨부파일 확장자 체크*/
         

         /* 첨부파일 사이즈 체크*/
         var uploadFileSize = 0;
         var limitSize = 6;

         if($.browser.msie){
            var objFSO = new ActiveXObject("Scripting.FileSystemObject");
            var sPath = obj.value;
            var objFile = objFSO.getFile(sPath);
            uploadFileSize = objFile.size/ 1024;
         }else {
            uploadFileSize = (obj.files[0].size / 1024);
         }

         //메가바이트(MB)단위 변환
         uploadFileSize = (Math.round((uploadFileSize / 1024) * 100) / 100);

         if(limitSize != 0 && uploadFileSize > limitSize){
            alert("파일 제한 사이즈를 초과하였습니다.\n첨부파일 사이즈 : " + uploadFileSize + "MB\n첨부파일 허용 사이즈 : " + limitSize + "MB");
            obj.value = "";
            return false;
         }
         /* 첨부파일 사이즈 체크*/
      }

      function f_ThumbnailFileChk(fileObj){
         if(fileObj.value != ""){

            var file = fileObj.value;
            var fileExt = file.substring(file.lastIndexOf('.') + 1, file.length).toLowerCase();
            var reg = /gif|jpg|png|bmp/i;

            if(reg.test(fileExt) == false)
            {
               alert("썸네일이미지는 확장자가 gif, jpg, png, bmp로 된\n파일만 첨부 가능합니다.");
               fileObj.value = "";
               return false;
               return false;
            }
            return true;
         }
      }
   }

   </script>


   <div id="contents">
      <h3 class="titPage">신고합니다</h3>
      <!-- Start Code -->
      <p class="nbTxtTbRequired">*필수입력사항</p>
      <p class="nbTxtTbRequired">&#8251;내용 입력시 주민등록번호, 연락처 등 개인정보가 노출되지 않도록 주의하시기 바랍니다.</p>
      
      <form encType="multipart/form-data" id="form" name="form" action="<%=request.getContextPath() %>/board/report/regist.do" method="post">
     <!--  <input id="crud" name="crud" type="hidden" value="CREATE"/>
      <input id="bbsNo" name="bbsNo" type="hidden" value="360"/>
      <input id="nttNo" name="nttNo" type="hidden" value="0"/>
      <input id="nttGroup" name="nttGroup" type="hidden" value="0"/>
      <input id="nttOrdr" name="nttOrdr" type="hidden" value="1"/>
      <input id="nttLevel" name="nttLevel" type="hidden" value="0"/> -->
      <input type="hidden" id="delAttachFileNo" name="delAttachFileNo" value="" />
      
      <table class="tableWriteForm mt10">
         <!--CAPTIONWORK[0317]-->
      <caption>신고게시판 입력 :
         (으)로 구성된 표
      </caption>
         <colgroup>
            <col style="width:20%;">
            <col style="width:80%;">
         </colgroup>
         <tbody>

            <!-- 제목 -->
               <tr>
                  <th scope="row"><label for="sj">제목</label><span class="nbTxtTbRequired">*<span class="hidden">필수입력사항</span></span></th>
                  <td><input id="sj" name="title" class="textForm" style="width:100%;" title="제목" type="text" value=""/></td>
               </tr>
            <!-- 작성자 -->
            <tr>
               <th scope="row"><label for="wrter">작성자</label><span class="nbTxtTbRequired">*<span class="hidden">필수입력사항</span></span></th>
               <td>
                  <input id="wrter" name="writer" class="textForm" style="width:31%;min-width:110px;" title="작성자" type="text" value=""/></td>
            </tr>
            <!-- 공개여부 -->
               <tr>
               </tr>
               <!-- 내용 -->
               <tr>
                  <th scope="row"><label for="cn">내용</label><span class="nbTxtTbRequired">*<span class="hidden">필수입력사항</span></span></th>
                  <td><textarea id="cn" name="content" title="내용" style="height:150px;" placeholder="비회원 및 소셜 로그인 시 게시글 작성은 가능하나, 수정 및 삭제가 불가합니다. 이용에 참고 바랍니다."></textarea></td>
               </tr>
            <!-- 첨부파일 -->
               <!-- 일반 첨부파일 -->
               <tr>
                  <th scope="row">
                     첨부파일<br>
                     (최대 6MB)
                  </th>
                  <td>
                     <ul class="textFormFile">
                        <li id="attachFileInput0" >
                           <span class="cell">
                              <label for="file0" class="hidden">첨부파일1</label>
                              <input type="text" class="textForm" id="file0" disabled="disabled">
                              <input id="fileInput" name="fileInput" type="file" class="hidden" onchange="f_FileCheck(this);" >
                           </span>
                           <span class="cell btns">
                              <label for="fileInput" class="btnFile btnColorType2">첨부파일선택</label>
                           </span>
                        </li>
                        <li id="attachFileInput1" >
                           <span class="cell">
                              <label for="file1" class="hidden">첨부파일2</label>
                              <input type="text" class="textForm" id="file1" disabled="disabled">
                              <input id="attachFile1" name="attachFile1" type="file" class="hidden" onchange="f_FileCheck(this);" >
                           </span>
                           <span class="cell btns">
                              <label for="attachFile1" class="btnFile btnColorType2">첨부파일선택</label>
                           </span>
                        </li>
                        <li id="attachFileInput2" >
                           <span class="cell">
                              <label for="file2" class="hidden">첨부파일3</label>
                              <input type="text" class="textForm" id="file2" disabled="disabled">
                              <input id="attachFile2" name="attachFile2" type="file" class="hidden" onchange="f_FileCheck(this);" >
                           </span>
                           <span class="cell btns">
                              <label for="attachFile2" class="btnFile btnColorType2">첨부파일선택</label>
                           </span>
                        </li>
                        <li id="attachFileInput3" >
                           <span class="cell">
                              <label for="file3" class="hidden">첨부파일4</label>
                              <input type="text" class="textForm" id="file3" disabled="disabled">
                              <input id="attachFile3" name="attachFile3" type="file" class="hidden" onchange="f_FileCheck(this);" >
                           </span>
                           <span class="cell btns">
                              <label for="attachFile3" class="btnFile btnColorType2">첨부파일선택</label>
                           </span>
                        </li>
                        <li id="attachFileInput4" >
                           <span class="cell">
                              <label for="file4" class="hidden">첨부파일5</label>
                              <input type="text" class="textForm" id="file4" disabled="disabled">
                              <input id="attachFile4" name="attachFile4" type="file" class="hidden" onchange="f_FileCheck(this);" >
                           </span>
                           <span class="cell btns">
                              <label for="attachFile4" class="btnFile btnColorType2">첨부파일선택</label>
                           </span>
                        </li>
                        </ul>
                  </td>
               </tr>
               <!-- Q&A 첨부파일 -->
               </tbody>
      </table>
      <div class="btnArea">
         <span class="fC">
                <button type="submit" class="btnTypeM btnLineType1" value="">저장</button>
                  <a href="<%= request.getContextPath() %>/board/report/close.do" class="btnTypeM btnLineType1" title="수정">닫기</a>
         </span>
      </div>
      </form><!-- 개인정보수집동의 -->
      <!-- 버튼 -->
      
   </div></div>
   </div>
<!-- end:content -->

<!-- start:footer -->

<!-- Google Analytics -->
<!-- LOGGER TRACKING SCRIPT V.31 FOR area.busan.go.kr/120 / 1071 : FAIL-SAFE TYPE / DO NOT ALTER THIS SCRIPT. -->
<!-- COPYRIGHT (C) 2002-2016 BIZSPRING INC. LOGGER(TM) ALL RIGHTS RESERVED. -->
<script type="text/javascript">/* LOGGER TRACKING SCRIPT V.31 : 1071 *//*X*//* COPYRIGHT 2002-2016 BIZSPRING INC. *//*X*//* DO NOT MODIFY THIS SCRIPT. *//*X*/var _TRK_DOMAIN="logger.busan.go.kr";var _trk_bMSIE=(document.all)?true:false;var _trk_bJS12=(window.screen)?true:false;function _trk_escape(_str) { var str, ch; var bEncURI = "N"; eval("try{bEncURI=encodeURI('Y');}catch(_e){ }" ); if( bEncURI == "Y" ) str=encodeURI(_str); else str = escape(_str); str=str.split("+").join("%2B"); str=str.split("/").join("%2F"); str=str.split("&").join("%26"); str=str.split("?").join("%3F"); str=str.split(":").join("%3A"); str=str.split("#").join("%23"); return str;}function _trk_setCookie(name,value,expire) { var today=new Date(); today.setTime(today.getTime()+ expire ); document.cookie=name+"="+value+"; path=/; expires="+today.toGMTString()+";";}function _trk_getCookie(name) { var cookieName=name+"="; var x=0; while(x<=document.cookie.length) { var y=(x+cookieName.length); if(document.cookie.substring(x,y)==cookieName) {  if((endOfCookie=document.cookie.indexOf(";",y))==-1) endOfCookie=document.cookie.length;  return unescape(document.cookie.substring(y,endOfCookie)); } x=document.cookie.indexOf(" ",x)+1; if(x == 0) break; } return "";}function _trk_getParameter(name) { var paraName=name+"="; var URL=""+self.document.location.search; var tURL=""; eval("try{ tURL=top.document.location.search; }catch(_e){}"); URL=URL+"&"+tURL; if(URL.indexOf(paraName)!=-1) { var x=URL.indexOf(paraName)+paraName.length; var y=URL.substr(x).indexOf("&"); if(y!=-1) return URL.substring(x,x+y); else return URL.substr(x); } return "";}function _trk_make_code(_TRK_SERVER,_TRK_U) { var dt=document.title.toString(); dt=dt.substr(0,128); var dr=self.document.referrer; var tdr=""; eval("try{ tdr=top.document.referrer; }catch(_e){}"); var tdu=""; eval("try{ tdu=top.document.location.href; }catch(_e){}"); var bFrm=false; if(dr==tdu) { dr=tdr; bFrm=true; } if(dr=="undefined") dr=""; var du=self.document.location.href; if(du.substr(0,4)=="file") return ""; var adKeyVal = ""; if(bFrm) { adKeyVal=_trk_getParameter("OVKEY"); if(adKeyVal!="" && du.indexOf("OVKEY=")<0) {  if(du.indexOf("?")!=-1) du=du+"&OVKEY="+adKeyVal; else du=du+"?OVKEY="+adKeyVal;  adKeyVal=_trk_getParameter("OVRAW");  if(adKeyVal!="" && du.indexOf("OVRAW=")<0 ) if(du.indexOf("?")!=-1) du=du+"&OVRAW="+adKeyVal; else du=du+"?OVRAW="+adKeyVal; } else {  adKeyVal=_trk_getParameter("netpia");  if(adKeyVal!="" && du.indexOf("netpia=")<0 ) if(du.indexOf("?")!=-1) du=du+"&netpia="+adKeyVal; else du=du+"?netpia="+adKeyVal; } adKeyVal=_trk_getParameter("logger_kw"); if(adKeyVal!="" && du.indexOf("logger_kw=")<0 )  if(du.indexOf("?")!=-1) du=du+"&logger_kw="+adKeyVal; else du=du+"?logger_kw="+adKeyVal; adKeyVal=_trk_getParameter("source"); if(adKeyVal!="" && du.indexOf("source=")<0 )  if(du.indexOf("?")!=-1) du=du+"&source="+adKeyVal; else du=du+"?source="+adKeyVal; adKeyVal=_trk_getParameter("keywd"); if(adKeyVal!="" && du.indexOf("keywd=")<0 )  if(du.indexOf("?")!=-1) du=du+"&keywd="+adKeyVal; else du=du+"?keywd="+adKeyVal; adKeyVal=_trk_getParameter("NVADID"); if(adKeyVal!="" && du.indexOf("NVADID=")<0 )  if(du.indexOf("?")!=-1) du=du+"&NVADID="+adKeyVal; else du=du+"?NVADID="+adKeyVal; adKeyVal=_trk_getParameter("NVAR"); if(adKeyVal!="" && du.indexOf("NVAR=")<0 )  if(du.indexOf("?")!=-1) du=du+"&NVAR="+adKeyVal; else du=du+"?NVAR="+adKeyVal; adKeyVal=_trk_getParameter("NVADKWD");  if(adKeyVal!="" && du.indexOf("NVADKWD=")<0)  if(du.indexOf("?")!=-1) du=du+"&NVADKWD="+adKeyVal; else du=du+"?NVADKWD="+adKeyVal;  adKeyVal=_trk_getParameter("NVKWD");  if(adKeyVal!="" && du.indexOf("NVKWD=")<0 )  if(du.indexOf("?")!=-1) du=du+"&NVKWD="+adKeyVal; else du=du+"?NVKWD="+adKeyVal;   adKeyVal=_trk_getParameter("DWIT");  if(adKeyVal!="" && du.indexOf("DWIT=")<0) if(du.indexOf("?")!=-1) du=du+"&DWIT="+adKeyVal; else du=du+"?DWIT="+adKeyVal;  adKeyVal=_trk_getParameter("DWIC");  if(adKeyVal!="" && du.indexOf("DWIC=")<0 )  if(du.indexOf("?")!=-1) du=du+"&DWIC="+adKeyVal; else du=du+"?DWIC="+adKeyVal;  adKeyVal=_trk_getParameter("gad"); if(adKeyVal!="" && du.indexOf("gad=")<0 )  if(du.indexOf("?")!=-1) du=du+"&gad="+adKeyVal; else du=du+"?gad="+adKeyVal; adKeyVal=_trk_getParameter("gclid"); if(adKeyVal!="" && du.indexOf("gclid=")<0 )  if(du.indexOf("?")!=-1) du=du+"&gclid="+adKeyVal; else du=du+"?gclid="+adKeyVal; adKeyVal=_trk_getParameter("gkw"); if(adKeyVal!="" && du.indexOf("gkw=")<0 )  if(du.indexOf("?")!=-1) du=du+"&gkw="+adKeyVal; else du=du+"?gkw="+adKeyVal; adKeyVal=_trk_getParameter("rcsite"); if(adKeyVal!="" && du.indexOf("rcsite=")<0 )  if(du.indexOf("?")!=-1) du=du+"&rcsite="+adKeyVal; else du=du+"?rcsite="+adKeyVal; adKeyVal=_trk_getParameter("rctype"); if(adKeyVal!="" && du.indexOf("rctype=")<0 )  if(du.indexOf("?")!=-1) du=du+"&rctype="+adKeyVal; else du=du+"?rctype="+adKeyVal; adKeyVal=_trk_getParameter("rc_code"); if(adKeyVal!="" && du.indexOf("rc_code=")<0 )  if(du.indexOf("?")!=-1) du=du+"&rc_code="+adKeyVal; else du=du+"?rc_code="+adKeyVal; adKeyVal=_trk_getParameter("_C_"); if(adKeyVal!="" && du.indexOf("_C_=")<0 )  if(du.indexOf("?")!=-1) du=du+"&_C_="+adKeyVal; else du=du+"?_C_="+adKeyVal; } var ce=navigator.cookieEnabled?"Y":"N"; var je=navigator.javaEnabled()?"Y":"N"; var ss=""; var cd = ""; if(_trk_bJS12) { ss=screen.width+"x"+screen.height; cd=screen.colorDepth; } if(!dt) dt=""; if(!dr) dr=""; if(!du) du=""; if(!ce) ce=""; if(!je) je=""; var t = new Date; var tye=(_trk_bMSIE)?(t.getYear()):(t.getFullYear()); var tmo=t.getMonth()+1; var tda=t.getDate(); var tho=t.getHours(); var tmi=t.getMinutes(); var tse=t.getSeconds(); var tzo=t.getTimezoneOffset(); var tc = ""; var prtcl="https://"; if(prtcl=="https://") _TRK_SERVER=""+_TRK_DOMAIN; tc=tc+prtcl+_TRK_SERVER; var bPNF=((typeof _TRK_PI)!="undefined" && _TRK_PI=="PNF")?true:false; if(bPNF) tc=tc+"/tracker_click.tsp"; else tc=tc+"/tracker.tsp"; tc=tc+"?u="+_TRK_U+"&XU=&EXEN="+_EXEN; if(bPNF) { tc=tc+"&rnd="+Math.random()+"&CKFL="+_TRK_PI+"&CKDATA="+_trk_escape(du); } else { tc=tc+"&dr="+_trk_escape(dr)+"&XDR="+"&dt="+_trk_escape(dt)+"&du="+_trk_escape(du); if((typeof _TRK_CP)!="undefined" && _TRK_CP!="") tc=tc+"&CP="+_trk_escape(_TRK_CP)+"&XCP="; if((typeof _TRK_PI)!="undefined" && _TRK_PI!="") tc=tc+"&PI="+_TRK_PI; if((typeof _TRK_PN)!="undefined" && _TRK_PN!="") tc=tc+"&PN="+_trk_escape(_TRK_PN); if((typeof _TRK_MF)!="undefined" && _TRK_MF!="") tc=tc+"&MF="+_trk_escape(_TRK_MF); if((typeof _TRK_OA)!="undefined" && _TRK_OA!="") tc=tc+"&OA="+_TRK_OA; if((typeof _TRK_OP)!="undefined" && _TRK_OP!="") tc=tc+"&OP="+_trk_escape(_TRK_OP); if((typeof _TRK_OE)!="undefined" && _TRK_OE!="") tc=tc+"&OE="+_TRK_OE; if((typeof _TRK_CC)!="undefined" && _TRK_CC!="") tc=tc+"&CC="+_TRK_CC; if((typeof _TRK_RK)!="undefined" && _TRK_RK!="") tc=tc+"&RK="+_trk_escape(_TRK_RK); if((typeof _TRK_SX)!="undefined" && _TRK_SX!="") tc=tc+"&SX="+_TRK_SX; if((typeof _TRK_AG)!="undefined" && _TRK_AG!="") tc=tc+"&AG="+_TRK_AG; if((typeof _TRK_IK)!="undefined" && _TRK_IK!="") tc=tc+"&IK="+_trk_escape(_TRK_IK); tc=tc+"&js=Y"+"&ss="+escape(ss)+"&cd="+cd+"&ce="+ce+"&je="+je+"&tzo="+tzo+"&tye="+tye+"&tmo="+tmo+"&tda="+tda+"&tho="+tho+"&tmi="+tmi+"&tse="+tse; } return tc;}var _TRK_LIFE=_trk_getParameter("_L_");if(_TRK_LIFE=="") _TRK_LIFE=14;_TRK_LIFE = parseInt(_TRK_LIFE)*24*60*60*1000;var _TRK_U="";var _TRK_U_P=_trk_getParameter("_U_");var _TRK_U_C= _trk_getCookie("_TRK_U");if(_TRK_U_C!="") _TRK_U=_TRK_U_C;if(_TRK_U_P!="") _TRK_U=_TRK_U_P;if(_TRK_U!="" && _TRK_U_P!="") _trk_setCookie("_TRK_U",_TRK_U,_TRK_LIFE);var _TRK_CC_C=_trk_getCookie("_TRK_CC");var _TRK_CC_P=_trk_getParameter("_C_");if((typeof _TRK_CC)!="undefined" && _TRK_CC!="") _TRK_CC_P=_TRK_CC;if(_TRK_CC_C!="") _TRK_CC=_TRK_CC_C;if(_TRK_CC_P!="") _TRK_CC=_TRK_CC_P;if((typeof _TRK_CC)!="undefined" && _TRK_CC!="" && _TRK_CC_P!="") _trk_setCookie("_TRK_CC",_TRK_CC,_TRK_LIFE);var _TRK_RK_C=_trk_getCookie("_TRK_RK");var _TRK_RK_P=_trk_getParameter("_R_");if((typeof _TRK_RK)!="undefined" && _TRK_RK!="") _TRK_RK_P=_TRK_RK;if(_TRK_RK_C!="") _TRK_RK=_TRK_RK_C;if(_TRK_RK_P!="") _TRK_RK=_TRK_RK_P;if((typeof _TRK_RK)!="undefined" && _TRK_RK!="" && _TRK_RK_P!="") _trk_setCookie("_TRK_RK",_TRK_RK,_TRK_LIFE);var _SS_LIFE = 30*60*1000;var _EXEN = _trk_getCookie("_EXEN");if( _EXEN == "" ) _EXEN = 0; _EXEN ++;_trk_setCookie("_EXEN",_EXEN,_SS_LIFE);var _trk_code_base=_trk_make_code("logger.busan.go.kr","1071");var _trk_code_chan="";if(_TRK_U!="") _trk_code_chan=_trk_code_base.replace(/\?u=1071&XU=/g,"?u="+_TRK_U+"&XU=");var _trk_img_base=new Image();var _trk_img_chan=new Image();var _trk_img_base_click=new Image();var _trk_img_chan_click=new Image();if(_trk_bJS12==true) { if(_trk_bMSIE) { _trk_img_base.src=_trk_code_base; if(_TRK_U!="") _trk_img_chan.src=_trk_code_chan; } else { setTimeout("_trk_img_base.src=_trk_code_base;",1); if(_TRK_U!="") setTimeout("_trk_img_chan.src=_trk_code_chan;",1); }} else { if(_trk_bMSIE) document.write('<div style=\"display: none\">'); document.write('<img src=\"'+_trk_code_base+'\" height=\"0\" width=\"0\" alt=\"\" >'); if(_TRK_U!="") document.write('<img src=\"'+_trk_code_chan+'\" height=\"0\" width=\"0\" alt=\"\" >'); if(_trk_bMSIE) document.write('</div>');}function _trk_flashEnvView(env1,env2,env3,env4,env5,env6,env7,env8,env9,env10,env11,env12){ var _trk_code_flash=_trk_code_base; for (var envCnt=1; envCnt< 13; envCnt++){ if((eval("env"+envCnt) != "") && (typeof eval("env"+envCnt) != "undefined" )){  var trk_str  = eval("env"+envCnt) ;  if(trk_str.indexOf("_TRK_CP")>=0){   var trk_cp = trk_str.split('=');   var _TRK_CP = trk_cp[1];   _trk_code_flash=_trk_code_flash.replace(/&CP=.*&XCP=/g,"&XCP=");   _trk_code_flash=_trk_code_flash.replace(/&dr=.*&XDR=/g,"&XDR=");   _trk_code_flash=_trk_code_flash+"&dr=&CP="+_trk_escape(_TRK_CP)+"&rnd="+Math.random();   if(_TRK_U!="") {    _trk_code_flash=_trk_code_flash.replace(/\?u=1071&XU=/g,"?u="+_TRK_U+"&XU=");   }  }  if((trk_str.indexOf("_TRK_PN")>=0) || (trk_str.indexOf("_TRK_MF")>=0) || (trk_str.indexOf("_TRK_RK")>=0) || (trk_str.indexOf("_TRK_OP")>=0) || (trk_str.indexOf("_TRK_IK")>=0)){   var trk_env = trk_str.split('=');   var _TRK_ENV = _trk_escape(trk_env[1]);   var tkr_env_name = trk_str.substring(trk_str.indexOf('_',1)+1,trk_str.lastIndexOf('='));   var _trk_envs = "&"+tkr_env_name+"="+ _TRK_ENV;   if( _trk_code_flash.indexOf("&"+tkr_env_name+"=") > 0) {    var regVal = "\&"+tkr_env_name+"\=(.*)(\&PN\=|\&MF\=|\&OA\=|\&OP\=|\&OE\=|\&CC\=|\&RK\=|\&SX\=|\&AG\=|\&IK\=|\&js\=)";    var envReg = new RegExp(regVal, 'gi');    var envRst = _trk_code_flash.match(envReg);    var envRst = envRst.toString();    var envArr = envRst.split('&');    var envVar = envArr[1];    _trk_code_flash=_trk_code_flash.replace("&"+envVar+"&", _trk_envs);   }else{    _trk_code_flash = _trk_code_flash+"&"+tkr_env_name+"="+_TRK_ENV;   }  }  if((trk_str.indexOf("_TRK_PI")>=0) || (trk_str.indexOf("_TRK_OA")>=0) || (trk_str.indexOf("_TRK_OE")>=0) || (trk_str.indexOf("_TRK_CC")>=0) || (trk_str.indexOf("_TRK_SX")>=0) || (trk_str.indexOf("_TRK_AG")>=0)){   var trk_env = trk_str.split('=');   var _TRK_ENV = trk_env[1];   var tkr_env_name = trk_str.substring(trk_str.indexOf('_',1)+1,trk_str.lastIndexOf('='));   var _trk_envs = "&"+tkr_env_name+"="+_TRK_ENV+"&";   if( _trk_code_flash.indexOf("&"+tkr_env_name+"=") > 0) {    var regVal = "\&"+tkr_env_name+"\=(.*)(\&PN\=|\&MF\=|\&OA\=|\&OP\=|\&OE\=|\&CC\=|\&RK\=|\&SX\=|\&AG\=|\&IK\=|\&js\=)";    var envReg = new RegExp(regVal, 'gi');    var envRst = _trk_code_flash.match(envReg);    var envRst = envRst.toString();    var envArr = envRst.split('&');    var envVar = envArr[1];    _trk_code_flash=_trk_code_flash.replace("&"+envVar+"&", _trk_envs);   }else{    _trk_code_flash = _trk_code_flash+"&"+tkr_env_name+"="+_TRK_ENV;   }  } } } _trk_img_base_click.src=_trk_code_flash ;}function _trk_flashContentsView(_TRK_PI, _TRK_CP) { var _trk_code_flash=_trk_code_base; var _trk_piv = "&PI="+_TRK_PI+"&"; _trk_code_flash=_trk_code_flash.replace(/&CP=.*&XCP=/g,"&XCP="); _trk_code_flash=_trk_code_flash.replace(/&dr=.*&XDR=/g,"&XDR="); if( _trk_code_flash.indexOf("&PI=") > 0) { var regVal = "\&PI\=(.*)(\&PN\=|\&MF\=|\&OA\=|\&OP\=|\&OE\=|\&CC\=|\&RK\=|\&SX\=|\&AG\=|\&IK\=|\&js\=)"; var envReg = new RegExp(regVal, 'gi'); var envRst = _trk_code_flash.match(envReg); var envRst = envRst.toString(); var envArr = envRst.split('&'); var envVar = envArr[1]; _trk_code_flash=_trk_code_flash.replace("&"+envVar+"&", _trk_piv ); }else{ _trk_code_flash = _trk_code_flash+"&PI="+_TRK_PI; } _trk_img_base_click.src=_trk_code_flash+"&dr=&CP="+_trk_escape(_TRK_CP)+"&rnd="+Math.random(); if(_TRK_U!="") { _trk_code_flash=_trk_code_flash.replace(/\?u=1071&XU=/g,"?u="+_TRK_U+"&XU="); _trk_img_chan_click.src=_trk_code_flash+"&dr=&CP="+_trk_escape(_TRK_CP)+"&rnd="+Math.random(); }}function _trk_clickTrace(_TRK_CKFL,_TRK_CKDATA) { var _trk_code_click=_trk_code_base.substr(0,_trk_code_base.indexOf("tracker.tsp")); _trk_code_click=_trk_code_click+"tracker_click.tsp?rnd="+Math.random()+"&CKFL="+_TRK_CKFL+"&CKDATA="+_trk_escape(_TRK_CKDATA); _trk_img_base_click.src=_trk_code_click+"&u=1071"; if(_TRK_U!="") _trk_img_chan_click.src=_trk_code_click+"&u="+_TRK_U;}function _trk_adClick( adSvr, svcCode, adCode ) { var ac = ""; var prtcl="https://"; if(prtcl=="https://") adSvr=""+_TRK_DOMAIN; ac=ac+prtcl+adSvr; _trk_img_base_click.src=ac+"/tracker_ad.tsp?u="+svcCode+"&mode=C&adCode="+adCode;}</script>
<noscript><img src="http://logger.busan.go.kr/tracker.tsp?u=1071&js=N" alt="logger" style="width:0px;height:0px" /></noscript>
<!-- END OF LOGGER TRACKING SCRIPT -->
</body>
</html>