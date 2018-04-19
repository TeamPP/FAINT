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
   
<!--검색창 부트스트랩  -->  
<link rel="stylesheet" href="/resources/bootstrap/css/nav-style.css"> 

<!-- expage.css -->
<link rel="stylesheet" href="/resources//css/expage.css"> 
  
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
 .recommContainer{
 width: 100%;
 height: 250px;
  text-align:center;
}

.recommendList{
overflow: hidden;
}

.recommendList li{
/* transition: transform 1s, left 1s ;
 */
 }

#chip {
 width: 13%;
 border: solid 1px #efefef;
 margin-left: 1%;
} 

.hideLeft{
display: none;
}

 .prev{
	display: block;
	display: inline-block;
}

.prevLeftSecond{
display: block;
display: inline-block;
}

.selected{
	display: block;
	display: inline-block;
}

.next{
display: block;
display: inline-block;
}

.nextRightSecond{
display: block;
display: inline-block;
}

.hideRight{
display: none;
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

/*모두보기 버튼 */
.allRecomm{

}


.getShow{
display: block;
	display: inline-block;
}

.getHidden{
display: none;
}

</style>
</head>

<body>

<input type="hidden"
	name="${_csrf.parameterName}"
	value="${_csrf.token}"/>


<!--친구추천  -->
<div class="recommContainer">
<ul class="recommendList">

<c:forEach items="${recommList}" var="userVO">   
<li id="chip">
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
  <button class="isFlw" title='${userVO.id}'>팔로우</button>
	</div>
</li>
</c:forEach>


<c:forEach items="${recommList}" var="userVO">   
<li id="chip">
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
  <button class="isFlw" title='${userVO.id}'>팔로우</button>
	</div>
</li>
</c:forEach>


</ul>
</div>

<script>

var startInd=$(".recommendList").children().eq(0).index(); // start부분의 인덱스 처음엔 0
var totalChild=$(".recommendList").children().length;




/* 추천계정 */
 function changeClass(){
	 console.log("totalChild:   "+totalChild);
	
	
	//클래스명 추가하기
	$(".recommendList").children().eq(startInd).addClass("getShow");
	$(".recommendList").children().eq(startInd+1).addClass("getShow");
	$(".recommendList").children().eq(startInd+2).addClass("getShow");
	$(".recommendList").children().eq(startInd+3).addClass("getShow");
	$(".recommendList").children().eq(startInd+4).addClass("getShow");
	$(".recommendList").children().eq(startInd+4).nextAll().addClass("getHidden");
} 


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



//추천계정 넘기기
function moveToSelected(element) {
	console.log("moveToSelected");
	if (element == "next") {
		console.log("->화살표누름!!!!")
		//->화살표누름
		if(startInd>=totalChild-5){ //5개만 보여주기
			 console.log("멈췄다 기능 멈췄다");
			//비었다
		} else {
		console.log("처음 startInd"+startInd);
		$(".recommendList").children().eq(startInd).removeClass("getShow");
		$(".recommendList").children().eq(startInd).addClass("getHidden");
		startInd= startInd+1;
		console.log("변경된 스타트 인덱스:    "+startInd);
		$(".recommendList").children().eq(startInd+4).removeClass("getHidden");	
		$(".recommendList").children().eq(startInd+4).addClass("getShow");	
		}
		
		
	} else if (element == "prev") {
		console.log("<-화살표누름!!!!")
		console.log("totalChild-5:      "+totalChild-5);
		
		  if(startInd==0){  
			  
			  console.log("멈췄다 기능 멈췄다");
			  //비었다
		  } else {
			console.log("처음 startInd:    " +startInd);
		$(".recommendList").children().eq(startInd+4).removeClass("getShow");
		$(".recommendList").children().eq(startInd+4).addClass("getHidden");
		// <-- 화살표누름
		startInd= startInd-1;
		console.log("변경된 startInd" +startInd);		
		$(".recommendList").children().eq(startInd).removeClass("getHidden");
		$(".recommendList").children().eq(startInd).addClass("getShow");
			  
		  }
		
	} 
	
	

	

	/* prev, next 아이콘 클릭 사진이동  */
	$('#prev').click(function() {
	moveToSelected('prev');
	});
	$('#next').click(function() {
	moveToSelected('next');
	});
} 







 $(document).ready(function(){
	follow();
	changeClass();
})

//follow여부확인하여 팔로우/팔로우취소

function follow(){
	 var followFlg=false;
	 
	 $(".isFlw").on("click", function(){
		
		 var userid=$(this).attr("title");
		 var isFlw=this;
		 
		 if(followFlg){return;};
		 
		 followFlg=true;
		 if($(this).html()=="팔로우"){
			 var type="post";
			 var url="/member/follow/"+userid;
			 var header="{'X-HTTP-Method-Overrid' : 'POST'}";
			 $(isFlw).html("팔로잉"); 
		 } else if($(this).html()=="팔로잉"){
			 var type="delete";
			 var url="/member/unfollow/"+userid;
			 var header="{'X-HTTP-Method-Overrid' : 'DELETE'}";
			 $(isFlw).html("팔로우");
		 }
		 
		 $.ajax({
			type:type,
			url:url,
			headers:header,
			dataType:"text",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			
			success:function(result){
				if(result=="SUCCESS"){
					followFlg=false;
				};
			}
		 });
	 });
 };




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