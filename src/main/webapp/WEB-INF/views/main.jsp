<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
               <li><a href="/member/${postDTO.usernickname}">${postDTO.usernickname}</a>   <span>${postDTO.caption}</span></li>
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
                  "<a href='/member/"+this.username+"'>" + this.username +"</a>   <span>"+this.comment+"</span>";
               
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
</html> --%>

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

<!-- 슬라이드 넘기기 버튼 부트스트랩  -->
 <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">


</head>
<style>
article {
   align-items: stretch;
   margin-bottom: 60px;
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
/* .cateSection ul {
   height: 150px;
   position: absolute;
   top: -30px;
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
   top: 70px; 
   left: 0px;
}
#categoryList {
   list-style: none; 
}
li.cate {
   list-style: none; 
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
   border-radius: 150px;
   border: 2px solid black;
}
li.cate * {
   
   -webkit-transition: all 0.45s ease-in-out;
   transition: all 0.45s ease-in-out;
}
li.cate img {
   height: 100%;
   width: 100%;
   position: relative;
   opacity: 1; 
   border-radius: 150px;
}
/* li.cate .caption {
   overflow: hidden;
   -webkit-transform: translateY(20%); 
   /* "일상" Y위치 */
   /* transform: translateY(20%);
   transform: translateX(2%);
   -webkit-transform: translateX(2%);  */
   /* "일상" X위치 */
/*    position: absolute;
   width: 100%;
   bottom: 0;
}  */
/* li.cate p {
   display: table;
   margin: 0 auto;
   padding: 0 10px;
   position: relative;
   text-align: center;
   width: auto;
   text-transform: uppercase;
   font-weight: 400;
} */
/* "일상" 글자크기 & 글자 하얀테두리 감싸기 */
/* li.cate p {
   font-size: 0.8em;
   font-weight: 500;
   color: black;
   
   text-shadow: -1px 0 #F2F1F6, 0 1px #F2F1F6, 1px 0 #F2F1F6, 0 -1px
      #F2F1F6;
   -moz-text-shadow: -1px 0 #F2F1F6, 0 1px #F2F1F6, 1px 0 #F2F1F6, 0 -1px
      #F2F1F6;
   -webkit-text-shadow: -1px 0 #F2F1F6, 0 1px #F2F1F6, 1px 0 #F2F1F6, 0
      -1px #F2F1F6;
} */
/* a링크가 전체 이미지 크기만큼 */
/* li.cate a {
   left: 0;
   right: 0;
   top: 0;
   bottom: 0;
   position: absolute;
   z-index: 1;
} */
/*이미지 변경 스타일 */
/* li.cate:hover img, li.cate.hover img {
   opacity: 0.35;
   -webkit-transform: scale(1.15);
   transform: scale(1.15);
} */
/* .gray {
   -webkit-filter: grayscale(100%);
   filter: gray;
}
 */
/* 프로필 사진 및 닉네임 */
/*         ._header{
            padding: 10px;
            border: 1px solid #efefef;
        } */
/*프사 */
/*       ._postImage{
      width:30px;
       height:30px;
        border-radius: 150px;
      }
    */
/*포스트 사진 밑 부분( 좋아요 caption내용) */
/*    ._footer{
         padding: 10px;
            border: 1px solid #efefef;
      }  */
/* 화살표 아이콘 */
/*
.arrow {
      padding:5px;
    border: solid black;
    border-width: 0 2px 2px 0; /*아이콘 밑 화살표모양으로 만들기 */
/*    position: absolute;
   left: 4px;
   bottom: 30px;
   transform: rotate(45deg);
   -webkit-transform: rotate(45deg);
}  */ 
/* 회전목마 슬라이드 */
main {
   position: relative;
   width: 100%;
   height: 100%;
   margin: 25% auto;
   padding: 0;
}
/*id는 스타일 최우선으로 적용됨 그 다음에 class */
#carousel {
   position: relative;
   height: 500px;
   top: 50%;
   transform: translateY(-50%);
   overflow: hidden;
}
#carousel div {
   height: 500px;
   width: 500px;
   position: absolute;
   /*  transition 변경되는 부분 width 1s만 쓰면 어색함 왜냐하면 width랑 height랑 2가지 요소가 바뀜 */
   transition: transform 1s, left 1s, opacity 1s, z-index 0s, width 1s, height 1s;
   opacity: 1;
}
#carousel div img {
   height: 100%;
   width: 100%;
   object-fit: cover;
}
#carousel .hideLeft {
   height: 300px;
   width: 300px;
   left: 0%; /* 왼쪽 0으로 빠지는 애니메이션 효과 */
   opacity: 0; /*투명도 0으로 숨김처리 */
   transform: translateY(50%) translateX(-50%); /*부모기준으로 위치지정 */
}
#carousel .hideLeft img {
   height: 100%;
   width: 100%;
   object-fit: cover;
}
#carousel .hideRight {
   height: 300px;
   width: 300px;
   left: 100%;
   opacity: 0;
   transform: translateY(50%) translateX(-50%);
}
#carousel .hideRight img {
   height: 100%;
   width: 100%;
   object-fit: cover;
}
#carousel .prev {
   height: 400px;
   width: 400px;
   z-index: 5;
   left: 30%;
   transform: translateY(50px) translateX(-50%);
}
#carousel .prev img {
   height: 100%;
   width: 100%;
   object-fit: cover;
}
#carousel .prevLeftSecond {
   height: 300px;
   width: 300px;
   z-index: 4;
   left: 15%;
   transform: translateY(33%) translateX(-50%);
   opacity: .7;
}
#carousel .prevLeftSecond img {
   height: 100%;
   width: 100%;
   object-fit: cover;
}
/*가운데 이미지 */
#carousel .selected {
   height: 500px;
   width: 500px;
   z-index: 10;
   left: 50%;
   transform: translateY(0px) translateX(-50%);
}
#carousel .selected img {
   height: 100%;
   width: 100%;
   object-fit: cover;
}
#carousel .next {
   height: 400px;
   width: 400px;
   z-index: 5;
   left: 70%;
   transform: translateY(50px) translateX(-50%);
}
#carousel .next img {
   height: 100%;
   width: 100%;
   object-fit: cover;
}
#carousel .nextRightSecond {
   height: 300px;
   width: 300px;
   z-index: 4;
   left: 85%;
   transform: translateY(33%) translateX(-50%);
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
</style>

