<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--헤더-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>${userVO.name}(@${userVO.nickname})</title>
<style>
a {
	color: black;
}
a:hover {
	text-decoration: none;
}
.hashTag{
	color: hotpink;
}
.isFlw, #admin, #moreAction, .btnUserUnblock{
	float: right;
	font-size: 12px;
	font-weight: 400;
	cursor: pointer;
	background: 0 0;
	border-color: #dbdbdb;
	color: #262626;
	border-style: solid;
	border-width: 1px;
	line-height: 26px;
	border-radius: 2px;
}
.followModal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 15vh; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content */
.followModal-content {
	background-color: #fefefe;
	margin: auto;
	border: 1px solid #888;
	width: 30%;
	height: 70%;
	overflow: auto;
}
/* The Close Button */
.close {
	color: #fefefe;
	float: right;
	font-size: 50px;
	font-weight: bold;
	right: 1.5%;
	top: 0%;
	cursor: pointer;
	background: 0 0;
	border: 0;
	cursor: pointer;
	height: 36px;
	outline: 0;
	position: absolute;
	z-index: 2;
}
article {
	text-align: center;
}
.photo-profile {
	display: inline-block;
	width: 935px;
	max-width: 935px !important;
	margin-bottom: 70px;
	height: 170px;
}

#proPhoto {
	display: inline-block;
	text-align: center;
	width: 33%;
	height: 100%;
	float: left; /* 이거 안하면 위에 공간 뜸 */
}
#btnChangePhoto {
	width: 100%;
	height: 100%;
	border-radius: 50%; /*사진 둥글게 */
	display: inline-block;
	background-color: gray;
}
#proFile {
	display: inline-block;
	text-align: left;
	width: 63%;
	height: 170px;
	margin-left: 3%;
}

/* 첫번째줄 */
.firstLine {
	width: 613px;
	height: 40px;
	margin-bottom: 20px;
}

div.firstLine span {
	margin-right: 10px;
}

.fL-1 {
	font-size: 32px;
	font-weight: 200;
}

/* 두번째줄 */
.secondLine {
	margin-bottom: 20px;
	font-size:16px;
}

div.secondLine span {
	margin-right: 20px;
}

/* 세번째 줄 */
.thirdLine {
	margin-bottom: 20px;
}

.intro-name {
	margin-right: 5px;
	font-weight: bold;
	float: left;
}

.mid-line{
	border-top: 1px solid #efefef;
	width:935px;
	text-align:center;
	display:inline-block;
	font-size: 16px;
	font-weight: 200;
	height:35px;
}
.mid-line > span{
    height: 100%;
	padding-top:7px;
}
.mid-line > span:first-child {
	margin-right: 30px;
	border-top: 1.5px solid black;
}
</style>
</head>
<body>

<article>
	<div class="photo-profile">
		<section id="proPhoto">
			<div style="width:170px; height:100%; margin:auto;">
			<c:choose>
				<c:when test="${userVO.profilephoto ne null && userVO.profilephoto != ''}">
					<img id="btnChangePhoto" src="http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122${userVO.profilephoto}" />
				</c:when>
				<c:otherwise>
					<img id="btnChangePhoto" src="/resources/img/emptyProfile.jpg" />
				</c:otherwise>
			</c:choose>
			</div>
		</section>
	
		<section id="proFile">
			<div class="firstLine">
				<span class="fL-1">${userVO.nickname}</span>
				<c:choose>
					<c:when test="${userVO.id==login.id}">
						<span class="fL-2">
							<button id='admin'>
								<a href="/member/profile/edit">프로필 편집</a>
							</button>
						</span>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${userVO.isBlock > 0}">
								<span><button class='btnUserUnblock' onclick="userUnblock()">차단 해제</button></span>
							</c:when>
							<c:when test="${userVO.isFollow > 0}">
								<span><button class='isFlw' data-uid="${userVO.id}">팔로잉</button></span>
							</c:when>
							<c:otherwise>
								<span><button class='isFlw' data-uid="${userVO.id}">팔로우</button></span>
							</c:otherwise>
						</c:choose>
						<span><button id="moreAction">...</button></span>
					</c:otherwise>
				</c:choose>
			</div>
			
			<div class="secondLine">
				<span id="postCnt">게시물 ${userVO.postCount}</span>
				<span id="followed">팔로워 0</span>
				<span id="following">팔로우 0</span>
			</div>
			
			<div class="intro">
				<div class="intro-name">${userVO.name}</div>
				<span>${userVO.intro}</span> <div><a href='https://${userVO.website}'>${userVO.website}</a></div>
			</div>
		</section>
	</div>
