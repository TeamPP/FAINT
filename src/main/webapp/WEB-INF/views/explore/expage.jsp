<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--헤더-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 모달 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
   
<!--검색창 부트스트랩  -->  
<link rel="stylesheet" href="/resources/bootstrap/css/nav-style.css"> 
  
<title>Insert title here</title>
<!-- jquery 2.1.4. -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<style>

.fadeInDown {
   /* animation-iteration-count: infinite; */
}

 .tit {
   text-overflow: ellipsis;
   width: 100px;
   
}

/* 인기 검색어 스타일 */
h2 {
   text-align: center;
}

.top{
   display: inline-block;
   border: 1px solid black;
   width: 400px;
   margin: auto;
   background: white;
}

.tagOL, .userOL { 
   list-style-type: decimal; 
}

em { 
   font-style: normal;
   cursor : pointer;
}

.tagnum, .usernum {
   display: block;
    float: left;
    min-width: 13px;
    _width: 13px;
    height: 12px;
    margin-right: 9px;
    border: 1px solid #e0e0e0;
    color: #666;
    line-height: 12px;
    font-size: 11px;
    text-align: center;
    font-family: tahoma,sans-serif;
}

.tagList {
   /* width: 200px; */
   margin: auto;
    display: list-item;
    text-align: -webkit-match-parent;
}

.userList {
   /* width: 200px; */
   margin: auto;
    display: list-item;
    text-align: -webkit-match-parent;
}

 .tagList .keyword .tit {
    display: block;
    overflow: hidden;
    _width: 210px;
    font-size: 12px;
    color: #000;
    white-space: nowrap;
    text-overflow: ellipsis;
    word-wrap: normal;
}

 .userList .keyword .tit {
    display: block;
    overflow: hidden;
    _width: 210px;
    font-size: 12px;
    color: #000;
    white-space: nowrap;
    text-overflow: ellipsis;
    word-wrap: normal;
}

span {
   display : inline-block;
   margin: 0;
    padding: 0;
    border: 0;
    font: inherit;
    vertical-align: baseline;
}
</style>


</head>
<body>

<!-- 실시간 -->
<br/>
<br/>
<h2>실시간 둘러보기</h2>
<p class="dsc"><time></time></p>
<br/>

<div class="top">
<div class="topTag">
<br/>
   <ol class="tagOL"></ol>
</div>
</div>


<script type="text/javascript">

   RTtag();
       
   function RTtag () {  
       $.ajax({
           type:"POST",
           url: "/explore/getTag",
           async: false,
           headers:{
              "Content-Type" : "application/json",
              "X-HTTP-Method-Override" : "POST"
           },
           
           success : function (data) {
               // 변경된 태그 부분을 넘어온 index 값으로 찾은 뒤 on/off를 변경합니다.
               
            var str = ' ';
               for(var i=1; i<data.length+1; i++) {
                  str += "<li class='tagList' style='list-style-type:none;'>"
                        + "<a class='tagname' href='/search/tags?name="+data[i-1].name+"'>"
                        + "<span class='keyword'>"
                        + "<em class='tagnum'>"+i+"</em>"
                        + "<span class='fid'>"
                        + "<span class='tit'>"+data[i-1].name+"</span>"
                        + "   </span></span></a></li>";
                        
               } /* for문 끝*/
               
             $(".tagOL").html(str);
               
           }, /* success 끝 */
           
           error: function(e){
              if(e.status==500) {
                 console.log("에러로갓니?");
              }
              
              updater.stop();
              console.log("갱신스탑");
           }/* error 끝 */
           
       }); /* ajax 끝 */
       
   } /* RTtag끝  */

   
$(document).ready(function() {
   
   setInterval("RTtag()", 100000);
   // 30초에 한번씩 받아온다.   
   
});
   
</script>

<script>

var ii =0;
var fade = document.getElementsByClassName("fid");

window.setInterval(function(){
        if(ii == fade.length) {   //다 보여주면 스탑
               ii=0;
        }
        
        //카드 보여주기
        $(".fid:eq("+ii+")").toggleClass("fadeInDown animated");
        
        //보여준 후 다시 뒤집
        (function(x){
            window.setTimeout(function(){
               $(".fid:eq("+x+")").toggleClass("fadeInDown animated");
            },1000);
        })(ii);

        ii++;
        
    },1000);   

</script>

<!-- 인기 게시글 -->
<br/>
<br/>

<!-- 모달 적용한 것 -->

<h2>=====인기 게시물=====</h2>
<br/>


<script>
var jsonList=${jsonList};

</script>

<!-- 메인피드 -->
<jsp:include page="/WEB-INF/views/include/postFeed.jsp" flush="false" />

</body>
</html>