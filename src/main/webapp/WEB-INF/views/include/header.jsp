<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--제이쿼리 라이브러리  -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- 모달 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--검색창 부트스트랩  -->
<link rel="stylesheet" href="/resources/bootstrap/css/nav-style.css">

<!-- 업로드 관련 확장자 필터링 스크립트 -->
<script type="text/javascript" src="../../resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="/resources/css/header.css" type="text/css">
<link rel="stylesheet" href="/resources/css/animation.css" type="text/css">

<!-- 길이제한 함수, 해쉬태그 필터링 -->
<script type="text/javascript" src="../../resources/js/common.js"></script>

<!-- 웹소켓 -->
<script type="text/javascript" src="../../resources/js/sockjs.js"></script>

<!-- 아이콘 부트스트랩  -->
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" >

<style>

body {
	 padding-top: 5px;
}

.navbar-default .explore {
   width: 38px;
   height: 38px;
   margin-left: 30px;
   display: inline-block;
   background-size: 38px;
   background-image: url(/resources/image/header_icon/explore_icon.png);
   background-repeat: no-repeat;
   position: relative;
}

.navbar-default .new-post {
   width: 40px;
   height: 40px;
   margin-left: 30px;
   display: inline-block;
   background-size: 40px;
   background-image: url(/resources/image/header_icon/camera_icon.png);
   background-repeat: no-repeat;
   position: relative;
   top: 3px;
}

.navbar-default .follow-list {
    width: 34px;
    height: 36px;
    margin-left: 30px;
    display: inline-block;
    background-size: 34px;
    background-image: url(/resources/image/header_icon/heart.png);
    background-repeat: no-repeat;
    position: relative;
}

.navbar-default .account {
   width: 40px;
   height: 40px;
   margin-left: 30px;
   display: inline-block;
   background-size: 40px;
   background-image: url(/resources/img/emptyProfile.jpg);
   background-repeat: no-repeat;
   border-radius:50%;
}

.navbar-default .nav-wrap {
   max-width: 1010px;
   width: 100%;
   margin: 0 auto;
   padding: 0 30px;
}

.empty {
	height: 80px;
}

/* 카테고리 시작 */
.cateSection {
	display: inline-block;
	visibility: hidden;
	position: fixed;
  	left: 38.5%;
    width: 385px;
    top: 0;
}

.cateSection ul {
	height: 150px;
	transition: 0.3s;
	margin: 0;
	padding: 5px 0;
	text-decoration: none;
	font-size: 20px;
	color: white;
	position: fixed;
    left: 38.5%;
    width: 385px;
}

#categoryList {
	list-style: none; /* 리스트 쩜 없애기 */
    position: fixed;
    left: 38.5%;
    width: 385px;
    top: 135px;
}

li.cate {
	list-style: none; /* 리스트 쩜모양 없애기 */
	font-family: 'Raleway', Arial, sans-serif;
	position: relative;
	float: left;
	overflow: hidden;
	margin: 20px 1% 0 1%;
	width: 50px;
	height: 50px;
	color: #ffffff;
	text-align: center;
}

li.cate * {
	/* 쩜쩜하면서 천천히 바뀜 */
	-webkit-transition: all 0.45s ease-in-out;
	transition: all 0.45s ease-in-out;
}

li.cate img {
	height: 100%;
	width: 100%;
	position: relative;
	opacity: 1; /* 투명도 */

}

li.cate .caption {
	overflow: hidden;
	-webkit-transform: translateY(20%); /* "일상" Y위치 */
	transform: translateY(20%);
	transform: translateX(2%);
	-webkit-transform: translateX(2%); /* "일상" X위치 */
	position: absolute;
	width: 100%;
	bottom: 0;
}

li.cate p {
	display: table;
	margin: 0 auto;
	padding: 0 10px;
	position: relative;
	text-align: center;
	width: auto;
	text-transform: uppercase;
	font-weight: 400;
}

/* "일상" 글자크기 & 글자 하얀테두리 감싸기 */
li.cate p {
	font-size: 0.8em;
	font-weight: 500;
	color: black;
	/* 글씨에 하얀 테두리 감싸기 */
	text-shadow: -1px 0 #F2F1F6, 0 1px #F2F1F6, 1px 0 #F2F1F6, 0 -1px
		#F2F1F6;
	-moz-text-shadow: -1px 0 #F2F1F6, 0 1px #F2F1F6, 1px 0 #F2F1F6, 0 -1px
		#F2F1F6;
	-webkit-text-shadow: -1px 0 #F2F1F6, 0 1px #F2F1F6, 1px 0 #F2F1F6, 0
		-1px #F2F1F6;
}