<body>
<!-- 카테고리 버튼 -->
<!-- <section class="cateSection">
<ul id="categoryList">
    ALL 여행 영화 음악 음식 글귀
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
         화살표 아이콘 
         <i class="mega-octicon octicon-chevron-down" id=""></i>
         <i class="arrow"></i>
</ul>
</section> -->




   <main>
   <div id="carousel">
      <c:forEach items="${list}" var="postDTO">
         <div class="post" data-filter="${postDTO.cateid}">
            <c:set var="urlList" value="${fn:split(postDTO.url, '[|]')}" />
            <c:forEach var="i" begin="0" end="${fn:length(urlList)-1}" step="1">
               <c:choose>
                  <c:when test="${i==0}">
                     <img  src="/displayFile?fileName=${urlList[i]}"
                        title="${postDTO.postid}" />
                  </c:when>
                  <c:otherwise>
                     <img  src="/displayFile?fileName=${urlList[i]}"
                        style="display: none;" title="${postDTO.postid}" />
                  </c:otherwise>
               </c:choose>
            </c:forEach>
         </div>
      </c:forEach>
   </div>
   <!--버튼  -->
       <div class="buttons">
       <i  id="prev" class="fa fa-arrow-left"></i>
       <i  id="next" class="fa fa-arrow-right"></i>
       </div>
   </main> 


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
   
   //이미지 class명부여
   changeClass();
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
                  "<a href='/member/"+this.username+"'>" + this.username +"</a>   <span>"+this.comment+"</span>";
               
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
// 일단 막음
//css - 사진클릭시 이동
/* $(".imageContainer").children().on("click"