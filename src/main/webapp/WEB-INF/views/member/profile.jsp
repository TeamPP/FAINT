<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--헤더-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${userVO.name}(@${userVO.nickname})</title>
<!-- 프로필 사진 변경 공통 처리 -->
<script type="text/javascript" src="../../resources/js/upload.js"></script>
<style>

.followModal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
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
    right:1.5%;
    top:0%;
    cursor: pointer;
    
    background: 0 0;
    border: 0;
    cursor: pointer;
    height: 36px;
    outline: 0;
    position: absolute;
    z-index: 2;
}

</style>


</head>
<body>

<article>
	<header>
		<div>
		<c:choose>
			<c:when test="${userVO.profilephoto ne null && userVO.profilephoto != ''}">
				<button id="btnChangePhoto"><img src="/displayFile?fileName=${userVO.profilephoto}" style="width:50px; height:50px;"/></button>
			</c:when>
			<c:otherwise>
				<button id="btnChangePhoto"><img src="/resources/img/emptyProfile.jpg" style="width:50px; height:50px;"/></button>
			</c:otherwise>
		</c:choose>
		</div>
		<section>
			<h1>${userVO.nickname}</h1>
			<c:choose>
				<c:when test="${userVO.id==login.id}">
					<button id='admin'><a href="../member/profile/edit">프로필 편집</a></button>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${userVO.isFollow > 0}">
							<span><button class='isFlw' title="${userVO.id}">팔로잉</button></span>
						</c:when>
						<c:otherwise>
							<span><button class='isFlw' title="${userVO.id}">팔로우</button></span>
						</c:otherwise>
					</c:choose>
					<span><button>▽</button></span>
					<div><button>...</button></div>
				</c:otherwise>
			</c:choose>
			<ul>
				<li id="postCnt">게시물 ${userVO.postCount}</li>
				<li id="followed">팔로워 0</li>
				<li id="following">팔로우 0</li>
			</ul>
			<div class="intro">
				<h1>${userVO.name}</h1>
				<span>${userVO.intro}</span>
				<a href='https://${userVO.website}' >${userVO.website}</a>
			</div>
		</section>
	</header>
</article>

	
<h1>-------------아래부터 피드---------------</h1>

<c:if test="${userVO.id==login.id}">
	<div>
		<a href="javascript:;">게시물</a>
		<a href="/member/${userVO.nickname}/store">저장됨</a>
	</div>
</c:if>


<!-- 프로필 이미지 input -->
<input type="file" name="file" id="inputfile" accept="image/*" style="display:none;">

<!-- 팔로워 팔로잉 list Modal -->
<script id="modalFollow" type="text/x-handlebars-template">
<div id="myFollowModal" class="followModal">
	<span class="close">&times;</span>
	<div class="followModal-content">
		<ul id="followsContainer">
		</ul>
	</div>
</div>
</script>

<script id="modalTemplate" type="text/x-handlebars-template">
	<div class="_pfyik" role="dialog" onclick="callRemoveDialog(event)">
	<div class="_23gmb"></div>
	<div class="_o0j5z" onclick="callRemoveDialog(event)">
	<div class="_784q7" id="modalChangeProfilePhoto" onclick="callRemoveDialog(event)">
	<ul class="_cepxb">
		<li class="_hql7s">프로필 사진 바꾸기</li>
		<li class="_o2wxh"><button class="_h74gn" id="btnRemovePhoto" onclick="removePhoto(event)">현재 사진 삭제</button></li>
		<li class="_hql7s"><button class="_h74gn" id="btnPhotoUpload" onclick="callFileUploader(event)">사진 업로드</button></li>
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

//프로필 사진 버튼 클릭

$("#btnChangePhoto").on("click",function(){
	if(${userVO.id}==${login.id}){
		if($("#btnChangePhoto").children("img").attr("src") != "../../resources/img/emptyProfile.jpg"){
			var template = Handlebars.compile($("#modalTemplate").html());
			$("body").append(template);
			//$("body").attr("sytle","position: fixed; top: -"+$(window).scrollTop()+"px; width: 100%;");
			$("body").attr("aria-hidden","true");
			
			$("._hql7s").on("click",function(event){
		  		event.stopPropagation();
			});
		}else{
			$("#inputfile").click();
		}
	}
})
	
function callRemoveDialog(event){
	if(typeof event != "undefined"){
	   event.stopPropagation();
	}
	$("body").attr("sytle","");
	$("body").attr("aria-hidden","false");
	$("div[role='dialog']").remove();
}

//파일탐색기에서 OK누른 후 처리
//파일 업로드
$("#inputfile").on("change", function(event) {
	console.log("change");
	event.preventDefault();
	uploadFiles(this.files);
});


