<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!--헤더-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>
   
<title>FAINT</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- 슬라이드 넘기기 버튼 부트스트랩  -->
 <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">


</head>
<style>
body{
	overflow: hidden;
	}
.likeModal {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
   padding-top: 100px; /* Location of the box */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0, 0, 0); /* Fallback color */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content */
.likeModal-content {
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

/*id는 스타일 최우선으로 적용됨 그 다음에 class */
#carousel {
	position: relative;
	height: 600px;
	top: 50%;
	/* transform: translateY(-50%); */
	overflow: hidden;
}
#carousel article{
height: 560px;
	width: 500px;
	position: absolute;
	/*  transition 변경되는 부분 width 1s만 쓰면 어색함 왜냐하면 width랑 height랑 2가지 요소가 바뀜 */
	transition: transform 1s, left 1s, opacity 1s, z-index 0s, width 1s, height 1s;
	opacity: 1;
}
#carousel .imgDiv {
	height: 500px;
	width: 500px;
	transition: transform 1s, left 1s, opacity 1s, z-index 0s, width 1s, height 1s;
}
#carousel .imgDiv img{
	height: 100%;
	width: 100%;
	object-fit: cover;
}
#carousel .hideLeft {
	height: 260px;
	width: 200px;
	left: 0%; /* 왼쪽 0으로 빠지는 애니메이션 효과 */
	opacity: 0; /*투명도 0으로 숨김처리 */
	transform: translateY(75%) translateX(-75%); /*부모기준으로 위치지정 */
}
#carousel .hideLeft header{
	height: 60px;
	width: 200px;
	left: 0%; /* 왼쪽 0으로 빠지는 애니메이션 효과 */
	opacity: 0; /*투명도 0으로 숨김처리 */
}
#carousel .hideLeft .imgDiv{
	height: 200px;
	width: 200px;
	opacity: 0; /*투명도 0으로 숨김처리 */
}
#carousel .hideLeft img {
   height: 100%;
   width: 100%;
   object-fit: cover;
}
#carousel .hideRight {
	height: 260px;
	width: 200px;
	left: 100%;
	opacity: 0;
	transform: translateY(75%) translateX(-75%);
}
#carousel .hideRight header{
	height: 60px;
	width: 200px;
	left: 100%;
	opacity: 0;
}
#carousel .hideRight .imgDiv{
	height: 200px;
	width: 200px;
	opacity: 0;
}
#carousel .hideRight img {
   height: 100%;
   width: 100%;
   object-fit: cover;
}
#carousel .prev {
	height: 460px; 
	width: 400px;
	z-index: 5;
	left: 30%;
	transform: translateY(50px) translateX(-50%);
}
#carousel .prev header{
	height: 60px; 
	width: 400px;
	z-index: 5;
	left: 30%;
}
#carousel .prev .imgDiv{
	height: 400px; 
	width: 400px;
	z-index: 5;
}
#carousel .prev img{
   height: 100%;
   width: 100%;
   object-fit: cover;
}
#carousel .prevLeftSecond {
	height: 360px;
	width: 300px;
	z-index: 4;
	left: 20%;
	opacity: .7;
	transform: translateY(33%) translateX(-50%);
}
#carousel .prevLeftSecond header{
	height: 60px;
	width: 300px;
	z-index: 4;
	left: 20%;
	opacity: .7;
}
#carousel .prevLeftSecond .imgDiv{
	height: 300px;
	width: 300px;
	z-index: 4;
	opacity: .7;
}
#carousel .prevLeftSecond img{
   height: 100%;
   width: 100%;
   object-fit: cover;
}
/*가운데 이미지 */
#carousel .selected {
	height: 560px;
	width: 500px; 
	z-index: 10;
	left: 50%;
	transform: translateY(0px) translateX(-50%);
}
#carousel .selected header{
	height: 60px;
	width: 500px; 
	z-index: 10;
	left: 50%;
}
#carousel .selected .imgDiv{
	height: 500px;
	width: 500px; 
	z-index: 10;
}
#carousel .selected img {
   height: 100%;
   width: 100%;
   object-fit: cover;
}
#carousel .next {
	height: 460px;
	width: 400px;
	z-index: 5;
	left: 70%;
	transform: translateY(50px) translateX(-50%);
}
#carousel .next header{
	height: 60px;
	width: 400px;
	z-index: 5;
	left: 70%;
}
#carousel .next .imgDiv{
	height: 400px;
	width: 400px;
	z-index: 5;
}
#carousel .next img {
   height: 100%;
   width: 100%;
   object-fit: cover;
}
#carousel .nextRightSecond {
	height: 360px;
	width: 300px;
	z-index: 4;
	left: 80%;
	transform: translateY(33%) translateX(-50%);
	opacity: .7;
}
#carousel .nextRightSecond header{
	height: 60px;
	width: 300px;
	z-index: 4;
	left: 80%;
	opacity: .7;
}
#carousel .nextRightSecond .imgDiv{
	height: 300px;
	width: 300px;
	z-index: 4;
	opacity: .7;
}
#carousel .nextRightSecond img {
   height: 100%;
   width: 100%;
   object-fit: cover;
}
/* 사진 넘기기 버튼 */
.buttons {
   position: absolute;
   left: 47%;
   bottom: 30%;
}
.fa{
   font-size: 19px;
   border:0;
}
#carousel > article > header{
height: 60px;
background-color: white;
transition: transform 1s, left 1s, opacity 1s, z-index 0s, width 1s, height 1s;
}
a,a:visited{
    text-decoration: none !important;
}