/* a링크가 전체 이미지 크기만큼 */
li.cate a {
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	position: absolute;
	z-index: 1;
}

/*이미지 변경 스타일 */
li.cate:hover img, li.cate.hover img {
	opacity: 0.35;
	-webkit-transform: scale(1.15);
	transform: scale(1.15);
}

/* 화살표 아이콘 */
i {
	border: solid #ddd;
	border-width: 0 5px 5px 0;
	display: inline-block;
	padding: 5px;
}

.arrowslide {
	position: fixed;
	left: 50%;
}

.one{
	top: 5px;
	position: absolute;
	left: 50%;
	bottom: 30px;
	transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
}

.two{
	top: 20px;
	position: absolute;
	left: 50%;
	bottom: 30px;
	transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
}

.empty {
	height: 220px;
}

.dropbtn {
    background-color: #f8f8f8;
    color: #999;
    width: 109px;
    text-align: center;
    padding: 16px;
    font-size: 13px;
    border: none;
    cursor: pointer;
    font-family: Arial;
    position: fixed;
    top: 22.8px;
}

.dropbtn:hover {
	color: black;
    background-color: #f8f8f8;
    border: 1px solid #f8f8f8;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: white;
    border-top: 1px solid #f1f1f1;
    min-width: 109px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    font-size: 13px;
    font-family: Arial;
}

.dropdown a:hover {background-color: #f1f1f1}
.dropdown a:visited {color: black;}

.show {display:block;}


</style>

</head>
<body>

   <nav class="navbar navbar-default" style="z-index: 1;">

   <a href="/main"><div class="faintlogo"></div></a>
   <div class="nav-wrap" style="display: block;">
      <form class="search-form" action="/search/search" method="get">
         <input class="textInput" type="text" name='inputKeyword'
            id='keywordInput' value="${keyword}" placeholder="검색"
            title="사람검색@ 태그검색# 위치검색*" list="results" data-toggle="modal"
            data-target="#searchModal" data-backdrop="true" autocomplete="off">
         <span class="search-icon"></span>
      </form>

	<div class="arrowslide">
		<i class="arrow one"></i> 
		<i class="arrow two"></i> 
	</div>
	
		<div class="cateSection" id="1">   
        	<ul id="categoryList" style="z-index:5;">
 		 <li class="cate"  data-filter="all" tabindex="-1"  onclick="cateClick(this)">
              <div class="caption">
              	<img src="/resources/image/cate_icon/microsoft.svg" style="width:27px; height:45px;">
              	<!-- <p>ALL</p> -->
              </div>
        </li>
	
		  <li class="cate"  data-filter="1" tabindex="-1"  onclick="cateClick(this)">
              <div class="caption">
		  		<img src="/resources/image/cate_icon/plane.svg" style="width:33px; height:45px;">
                <!-- <p>여행</p> -->
              </div>
        </li>
        
          <li class="cate"  data-filter="2" tabindex="-1"  onclick="cateClick(this)">
              <div class="caption">
              	<img src="/resources/image/cate_icon/film.svg" style="width:33px; height:45px;">
                <!-- <p>영화</p> -->
              </div>
        </li>
        
          <li class="cate"  data-filter="3" tabindex="-1"  onclick="cateClick(this)">
              <div class="caption">
              	<img src="/resources/image/cate_icon/music.svg" style="width:29px; height:45px;">
                <!-- <p>음악</p> -->
              </div>
        </li>
        
          <li class="cate"  data-filter="4" tabindex="-1"  onclick="cateClick(this)">
              <div class="caption">
              	<img src="/resources/image/cate_icon/food.svg" style="width:23px; height:46px;">
                <!-- <p>음식</p> -->
              </div>
        </li>
 		
 		          <li class="cate"  data-filter="5" tabindex="-1"  onclick="cateClick(this)">
              <div class="caption">
              	<img src="/resources/image/cate_icon/write.svg" style="width:30px; height:45px;">
                <!-- <p>글귀</p> -->
              </div>
        </li>
	</ul>
	</div>
      
      <span class="pull-right">
      <a class="explore" href="/explore/expage"></a> 
      <a class="new-post" href="/post/register"></a>
      <a class="follow-list" href="javascript:;"></a>
      <a class="account" href="#"></a>
	<div class="dropdown">
		<div class="dropbtn" onclick="myFunction()">${login.nickname}</div>
		<div id="myDropdown" class="dropdown-content">
			<a href="/member/${login.nickname}" onclick='unloadCheck()'>MY PAGE</a>
			<a href="#" onclick='unloadCheck()' >LOGOUT</a>
		</div>
		</span>
   </div>
   </nav>

   <!-- Modal -->
   <div class="modal fade" id="searchModal" role="dialog" aria-hidden="false">
      <div class="modal-dialog modal-sm">
         <div class="modal-content">
            <div class="modal-header" id="header-modal">
               <div id="results"></div>
            </div>
         </div>
      </div>
   </div>
   <div class="empty"></div>

<script>

function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}


