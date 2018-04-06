<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--헤더-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAINT</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<style>
.post{
	padding-top:60px;
	max-width:600px;
	width:100%;
}
article{
	align-items: stretch;
	margin-bottom: 60px;
	border: 0 solid #000;
	border-radius: 3px;
    border: 1px solid #e6e6e6;
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
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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
    right:1.5%;
    top:0%;
    cursor: pointer;
    
    background: 0 0;
    border: 0;
    cursor: pointer;
    height: 36px;
    outline: 0;
    position: absolute;
    z-index: 2;
}
</style>

<body>

<ul id="categoryList">
	<li><a href="javascript:;" data-filter="all" tabindex="-1">ALL</a></li>
	<li><a href="javascript:;" data-filter="1" tabindex="-1">여행</a></li>
	<li><a href="javascript:;" data-filter="2" tabindex="-1">영화</a></li>
	<li><a href="javascript:;" data-filter="3" tabindex="-1">음악</a></li>
	<li><a href="javascript:;" data-filter="4" tabindex="-1">음식</a></li>
	<li><a href="javascript:;" data-filter="5" tabindex="-1">글귀</a></li>
</ul>

<section>

<c:forEach items="${list}" var="postDTO">
	<article class="post" data-filter="${postDTO.cateid}">
		<header class="_header">
			<div>
				<a class="_profileImageContainer" href="/member/${postDTO.usernickname}">
					<!-- 프로필 이미지 -->
					<c:choose>
						<c:when test="${postDTO.profilephoto ne null && postDTO.profilephoto != ''}">
							<img class="_postImage" src="/displayFile?fileName=${postDTO.profilephoto}" style="width:30px; height:30px;"/>
						</c:when>
						<c:otherwise>
							<img class="_postImage" src="/resources/img/emptyProfile.jpg" style="width:30px; height:30px;"/>
						</c:otherwise>
					</c:choose>
				</a>
			</div>
			<div class="_writerContainer">
				<div>
					<a class="_writerName" href="/member/${postDTO.usernickname}">
					${postDTO.usernickname}
					</a>
				</div>
				<div>
					<c:if test = "${postDTO.location ne null}">
						<a class="_postLocation" href="/search/locations?location=${postDTO.location}">${postDTO.location}</a>
					</c:if>
				</div>
			</div>
		</header>
		<div class="imageContainer" >
			<c:set var="urlList" value="${fn:split(postDTO.url, '[|]')}"/>
			<c:forEach var="i" begin="0" end="${fn:length(urlList)-1}" step="1">
				<c:choose>
					<c:when test="${i==0}">
						<img class="_postImage" src="/displayFile?fileName=${urlList[i]}" class="mainImg" style="width:370px; height:370px;" />
					</c:when>
					<c:otherwise>
						<img class="_postImage" src="/displayFile?fileName=${urlList[i]}" class="mainImg" style="width:370px; height:370px; display:none;" />
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div>
			<section title="${postDTO.postid}">
				<c:choose>
				    <c:when test="${postDTO.isLike eq '0'}">
				    	<button class="likeBtn">♡</button>
				    </c:when>
				    <c:otherwise>
						<button class="likeBtn">♥</button>
				    </c:otherwise>
			    </c:choose>
				<button class="replyBtn" onclick="replyCursor(this)">댓글달기</button>
				<c:choose>
				    <c:when test="${postDTO.isStore eq '0'}">
				    	<button class="storeBtn">□</button>
				    </c:when>
				    <c:otherwise>
						<button class="storeBtn">■</button>
				    </c:otherwise>
			    </c:choose>
			</section>
			
			<section>
				<a href="javascript:;" class="likeContainer" title="${postDTO.postid}">좋아요 <span>0</span>개</a>
			</section>
			
			<div class="captionContainer">
				<ul class="_captionContainer" id="post${postDTO.postid}" >
					<li><a href="/member/${postDTO.usernickname}">${postDTO.usernickname}</a>	<span>${postDTO.caption}</span></li>
					<li class="moreReply"><a href="javascript:;">댓글더보기</a></li>
					<div class="replyContainer" title="${postDTO.postid}" data-limit=0>
					</div>
					<time datetime=""+${postDTO.regdate}>${postDTO.regdate}</time>
				</ul>
			</div>
		</div>
	</article>
</c:forEach>

</section>


<script id="modalLike" type="text/x-handlebars-template">
<div id="myModal" class="likeModal">
	<span class="close">&times;</span>
	<div class="likeModal-content">
		<ul id="likersContainer">
		</ul>
	</div>
</div>
</script>

