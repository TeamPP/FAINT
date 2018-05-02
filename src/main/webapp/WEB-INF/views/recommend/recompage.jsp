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
   

  
<title>Insert title here</title>
<!-- jquery 2.1.4. -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<style>

article {
	text-align: center;
	display: block;
}

.mid-line {
    border-top: 1px solid #9d9d9d;
    width: 935px;
    text-align: center;
    display: inline-block;
    font-size: 16px;
    font-weight: 200;
    height: 35px;
}



/* 추천계정 스타일 */
.recommContainerWrp{
 width: 100%;
 height: 100%;
 text-align:center;
}


 .recommContainer{
 width: 935px;
 max-width: 935px;
display: inline-block;
 /* height: 100%; */
 /* height: 250px; */
 /*  text-align:center; */
}

.recommendList{
padding-left:0;
overflow: hidden;
}

.recommendList li{
/* 	display: inline-block;
	display: block; */
/*  transition: transform 1s, left 1s ; */

 }

#chip {
 width: 23%;
 border: solid 1px #efefef;
 margin-left: 1%;
} 



#chip img {
border-radius: 50%;
}

.nickname {
	line-height: 28px;
    font-weight: 600;
} 

.name {
   line-height: 28px;
    font-weight: 600;
} 


/* 팔로우버튼 */
.isFlw{
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
margin-bottom: 10%;
} 


/*추천리스트 프사 */
 .recommPhoto{
width:80px;
height:80px;
margin: 5% auto;
} 


/*왼쪽 오른쪽 버튼  */
.prev{
margin-left:1%;
color: #999;
border: 0;
background-color: white;
}

.next{
color: #999;
border: 0;
background-color: white;
}
</style>
</head>

<body>

<input type="hidden"
	name="${_csrf.parameterName}"
	value="${_csrf.token}"/>


<!--친구추천  -->
<div class="recommContainerWrp">
<div class="recommContainer">
<ul class="recommendList">

<c:forEach items="${recommList}" var="userVO">   
<li id="chip" style="display:none;" >
<a href="/member/${userVO.nickname}">
			<c:choose>
				<c:when test="${userVO.profilephoto ne null && userVO.profilephoto != ''}">
					<img class="recommPhoto" src="http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122${userVO.profilephoto}" />
				</c:when>
				<c:otherwise>
					<img class="recommPhoto" src="/resources/img/emptyProfile.jpg" />
				</c:otherwise>
			</c:choose>
</a>
	<div>
  
  <c:choose>
  <c:when test="${userVO.name eq null}">
  <a  class="nickname" style="line-height: 55px;" href="/member/${userVO.nickname}">${userVO.nickname}</a>
  <p class="name">${userVO.name}</p>
  </c:when>
  <c:otherwise>
    <a  class="nickname" href="/member/${userVO.nickname}">${userVO.nickname}</a>
    <p class="name">${userVO.name}</p>
  </c:otherwise>
  </c:choose>
  <button class="isFlw" data-uid='${userVO.id}'>팔로우</button>
	</div>
</li>
</c:forEach>

</ul>
<div class="slideBtnContainer" style="display: block;">
  <button class="prev">prev</button>
  <button class="next" >next</button>
	</div>
	
</div>
</div>

<script>
$(document).ready(function(){
	follow();
	changeClass();
	 hideBtn();
})


/* =============================== */
/* 추천계정 슬라이드 처리 */
var startInd=$(".recommendList").children().eq(0).index(); // start부분의 인덱스 처음엔 0
var totalChild=$(".recommendList").children().length;  //총 추천계정의 수
var viewCnt=4; //보여주고 싶은 계정 수 

 function changeClass(){
	 console.log("totalChild:   "+totalChild);
	 console.log("totalChild:   "+totalChild);
	 console.log("totalChild:   "+totalChild);
	 console.log("totalChild:   "+totalChild);
	 console.log("totalChild:   "+totalChild);
	 console.log("totalChild:   "+totalChild);
	 console.log("totalChild:   "+totalChild);
	 console.log("totalChild:   "+totalChild);
	 console.log("totalChild:   "+totalChild);
	 console.log("totalChild:   "+totalChild);
	 console.log("totalChild:   "+totalChild);
	 console.log("totalChild:   "+totalChild);
	//클래스명 추가하기
	for(var i=0; i<viewCnt; i++){
		console.log("함수가 돌아가요 돌아돌아");
		$(".recommendList").children().eq(startInd+i).css("display","inline-block");
	}
	$(".recommendList").children().eq(startInd+viewCnt-1).nextAll().css("display","none");
	
	
} 


//추천계정 넘기기
function moveToSelected(element) {
	console.log("moveToSelected");
	if (element == "next") {
		console.log("->화살표누름!!!!")
		//->화살표누름
		if(startInd>=totalChild-4){ //4개만 보여주기
			 console.log("멈췄다 기능 멈췄다");
			//비었다
		} else {
		console.log("처음 startInd"+startInd);
		
		$(".recommendList").children().eq(startInd).css("display","none");
		
		startInd= startInd+1;
		console.log("변경된 스타트 인덱스:    "+startInd);
		$(".recommendList").children().eq(startInd+viewCnt-1).css("display","inline-block");
		
		}
		
		
	} else if (element == "prev") {
		console.log("<-화살표누름!!!!")
		console.log("totalChild-viewCnt:      "+totalChild-viewCnt);
		
		  if(startInd==0){  
			  console.log("멈췄다 기능 멈췄다");
			  //비었다
		  } else {
			console.log("처음 startInd:    " +startInd);
			$(".recommendList").children().eq(startInd+viewCnt-1).css("display","none");
			
		// <-- 화살표누름
		startInd= startInd-1;
		console.log("변경된 startInd" +startInd);		
		$(".recommendList").children().eq(startInd).css("display","inline-block");
		  }
		
	} 
} 

/* prev, next 버튼 클릭 사진이동  */
$('.prev').click(function() {
	console.log("왼쪽왼쪽왼쪽")
moveToSelected('prev');
});
$('.next').click(function() {
	console.log("왼쪽왼쪽왼쪽")
moveToSelected('next');
});


//totalChild가 viewCnt보다 작거나 같으면 prev, next 버튼 숨김
function hideBtn(){
 console.log("totalChild"+totalChild);
 console.log("viewCnt"+viewCnt);
 
 
 
	if(totalChild<=viewCnt){
		$(".prev").css("display","none");
		$(".next").css("display","none");
	}
	
}



</script> 




<!-- 인기 게시글 -->

</br>
</br>
</br>
</br>
</br>
</br>
<!-- 모달 적용한 것 -->
</br>


<article>
<div class="mid-line"></div>
</article>
<br/>


<script>
 var jsonList=${jsonList}; 

</script>

<!-- 메인피드 -->
<jsp:include page="/WEB-INF/views/include/postFeed.jsp" flush="false" />

</body>
</html>