$(".arrowslide").click(function() {
	if($(".cateSection").attr("id")=="1"){
		$(".cateSection").css("visibility", "visible");
		$(".cateSection").fadeIn();
		$(".cateSection").attr("id", "2");
	}
	
	else if($(".cateSection").attr("id")=="2") {
		$(".cateSection ").fadeOut();
		$(".cateSection").css("visibility", "hidden");
		$(".cateSection").attr("id", "1");
	}
})

// 검색 결과 없을 때 enter키 막기
$(".search-form").submit(function(event) { 
   if($("._oznku").text()=="검색 결과가 없습니다.") {
      return false;
      }
   
   // enter치면 목록에서 첫번째꺼로 페이지 이동
   else if($("._ndl3t").length>=1) {
      document.getElementsByClassName("_ndl3t _4jr79")[0].click();
      return false;
      }
   
   return true;
   }); 
   
</script>

<script>
searchAjax();
function searchAjax(){
   
   if($("#keywordInput").val()=="") {
      $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
   }
   
   $("#keywordInput").keyup(function(){
      
      var words = $("#keywordInput").val();
       //$(this).val( $(this).val().replace(/ /g, '') );      //공백삭제
       
      // 키워드 받아서 공백 제거하고 저장
      var chgwords = words;keywordInput
      var splitArray = chgwords.split(' ');
      var searchwords = '';
      for(i in splitArray) {
         chgwords = splitArray[i];
         if(chgwords.indexOf(" ")==0) {
            var chgwords = words.substring(chgwords.lastIndexOf(" "));
         }
         searchwords += chgwords;
      }
      console.log("searchwords-----------> " + searchwords);
      
      /* 검색 단어가 있으면 일치하는 것 출력 */
      if(searchwords!=''){
         $.ajax({
            type:"POST",
            url: "/explore/searchData/",
            headers:{
               "Content-Type" : "application/json",
               "X-HTTP-Method-Override" : "POST"
            },
            async: false,
            data: searchwords,
            //dataType: "text",
            success: function(result){
               
                for(var i=0; i<result.length; i++) {
                    if(searchwords.length>0) {
                        for(var a=0; a<searchwords.length; a++) {
                            if(result[i].type==0 && result[i].tagname!=null){
                            	// 특수문자 자르고
                            	tagname=result[i].tagname.substring(1);
                            	
                               for(var b=a; b<tagname.length; b++) {
                                  if(searchwords.charAt(a)==tagname.charAt(b)) {
                                     if(a==b && tagname.indexOf(searchwords)==0) {
                                        result[i].score += 3;
                                     } else if(a==b) {
                                    	 result[i].score += 2;
                                     }
                                    	 result[i].score += 1;
                                     }
                                  }
                               } /* tagname if문 끝 */
                            
                            else if(result[i].nickname!=null) {
                            	// 특수문자 자르고
                               nickname = result[i].nickname.substring(1);
                               
                               // nickname O name O => 둘 다 있는 경우
                              if(result[i].name!=null) {
                            	// 특수문자 자르고
                            	name = result[i].name.substring(1);
                               for(var b=a; b<name.length; b++) {
                                  if(searchwords.charAt(a)==name.charAt(b)) {
                                      if(a==b && name.indexOf(searchwords)==0) {
                                    	  result[i].score += 3;
                                       } else if(a==b) {
                                    	   result[i].score += 2;
                                      } 
                                    	  result[i].score += 1;
                                     }
                               } /* name for문 끝 */
                             }
                              
                               // nickname O name X => nickname만 있을 경우
                               for(var b=a; b<nickname.length; b++) {
                                  if(searchwords.charAt(a)==nickname.charAt(b)) {
                                      if(a==b && nickname.indexOf(searchwords)==0) {
                                    	  result[i].score += 3;
                                       } else if(a==b) {
                                    	   result[i].score += 2;
                                      } else {
                                    	  result[i].score += 1;
                                         }
                                     } 
                                  } /* nickname for문 끝 */
                                  
                            }/* nickname&name elseif끝 */
                            
                            else if(result[i].type==2 && result[i].location!=null) {
                            	
                               for(var b=a; b<result[i].location.length; b++) {
                                  if(searchwords.charAt(a)==result[i].location.charAt(b)) {
										if(a==b) {
                                        	result[i].score += 2;
                                       }
                                    	   result[i].score += 1;
                                     }
                                  }
                            } /* location elseif문 끝 */
                            
                            else {
                               result[i].score=0;
                            }
                            
                        }/* for문 끝 */
                     }
                }/* for문 끝 */
                
               // score를 비교하여 점수 높은 순으로 출력하기
                for(var i=0;i<result.length;i++) {
                  for(var j=i+1; j<result.length; j++) {
                     if(result[j].score>result[i].score) {
                        var temp = result[i];
                        result[i] = result[j];
                        result[j] = temp;
                      }
                    }
               }
                
                console.log("결과값--- "+JSON.stringify(result));
                 
                // 검색 첫 글자가 문자일 때
                if(result!="" && searchwords[0]!='#' && searchwords[0]!='@' && searchwords[0]!='%') {
                   var count = 0;
                   var str = ' ';
                   for(var i=0; i<result.length; i++) {
                       if(result[i].type==0 && result[i].tagname!=null) {
                          console.log("태그다");
                          str+="<a class='_ndl3t _4jr79' onclick='unloadCheck()'  href='/search/tags?name="+result[i].tagname.substring(1)+"'>"
                                +"<div class='_o92vn'>"
                                +"<span class='_po4xn coreSpriteHashtag'><img src='/resources/image/search_icon/hashtag.svg' style='height:23px; width:23px;'></span>"
                                +"<div class='_poxna'>"
                                +"<div class='_lv0uf'>"
                                +"<span class='_b01op'>"+result[i].tagname+"</span>"
                                +"</div>"
                                +"<div class='_2ph7c'>"
                                +"<span class=''>게시물 <span class=''>"+result[i].postedtagCnt+"개</span></span>"
                                +"</div></div></div></a>";
                       }
                                         
                       // 사람 검색
                       else if(result[i].type==1 && result[i].nickname!=null) {
                          console.log("이름이다");
                          str+="<a class='_ndl3t _4jr79' onclick='unloadCheck()' href='/member/"+result[i].nickname.substring(1)+"'>"
                                +"<div class='_o92vn'>";
                                
                                //프로필사진
                                //result[i].profilephoto.length==0 || result[i].profilephoto == "" 
                                if(result[i].profilephoto == null){
                                  str+="<span class='_po4xn coreSpriteHashtag'><img src='/resources/img/emptyProfile.jpg'; style='height:24px; width:24px; border-radius:50%;'></span>";
                                }else{
                                  str+="<span class='_po4xn coreSpriteHashtag'><img src='/displayFile?fileName="+result[i].profilephoto+"'; style='height:24px; width:24px; border-radius:50%;'></span>";
                                }
                                
                          str+="<div class='_poxna'>"
                                +"<div class='_lv0uf'>"
                                +"<span class='_b01op'>"+result[i].nickname+"</span>"
                                +"</div>"
                                +"<div class='_2ph7c'>";
                                if(result[i].name!=null) {
                                   str+="<span class=''><span class=''>"+result[i].name.substring(1)+"</span></span>";
                                } else {
                                   str+="<span class=''><span class=''></span></span>";
                                }
                           str+="</div></div></div></a>";
                       }
                                         
                        // 로케이션 검색
                       else if(result[i].type==2 && result[i].location!=null) {
                          console.log("지역이다");
                          str+="<a class='_ndl3t _4jr79' onclick='unloadCheck()'  href='/search/locations?location="+result[i].location.substring(1)+"'>"
                                +"<div class='_o92vn'>"
                                +"<span class='_po4xn coreSpriteHashtag'><img src='/resources/image/search_icon/location.svg' style='height:23px; width:23px;'></span>"
                                +"<div class='_poxna'>"
                                +"<div class='_lv0uf'>"
                                +"<span class='_b01op'>"+result[i].location.substring(1)+"</span>"
                                +"</div>"
                                +"<div class='_2ph7c'>"
                                +"</div></div></div></a>";
                       } 
                       
                       else if(result[i].score==0){
                          count ++;
                     	  }
                       
                       else {
                          $("#results").html("");
                      	 }
                       
                       if(count>=3) {
                          $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
                       } else {
                          $("#results").html(str);
                      	 }
                      	
                   }/* for문 끝 */
                   
                } /* 문자 검색 끝 */
                // 검색 문자 첫 글자가 #인 경우
               else if(searchwords[0]=="#") {
                  var count = 0;
                  var str = '';
                  for(i=0; i<result.length; i++) {
                        if(result[i].type==0 && result[i].tagname!=null) {
                            console.log("태그다");
                            str+="<a class='_ndl3t _4jr79' onclick='unloadCheck()'  href='/search/tags?name="+result[i].tagname.substring(1)+"'>"
                                  +"<div class='_o92vn'>"
                                  +"<span class='_po4xn coreSpriteHashtag'><img src='/resources/image/search_icon/hashtag.svg' style='height:23px; width:23px;'></span>"
                                  +"<div class='_poxna'>"
                                  +"<div class='_lv0uf'>"
                                  +"<span class='_b01op'>"+result[i].tagname+"</span>"
                                  +"</div>"
                                  +"<div class='_2ph7c'>"
                                  +"<span class=''>게시물 <span class=''>"+result[i].postedtagCnt+"개</span></span>"
                                  +"</div></div></div></a>"
                                  }
                           else if(result[i].tagname==null){
                             count ++;
                             $("#results").html("");
                          }
                 	 }
                 		
                       if(count>=3 && result.length==3) {
                    	   console.log(">>>"+result.length);
                          $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
                     	  } else {
                     		 $("#results").html(str);
                     	  }
               } /* #검색 끝 */
               
                // 검색 첫 글자가 @인 경우
               else if(searchwords[0]=="@") {
                 var count = 0;
                 var str = ' ';
                 for(var i=0; i<result.length; i++) {
                    if(result[i].type==1 && result[i].nickname!=null) {
                          console.log("이름이다");
                        str+="<a class='_ndl3t _4jr79'  onclick='unloadCheck()' href='/member/"+result[i].nickname.substring(1)+"'>"
                                   +"<div class='_o92vn'>";
                                   
                             //프로필사진
                             //result[i].profilephoto.length==0 || result[i].profilephoto == "" 
                             if(result[i].profilephoto == null){
                               str+="<span class='_po4xn coreSpriteHashtag'><img src='/resources/img/emptyProfile.jpg'; style='height:24px; width:24px; border-radius:50%;'></span>";
                                } else{
                               str+="<span class='_po4xn coreSpriteHashtag'><img src='/displayFile?fileName="+result[i].profilephoto+"'; style='height:24px; width:24px; border-radius:50%;'></span>";
                                   }
                             
                       str+="<div class='_poxna'>"
                             +"<div class='_lv0uf'>"
                             +"<span class='_b01op'>"+result[i].nickname+"</span>"
                             +"</div>"
                             +"<div class='_2ph7c'>";
                             if(result[i].name!=null) {
                                str+="<span class=''><span class=''>"+result[i].name.substring(1)+"</span></span>";
                             } else {
                                str+="<span class=''><span class=''></span></span>";
                             }
                          str+="</div></div></div></a>";
                    }
                        
                     else if(result[i].nickname==null){
                         count ++;
                         $("#results").html("");
                      }
                 }
                    if(count>=3 && result.length==3) {
                 	   console.log(">>>"+result.length);
                       $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
                  	  } else {
                  		 $("#results").html(str);
                  	  }
               } /* @ 검색 끝 */

                
               else {
                  console.log("검색문else로왔다");
                  $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
               }
               
            }, /* success  끝 */
            
            error: function(e){
               if(e.status==500) {
                  console.log("에러로갓니?");
                  $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
               //throw e.responseText;
               }
            }/* error 끝 */
            
         }); /* ajax 끝 */
      }      /* if 끝 */
      
      // enter 안 먹음
      else{
         console.log("그럼여기구나");
       	 console.log("결과값: "+JSON.stringify(result));
      }
      
   }) /* keyup() 끝 */
}      /* searchAjax() 끝 */

function show(str){
   searchAjax();
    $("#searchModal").modal('show');
}
  
</script>
</body>
</html>