._622au{padding:0}._9dpug{border-bottom:1px solid #efefef}._9dpug._msz04{height:76px;padding:0 16px 16px}._5mwg7{height:60px;-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center;position:absolute}._ebcx9{padding:0 16px}
._8oo9w{margin-top:4px}._nlmjy{margin-bottom:8px}._277v9{-webkit-box-flex:1;-webkit-flex-grow:1;-ms-flex-positive:1;flex-grow:1;-webkit-flex-shrink:1;-ms-flex-negative:1;flex-shrink:1;min-height:0;overflow:auto}._277v9,._6d44r{margin-bottom:4px}._ti7l3{margin-top:4px}._e34hf{display:none}._fsupd ._ti7l3{min-height:48px}._5lms4 ._ti7l3{padding-right:26px}._fsupd ._9dpug{padding-right:40px}._fsupd ._5mwg7{right:10px;top:0}._5lms4 ._5mwg7{bottom:0;height:52px;right:10px;top:auto}._8n9ix._9445e ._8oo9w{margin-top:-34px}._4kplh{width:100%}._4kplh ._sxolz{background-color:#000;-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center;margin-right:335px;min-height:450px}._4kplh ._sxolz._mi48x{background-color:#fafafa}._4kplh ._9dpug{border-bottom:1px solid #efefef;height:78px;margin-right:0;padding:20px 0;position:absolute;right:24px;top:0;width:287px}._4kplh ._9dpug._msz04{height:98px;padding:0 0 20px}._4kplh ._ebcx9{bottom:0;-webkit-box-sizing:border-box;box-sizing:border-box;padding-left:24px;padding-right:24px;position:absolute;right:0;top:78px;width:335px}._4kplh ._ebcx9._6zn4x{top:98px}._4kplh ._8oo9w{border-top:1px solid #efefef;margin:0;-webkit-box-ordinal-group:3;-webkit-order:2;-ms-flex-order:2;order:2;padding-top:2px}._4kplh ._nlmjy{margin-bottom:4px;-webkit-box-ordinal-group:4;-webkit-order:3;-ms-flex-order:3;order:3}._4kplh ._277v9{margin:0 -24px auto;-webkit-box-ordinal-group:2;-webkit-order:1;-ms-flex-order:1;order:1;padding:12px 24px}._4kplh ._6d44r{margin-bottom:0;-webkit-box-ordinal-group:5;-webkit-order:4;-ms-flex-order:4;order:4}._4kplh ._ti7l3{-webkit-box-ordinal-group:6;-webkit-order:5;-ms-flex-order:5;order:5}._4kplh._5lms4 ._5mwg7{right:18px}@media (-webkit-min-device-pixel-ratio:2){._8n9ix ._9dpug{border-bottom-width:.5px}}
._7b8eu,._csp04{-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row}._7b8eu{height:60px;padding:16px;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center}._iuvin button{line-height:18px;padding:0}._csp04{-webkit-box-align:baseline;-webkit-align-items:baseline;-ms-flex-align:baseline;align-items:baseline}._6y8ij{max-width:100%}._s7b66{display:inline}._74oom{-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;-webkit-box-align:baseline;-webkit-align-items:baseline;-ms-flex-align:baseline;align-items:baseline;max-width:240px}._j56ec{-webkit-box-align:start;-webkit-align-items:flex-start;-ms-flex-align:start;align-items:flex-start;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-flex:1;-webkit-flex-grow:1;-ms-flex-positive:1;flex-grow:1;-webkit-flex-shrink:1;-ms-flex-negative:1;flex-shrink:1;margin-left:12px;overflow:hidden}._k32zm{padding-top:20px}._60iqg{display:block;max-width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}._eeohz{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;max-width:100%}._iadoq,._iadoq:visited{color:#262626;-webkit-box-flex:0;-webkit-flex-grow:0;-ms-flex-positive:0;flex-grow:0;-webkit-flex-shrink:1;-ms-flex-negative:1;flex-shrink:1}._hz9vr{-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0;margin-left:5px}._elp6f{color:#999;display:inline-block;max-width:100%}
._82odm{-webkit-align-self:center;-ms-flex-item-align:center;align-self:center;display:block;-webkit-box-flex:0;-webkit-flex:none;-ms-flex:none;flex:none}._qtgjd{cursor:pointer}._15vpm{-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;-webkit-tap-highlight-color:transparent;-webkit-touch-callout:none}
._pg23k{background-color:#fafafa;border-radius:50%;-webkit-box-sizing:border-box;box-sizing:border-box;display:block;-webkit-box-flex:0;-webkit-flex:0 0 auto;-ms-flex:0 0 auto;flex:0 0 auto;overflow:hidden;position:relative}._pg23k::after{border:1px solid rgba(0,0,0,.0975);border-radius:50%;bottom:0;content:"";left:0;pointer-events:none;position:absolute;right:0;top:0}._jpwof{cursor:pointer}._rewi8{height:100%;width:100%}
._2g7d5{font-weight:600;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;padding-left:5px;margin-left:-5px}

header, header>div{-webkit-box-align:stretch;-webkit-align-items:stretch;-ms-flex-align:stretch;align-items:stretch;border:0 solid #000;-webkit-box-sizing:border-box;box-sizing:border-box;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-orient:vertical;-webkit-box-direction:normal;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0;margin:0;padding:0;}
span{
	display: inline-block;
}
.postModal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 15; /* Sit on top */
    padding-top: 15vh; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}


	.btn-circle {
        width: 30px;
        height: 30px;
        text-align: center;
        padding: 6px 0;
        font-size: 18px;
        line-height: 1.428571429;
        border-radius: 15px;
      }
      label.btn.btn-default.btn-circle.focus {
	    outline: none;
	}
	.multiFile{
	position: absolute;
	height: 39px;
	width: 39px;
	background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png");
	background-position: -360px -104px;
	right: 8px;
	top: 8px; 
}
.imgDiv{
position: relative;
background-color:black;
}
.imgDiv > video{
	position: absolute;
    max-width: 100%;
    max-height: 100%;
    width: auto;
    height: auto;
    margin: auto;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
}

.glyphicon {
	top: -1px;
}
</style>



<body>

	<div id="carousel">
		<c:forEach items="${list}" var="postDTO" varStatus='status'>
		<article  data-filter="${postDTO.cateid}"
		<c:choose>
		<c:when test="${status.index == 0}">
			class="post prev"
		</c:when>
		<c:when test="${status.index ==	1}">
			class="post selected"
		</c:when>
		<c:when test="${status.index ==	2}">
			class="post next"
		</c:when>
		<c:when test="${status.index ==	3}">
			class="post nextRightSecond"
		</c:when>
		<c:otherwise>
		class="post hideRight"
		</c:otherwise>
		</c:choose>
		
		>
<!-- 프사, 닉네임 -->
		<header class="_7b8eu _9dpug">
			<div class="_82odm _i2o1o">
				<a class="_pg23k _jpwof _gvoze" href="/member/${postDTO.usernickname}" style="width: 30px; height: 30px;">
				<img class="_rewi8" 
					<c:if test="${postDTO.profilephoto ne null && postDTO.profilephoto != '' }">
						src="http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122${postDTO.profilephoto}"
					</c:if>
					<c:if test="${postDTO.profilephoto eq null || postDTO.profilephoto == '' }">
						src="../../resources/img/emptyProfile.jpg"
					</c:if>/>
				</a>
			</div>
			<div class="_j56ec">
				<div class="">
					<div class="_eeohz">
						<a class="_2g7d5 notranslate _iadoq" href="/member/${postDTO.usernickname}">${postDTO.usernickname }</a>
					</div>
				</div>
				<div class="_60iqg">
					<a class="_q8ysx _6y8ij" id="address" title="" href="/search/locations?location=${postDTO.location }">${postDTO.location }</a>
				</div>
			</div>
			<div style="display: inline-block;">
		        <!-- 위치 추가 -->
		        <a class="btn btn-default btn-circle" id="" href="/search/category?cateid=${postDTO.cateid}">
		        <c:choose>
		        <c:when test="${postDTO.cateid == 1 }">
	       			<i class="glyphicon glyphicon-plane"></i>
		        </c:when>
		        <c:when test="${postDTO.cateid == 2 }">
      	       			<i class="glyphicon glyphicon-film"></i>
		        </c:when>
		        <c:when test="${postDTO.cateid == 3 }">
      	       			<i class="glyphicon glyphicon-music"></i>
		        </c:when>
		        <c:when test="${postDTO.cateid == 4 }">
      	       			<i class="fa fa-cutlery"></i>
		        </c:when>
		        <c:when test="${postDTO.cateid == 5 }">
     	       			<i class="fa fa-pencil"></i>
		        </c:when>
		        </c:choose>
		        </a>
	        </div>
		</header>
		<c:forEach items="${fileInfoList[status.index]}" var="fileInfo" varStatus='fileInfoListStatus'>
						<c:if test="${fileInfoListStatus.index eq 0}">
						<div class="imgDiv" data-postid="${postDTO.postid}" >
						<c:if test ="${fileInfo.fileType eq 'image'}" >
							<img id="${postDTO.postid}_file${fileInfoListStatus.index}" src="http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122${fileInfo.fileUrl}"
								data-postid="${postDTO.postid}" />
								<c:if test = "${fn:length(fileInfoList[status.index]) > 1}">
								<i class='multiFile'></i>
								</c:if>
								
						</c:if>
						<c:if test ="${fileInfo.fileType eq 'video'}" >
							<video  id="${postDTO.postid}_file${fileInfoListStatus.index}" src="http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122${fileInfo.fileUrl}"
								data-postid="${postDTO.postid}" loop="true" autoplay>
								</video>
							<c:if test = "${fn:length(fileInfoList[status.index]) > 1}">
								<i class='multiFile'></i>
							</c:if>
							<script>
							document.getElementById('${postDTO.postid}_file${fileInfoListStatus.index}').onloadeddata = function() { 
								if(this.videoWidth <= this.videoHeight){
		                			$(this).css("min-height", "100%");
		    					}else if(this.videoWidth > this.videoHeight){
		    						$(this).css("min-width", "100%");
		    					}
							}
							</script>
						</c:if>
						</div>
						</c:if>
				</c:forEach>
	 	</article>
		</c:forEach>
	</div>
	<!--버튼  -->
	    <div class="buttons">
	    <i  id="prev" class="fa fa-arrow-left"></i>
	    <i  id="next" class="fa fa-arrow-right"></i>
    	</div>

</body>

<!-- 선택메뉴창 팝업 -->
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
._dcj9f{background:0 0;border:0;cursor:pointer;height:36px;outline:0;overflow:hidden;position:absolute;right:0;top:0;z-index:4}
._dcj9f::before{color:#fff;content:'\00D7';display:block;font-size:36px;font-weight:600;line-height:36px;padding:0;margin:0}
._784q7{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;margin:auto;max-width:935px;pointer-events:auto;width:100%}
._23gmb{bottom:0;left:0;pointer-events:none;position:fixed;right:0;top:0;z-index:2}
._23gmb *{pointer-events:auto}
._o0j5z{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;min-height:100%;overflow:auto;width:auto;z-index:3}
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
  <!-- 좋아요 list Modal -->
<script id="modalLiker" type="text/x-handlebars-template">
<section class="section3">
	<div class="likersTitle">
		<div class="likersClose"><i class="material-icons">clear</i></div>
		<strong>좋아요</strong>
	</div>
	<ul id="likersContainer"></ul>
</section>

<style>
.section3{ width: 335px; height: 100%; display: inline-block; text-align: left; }
.likersClose { width:20px; height:20px; cursor: pointer; float:left; }
.likersTitle{ width: 100%; height: 7%; padding: 10px; font-size: 17px; text-align: center; border-bottom: 1.3px solid #efefef; }
.oneofList{ border-bottom: solid 1px #efefef; width: 100%; height: 53px; padding: 10px 16px; float: left; }
#likersContainer{ height: 93%; overflow-y: auto; width: 100%; list-style:none; padding:0; margin:0;}
.isFlw{ float: right; font-size: 12px; font-weight: 400; cursor: pointer; background: 0 0; border-color: #dbdbdb; color: #262626; border-style: solid;
	border-width: 1px; line-height: 26px; border-radius: 2px; }
.followPhoto{ width: 33px; height: 33px; display: inline-block; float: left; border-radius: 150px;  /* 프사 둥글게 */ }
a{ font-weight: bold; }
</style>
</script>
<!-- post개별 게시물 모달팝업 -->
<script id="modalPost" type="text/x-handlebars-template">
<div id="myModal" class="postModal" data-postid="{{postid}}" >
   <span class="close">&times;</span>
   <div class="postModal-content">
      
      <!--사진 및 동영상 -->    
		<section class="section1">
			<div class="popImageContainer" data-postid="{{postid}}">
			</div>
			<!-- 왼쪽 이미지 이동 버튼 -->
			<a class="_5wmqs _pak6p coreSpriteLeftChevron" role="button" id="moveLeft" style ="display: none" onclick="moveLeft()">
				<i class="fa fa-chevron-circle-left"></i>
			</a>

			<!-- 오른쪽 이미지 이동 버튼 -->
			<a class="_5wmqs _by8kl coreSpriteRightChevron" role="button" id="moveRight" onclick="moveRight()">
				<i class="fa fa-chevron-circle-right"></i>
			</a>

			<!-- 사진 몇개인지 표시 -->
			<div class=" _g5463"> 
				<table class="positionDot">
					<tbody>
						<tr>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

      <section class="section2">
         <div class="s2_1">
            <div class="s2_1_1">
               <a href="/member/{{usernickname}}">
                  <img class="s2_1_1_1">   <!-- 프사 -->
               </a>
               <span class="s2_1_1_2">
                  <a href="/member/{{usernickname}}">
                     <p class="nickname">{{usernickname}}</p>  <!-- 닉네임 -->
                  </a>
                  <a class="_postLocation" href="/search/locations?location={{location}}">
                     <p class="location">{{location}}</p> <!-- 위치 -->
                  </a>
               </span>
            </div>
         </div>
            
         <div class="s2_2">
            <div class="s2_2_1" id="post{{postid}}">
               <a href="/member/{{usernickname}}"><span class="nickname">{{usernickname}}</span></a>  <!-- 닉네임 -->
               <span class="caption">{{caption}}</span>
               <div class="replyContainer" data-postid="{{postid}}" data-limit=0>
               </div>
            </div> 
         </div>
 
         <div class="s2_3">
            <div class="s2_3_1">
               <div class="btnContainer" data-postid="{{postid}}">
                  <button class="replyBtn" onclick="replyCursor(this)">댓글달기</button>
               </div>
               <a class="likeContainer" data-postid="{{postid}}">좋아요 <span>0</span>개</a>
            </div>
         </div>

         <div class="s2_4">
            <div class="s2_4_1" data-postid="{{postid}}">
               <!-- 댓글달기 -->
               <input class="replyRegist" onkeypress="registReply(this, event);" type="textarea" placeholder="댓글 달기..." name="replyCaption">
            </div>
         </div>
        </section>
		<!-- 포스트 이동 버튼 -->
		<i class="postLeft material-icons">keyboard_arrow_left</i>
		<i class="postRight material-icons">keyboard_arrow_right</i>
   </div>
</div>
<style>
.postModal-content { position: relative; background-color: #fefefe; margin: auto; width: 935px; height: 600px; }
.postModal-content > i { position: absolute; font-size: 80px; color: white; top: 44%; }
.postLeft {left: -7%; cursor: pointer;}
.postRight {right: -7%; cursor: pointer;}
.section1{width: 600px; height: 600px; display: inline-block; float: left; position: relative; background-color: black; }
#moveLeft > i{ border-radius: 150px; border: none; margin: 8px 8px 8px; left:0; margin-top: 48%; position: absolute; font-size: 30px; color: white; opacity: 0.7;}
#moveRight > i{ border-radius: 150px; border: none; margin: 8px 8px 8px 0; right:0; margin-top: 48%; position: absolute; font-size: 30px; color: white; opacity: 0.8;}    
.popPostImage{ position: absolute; max-width: 100%; max-height: 100%; width: auto; height: auto; margin: auto; top: 0; bottom: 0; left: 0; right: 0; }
.section2{ width: 335px; height: 100%; display: inline-block; text-align: center; padding-left: 20px; padding-right: 20px; }
.s2_1{ padding-top: 20px; padding-bottom: 20px; height: 78px; text-align: left; border-bottom: 1.3px solid #efefef; }
.s2_1_1{ height: 100%; display: inline-block; }
.s2_1_1_1{ width: 45px; height: 45px; display: inline-block; float: left; border-radius: 50%; }
.s2_1_1_2{ width: 235px; margin-left: 10px; display: inline-block; }
.nickname{ font-weight: bold; }
.s2_2{ width: 100%; height: auto; padding-top: 16px; padding-bottom: 16px; text-align: left; border-bottom: 1.3px solid #efefef; }
.s2_2_1{ width: 100%; height: 352px; overflow-y: auto; }
.replyContainer{ margin-top: 20px; bottom: 0; }
.reply{ margin-bottom: 4px; }
.s2_3{ width: 100%; height: 85px; text-align: left; border-bottom: 1.3px solid #efefef; }
.s2_3_1{ padding: 10px 0 10px 0; height: 100%;}
.likeBtn{ height: 24px; width: 24px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); border: none; background-color: #fff; margin: 0 8px 8px 0; font-size: 0;}
.replyBtn{ height: 24px; width: 24px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-position: -306px -289px; background-color: #fff; margin: 0 8px 8px 0; border: none; font-size: 0;}
.storeBtn{ height: 24px; width: 24px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-color: #fff; margin-left: 842%; border: none; font-size: 0;}
.s2_4{ width: 100%; height: auto; }
.s2_4_1{ padding: 10px 0 10px 0; }
.replyRegist{ font-size: 15px; border: none; width: 100%; height: auto; float: left; }
.likeContainer{ font-weight: bold; cursor: default; }
</style>
</script>
<script>
//postid 가져와서 댓글달기
$(document).ready(function(){
	
	//이미지 class명부여
	//changeClass();
	postModal();
	$("#carousel").on("mousewheel", function(e){
		console.log(e);
		var event = e.originalEvent;
		var delta = event.wheelDelta;
		console.log(event.wheelDelta);
		
		if(delta>0){//휠 위로 하면 delta >0
			moveToSelected('prev');
		}
		else{//휠 위로 하면 delta <0
			moveToSelected('next');
		}
	});
	//   <- , -> 키보드 화살표로 이동
 	$(document).keydown(function(e) {
	  switch(e.which) {
	      case 37: // left
	      moveToSelected('prev');
	      break;
	      case 39: // right
	      moveToSelected('next');
	      break;
	      default: return;
	  }
	  e.preventDefault();
	}); 
	
 	$('#carousel article').not(".selected").click(function(e) {
		if($(this).hasClass("hideLeft")){
			moveToSelected($(".hideLeft:eq(0)"));	
		}else{
			moveToSelected($(this));
		}
	});
	
	/* prev, next 아이콘 클릭 사진이동  */
	$('#prev').click(function() {
	moveToSelected('prev');
	});
	$('#next').click(function() {
	moveToSelected('next');
	});
})

//css - 카테고리별 게시물 필터링
var all=$("#carousel").children(); //초기값
function cateClick(thisTag){
	  var customType=$(thisTag).data("filter");
	  console.log(customType);
	  //보고있던 이미지값 저장
	var currentTitle=$(".selected").children("div").children("img").data("postid");
	
	  $("#carousel").children().remove(); //다 지우기
 	  $("#carousel").prepend(all); //초기값 넣기
			
	  if(customType==="all") {
		  
	  }else{
		  $(".post").not("article[data-filter='" + customType +"']").remove(); //customType 일치하지않는 요소 삭제
	  }
	$("#carousel").children().removeClass(); //기존 클래스명 삭제
	//changeClass(); //클래스명 다시부여
	moveToSelected($("#carousel").children().eq(1));
	//삭제한 다음에 들어가는거라서 다시 클릭함수를 선언함
	$('#carousel article').not(".selected").click(function() {
		if($(this).hasClass("hideLeft")){
			moveToSelected($(".hideLeft:eq(0)"));	
		}else{
			moveToSelected($(this));
		}
    });
	
	//이전 선택한 이미지가 있을 경우
	if($(".post>div>img[data-postid="+currentTitle+"]")[0]!=undefined){
		$(".post>div>img[data-postid="+currentTitle+"]").parent().parent().trigger("click");
	}
}
	
//슬라이드 이미지 div 클래스 추가
function changeClass(){
   	//클래스명 추가하기
   	$("#carousel").children().eq(0).addClass("post prev"); //1번사진
   	$("#carousel").children().eq(1).addClass("post selected"); //1번사진
   	$("#carousel").children().eq(2).addClass("post next"); //2번사진
   	$("#carousel").children().eq(3).addClass("post nextRightSecond"); //3번사진
   	$("article.nextRightSecond").nextAll().addClass("post hideRight"); //6번사진이후로
}    
 	
	
function moveToSelected(element) {
	console.log("moveToSelected");
	if (element == "next") {
		var selected = $(".selected").next();
	} else if (element == "prev") {
		var selected = $(".selected").prev();
	} else {
		var selected = element;
	}
	
	var next = $(selected).next();
	var prev = $(selected).prev();
	var prevSecond = $(prev).prev();
	var nextSecond = $(next).next();

	
	//기존 클래스 삭제, post클래스와 새로운 클래스 추가(2개 추가 구분은 공백)
	$(selected).removeClass().addClass("post selected");
	$(prev).removeClass().addClass("post prev");
	$(next).removeClass().addClass("post next");
	$(nextSecond).removeClass().addClass("post nextRightSecond");
	$(prevSecond).removeClass().addClass("post prevLeftSecond");
	$(nextSecond).nextAll().removeClass().addClass('post hideRight');
	$(prevSecond).prevAll().removeClass().addClass('post hideLeft');
	
	//클릭이벤트 할당
	$(".post").unbind("click");
	postModal();
	$('#carousel article').not(".selected").click(function(e) {
		if($(this).hasClass("hideLeft")){
			moveToSelected($(".hideLeft:eq(0)"));	
		}else{
			moveToSelected($(this));
		}
	});
	
	/* prev, next 아이콘 클릭 사진이동  */
	$('#prev').click(function() {
	moveToSelected('prev');
	});
	$('#next').click(function() {
	moveToSelected('next');
	});
}
var modalFlg = false;
function postModal(){
	//포스트 모달 팝업 창

	$(".selected").on("click", function(e){
		if(modalFlg) {
			console.log("그만 클릭해");
			return;
		}
		modalFlg = true;
		if(!(e.target.tagName == 'IMG' || e.target.tagName == 'VIDEO')){
			return;
		}
		var curIndex=$("#carousel article").index($(this));
		var pid=$(this).children("div").data("postid");
		var curObj = $(this);
		//새로운 모달 띄우기 전에 다시 띄우려하면 리턴
		//이미 모달 띄워져있음 리턴
       	 if($(".postModal[data-postid="+pid+"]").length >0 ) return;
		console.log("curIndex : " + curIndex);
		console.log("여기는 모달 띄우는 중에 또 실행됨 : " + pid);
	   $.ajax({
	      type:"post",
	      url:"/post/detail",
	      headers:{
	         "X-HTTP-Method-Override" : "POST"
	      },
	      beforeSend : function(xhr)
          {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
          },
	      data:{postid:pid},
	      datatype:"json",
	      success:function(data){
	         if(data!=null){
			
	            //handlebar추가
	            var source=$("#modalPost").html();
	            var post=Handlebars.compile(source);
	            var postmodal=post(data);
	            $("body").append(postmodal);
	            $("#carousel").css("-webkit-filter"," blur(6px)");	            
	            //-----------------------------------여기도 수정
	            //현재 위치값 저장
	            $(".postModal-content").attr("data-index", curIndex);
	          	//현재 위치값을 통해 움직이는 버튼 삭제 여부 결정
	            if($(".post").length==1){
	            	$(".postModal-content > i").remove();
	            }else if(curIndex == $(".post").length-1){
	            	$(".postRight").remove();
 	            }else if(curIndex == 0){
	            	$(".postLeft").remove();
	            }
	          	//--------------------------------------------------
	            //프로필 사진 삽입
	            if(data.profilephoto!=null){
	           	 $(".s2_1_1_1").attr("src", "http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+data.profilephoto);
	            }else{
	           	 $(".s2_1_1_1").attr("src", "/resources/img/emptyProfile.jpg");
	            }
	            
		        //이미지 배열화
		        var urlList=data.url.split('|');
	        	
				//이미지 잘라서 삽입
	          	for (var i in urlList) {
	           	
		           	//이미지일 경우(upload.js func)
		           	if(checkImageType(urlList[i])){
	                	$(".popImageContainer[data-postid="+ pid+ "]").append("<img class='popPostImage' data-postid='"+pid+"' id='image"+i+"' src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+urlList[i]+"'/>");
	                	if(i!=0){ $(".popImageContainer[data-postid="+ pid+ "]").children("#image"+i).css("display", "none"); }
	                	else{
	                		//처음 컨텐츠만 길이 조정
	                		if($(".popImageContainer[data-postid="+ pid+ "]").children("#image"+i)[0].naturalWidth <= $(".popImageContainer[data-postid="+ pid+ "]").children("#image"+i)[0].naturalHeight){
	                			$(".popImageContainer[data-postid="+ pid+ "]").children("#image"+i).css("min-height", "100%");
	    					}else if($(".popImageContainer[data-postid="+ pid+ "]").children("#image"+i)[0].naturalWidth > $(".popImageContainer[data-postid="+ pid+ "]").children("#image"+i)[0].naturalHeight){
	    						$(".popImageContainer[data-postid="+ pid+ "]").children("#image"+i).css("min-width", "100%");
	    					}
	                	}
	                	
					//영상일 경우(upload.js func)
	           		}else if(checkVideoType(urlList[i])){
		           		$(".popImageContainer[data-postid="+ pid+ "]").append("<video class='popPostImage' data-postid='"+pid+"' id='video"+i+"' loop='true' autoplay src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+urlList[i]+"'/>");
		           		if(i!=0){$(".popImageContainer[data-postid="+ pid+ "]").children("#video"+i).css("display", "none"); $(".popImageContainer[data-postid="+ pid+ "]").children("#video"+i).autoplay=false; }
		           		else{
		           			//처음 컨텐츠만 길이 조정
		           			if($(".popImageContainer[data-postid="+ pid+ "]").children("#video"+i)[0].videoWidth <= $("#video"+i+"[data-postid="+ pid+ "]")[0].videoHeight){
		           				$(".popImageContainer[data-postid="+ pid+ "]").children("#video"+i).css("min-height", "100%");
	    					}else if($(".popImageContainer[data-postid="+ pid+ "]").children("#video"+i)[0].videoWidth > $(".popImageContainer[data-postid="+ pid+ "]").children("#video"+i)[0].videoHeight){
	    						$(".popImageContainer[data-postid="+ pid+ "]").children("#video"+i).css("min-width", "100%");
	    					}
		           		}
					//이미지나 영상타입이 아닐경우	
	           		}else{
	           			alert("지원하지 않는 타입의 파일형식을 포함하고 있음");
	           		}
	          	}
	          	//첨부 이미지or영상 수
	          	if(urlList.length == 1){
	          		$(".popImageContainer[data-postid="+pid+"]").siblings("#moveRight").css("display","none");
	        	}
				
	            //좋아요버튼 삽입
	            if(data.isLike=='0'){
					$(".btnContainer[data-postid="+ pid+ "]").prepend("<span><button class='likeBtn' style='background-position: -26px -349px;'>좋아요</button></span>");
	            }else{
					$(".btnContainer[data-postid="+ pid+ "]").prepend("<span><button class='likeBtn' style='background-position: 0 -349px;'>좋아요 취소</button></span>");
	            }
	            
	            //저장하기 버튼 삽입
	            if(data.isStore=='0'){
	               $(".btnContainer[data-postid="+ pid+ "]").append("<span><button class='storeBtn' style='background-position: -78px -349px;'>저장하기</button></span>");
	            }else{
	               $(".btnContainer[data-postid="+ pid+ "]").append("<span><button class='storeBtn' style='background-position: -182px -349px;'>저장하기 취소</button></span>");
	            }
	            
	            //게시물 수정버튼 삽입
	            if(data.userid==${login.id}){
	          		$(".s2_4_1[data-postid="+ pid+ "]").append("<span style='cursor: pointer; '><i id='postEdit' class='glyphicon glyphicon-option-horizontal'></i></span>")
	          		$(".replyRegist").css("width", "94%");
	            }
	  
	            //modal끄기 메서드-바깥부분
	            $(".postModal[data-postid="+ pid+ "]").on("click", function(event){
	               if(event.target==this){
	                  $("#myModal[data-postid="+ pid+ "]").css("display","none");
	                  $("#myModal[data-postid="+ pid+ "]").remove();
	                  $("#carousel").css("-webkit-filter","");	            
	               }
	            });
	            
	            //modal끄기 메서드-버튼부분
	            $("#myModal[data-postid="+ pid+ "] > .close:eq(0)").on("click", function(){
	               $("#myModal[data-postid="+ pid+ "]").css("display","none");
	               $("#myModal[data-postid="+ pid+ "]").remove();
	               $("#carousel").css("-webkit-filter","");	            
	            });
	            
	            //포스트 움직이기 버튼 함수 적용
	    		$(".postLeft").on("click", function(){
	    			curObj.prev().click();
	    			$(".selected > div").children().click();
	    		});
	    		$(".postRight").on("click", function(){
	    			curObj.next().click();
	    			$(".selected > div").children().click();
	    		});
	            
	            postEdit(pid);
	            reply();
	            like();
	            likerList();
	            store();
	            searchFilter();
	            
	            $(".postModal").not("#myModal[data-postid="+ pid+ "]").remove();
		       //modal창 보이기
	            $("#myModal[data-postid="+ pid+ "]").css("display","block");
		       
		       modalFlg = false;
	         }//if end
	      }	//success end
	   });
	});
}

//게시물 수정
function postEdit(pid){
	var postid;	
	if(typeof pid == "undefined" || pid == null) postid=$(".s2_4_1").data("postid");
	else{postid = pid;}
	
	console.log(postid);
	$(".s2_4_1[data-postid="+postid+"] > span > i").on("click",function(){
/* 	$("#postEdit").on("click",function(){ */
		
		var template = Handlebars.compile($("#modalTemplate").html());
		$("body").append(template);
		$("body").attr("aria-hidden","true");
		
		var list = '<li class="_o2wxh"><a href="/post/'+postid+'/postEditor"><button class="_h74gn">게시물 수정하기</button></a></li>';
		list += '<li class="_hql7s"><button class="_h74gn" id="btnDeletePost" data-post='+postid+' onclick="postDelete(this)">게시물 삭제하기</button></li>';
		list += '<li class="_hql7s"><button class="_h74gn" id="btnCancle" onclick="callRemoveDialog(event)">취소</button></li>';
		
		$("._cepxb").html(list);
		
		$("._hql7s").on("click",function(event){
		     event.stopPropagation();
		});
	})

}

//게시물 삭제
function postDelete(thisTag){
	var postid=$(thisTag).data("post");
	$.ajax({
		type: "delete",
		url: "/post/"+postid+"/delete",
		headers: "{'X-HTTP-Method-Override' : 'DELETE'}",
		beforeSend : function(xhr)
      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      },
		dataType:"text",
		success:function(result){
			if(result=="SUCCESS"){
				//메뉴모달 끄기
				$("body").attr("sytle","");
				$("body").attr("aria-hidden","false");
				$("div[role='dialog']").remove();
				//post모달 끄기
				$("#myModal").css("display","none");
				$("#myModal").remove();
				//postlist다시부르기
				
				//다음 객체 저장
				var nextObj = $(".post>div[data-postid="+ postid+ "]").parent().next();
				//카테고리 필터 리스트 다시 읽기 
				all=all.not(".selected"); 
				//article 지우고 다시로딩
				$(".post>div[data-postid="+ postid+ "]").parent().remove();
				//다음 게시물을 선택
				$(nextObj).trigger("click");
				$("#carousel").css("-webkit-filter","");
			};
		}
	})
}

//메뉴 모달 취소버튼 - CSS처리
function callRemoveDialog(event){
 if(typeof event != "undefined"){
    event.stopPropagation();
 }
 $("body").attr("sytle","");
 $("body").attr("aria-hidden","false");
 $("div[role='dialog']").remove();
}

//각 게시물에 댓글리스트 등록 처음 4개 이후 +20개씩('댓글 더보기' 기능이 수행)
function reply(){
   $(".replyContainer").each(function(){
      var pid=$(this).data("postid"); //게시물 id값 title에 넣어서 이동
      var limit = $(this).data("limit"); //댓글 출력제한자
      var replyContainer = this;
      
      $.getJSON("/reply/post/" + pid, function(rpldata){
         if(rpldata.length==0){
            $(replyContainer).html("");
         }
         
        // 게시물에 대한 댓글리스트 + 삭제버튼(해당 유저의 게시글일 경우만)
        var replystr="";
        
        //댓글더보기 관련
        var replyLimit = 4; //최초댓글 표시 수
     	var replyMore = 10; //댓글더보기 클릭 시 추가되는 댓글 수
     	
        $(rpldata).each(function(index){
        	//댓글 최신 4개까지만 우선 출력 및 제한자에 따른 댓글 출력
            if( $(rpldata).length-(replyLimit+replyMore*limit) <= index && index < $(rpldata).length ){ //10개씩 더 출력
               replystr +="<div class='reply' data-replyid='"+this.id+"'>"+
                  "<a href='/member/"+this.username+"'><span class='nickname'>" + this.username +"</span></a>\t<span>"+this.comment+"</span>";
               
               if(this.userid==${login.id} || this.postwriter==${login.id}){
                  replystr+="<a class='replyDelete' onclick='javascript:deleteReply(this);' style='cursor:pointer; float:right;' ><i class='material-icons' style='color:lightgray; font-size:18px;'>clear</i></a></li>";
               }else{
                  replystr+="</div>";
               };
               
               $(replyContainer).html(replystr);
            }
         });
         
         //전체 댓글 수가 4개 이하 or 제한자*10+4개면 댓글더보기 삭제
          if(rpldata.length<=replyLimit+replyMore*limit){ //20개씩 더 출력
             $(replyContainer).children(".moreReply").remove();
         }else if($(replyContainer).siblings(".moreReply")[0]==undefined){
            $(replyContainer).prepend("<div class='moreReply'><a href='javascript:;'>댓글더보기</a></div>");
         }
         
         //댓글더보기 클릭시 제한자 +1 및 댓글 목록 재출력
         $(replyContainer).children(".moreReply").on("click", function(){
            $(replyContainer).data("limit", limit+1);
            reply();
         })
         //댓글 및 게시물에 태그 검색 필터
         searchFilter();
      });
   });
}
//댓글등록함수 = 댓글입력창에서 onkeypress로 작동 (태그 객체와 event키값 매개변수로 받음)
function registReply(thisTag, key){
   var enter=key.keyCode||key.which;
   var comment=$(thisTag).val();
   if(enter==13&&comment.trim().length>0){
      var userid=${login.id};
      var postid=$(thisTag).parent().data("postid");
      $.ajax({
         type:"post",
         url:"/reply",
         headers:{
            "Content-Type" : "application/json",
            "X-HTTP-Method-Override" : "POST"
         },
         beforeSend : function(xhr)
         {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
         dataType:"text",
         data:JSON.stringify({
            postid:postid,
            userid:userid,
            comment:comment.trim()
         }),
         success:function(result){
            if(result=="SUCCESS"){
               reply();
               $(thisTag).val("");
               //댓글 창 스크롤 아래로
               $(".s2_2_1").scrollTop($(".s2_2_1").height());
            };
         }
      });
   }
}
//댓글 삭제함수 = 댓글 삭제버튼에서 사용(태그객체 받음)
function deleteReply(thisTag){
   var rid=$(thisTag).parent().data("replyid");
   $.ajax({
      type:"delete",
      url:"/reply/"+rid,
      headers:{
         "Content-Type" : "application/json",
         "X-HTTP-Method-Override" : "DELETE"
      },
      beforeSend : function(xhr)
      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      },
      dataType:"text",
      success:function(result){
         if(result=="SUCCESS"){
            //리플리스트 초기화 및 게시물의 댓글 피드 재호출
            reply();
         };
      }
   });
}

//게시물 저장하기 + 저장하기 취소 
function store(){
	var storeFlg=false;
   $(".storeBtn").on("click", function(){
      var postid=$(this).parents(".btnContainer").data("postid");
      var storeBtn=this;
      if(storeFlg){return;};
      storeFlg=true;
      if($(this).css("background-position")=="-78px -349px"){
         var type="post";
         var url ="/post/"+postid+"/store";
         var headers="{'X-HTTP-Method-Override' : 'POST'}";
         var val="-182px -349px";
         
      }else if($(this).css("background-position")=="-182px -349px"){
         var type="delete";
         var url ="/post/"+postid+"/takeaway";
         var headers="{'X-HTTP-Method-Override' : 'DELETE'}";
         var val="-78px -349px";
      }
      $.ajax({
         type: type,
         url: url,
         headers: headers,
         dataType:"text",
         beforeSend : function(xhr)
         {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
         success:function(result){
            if(result=="SUCCESS"){
               $(storeBtn).css("background-position", val);
               storeFlg=false;
            };
         }
      });
   });
};
//게시물 좋아요 + 좋아요 취소
function like(){
	var likeFlg=false;
   $(".likeBtn").on("click", function(){
      var postid=$(this).parents(".btnContainer").data("postid");
      var likeBtn=this;
      if(likeFlg){ return; };
      likeFlg=true;
      if($(this).css("background-position")=="-26px -349px"){
         var type="post";
         var url ="/post/"+postid+"/like";
         var headers="{'X-HTTP-Method-Override' : 'POST'}";
         var val="0px -349px";
         
      }else if($(this).css("background-position")=="0px -349px"){
         var type="delete";
         var url ="/post/"+postid+"/unlike";
         var headers="{'X-HTTP-Method-Override' : 'DELETE'}";
         var val="-26px -349px";
      }
      $.ajax({
         type: type,
         url: url,
         headers: {headers},
         dataType:"text",
         beforeSend : function(xhr)
         {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
         success:function(result){
            if(result=="SUCCESS"){
            	
               $(likeBtn).css("background-position", val);
               likerList();
               likeFlg=false;
            };
         }      
      });
   });
};


//좋아요 count+list
function likerList(){
	$(".likeContainer").each(function(){
	      var pid=$(this).data("postid");
	      var likeContainer = this;
	      
	      $.getJSON("/post/" + pid + "/likerlist", function(data){
	         var likerList="";
	         var data=$(data)
	         //좋아요 갯수가 1개 이상일때
	         if(data.length>0){
	            $(likeContainer).children("span").html(data.length);
	            $(likeContainer).css("cursor", "pointer");
	            
	            //좋아요 리스트 클릭함수
	            $(likeContainer).on("click", function(){
	                //원래 내용
	                $(".section2").hide();
	                
	            	//handlebar추가
	                var source=$("#modalLiker").html();
	                var post=Handlebars.compile(source);
	                var postmodal=post(data);
	                $(".postModal-content").append(postmodal);
	                
	                var likers="";
	                data.each(function(){
	        			console.log(this);
	                    likers+="<li class='oneofList'><a href='/member/"+this.nickname+"'><img class='followPhoto' ";
	                    
	                   	// 프로필 사진이 있는경우 | 없는 경우
	    				if(this.profilephoto != null){
	    					likers+="src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+this.profilephoto+"' /></a>&nbsp &nbsp";
	                	}else{
	                		likers+="src='/resources/img/emptyProfile.jpg' /></a>&nbsp &nbsp";
	                	}
	                   	// 이름이 있는 경우 | 없는 경우
	                   	if(this.name != null){
	                   		likers+="<div style='display:inline-block; line-height:16px;'><a href='/member/"+this.nickname+"'>" + this.nickname + "</a><p style='margin:0;'>"+this.name+"</p></div>"
	                   	}else{
	                   		likers+="<a style='line-height: 28px;' href='/member/"+this.nickname+"'>" + this.nickname + "</a>"
	                   	}
	                   	
	                	// 팔로우하고있는 경우 | 팔로우하지 않는 경우 | 본인인 경우
	                	if(this.isFollow > 0){
	                		likers+="<button class='isFlw' data-uid='"+this.id+"'>팔로잉</button></li>";
	                   
		                }else if(this.isFollow==0 && this.id!=${login.id}){
		                	likers+="<button class='isFlw' data-uid='"+this.id+"'>팔로우</button></li>";
		                   
		                }else{
		                	likers+="</li>";
		                }
	                })
	                
	                $("#likersContainer").html(likers);
	                //팔로우+언팔로우
	                follow();
	                
	                $(".likersClose").on("click", function(){
	                	$(".section3").remove();
	                	$(".section2").show();
	                })
	                
	            });
	         }else if(data.length==0){
	            $(likeContainer).children("span").html(0);
	         }
	      }); 
	   });
}

//css - 모달창 사진이동버튼
		
//오른쪽으로 넘기기
function moveRight(){
	var len = $(".popPostImage").length-1;
	var curIdx = parseInt($(".popPostImage:visible").index());
	var curObj = $(".popPostImage:visible");
	var nextObj = curObj.next();

	////다음객체 비율 조정
	if(nextObj.is("video")){
		//다음 비디오 플레이
		nextObj.get(0).play();
		if(nextObj[0].videoWidth <= nextObj[0].videoHeight){
      			$(nextObj).css("min-height", "100%");
		}else if(nextObj[0].videoWidth > nextObj[0].videoHeight){
			$(nextObj).css("min-width", "100%");
		}
	}else{	//이미지면
		if(nextObj[0].naturalWidth <= nextObj[0].naturalHeight){
      			$(nextObj).css("min-height", "100%");
		}else if(nextObj[0].naturalWidth > nextObj[0].naturalHeight){
			$(nextObj).css("min-width", "100%");
		}
	}
	//이미지 전환
	curObj.css("display","none");
	nextObj.css("display","block");
	
	//현재 비디오면 정지
	if(curObj.is("video")){
		curObj.get(0).pause();
	}
	//버튼 보이기
	$("#moveLeft").css("display","block");
	if(len == curIdx+1){
		$("#moveRight").css("display","none");
	}
};

//이미지 왼쪽으로 넘기기
function moveLeft(){
	var len = $(".popPostImage").length-1;
	var curIdx = parseInt($(".popPostImage:visible").index());
	var curObj = $(".popPostImage:visible");
	var prevObj = curObj.prev();

	//이전객체 비율 조정
	if(prevObj.is("video")){
		//다음 비디오 플레이
		prevObj.get(0).play();
		if(prevObj[0].videoWidth <= prevObj[0].videoHeight){
      			$(prevObj).css("min-height", "100%");
		}else if(prevObj[0].videoWidth > prevObj[0].videoHeight){
			$(prevObj).css("min-width", "100%");
		}
	}else{	//이미지면
		if(prevObj[0].naturalWidth <= prevObj[0].naturalHeight){
      			$(prevObj).css("min-height", "100%");
		}else if(prevObj[0].naturalWidth > prevObj[0].naturalHeight){
			$(prevObj).css("min-width", "100%");
		}
	}
	
	//이미지 전환
	curObj.css("display","none");
	prevObj.css("display","block");
	
	//현재 비디오 정지
	if(curObj.is("video")){
		curObj.get(0).pause();
	}
	
	//버튼 보이기
	$("#moveRight").css("display","block");
	if(curIdx - 1 == 0){
		$("#moveLeft").css("display","none");
	}
};

    
//css - 댓글달기 버튼 클릭시 커서 포커스
function replyCursor(thisBtn){
   $(".replyRegist").focus();
};

//follow여부확인하여 팔로우/팔로우취소
function follow(){
	var followFlg=false;
   $(".isFlw").on("click", function(){
      var userid=$(this).data("uid");
      var isFlw=this;
      if(followFlg){return;};
      followFlg=true;
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
         headers:header,
         dataType:"text",
         beforeSend : function(xhr)
         {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
         success:function(result){
            if(result=="SUCCESS"){
            	followed();
                following();
                followFlg=false;
            };
         }
      });
   });
};

function followed(){
	
	$.getJSON("/member/followed/${userVO.id}", function(data){
	      var data=$(data);
	      if(data.length!=0){
	         $("#followed").html("<a href='javascript:;' id='flwr'>팔로워 "+data.length+"</a>");
	         //followed onclick 메서드 적용(follow리스트뜨도록)
	         $("#flwr").on("click", function(){
	            var followedList="";
	            data.each(function(){
	               followedList+="<li class='oneofList'> <a href='/member/"+this.nickname+"'> <img class='followPhoto' ";
	                
	               	// 프로필 사진이 있는경우 | 없는 경우
					if(this.profilephoto != null){
						followedList+="src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+this.profilephoto+"' /></a>&nbsp &nbsp";
	            	}else{
						followedList+="src='/resources/img/emptyProfile.jpg' /></a>&nbsp &nbsp";
	            	}
	               	// 이름이 있는 경우 | 없는 경우
	               	if(this.name != null){
	               		followedList+="<div style='display:inline-block; line-height:16px;'><a style='font-weight:bold;' href='/member/"+this.nickname+"'>" + this.nickname + "</a><p style='margin:0;'>"+this.name+"</p></div>"
	               	}else{
	               		followedList+="<a style='font-weight:bold; line-height: 28px;' href='/member/"+this.nickname+"'>" + this.nickname + "</a>"
	               	}
	            	// 팔로우하고있는 경우 | 팔로우하지 않는 경우 | 본인인 경우
	            	if(this.isFollow > 0){
						followedList+="<button class='isFlw' data-uid='"+this.id+"'>팔로잉</button></li>";
	               	}else if(this.isFollow==0 && this.id!=${login.id}){
	               		followedList+="<button class='isFlw' data-uid='"+this.id+"'>팔로우</button></li>";
             		}else{
	               		followedList+="</li>";
          		}
	            });
	            
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
           	$(".followTitle strong").text("팔로워");
	             
	            //modal끄기 메서드-바깥부분
	            $("#myFollowModal").click(function(event){
	               if(event.target==this){
	                  $("#myFollowModal").css("display","none");
	                  $("#myFollowModal").remove();   
	               }
	            });
	            
	            
	            //modal끄기 메서드-버튼부분
	            $(".close:eq(0)").on("click", function(){
	               $("#myFollowModal").css("display","none");
	               $("#myFollowModal").remove();
	            });
	            
	         });
	         //$("#flwr").on("click") end
	      }else{
	         $("#followed").html("팔로워 0");
	      }
	   }); //getjson end
}
	   
	

//followList 에 followingList부여 및 팔로우 수 갱신
function following(){
	
	   $.getJSON("/member/following/${userVO.id}", function(data){
	      var data=$(data)
	      if(data.length!=0){
	         $("#following").html("<a href='javascript:;' id='flw'>팔로우 "+data.length+"</a>");
	         //following onclick 메서드 적용(follow리스트뜨도록)
	         $("#flw").on("click", function(){
	         var followingList="";
	            data.each(function(){
	               
	               followingList+="<li class='oneofList'> <a href='/member/"+this.nickname+"'> <img class='followPhoto' ";
	               	// 프로필 사진이 있는경우 | 없는 경우
	            	if(this.profilephoto != null){
	            		followingList+="src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+this.profilephoto+"' /></a>&nbsp &nbsp";
	            	}else{
	            		followingList+="src='/resources/img/emptyProfile.jpg' /></a>&nbsp &nbsp";
	            	}
	               	// 이름이 있는 경우 | 없는 경우
	               	if(this.name != null){
	               		followingList+="<div style='display:inline-block; line-height:16px;'><a style='font-weight:bold;' href='/member/"+this.nickname+"'>" + this.nickname + "</a><p style='margin:0;'>"+this.name+"</p></div>"
	               	}else{
	               		followingList+="<a style='font-weight:bold; line-height: 28px;' href='/member/"+this.nickname+"'>" + this.nickname + "</a>"
	               	}
	            	// 팔로우하고있는 경우 | 팔로우하지 않는 경우 | 본인인 경우
	            	if(this.isFollow > 0){
	                  followingList+="<button class='isFlw' data-uid='"+this.id+"'>팔로잉</button></li>";
	               
	               }else if(this.isFollow==0 && this.id!=${login.id}){
	                  followingList+="<button class='isFlw' data-uid='"+this.id+"'>팔로우</button></li>";
	               
	               }else{
	                  followingList+="</li>";
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
	            $(".followTitle strong").text("팔로우");
	            
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
	}
</script>

</html>
