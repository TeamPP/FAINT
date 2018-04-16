<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>
   
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
<script type="text/javascript" src="../../resources/js/scokjs.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<style>
.pull-right > a {
   width: 33px;
   height: 33px;
   margin-left: 30px;
   display: inline-block;
}
.pull-right > a > i{
	font-size:33px !important;
	color: lightcoral !important;
}
.navbar-default .nav-wrap {
   max-width: 1010px;
   width: 100%;
   margin: 0 auto;
   padding: 0 30px;
   color: gray;
}
.headerPhoto{
	width: 33px;
	height: 33px;
	display: inline-block;
	border-radius: 150px;  /* 프사 둥글게 */
	vertical-align: baseline !important;
}

.search-form{
	text-align:center;
}


/* 카테고리 아이콘____ */
.cateSection ul {
   height: 150px;
   position: absolute;
   top: -30px; /*처음 숨겨지는 부분 */
   left: 0px;
   transition: 0.3s;
   margin: 0;
   padding: 5px 0;
   width: 30%;
   text-decoration: none;
   font-size: 20px;
   color: white;
}
.cateSection ul:hover {
   top: 50px; /* mouseenter 시에 이벤트  판넬 내려옴 */
   left: 0px;
}
#categoryList {
   list-style: none; /* 리스트 쩜 없애기 */
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
   background: #000000;
   color: #ffffff;
   text-align: center;
   box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
   border-radius: 150px; /*사진 둥글게 */
   border: 2px solid black;
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
   border-radius: 150px; /*사진 둥글게 */
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
.arrow {
   padding:5px;
    border: solid black;
    border-width: 0 2px 2px 0; /*아이콘 밑 화살표모양으로 만들기 */
   position: absolute;
   left: 4px;
   bottom: 30px;
   transform: rotate(45deg);
   -webkit-transform: rotate(45deg);
}

</style>

</head>
<body>

<!--카테고리 아이콘  -->
<!-- 카테고리 버튼 -->
<section class="cateSection">
<ul id="categoryList">
    <!-- ALL 여행 영화 음악 음식 글귀 -->
        <li class="cate"  data-filter="all" tabindex="-1"  onclick="cateClick(this)">
            <img class ="cateIcon" src="https://pbs.twimg.com/profile_images/892243625198755842/X1n8LRQH_400x400.jpg" alt="sample22" />
              <div class="caption"><p>ALL</p></div>
        </li>
   
        <li class="cate"  data-filter="1" tabindex="-1"  onclick="cateClick(this)">
            <img class ="cateIcon" src=https://post-phinf.pstatic.net/MjAxNzExMzBfMTQx/MDAxNTEyMDI5ODQxMTM5.sdeLNBYNUgcXjghC6MTd1IZAH5OWJKds9qWnSdByBCQg.VjtqfFZ_074J9dsv6qN3DD2f51O03av1gw9K_BL4UN8g.GIF/emot_020_x3.gif?type=w1200 alt="sample22" />
              <div class="caption">
                <p>여행</p>
              </div>
        </li>
        
          <li class="cate"  data-filter="2" tabindex="-1"  onclick="cateClick(this)">
            <img class ="cateIcon" src="http://kstatic.inven.co.kr/upload/2017/10/24/bbs/i16627999197.gif" alt="sample22" />
              <div class="caption">
                <p>영화</p>
              </div>
        </li>
        
          <li class="cate"  data-filter="3" tabindex="-1"  onclick="cateClick(this)">
            <img class ="cateIcon" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNkYEtCWfkb94vsBBh_O_-9rvPsW7DcE70k4THgoCHYHH0wN_yBw" alt="sample22" />
              <div class="caption">
                <p>음악</p>
              </div>
        </li>
        
          <li class="cate"  data-filter="4" tabindex="-1"  onclick="cateClick(this)">
            <img class ="cateIcon" src="https://i.pinimg.com/originals/8d/6a/86/8d6a867e299c5cb6bef1eb33bfe9791b.gif" alt="sample22" />
              <div class="caption">
                <p>음식</p>
              </div>
        </li>
      
       
                 <li class="cate"  data-filter="5" tabindex="-1"  onclick="cateClick(this)">
            <img class ="cateIcon" src="http://upload2.inven.co.kr/upload/2017/07/01/bbs/i16284189296.gif" alt="sample22" />
              <div class="caption">
                <p>글귀</p>
              </div>
        </li>
         <!--화살표 아이콘  -->
         <i class="arrow"></i>
