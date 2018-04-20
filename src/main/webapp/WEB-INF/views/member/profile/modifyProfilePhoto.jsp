<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<style>
h1{
margin:0;
}
</style>
<body>
<div class="_1eg8c">
	<div class="_5g4e2 _62ai2">
		<button class="_3xjwv" id="btnChangePhoto" title="프로필 사진 바꾸기">
			<img alt="프로필 사진 바꾸기" class="_cuacn" 
			src="
				<c:if test="${userVO.profilephoto ne null && userVO.profilephoto != '' }">
					/displayFile?fileName=${userVO.profilephoto}
				</c:if>
				<c:if test="${userVO.profilephoto eq null || userVO.profilephoto == '' }">
					../../resources/img/emptyProfile.jpg
				</c:if>
			">
		</button>
	</div>
		<div class="_ax54t" style="display: block;">
			<h1 class="_gvhl0" title="${userVO.nickname}">${userVO.nickname}</h1> 
			<a class="_5aav8 linkChangeProfilePotho" href="javascript:;">프로필
				사진 수정</a>
		</div>
	</div>
	
</body>

<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<script id="modalTemplate" type="text/x-handlebars-template"> 
	<div class="_pfyik" role="dialog" onclick="callRemoveDialog(event)">
	<div class="_23gmb"></div>
	<div class="_o0j5z" onclick="callRemoveDialog(event)">
	<div class="_784q7" id="modalChangeProfilePhoto" onclick="callRemoveDialog(event)">
		<ul class="_cepxb">
			<li class="_hql7s">프로필 사진 바꾸기</li>
			<li class="_o2wxh"><button class="_h74gn"
					id="btnRemovePhoto" onclick="removePhoto(event)">현재 사진 삭제</button></li>
			<li class="_hql7s"><button class="_h74gn"
					id="btnPhotoUpload" onclick="callFileUploader(event)">사진 업로드</button></li>
			<li class="_hql7s"><button class="_h74gn" id="btnCancle" onclick="callRemoveDialog(event)">취소</button></li>
		</ul>
	</div>
		</div>
		<button class="_dcj9f"  onclick="callRemoveDialog(event)">닫기</button>
	</div> 
<style>
._pfyik{background-color:rgba(0,0,0,.5);bottom:0;-webkit-box-pack:justify;-webkit-justify-content:space-between;-ms-flex-pack:justify;justify-content:space-between;left:0;overflow-y:auto;-webkit-overflow-scrolling:touch;position:fixed;right:0;top:0;z-index:1}
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
$(document).ready(function(){

	//프로필 사진 버튼 클릭
	$("#btnChangePhoto, .linkChangeProfilePotho").on("click",function(){
		if($("#btnChangePhoto").children("img").attr("src") != "../../resources/img/emptyProfile.jpg"){
			var template = Handlebars.compile($("#modalTemplate").html());
			$("#react-root").after(template);
			$("body").attr("sytle","position: fixed; top: -"+$(window).scrollTop()+"px; width: 100%;");
			$("#react-root").attr("aria-hidden","true");
			$('body').css("overflow","hidden");
			$("._hql7s").on("click",function(event){
				event.stopPropagation();
			});
		}
		else{
			$("#inputfile").click();
		}
	});
	
	//파일탐색기에서 OK누른 후 처리
	//파일 업로드
	$("#inputfile").on("change", function(event) {
		event.preventDefault();
		uploadFiles(this.files);
	});
	
	//현재사진 삭제버튼 클릭
	$("#btnRemovePhoto").on("click", function(event){
		//사진 삭제
		removePhoto(event);
		
	});
	
	//파일 업로드 버튼 클릭
	$("#btnPhotoUpload").on("click", function(event){
		callFileUploader(event);
	});
	//취소 버튼
	$("#btnCancle").on("click", function(event){
		callRemoveDialog(event);
	});
}); //ready end

//서버에 업로드
	//프로필 사진 바꾸기
	function uploadFiles(files) {
		$(files).each(function() {
			var file = this;

			console.log(this);
			var formData = new FormData();
			
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
					updatePhoto( "");
				}
			}
		});
	}
	
	
	//파일탐색기호출
	function callFileUploader(){
		$("#inputfile").click();
	}
		
	//팝업 닫기
	function callRemoveDialog(event){
		if(typeof event != "undefined"){
			event.stopPropagation();
		}

		$("body").attr("sytle","");
		$("#react-root").attr("aria-hidden","false");
		$("div[role='dialog']").remove();
		$('body').css("overflow","auto");
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
					}
					else{
						alert("프로필 사진 수정에 실패했습니다.");
					}
			}
		}); //ajax end
	}
</script>
</html>