</article>

<c:if test="${userVO.id==login.id}">
<article>
	<div class="mid-line">
	   <span>
	      <a href="javascript:;">게시물</a>
	   </span>
	   <span>
	      <a href="/member/${userVO.nickname}/store">저장됨</a>
	   </span>
	</div>
</article>
</c:if>



<!-- 프로필 이미지 input -->
<input type="file" name="file" id="inputfile" accept="image/*" style="display:none;">

<!-- 팔로워 팔로잉 list Modal -->
<script id="modalFollow" type="text/x-handlebars-template">
<div id="myFollowModal" class="followModal">
   <span class="close">&times;</span>
    <div class="followModal-content">
   <div class="followTitle"><strong>list</strong></div>
    <hr class="followLine">
   <ul id="followsContainer"></ul>
   </div>
</div>

<style>
.followModal-content{
width: 602px;
height: 600px;
}

.followTitle{
width:600px; 
height:51px;
padding: 16px;
}

.followLine{
width:600px;
margin-top: 0;
margin-bottom: 0;
}

.oneofList{
border-bottom: solid 1px #efefef;
width: 581px;
height: 53px;
padding: 8px 16px;
}

#followsContainer{
height: 536px;
overflow-y: scroll;
width: 600px;
list-style:none;   
padding:0;
}

.isFlw{
float: right;
font-size: 12px;
font-weight: 400;
cursor: pointer;
background: 0 0;
border-color: #dbdbdb;
color: #262626;
border-style: solid;
border-width: 1px;
line-height: 26px;
border-radius: 2px;
}

.followPhoto{
width: 33px;
height: 33px;
display: inline-block;
float: left;
border-radius: 150px;  /* 프사 둥글게 */
}


</style>


</script>


<script id="modalTemplate" type="text/x-handlebars-template">
   <div class="_pfyik" role="dialog" onclick="callRemoveDialog(event)">
   <div class="_23gmb"></div>
   <div class="_o0j5z" onclick="callRemoveDialog(event)">
   <div class="_784q7" id="modalChangeProfilePhoto" onclick="callRemoveDialog(event)">
   <ul class="_cepxb">
   </ul>
   </div>
   </div>
      <button class="_dcj9f"  onclick="callRemoveDialog(event)">닫기</button>
   </div>
