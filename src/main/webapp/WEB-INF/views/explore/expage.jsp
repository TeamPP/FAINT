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
 <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>
<!-- 모달 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- expage.css -->
<link rel="stylesheet" href="/resources//css/expage.css"> 
  
<title>Insert title here</title>
<!-- jquery 2.1.4. -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<style>

.empty {
	height: 150px;
}

article {
	text-align: center;
	display: block;
}

.mid-line {
    width: 935px;
    text-align: center;
    display: inline-block;
    font-size: 16px;
    font-weight: 200;
    height: 35px;
}

.pull-right {
	float: left !important;
}
.intro {
	position: relative;
    left: 11%;
    top: 68px;
    color: #555;
    font-size: 13px;
}
</style>
</head>

<body>

<input type="hidden"
	name="${_csrf.parameterName}"
	value="${_csrf.token}"/>
<!-- 실시간 -->

<div class="realtime_keywd">
	<span class="intro">실시간 인기 검색어</span>
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

  	RTtag();
   function RTtag () {  
	   flag = false;
       $.ajax({
           type:"POST",
           url: "/explore/getTag",
           async: false,
           headers:{
              "Content-Type" : "application/json",
              "X-HTTP-Method-Override" : "POST"
           },
           beforeSend : function(xhr)
           {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
           },
           success : function (data) {
               
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
              
              console.log("갱신스탑");
           }/* error 끝 */
           
       }); /* ajax 끝 */
       
       flag = true;
       console.log(">>>"+flag);
   } /* RTtag끝  */

   
$(document).ready(function() {
	
	// 실시간 검색어  flag가 false일 때 ajax로 데이터 가져옴
	var flag = true;
	//console.log(">"+flag);
	
	//처음에 expage 들어간 시간 적용
 	 var d = new Date();
	 $(".last_date").html(d.getFullYear()+"."+(d.getMonth()+1)+"."+d.getDate());
	 if(d.getHours()>12) {
		 $(".last_time").html("오후 "+(d.getHours()-12)+"시 "+d.getMinutes()+"분 기준");
	   } else if(d.getHours()==12) {
  	  		$(".last_time").html("오후 "+(d.getHours())+"시 "+d.getMinutes()+"분 기준");
 	  	 } else {
		   $(".last_time").html("오전 "+d.getHours()+"시 "+d.getMinutes()+"분 기준");
		   	}
   
	var ii =1;
	var jj =1;
	
	// 인기 검색어 1위~10위 className
	var chgname = document.getElementsByClassName("cntt_realtime"); 

	if(flag) {
		setInterval(function(){
		    
	        if(ii == chgname.length+1) {
	        	ii=1;
	        	
	        	// 대략 5분 단위로 데이터 갱신
	        	if(jj==151){
	        		//console.log("갱신하잣");
	        		RTtag();
	        		
	     	   	   var d = new Date();
	    	   	   $(".last_date").html(d.getFullYear()+"."+(d.getMonth()+1)+"."+d.getDate());
	    	   	   if(d.getHours()>12) {
	    	   		   $(".last_time").html("오후 "+(d.getHours()-12)+"시 "+d.getMinutes()+"분 기준");
	    	   	  	 } else if(d.getHours()==12) {
	    	   	  		$(".last_time").html("오후 "+(d.getHours())+"시 "+d.getMinutes()+"분 기준");
	    	   	  	 } else {
	    	   			$(".last_time").html("오전 "+d.getHours()+"시 "+d.getMinutes()+"분 기준");
	    	   	 	  }
	        	jj=1;
	        		
	        	} /* jj if문 끝 */
	        	
	        } /* ii if문 끝 */
	        
	        	// 1위부터 10위까지 순차적으로 효과주기
		    	$(".rank"+ii+"").toggleClass("on");
		    	d = new Date();
		        
		    	// 효과 해제하기
		        (function(x){
		            window.setTimeout(function(){
			               $(".rank"+x+"").toggleClass("on");
		            },2100);
		        })(ii);

		        ii++;
		        jj++;
	        
	    },2200); // 2.2초마다 실행
		
	} else {
	   	   console.log("실시간 검색어 에러다 에러에러 삐뽀삐뽀");
	}
	
});
   
</script>

<!-- 인기 게시글 -->
<article>
<div class="mid-line"></div>
</article>

<script>
var jsonList=${jsonList};

</script>

<!-- 메인피드 -->
<jsp:include page="/WEB-INF/views/include/postFeed.jsp" flush="false" />

</body>
</html>