</ul>
</section>



   <nav class="navbar navbar-default" style="z-index: 1;">
   <div class="nav-wrap" style="display: block;">
      <a class="logo pull-left" href="/">나와라 로고!</a>
      <form class="search-form" action="/search/search" method="get">
         <input class="textInput" type="text" name='inputKeyword'
            id='keywordInput' value="${keyword}" placeholder="검색"
            title="사람검색@ 태그검색# 위치검색*" list="results" data-toggle="modal"
            data-target="#searchModal" data-backdrop="true" autocomplete="off">
         <span class="search-icon"></span>
      </form>
      <span class="pull-right">
      <a class="explore" href="/explore/expage"><i class="material-icons">explore</i></a>
      <a class="new-post" href="/post/register"><i class="material-icons">create</i></a>
       <a class="follow-list" href="javascript:;"><i class="material-icons">insert_comment</i></a>
      <a class="account" href="/member/${login.nickname}">
		<c:choose>
			<c:when test="${login.profilephoto ne null && login.profilephoto != ''}">
				<img class="headerPhoto" src="http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122${login.profilephoto}" /> 
			</c:when>
			<c:otherwise>
				<img class="headerPhoto" src="/resources/img/emptyProfile.jpg" />
			</c:otherwise>
		</c:choose>
      </a>
      			<sec:authorize access="hasRole('ROLE_USER')">
				<form action="<c:url value='/logout'/>" method="post">

					<button type="submit" class="btn btn-default">로그아웃</button>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</sec:authorize>
      
      </span>
   </div>
    <div class="top-menu">
            	<ul class="nav pull-right top-menu">
          <%--     <security:authorize access="isAnonymous()"><li><a class="login" href="login_view">login</a></li></security:authorize> --%>
       <%--        <security:authorize access="hasRole('ROLE_USER')">
              <form action="<c:url value='/logout'/>" method="post">
               
                              <button type="submit" class="btn btn-default">로그아웃</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </security:authorize> --%>
        		<sec:authorize access="!hasRole('ROLE_USER') ">
		<a href="<c:url value='/login.do'/>">로그인좀해 임마 </a>
	</sec:authorize>



			<%-- 	 <form>
	            	  <a class="logout" href="<c:url value='/logout'/>">logout</a>
	            	   
	              </form> --%>
            	</ul>
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

   <script>
