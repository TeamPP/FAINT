<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>프로필 편집</title>


</head>

<style>
h2 {
	margin: 0;
}

.followLine{
/* width:600px; */
margin-top: 0;
margin-bottom: 0;
}

.oneofList{
border-bottom: solid 1px #efefef;
/* width: 581px; */
height: 53px;
padding: 8px 16px;
}

#blockedUserContainer{
/* height: 536px; */
overflow-y: auto;
/* width: 600px; */
list-style:none;   
padding:0;
}

.btn_block{
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
<body class style="">
	<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"></jsp:include>
	<span id="react-root" aria-hidden="false"> 
	<section class="_sq4bv _29u45"> 
		<main class="_8fi2q _2v79o">
		<div class="_28rsa">
			<!-- 사이드바 -->
			<jsp:include page="editSide.jsp" flush="false"></jsp:include>
			<article class="_75z9k">
			<div id="blockedUser" class="blockedUser">
				<div class="blockedUser-content">
					<hr class="followLine">
					<ul id="blockedUserContainer">
					<c:forEach var="blockedUserList" items='${blockedUserList}' varStatus='status'>
					<li class='oneofList'> 
						<a href='/member/${blockedUserList.nickname}'> <img class='followPhoto'
								<c:if test="${blockedUserList.profilephoto ne null && blockedUserList.profilephoto != '' }">
									 src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122${blockedUserList.profilephoto}'
								</c:if>
								<c:if test="${blockedUserList.profilephoto eq null || blockedUserList.profilephoto == '' }">
									src='../../resources/img/emptyProfile.jpg'
								</c:if>
							/></a>&nbsp &nbsp
						
						<c:if test="${blockedUserList.name ne null && blockedUserList.name != '' }">
							<div style='display:inline-block; line-height:16px;'><a style='font-weight:bold;' href='/member/${blockedUserList.nickname}'>${blockedUserList.nickname}</a><p style='margin:0;'>${blockedUserList.name}</p></div>
						</c:if>
						<c:if test="${blockedUserList.name eq null || blockedUserList.name == '' }">
							<a style='font-weight:bold; line-height: 28px;' href='/member/${blockedUserList.nickname}'>${blockedUserList.nickname}</a>
						</c:if>
					<button class='btn_block' data-user ='${blockedUserList.blockedid}'>차단해제</button>
					</li>
					</c:forEach>
					</ul>
				</div>
			</div>

			</article>
		</div>
		</main> <jsp:include page="../../common/footer.jsp" flush="false"></jsp:include>
		</section>
	</span>
</body>


<!-- 공통 처리 import -->
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript" src="../../resources/js/upload.js"></script>
<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
<script>


//차단 flg true-> 차단,차단해제 처리 진행중, false -> 대기
var blockFlg = false;
//사용자 차단
function userBlock(obj){
	$.ajax({
		type: "post",
		url: "/member/block",
		headers: "{'X-HTTP-Method-Override' : 'POST'}",
		dataType: "text",
		async: false,
		data: {
			"userid": obj.data("user")
		},
		beforeSend : function(xhr)
        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success: function(result){
			if(result=="SUCCESS"){
				alert("차단되었습니다");
				$(obj)[0].innerText='차단해제';
				//차단 처리 끝나면 flg 초기화
				blockFlg =false;

			}
		}
	})
}

//사용자 차단해제
function userUnblock(obj){
	$.ajax({
		type: "delete",
		url: "/member/unblock/" + obj.data("user"),
		headers: "{'X-HTTP-Method-Override' : 'DELETE'}",
		dataType: "text",
		async: false,
		beforeSend : function(xhr)
        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success: function(result){
			if(result=="SUCCESS"){
				$(obj)[0].innerText='차단';
				alert("차단해제되었습니다");
				//차단 처리 끝나면 flg 초기화
				blockFlg =false;
			}
		}
	})
};
$(document).ready(function(){
	//차단해제, 차단 버튼 클릭시
	$(".btn_block").on("click",function(){
		//차단 버튼 누른 처리가 아직 진행중이면
		if(blockFlg) return;
		
		blockFlg = true;
		
		//버튼 이상하면 리턴
		if(typeof this.innerText == "undefined" || this.innerText == null) return;
		//텍스트가 차단해제일 경우 차단해제 처리
		if(this.innerText == "차단해제"){
			userUnblock($(this));
		}
		//텍스트가 차단일경우 차단 처리
		else if(this.innerText == "차단"){
			userBlock($(this));
		}
	});
});
</script>
</html>