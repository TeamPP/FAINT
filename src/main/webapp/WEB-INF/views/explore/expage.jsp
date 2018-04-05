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

<!-- expage.css -->
<link rel="stylesheet" href="/resources//css/expage.css"> 
  
<title>Insert title here</title>
<!-- jquery 2.1.4. -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<style>

.fadeInDown {
   /* animation-iteration-count: infinite; */
}

h2 {
	text-align: center;
}

</style>


</head>
<body>

<!-- 실시간 -->
<br/>
<br/>
<h2>실시간 둘러보기</h2>

<div class="realtime_keywd">
    <div class="wrap_last_date">
        <span class="none">실시간 급상승 키워드 최종 업데이트 시간</span>
        <span class="last_date"></span><span class="last_time"></span>
    </div>

    <div class="keywd_control">
        <button type="button" title="실시간 급상승 키워드 이전 보기" class="btn_keywd_control pre" style="display: none;"><span class="odd_span">이전</span></button>
        <button type="button" title="실시간 급상승 키워드 재생"  class="btn_keywd_control play" style="display: none;"><span class="odd_span">재생</span></button>
       <button type="button" title="실시간 급상승 키워드 일시 정지"  class="btn_keywd_control stop" style="display: none;"><span class="odd_span">일시정지</span></button>
       <button type="button" title="실시간 급상승 키워드 다음 보기" class="btn_keywd_control next" style="display: none;"><span class="odd_span">다음</span></button>
   </div>
   
   <ol class="tagOL"></ol>
</div>

<script type="text/javascript">

/* var pB = ​document.getElementsByClassName("btn_keywd_control play");
var sB = ​​document.getElementsByClassName("btn_keywd_control stop");

function playBtn() {
	pB.css('display'​​​​​​​​​​​​​​​​​​​​​​​​​​​,'none');
	sB.css('display'​​​​​​​​​​​​​​​​​​​​​​​​​​​,'inline-block');
}

function stopBtn() {
	sB.css('display'​​​​​​​​​​​​​​​​​​​​​​​​​​​,'none');
	​pB.css('display'​​​​​​​​​​​​​​​​​​​​​​​​​​​,'inline-block');
} */

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
                        
                  str += "<li class='rank"+i+"'>"
                  		+ "<div class='realtime_rank'>"
                  		+ "<span class='no'>"+i+"</span>"
                  		+ "<span class='none'>위</span>"
                  		+ "<div class='keywd'>"
                  		+ "<span class='none'>실시간 급상승 키워드</span>"
                  		+ "<a class='ellipsis' href='/search/tags?name="+data[i-1].name+"'>"+data[i-1].name+"</a>"
                  		+ "</div>"
                  		+ "</div>"
                  		+ "<div class='cntt_realtime'>"
                  		+ "<div class='no'>"+i+"위</div>"
                  		+ "<div class='keywd'>"
                  		+ "<span class='none'>실시간 급상승 키워드</span>"
                  		+ "<a class='ellipsis' href='/search/tags?name="+data[i-1].name+"'>"+data[i-1].name+"</a>"
                  		+ "</div>"
                  		+ "</div>"
                  		+ "</li>";
                        
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
   
   setInterval("RTtag()", 1000000);
   // 30초에 한번씩 받아온다.
});
   
</script>

<script>

var d = new Date();
$(".last_date").html(d.getFullYear()+"."+(d.getMonth()+1)+"."+d.getDate());
$(".last_time").html(d.getHours()+"시 "+d.getMinutes()+"분 기준");


var ii =1;
var chgname = document.getElementsByClassName("cntt_realtime");

window.setInterval(function(){
    
        if(ii == chgname.length+1) {   //다 보여주면 스탑
        	ii=1;
        }
        
    	$(".rank"+ii+"").toggleClass("on");
        
        (function(x){
            window.setTimeout(function(){
	               $(".rank"+x+"").toggleClass("on");
            },1500);
        })(ii);

        ii++;
        
    },1500);   


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