//=================프로필 사진 서버에 업로드================
//프로필 사진 바꾸기
function uploadFiles(files) {
	$(files).each(function() {
		var file = this;
		var formData = new FormData();
		console.log("method");
		formData.append("file", this);
		$.ajax({
			url : '/uploadAjax',	
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
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


//postFeed 에러방지용 변수
var jsonList="profile";
var uid=${userVO.id};

//followList 에 followedList부여 및 팔로워 수 갱신
$(document).ready(function(){
	followed();
	following();
	follow();
	searchFilter();
})

function followed(){
	$.getJSON("/member/followed/" + ${userVO.id}, function(data){
		var followedList="";
		var data=$(data)
		if(data.length!=0){
			$("#followed").html("<a href='javascript:;' id='flwr'>팔로워 "+data.length+"</a>");
			//followed onclick 메서드 적용(follow리스트뜨도록)
			$("#flwr").on("click", function(){
				followedList="";
				data.each(function(){
					if(this.isFollow>0){
						followedList+="<li><a href='/member/"+this.nickname+"'>" + this.nickname + "</a><button class='isFlw' title='"+this.id+"'>팔로잉</button></li>";
					}else if(this.isFollow==0 && this.id!=${login.id}){
						followedList+="<li><a href='/member/"+this.nickname+"'>" + this.nickname + "</a><button class='isFlw' title='"+this.id+"'>팔로우</button></li>";
					}else{
						followedList+="<li><a href='/member/"+this.nickname+"'>" + this.nickname + "</a></li>";
					}
				})
				
				//모달창 불러오기
				var source=$("#modalFollow").html();
				var likers=Handlebars.compile(source);
				var likersModal=likers(data);
				$("body").append(likersModal);
				$("#followsContainer").html(followedList);
				
				//팔로우 + 언팔로우
				follow();
				
				//modal창 보이기
				$("#myFollowModal").css("display","block");
				
				//modal끄기 메서드-바깥부분
				$("#myFollowModal").click(function(event){
					if(event.target==this){
						$("#myFollowModal").css("display","none");
						$("#myFollowModal").remove();	
					}
				})
				
				//modal끄기 메서드-버튼부분
				$(".close:eq(0)").on("click", function(){
					$("#myFollowModal").css("display","none");
					$("#myFollowModal").remove();
				})
				
			});
		}else{
			$("#followed").html("팔로워 0");
		}
	});
};

//followList 에 followingList부여 및 팔로우 수 갱신
function following(){
	$.getJSON("/member/following/" + ${userVO.id}, function(data){
		var followingList="";
		var data=$(data)
		if(data.length!=0){
			$("#following").html("<a href='javascript:;' id='flw'>팔로우 "+data.length+"</a>");
			//following onclick 메서드 적용(follow리스트뜨도록)
			$("#flw").on("click", function(){
				followingList="";
				data.each(function(){
					if(this.isFollow>0){
						followingList+="<li><a href='/member/"+this.nickname+"'>" + this.nickname + "</a><button class='isFlw' title='"+this.id+"'>팔로잉</button></li>";
					}else if(this.isFollow==0 && this.id!=${login.id}){
						followingList+="<li><a href='/member/"+this.nickname+"'>" + this.nickname + "</a><button class='isFlw' title='"+this.id+"'>팔로우</button></li>";
					}else{
						followingList+="<li><a href='/member/"+this.nickname+"'>" + this.nickname + "</a></li>";
					}
				})
				
				//모달창 불러오기
				var source=$("#modalFollow").html();
				var likers=Handlebars.compile(source);
				var likersModal=likers(data);
				$("body").append(likersModal);
				$("#followsContainer").html(followingList);
				
				//팔로우 + 언팔로우
				follow();
				
				//modal창 보이기
				$("#myFollowModal").css("display","block");
				
				//modal끄기 메서드-바깥부분
				$("#myFollowModal").click(function(event){
					if(event.target==this){
						$("#myFollowModal").css("display","none");
						$("#myFollowModal").remove();	
					}
				})
				
				//modal끄기 메서드-버튼부분
				$(".close:eq(0)").on("click", function(){
					$("#myFollowModal").css("display","none");
					$("#myFollowModal").remove();
				})
				
			});
		}else{
			$("#following").html("팔로우 0");
		}
	});
};

//follow여부확인하여 팔로우/팔로우취소
function follow(){
	$(".isFlw").on("click", function(){
		var userid=$(this).attr("title");
		var isFlw=this;
		if(($(this).html()=="팔로우")){
			var type="post";
			var url ="/member/follow/"+userid;
			var header="{'X-HTTP-Method-Override' : 'POST'}";
			$(isFlw).html("팔로잉");
			
		}else if(($(this).html()=="팔로잉")){
			var type="delete";
			var url ="/member/unfollow/"+userid;
			var header="{'X-HTTP-Method-Override' : 'DELETE'}";
			$(isFlw).html("팔로우");
		}
		$.ajax({
			type: type,
			url: url,
			headers:{header},
			dataType:"text",
			success:function(result){
				if(result=="SUCCESS"){
					following();
				};
			}		
		});
	});
};


</script>

<jsp:include page="/WEB-INF/views/include/postFeed.jsp" flush="false" />

</body>
</html>