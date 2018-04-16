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
#carousel .imgDiv img {
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
   left: 0%; /* 왼쪽 0으로 빠지는 애니메이션 효과 */
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
   left: 100%;
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
   left: 30%;
}
#carousel .prev img {
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
   left: 20%;
   opacity: .7;
}
#carousel .prevLeftSecond img {
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
   left: 50%;
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
   left: 70%;
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
   left: 80%;
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
   font-size: 35px;
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

header{-webkit-box-align:stretch;-webkit-align-items:stretch;-ms-flex-align:stretch;align-items:stretch;border:0 solid #000;-webkit-box-sizing:border-box;box-sizing:border-box;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-orient:vertical;-webkit-box-direction:normal;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0;margin:0;padding:0;}
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
</style>



<body>

   <div id="carousel">
   
      <c:forEach items="${list}" var="postDTO" varStatus='status'>
      <%-- <div class="post" data-filter="${postDTO.cateid}"> --%>
      <article  data-filter="${postDTO.cateid}"
      <c:choose>
      <c:when test="${status.index == 0}">
         class="post prev"
      </c:when>
      <c:when test="${status.index ==   1}">
         class="post selected"
      </c:when>
      <c:when test="${status.index ==   2}">
         class="post next"
      </c:when>
      <c:when test="${status.index ==   3}">
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
               <a class="_q8ysx _6y8ij" id="address" title="" href="#">${postDTO.location }</a>
            </div>
         </div>
      </header>
            <c:set var="urlList" value="${fn:split(postDTO.url, '[|]')}" />
            <c:forEach var="i" begin="0" end="${fn:length(urlList)-1}" step="1">
               <c:choose>
                  <c:when test="${i==0}">
                  <div class="imgDiv">
                     <img  src="http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122${urlList[i]}"
                        data-postid="${postDTO.postid}" />
                  </div>
                  </c:when>
               </c:choose>
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
._pfyik{background-color:rgba(0,0,0,.5);bottom:0;-webkit-box-pack:justify;-webkit-justify-content:space-between;-ms-flex-pack:justify;justify-content:space-between;left:0;overflow-y:auto;-webkit-overflow-scrolling:touch;position:fixed;right:0;top:0;z-index:3}
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
<div id="myModal" class="postModal" >
   <span class="close">&times;</span>
   <div class="postModal-content">
      
      <!--사진 및 동영상 -->    
      <section class="section1">
         <div class="popImageContainer">
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
               <div class="replyContainer" title="{{postid}}" data-limit=0>
               </div>
            </div> 
         </div>
 
         <div class="s2_3">
            <div class="s2_3_1">
               <div class="btnContainer" title="{{postid}}">
                  <button class="replyBtn" onclick="replyCursor(this)">댓글달기</button>
               </div>
               <a class="likeContainer" title="{{postid}}">좋아요 <span>0</span>개</a>
            </div>
         </div>

         <div class="s2_4">
            <div class="s2_4_1" title="{{postid}}">
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
   
    $('#carousel article').not(".selected").click(function() {
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
   //var currentTitle=$(".selected").children("img").attr("title");
   var currentTitle=$(".selected").children("div").children("img").data("postid");
   
     $("#carousel").children().remove(); //다 지우기
      $("#carousel").prepend(all); //초기값 넣기
         
     if(customType==="all") {
        
     }else{
        $(".post").not("article[data-filter='" + customType +"']").remove(); //customType 일치하지않는 요소 삭제
     }
   $("#carousel").children().removeClass(); //기존 클래스명 삭제
   changeClass(); //클래스명 다시부여
   postModal();
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
      //$("#carousel").children().eq(3).addClass("post selected"); //4번사진_가운데
      //$("#carousel").children().eq(4).addClass("post next"); //5번사진
      //$("#carousel").children().eq(5).addClass("post nextRightSecond"); //6번사진
      //나머지는 다 class명을 hideRight로 추가
      //$("div.nextRightSecond").nextAll().addClass("post hideRight"); //6번사진이후로
      $("article.nextRightSecond").nextAll().addClass("post hideRight"); //6번사진이후로
}    
    
   
function moveToSelected(element) {
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
   
   postModal();
}
    

function postModal(){
   //포스트 모달 팝업 창
   $(".selected").on("click", function(){
      var curIndex=$("#carousel article").index(this);
      console.log(curIndex);
      var pid=$(this).children("div").children("img").data("postid");
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
         console.log("나 석세스임");            
            if(data!=null){
               //handlebar추가
               var source=$("#modalPost").html();
               var post=Handlebars.compile(source);
               var postmodal=post(data);
               $("body").append(postmodal);
               
               //현재 위치값 저장
               $(".postModal-content").data("index", curIndex);
                //현재 위치값을 통해 움직이는 버튼 삭제 여부 결정
               if($(".imageContainer:has(img)").length==1){
                  $(".postModal-content > i").remove();
               }else if(curIndex == $(".imageContainer:has(img)").length-1){
                  $(".postRight").remove();
//                }else if(curIndex == 0){
                  $(".postLeft").remove();
               }
                
               //프로필 사진 삽입
               if(data.profilephoto!=null){
                  $(".s2_1_1_1").attr("src", "http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+data.profilephoto)
               }else{
                  $(".s2_1_1_1").attr("src", "/resources/img/emptyProfile.jpg")
               }
               
              //이미지 배열화
              var urlList=data.url.split('|');
              //첨부 이미지or영상 수
                var len = urlList.length;
              if(len == 1){
                 $("#moveRight").css("display", "none");
              }
            //이미지 잘라서 삽입
                for (var i in urlList) {
                 
                    //이미지일 경우(upload.js func)
                    if(checkImageType(urlList[i])){
                      $(".popImageContainer").append("<img class='popPostImage' id='image"+i+"' src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+urlList[i]+"'/>")
                      if(i!=0){$("#image"+i).css("display", "none");}
                  
               //영상일 경우(upload.js func)
                    }else if(checkVideoType(urlList[i])){
                       $(".popImageContainer").append("<video class='popPostImage' id='video"+i+"' loop='true' autoplay src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+urlList[i]+"'/>")
                       if(i!=0){$("#video"+i).css("display", "none"); $("#video"+i).autoplay=false; }
                 
               //이미지나 영상타입이 아닐경우   
                    }else{
                       alert("지원하지 않는 타입의 파일형식을 포함하고 있음")
                    }
               
                }
            
            //이미지 길이조정
            $(".popPostImage").each(function(){
                if(this.naturalWidth <= this.naturalHeight){
                  $(this).css("min-height", "100%");
               }else if(this.naturalWidth > this.naturalHeight){
                  $(this).css("min-width", "100%");
               }
            })
               
               //좋아요버튼 삽입
               if(data.isLike=='0'){
               $(".btnContainer").prepend("<span><button class='likeBtn' style='background-position: -26px -349px;'>좋아요</button></span>")
               }else{
               $(".btnContainer").prepend("<span><button class='likeBtn' style='background-position: 0 -349px;'>좋아요 취소</button></span>")
               }
               
               //저장하기 버튼 삽입
               if(data.isStore=='0'){
                  $(".btnContainer").append("<span><button class='storeBtn' style='background-position: -78px -349px;'>저장하기</button></span>")
               }else{
                  $(".btnContainer").append("<span><button class='storeBtn' style='background-position: -182px -349px;'>저장하기 취소</button></span>")
               }
               
               //게시물 수정버튼 삽입
               if(data.userid==${login.id}){
                   $(".s2_4_1").append("<span style='cursor: pointer; '><i id='postEdit' class='glyphicon glyphicon-option-horizontal'></i></span>")
                   $(".replyRegist").css("width", "94%");
               }
               
               //modal창 보이기
               $("#myModal").css("display","block");
               
               //modal끄기 메서드-바깥부분
               $("#myModal").click(function(event){
                  if(event.target==this){
                     $("#myModal").css("display","none");
                     $("#myModal").remove();
                  }
               })
              

               
               //modal끄기 메서드-버튼부분
               $(".close:eq(0)").on("click", function(){
                  $("#myModal").css("display","none");
                  $("#myModal").remove();
               })
               
               //포스트 움직이기 버튼 함수 적용
             $(".postLeft").on("click", function(){
                var curIndex=$(".postModal-content").data("index");
                $(".close:eq(0)").trigger("click");
                $(".imageContainer:eq("+(curIndex-1)+")").trigger("click");
             });
             $(".postRight").on("click", function(){
                var curIndex=$(".postModal-content").data("index");
                $(".close:eq(0)").trigger("click");
                $(".imageContainer:eq("+(curIndex+1)+")").trigger("click");
             });
               
               postEdit();
               reply();
               like();
               likerList();
               store();
               searchFilter();
            }
         }
      });
   });
}

//게시물 수정
function postEdit(){
   $("#postEdit").on("click",function(){
      var postid=$(".s2_4_1").attr("title");
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
            $("#myModal").css("d