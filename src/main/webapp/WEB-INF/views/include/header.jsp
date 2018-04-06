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

<style>
.navbar-default .explore {
   width: 24px;
   height: 23px;
   margin-left: 30px;
   display: inline-block;
   background-size: 413px 391px;
   background-image:
      url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/abfe22.png");
   background-position: -200px -342px;
}
.navbar-default .new-post {
   width: 24px;
   height: 23px;
   margin-left: 30px;
   display: inline-block;
   background-size: 413px 391px;
   background-image:
      url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/abfe22.png");
   background-position: -201px -111px;
}
.navbar-default .follow-list {
   width: 24px;
   height: 23px;
   margin-left: 30px;
   display: inline-block;
   background-size: 413px 391px;
   background-image:
      url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/abfe22.png");
   background-position: -192px -283px;
}
.navbar-default .account {
   width: 24px;
   height: 23px;
   margin-left: 30px;
   display: inline-block;
   background-size: 413px 391px;
   background-image:
      url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/abfe22.png");
   background-position: -275px -342px;
}
.navbar-default .nav-wrap {
   max-width: 1010px;
   width: 100%;
   margin: 0 auto;
   padding: 0 30px;
}
</style>


</head>
<body>

   <nav class="navbar navbar-default">
   <div class="nav-wrap" style="display: block;">
      <a class="logo pull-left" href="/main"></a>
      <form class="search-form" action="/search/search" method="get">
         <input class="textInput" type="text" name='inputKeyword'
            id='keywordInput' value="${keyword}" placeholder="검색"
            title="사람검색@ 태그검색# 위치검색*" list="results" data-toggle="modal"
            data-target="#searchModal" data-backdrop="true" autocomplete="off">
         <span class="search-icon"></span>
      </form>
      <span class="pull-right"> <a class="explore"
         href="/explore/expage"></a> <a class="new-post" href="/post/register"></a>
         <a class="follow-list" href="javascript:;"></a> <a class="account"
         href="/member/${login.nickname}"></a>
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