<script>
//postid 가져와서 댓글달기
$(document).ready(function(){
	reply();
	searchFilter();
})
//각 게시물에 댓글리스트 등록 처음 4개 이후 +20개씩('댓글 더보기' 기능이 수행)
function reply(){
	$(".replyContainer").each(function(){
		var moreReply=$(this).children("#moreReply");
		var pid=$(this).attr("title"); //게시물 id값 title에 넣어서 이동
		var limit = $(this).data("limit"); //댓글 출력제한자
		var replyContainer = this;
		
		$.getJSON("/reply/post/" + pid, function(rpldata){
			//게시물의 댓글 등록창
			var replyRegist=
				"<div class='_replyRegister' title="+pid+">"
				+"<input type='textarea' onkeypress='registReply(this, event);' class='replyRegist' placeholder='댓글입력'/>"
				+"</div>";
			$(replyContainer).html(replyRegist);
			
			//전체 댓글 수가 4개 이하 or 제한자*20+4개면 댓글더보기 삭제
		 	if(rpldata.length<=4+5*limit){ //20개씩 더 출력
		 		$(replyContainer).siblings(".moreReply").remove();
			}else if($(replyContainer).siblings(".moreReply")[0]==undefined){
				$(replyContainer).before("<li class='moreReply' data-limit='0'><a href='javascript:;'>댓글더보기</a></li>");
			}
			
			// 게시물에 대한 댓글리스트 + 삭제버튼(해당 유저의 게시글일 경우만)
			var replystr="";
			$(rpldata).each(function(index){
				
				//댓글 최신 4개까지만 우선 출력 및 제한자에 따른 댓글 출력
				if( $(rpldata).length-(4+5*limit) <= index && index < $(rpldata).length ){ //20개씩 더 출력
					replystr +="<li title='"+this.id+"'>"+
						"<a href='/member/"+this.username+"'>" + this.username +"</a>	<span>"+this.comment+"</span>";
					
					if(this.userid==${login.id}){
						replystr+="<button class='replyDelete' onclick='deleteReply(this);' ><strong>Ｘ</strong></button></li>";
					}else{
						replystr+="</li>";
					};
					
					$(replyContainer).html(replystr+replyRegist);
				}
			});
			
			//댓글더보기 클릭시 제한자 +1 및 댓글 목록 재출력
			$(replyContainer).siblings(".moreReply").children().on("click", function(){
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
	//enter친 순간 앞뒤 공백 제거된 value값의 길이확인 
	if(enter==13 && comment.trim().length>0){
		var userid=${login.id};
		var postid=$(thisTag).parent().attr("title");
		$.ajax({
			type:"post",
			url:"/reply",
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
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
				};
			}
		});
	}
}
//댓글 삭제함수 = 댓글 삭제버튼에서 사용(태그객체 받음)
function deleteReply(thisTag){
	var rid=$(thisTag).parent().attr("title");
	$.ajax({
		type:"delete",
		url:"/reply/"+rid,
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "DELETE"
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
//게시물 저장 + 저장 취소
store();
function store(){
	$(".storeBtn").on("click", function(){
		var postid=$(this).parent().attr("title");
		var storeBtn=this;
		if($(this).html()=="□"){
			var type="post";
			var url ="/post/"+postid+"/store";
			var headers="{'X-HTTP-Method-Override' : 'POST'}";
			var val="■";
			
		}else if($(this).html()=="■"){
			var type="delete";
			var url ="/post/"+postid+"/takeaway";
			var headers="{'X-HTTP-Method-Override' : 'DELETE'}";
			var val="□";
		}
		$.ajax({
			type: type,
			url: url,
			headers: headers,
			dataType:"text",
			success:function(result){
				if(result=="SUCCESS"){
					$(storeBtn).html(val);
				};
			}
		});
	});
};
//게시물 좋아요 + 좋아요 취소
like();
function like(){
	$(".likeBtn").on("click", function(){
		var postid=$(this).parent().attr("title");
		var likeBtn=this;
		if($(this).html()=="♡"){
			var type="post";
			var url ="/post/"+postid+"/like";
			var headers="{'X-HTTP-Method-Override' : 'POST'}";
			var val="♥";
			
		}else if($(this).html()=="♥"){
			var type="delete";
			var url ="/post/"+postid+"/unlike";
			var headers="{'X-HTTP-Method-Override' : 'DELETE'}";
			var val="♡";
		}
		$.ajax({
			type: type,
			url: url,
			headers: headers,
			dataType:"text",
			success:function(result){
				if(result=="SUCCESS"){
					$(likeBtn).html(val);
					
					likerList();
				};
			}		
		});
	});
};
//좋아요 count+likerlist
likerList();
function likerList(){
	$(".likeContainer").each(function(){
		var pid=$(this).attr("title");
		var likeContainer = this;
		$.getJSON("/post/" + pid + "/likerlist", function(data){
			var likerList="";
			$(data).each(function(){
				if(this.isFollow>0){
					likerList+="<li><a href='/member/"+this.nickname+"'>" + this.nickname + "</a><button class='isFlw' title='"+this.id+"'>팔로잉</button></li>";
				}else if(this.isFollow==0 && this.id!=${login.id}){
					likerList+="<li><a href='/member/"+this.nickname+"'>" + this.nickname + "</a><button class='isFlw' title='"+this.id+"'>팔로우</button></li>";
				}else{
					likerList+="<li><a href='/member/"+this.nickname+"'>" + this.nickname + "</a></li>";
				}
			})
			
			if($(data).length>0){
				$(likeContainer).children("span").html($(data).length);
				$(likeContainer).on("click", function(){
					
					var source=$("#modalLike").html();
					var likers=Handlebars.compile(source);
					var likersModal=likers(data);
					$("body").append(likersModal);
					$("#likersContainer").html(likerList);
					
					//팔로우 + 언팔로우
					follow();
					
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
					
				});
			}else if($(data).length==0){
				$(likeContainer).children("span").html(0);
			}
		}); 
	});
};
//follow여부확인하여 팔로우/팔로우취소
function follow(){
	$(".isFlw").on("click", function(){
		var userid=$(this).attr("title");
		var isFlw=this;
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
			headers:{header},
			dataType:"text",
			success:function(result){
				if(result=="SUCCESS"){
					console.log("팔로우/언팔 성공")
				};
			}		
		});
	});
};
//댓글내용 및 글내용 검색처리

//searchFilter - 포스트 내용, 프로필 intro, 댓글 해쉬태그 및 인물태그 링크처리
function searchFilter(){
   $(".intro, .captionContainer").find("span").each(function(){
      
      //1. 텍스트 가져오기 & 처리한 새로운 문자
      var text = $(this).text();
      
      //2. split() 함수처리하기
      text = split(text);
      
      //3. 공백으로 나누기
      var splitArray = text.split(" ");
      
      //4. 특수문자 
      var special = "!$%^&*()-=+<>?_";
      
      //5. 링크처리
      for(var i in splitArray){
         var word = splitArray[i];
         
         //두글자 이상이면서, 첫글자가 #이면서 , 두번째글자가 특수문자가 아니면 링크처리
         if(splitArray[i].length!=1 && (word.indexOf("#")==0 && special.indexOf(splitArray[i].charAt(1))==-1)){
            var hash=word.substring(word.lastIndexOf("#")+1);
            splitArray[i] = "<a href='/search/tags?name="+hash+"'>"+splitArray[i]+"</a>";
         
         
         //두글자 이상이면서, 첫글자가 @이면서 , 두번째글자가 특수문자가 아니면 링크처리
         } else if(splitArray[i].length!=1 && (word.indexOf("@")==0 && special.indexOf(splitArray[i].charAt(1))==-1)){
            var person=word.substring(word.lastIndexOf("@")+1);
            splitArray[i] = "<a href='/member/"+person+"'>"+splitArray[i]+"</a>";
         }
      }
      
      //6. 한문장으로 합치기
      var splitMerge = splitArray.join(" ");
      
      $(this).html(splitMerge);
   });
}

//searchFilter메서드의 보조 사용 함수
function split(text){
    
    //1. 공백기준으로 나누기
    var splitArray = text.split(" ");
    
    //2. 처리될 특수문자 
    var special="!$%^&*()-=+<>?_";
    
    //3. 두글자 이상이면서, 2번째 글자가 특수문자가 아님
    // '#'->' #' : #과 @앞에 공백넣기
    for(var i in splitArray){
       if(splitArray[i].length!=1 && special.indexOf(splitArray[i].charAt(1))==-1){
           splitArray[i]=splitArray[i].replace(/#/g, " #"); 
           splitArray[i]=splitArray[i].replace(/@/g, " @"); 
       } //if end
    } // for end
    
    //4. 배열의 각 요소를 한문장으로 합치기
    var splitMerge = splitArray.join(" ");
    return splitMerge;
}

//css - 사진클릭시 이동
$(".imageContainer").children().on("click", function(event){
	if($(this).parent().children(":first")==$(this).parent().children(":last")){
		return;
	}else if($(this)[0]==$(this).parent().children(":last")[0]){
		console.log(1);
		$(this).css("display", "none");
		$(this).parent().children(":first").css("display", "");
	}else{
		$(this).css("display", "none");
		$(this).next().css("display", "");
	}
})
//css - 카테고리별 게시물 필터링
$("#categoryList li a").click(function(){
	var customType=$(this).data("filter");
	$(".post").hide().filter(function(){
		return $(this).data("filter") === customType || customType==="all";
		}).show();
})
	
//css - 댓글달기 버튼 클릭시 커서 포커스
function replyCursor(thisBtn){
	var postid=$(thisBtn).parent().attr("title");
	$("._replyRegister[title="+postid+"]").children("input").focus();
}

</script>

</body>
</html>