// 검색 결과 없을 때 enter키 막기
$(".search-form").submit(function(event) { 
   if($("._oznku").text()=="검색 결과가 없습니다.") {
      return false;
      }
   
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
      console.log("searchwords : -----------" + searchwords);
      
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
            beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            //dataType: "text",
            success: function(result){
               
               console.log("결과값 :"+JSON.stringify(result));
               
                for(var i=0; i<result.length; i++) {
                   
                    if(searchwords.length>0) {
                        for(var a=0; a<searchwords.length; a++) {
                           
                            if(result[i].type==0 && result[i].tagname!=null){
                               for(var b=a; b<result[i].tagname.length; b++) {
                                  if(searchwords.charAt(a)==result[i].tagname.charAt(b)) {
                                     if(a==b) {
                                        result[i].score += 2;
                                     } else {
                                        result[i].score++;
                                        }
                                     }
                                  }
                               } /* tagname if문 끝 */
                            
                            else if(result[i].nickname!=null && result[i].nickname!=null) {
                               var nickscore = result[i].score;
                                  var namescore = result[i].score;
                               for(var b=a; b<result[i].nickname.length; b++) {
                                  if(searchwords.charAt(a)==result[i].nickname.charAt(b)) {
                                      if(a==b) {
                                         nickscore += 2;
                                      } else {
                                         nickscore++;
                                         }
                                     } /* nickname if문 끝 */
                                  
                                  if(searchwords.charAt(a)==result[i].name.charAt(b)) {
                                      if(a==b) {
                                         namescore += 2;
                                      } else {
                                         namescore++;
                                         }
                                     } /* naem if문 끝 */
                                  
                                  }
                               
                                  if(nickscore<namescore) {
                                     result[i].score = namescore;
                                     } else if(nickscore>namescore){
                                     result[i].score=nickscore;
                                  } else {
                                     result[i].score = nickscore+namescore;
                                  }
                            }/* elseif끝 */
                            
                            
                            else if(result[i].type==2 && result[i].location!=null) {
                               for(var b=a; b<result[i].location.length; b++) {
                                  if(searchwords.charAt(a)==result[i].location.charAt(b)) {
                                      if(a==b) {
                                         result[i].score += 2; 
                                      } else {
                                         result[i].score++;
                                         }
                                     }
                                  }
                            } /* location elseif문 끝 */
                            
                            else {
                               result[i].score=0;
                            }
                            
                        }/* for문 끝 */
                     }
                }/* for문 끝 */
                
                for(var i=0;i<result.length;i++) {
                  for(var j=i; j<result.length-1-i; j++) {
                     if(result[j].score<result[j+1].score) {
                        var temp = result[j];
                        result[j] = result[j+1];
                        result[j+1] = temp;
                      }
                    }
               }
                 
                console.log("바뀐결과값 :"+JSON.stringify(result));
                
                // 검색 첫 글자가 문자일 때
                if(result!="" && searchwords[0]!='#' && searchwords[0]!='@' && searchwords[0]!='%') {
                   var count = 0;
                   var str = ' ';
                   for(var i=0; i<result.length; i++) {
                       if(result[i].type==0 && result[i].tagname!=null) {
                          console.log("태그다");
                          str+="<a class='_ndl3t _4jr79' onclick='unloadCheck()'  href='/search/tags?name="+result[i].tagname.substring(1)+"'>"
                                +"<div class='_o92vn'>"
                                +"<span class='_po4xn coreSpriteHashtag'><img src='/resources/image/hashtag.jpg' style='height:23px; width:23px;'></span>"
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
                                +"<span class='_po4xn coreSpriteHashtag'><img src='/resources/image/location.jpg' style='height:23px; width:23px;'></span>"
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
                  var str = ' ';
                  for(i=0; i<result.length; i++) {
                        if(result[i].type==0 && result[i].tagname!=null) {
                            console.log("태그다");
                            str+="<a class='_ndl3t _4jr79' onclick='unloadCheck()'  href='/search/tags?name="+result[i].tagname.substring(1)+"'>"
                                  +"<div class='_o92vn'>"
                                  +"<span class='_po4xn coreSpriteHashtag'><img src='/resources/image/hashtag.jpg' style='height:23px; width:23px;'></span>"
                                  +"<div class='_poxna'>"
                                  +"<div class='_lv0uf'>"
                                  +"<span class='_b01op'>"+result[i].tagname+"</span>"
                                  +"</div>"
                                  +"<div class='_2ph7c'>"
                                  +"<span class=''>게시물 <span class=''>"+result[i].postedtagCnt+"개</span></span>"
                                  +"</div></div></div></a>"
                                  }
                           
                           else if(result[i].score==0){
                             result[i] = null;
                             count ++;
                          }
                       if(count>=3) {
                          $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
                       } else {
                          $("#results").html(str);
                       }
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
                        
                     else if(result[i].score==0){
                         result[i] = null;
                         count ++;
                        console.log("여기갔지?");
                        console.log(count);
                      }
                   if(count>=3) {
                      console.log("총카운트:"+count);
                      $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
                   } else {
                      $("#results").html(str);
                   }
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
         //$("#results").html("");
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