<style>
._pfyik{background-color:rgba(0,0,0,.5);bottom:0;-webkit-box-pack:justify;-webkit-justify-content:space-between;-ms-flex-pack:justify;justify-content:space-between;left:0;overflow-y:auto;-webkit-overflow-scrolling:touch;position:fixed;right:0;top:0;z-index:20}
._dcj9f{background:0 0;border:0;cursor:pointer;height:36px;outline:0;overflow:hidden;position:absolute;right:0;top:0;z-index:2}
._dcj9f::before{color:#fff;content:'\00D7';display:block;font-size:36px;font-weight:600;line-height:36px;padding:0;margin:0}
._784q7{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;margin:auto;max-width:935px;pointer-events:auto;width:100%}
._23gmb{bottom:0;left:0;pointer-events:none;position:fixed;right:0;top:0;z-index:0}
._23gmb *{pointer-events:auto}
._o0j5z{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;min-height:100%;overflow:auto;width:auto;z-index:1}
@media (min-width:481px){._o0j5z{padding:0 40px;pointer-events:none;-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}
._o0j5z::after,._o0j5z::before{content:'';display:block;-webkit-flex-basis:40px;-ms-flex-preferred-size:40px;flex-basis:40px;-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0}}
@media (max-width:480px){._23gmb,._dcj9f{display:none}}

._h74gn{background:#fff;border:0;color:#262626;cursor:pointer;font-size:16px;font-weight:400;line-height:50px;margin:0;overflow:hidden;padding:0 16px;text-align:center;text-overflow:ellipsis;white-space:nowrap;width:100%}
._h74gn:hover{background-color:#efefef}
._hql7s,._o2wxh{background-color:#fff;border-bottom:1px solid #dbdbdb}
._o2wxh:last-child{border-bottom-width:0}
._hql7s{color:#999;font-size:16px;font-weight:600;line-height:50px;text-align:center}
@media (min-width:736px){._hql7s,._o2wxh{min-width:510px}}
@media (min-width:414px) and (max-width:735px){._cepxb,._hql7s,._o2wxh{width:100%}}
@media (min-width:414px){._cepxb{margin:0 auto}}
</style>
</script>

<script>
// ======================프로필 사진 버튼 클릭(자기페이지일 경우에만)==========================
// 모달팝업
if(${userVO.id}==${login.id}){
	$("#btnChangePhoto").css("cursor", "pointer");
	$("#btnChangePhoto").on("click",function(){	   
		   if($("#btnChangePhoto").children("img").attr("src") != "../../resources/img/emptyProfile.jpg"){
	         var template = Handlebars.compile($("#modalTemplate").html());
	         $("body").append(template);
	         //$("body").attr("sytle","position: fixed; top: -"+$(window).scrollTop()+"px; width: 100%;");
	         $("body").attr("aria-hidden","true");
	         
	         var list = '<li class="_hql7s">프로필 사진 바꾸기</li>';
	         list += '<li class="_o2wxh"><button class="_h74gn" id="btnRemovePhoto" onclick="removePhoto(event)">현재 사진 삭제</button></li>';
	         list += '<li class="_hql7s"><button class="_h74gn" id="btnPhotoUpload" onclick="callFileUploader(event)">사진 업로드</button></li>';
	       	 list += '<li class="_hql7s"><button class="_h74gn" id="btnCancle" onclick="callRemoveDialog(event)">취소</button></li>';
	         
	         $("._cepxb").html(list);
	         
	         $("._hql7s").on("click",function(event){
	              event.stopPropagation();
	         });
	      }else{
	         $("#inputfile").click();
	      }
	})
}

// 취소버튼 - CSS처리 (유저 더보기 액션에서도 동일 처리)
function callRemoveDialog(event){
   if(typeof event != "undefined"){
      event.stopPropagation();
   }
   $("body").attr("sytle","");
   $("body").attr("aria-hidden","false");
   $("div[role='dialog']").remove();
}

// 파일 업로드 - 파일탐색기에서 OK누른 후 처리
$("#inputfile").on("change", function(event) {
   console.log("change");
   event.preventDefault();
   uploadFiles(this.files);
});


// ======================프로필 사진 CRUD======================
//프로필 사진 바꾸기
function uploadFiles(files) {
   $(files).each(function() {
      var file = this;
      var formData = new FormData();
      console.log("method");
      if(this.type.indexOf('image') ==-1 ) {
    		console.log("이상한 파일");
    		alert("이미지 파일을 다시 선택하세요.");
    		return false;
  		}
      formData.append("file", this);
      $.ajax({
         url : '/uploadAjax',   
         data : formData,
         dataType : 'text',
         processData : false,
         contentType : false,
         type : 'POST',
         beforeSend : function(xhr)
         {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
         success : function(data) {
            var fileInfo = getFileInfo(data);
            //프로필 사진 수정
            $("#btnChangePhoto").children("img").attr("src", fileInfo.imgsrc);
            
            //DB업뎃
            updatePhoto(fileInfo.fullName);
         }
      }); //ajax end
   });
}

//프사지우기
function removePhoto(){
   var data_src = $("#btnChangePhoto").children("img").attr("src").substr(22);
   //첨부파일 삭제
   $.ajax({
      url : "/deleteFile",
      type : "post",
      data : {
         //data-src 첨부파일 fullname
         fileName : data_src
      },
      dataType : "text",
      beforeSend : function(xhr)
      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      },
      success : function(result) {
         if (result == 'deleted') {
            $("#btnChangePhoto").children("img").attr("src", "../../resources/img/emptyProfile.jpg");
            //DB 업뎃
            updatePhoto("");
         }
      }
   });
}

//파일탐색기호출
function callFileUploader(){
   $("#inputfile").click();
}

//프로필 사진 DB업데이트
function updatePhoto(fullName){
   $.ajax({
      url : '/member/profile/edit/modifyPhoto',
      data : {
         "userid": ${userVO.id},
         "fileName": fullName
      },
      dataType : 'text',
      type : 'POST',
      beforeSend : function(xhr)
      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      },
      success : function(result) {
            //update문, 0보다크면 업데이트 성공
            if(result > 0) {
               //대화창 닫기
               callRemoveDialog();
            }else{
               alert("프로필 사진 수정에 실패했습니다.");
            }
      }
   }); //ajax end
}

//======================유저 더보기 버튼 액션==========================
//모달팝업
$("#moreAction").on("click",function(){	   
	var template = Handlebars.compile($("#modalTemplate").html());
	$("body").append(template);
	//$("body").attr("sytle","position: fixed; top: -"+$(window).scrollTop()+"px; width: 100%;");
	$("body").attr("aria-hidden","true");
	
	var list = '<li class="_o2wxh"><button class="_h74gn" id="btnUserReport" onclick="userReport(event)">사용자 신고</button></li>';
	list += '<li class="_hql7s"><button class="_h74gn" id="btnUserBlock" onclick="userBlock(event)">이 사용자 차단하기</button></li>';
	list += '<li class="_hql7s"><button class="_h74gn" id="btnCancle" onclick="callRemoveDialog(event)">취소</button></li>';
	
	$("._cepxb").html(list);
	
	$("._hql7s").on("click",function(event){
	     event.stopPropagation();
	});
})

//사용자 신고
function userReport(){
	//임시 함수
	$("body").attr("sytle","");
	$("body").attr("aria-hidden","false");
	$("div[role='dialog']").remove();
}

//사용자 차단
function userBlock(){
	$.ajax({
		type: "post",
		url: "/member/block",
		headers: "{'X-HTTP-Method-Override' : 'POST'}",
		dataType: "text",
		async: false,
		data: {
			"userid": ${userVO.id}
		},
		beforeSend : function(xhr)
        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success: function(result){
			if(result=="SUCCESS"){
				alert("차단되었습니다");
				history.go(0);
			}
		}
	})
}

//사용자 차단해제
function userUnblock(){
	$.ajax({
		type: "delete",
		url: "/member/unblock/${userVO.id}",
		headers: "{'X-HTTP-Method-Override' : 'DELETE'}",
		dataType: "text",
		async: false,
		beforeSend : function(xhr)
        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success: function(result){
			if(result=="SUCCESS"){
				alert("차단해제되었습니다");
				history.go(0);
			}
		}
	})
}

//======================postFeed.jsp관련======================
var jsonList="profile";
var uid=${userVO.id};
</script>

<jsp:include page="/WEB-INF/views/include/postFeed.jsp" flush="false" />

<script>
//followList 에 followedList부여 및 팔로워 수 갱신 & 해쉬태그 필터 등록
$(document).ready(function(){
   followed();
   following();
   follow();
   searchFilter($(".intro"));
})

//body로딩 후
$(document).ready(function(){

	//viewport크기 관리
    $(window).resize(function(){
    	if(parseInt($(".photo-profile").css("max-width")) <= parseInt($(window).width())){
    		//viewport크기에 따른 컨테이너 가로값 조정
    		$(".photo-profile").css("width", "935px;");
    		$(".mid-line").css("width", "935px;");
        //viewport크기에 따른 사진이미지 높이 값 조정
    	}else if(parseInt($(".photo-profile").css("max-width")) >= parseInt($(window).width())){
    		$(".photo-profile").css("width", $(window).width());
    		$(".mid-line").css("width", $(window).width());
    	}
	})

})

</script>

</body>

</html>