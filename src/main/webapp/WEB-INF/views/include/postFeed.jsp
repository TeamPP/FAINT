<<<<<<< Upstream, based on branch 'mh.park' of https://github.com/TeamPP/FAINT.git
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<header>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</header>
<style>
.postModal {
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
.postModal-content {
    background-color: #fefefe;
    margin: auto;
    border: 1px solid #888;
    width: 940px;
    height: 600px;
}

.postContainerWrp{
   text-align : center;
   margin-top: 35px;
}


.postContainer{
    width : 879px;
   display: inline-block;
}
.postLiner{
   display:flex !important; 
   width:100%;
   max-width:879px;
   max-height:293px;
   display: inline-block;
}
.imageContainer{
   height:100%;
   width:33%;
   max-width: 293px;
   max-height: 293px;
   padding: 3px 3px 3px 3px;
}
.imageContainer > img{
   overflow:hidden;
}
._header > div{
   display: inline-block;
}
._sideSeparator{
   display: inline-block;
   vertical-align: middle;
}
._sideSeparator:eq(0){
   max-height:100%
}
._sideSeparator:eq(2){
   overflow:auto;
}
</style>

<body>

<script id="modalPost" type="text/x-handlebars-template">
<div id="myModal" class="postModal">
   <span class="close">&times;</span>
   <div class="postModal-content">
      
      <!--사진 및 동영상 -->    
      <section class="section1">
         <!-- 화살표 (사진변경) -->
         <input class="leftBtn" type="button">
         <input class="rightBtn" type="button">
            <img class="popImageContainer">
        </section>

      <section class="section2">
         <div class="s2_1">
            <div class="s2_1_1">
               <a href="/member/{{usernickname}}">
                  <img class="s2_1_1_1" src="/displayFile?fileName={{profilephoto}}">   <!-- 프사 -->
               </a>
               <span class="s2_1_1_2">
                  <a href="/member/{{usernickname}}">
                     <p class="nickname">{{usernickname}}</p>  <!-- 닉네임 -->
                  </a>
                  <a class="_postLocation" href="/search/locations?location={{location}}">
                     <p class="location">{{location}}</p> <!-- 위치 -->
                  </a>
               </span>
            </div>
         </div>

            <hr/>
            
         <div class="s2_2">
            <div class="s2_2_1" id="post{{postid}}">
               <a href="/member/{{usernickname}}"><span class="nickname">{{usernickname}}</span></a>  <!-- 닉네임 -->
               <span class="caption">{{caption}}</span>
               <div class="replyContainer" title="{{postid}}" data-limit=0>
               </div>
               <time datetime=""+{{regdate}}>{{regdate}}</time>
            </div> 
         </div>

            <hr/>
 
         <div class="s2_3">
            <div class="s2_3_1">
               <div class="btnContainer" title="{{postid}}">
                  <button class="replyBtn" onclick="replyCursor(this)">댓글달기</button>
               </div>
               <a class="likeContainer" title="{{postid}}">좋아요 <span>0</span>개(링크미구현)</a>
            </div>
         </div>

            <hr/>

         <div class="s2_4">
            <div class="s2_4_1" title="{{postid}}">
               <!-- 댓글달기 -->
               <input class="replyRegist" onkeypress="registReply(this, event);" type="textarea" placeholder="댓글 달기..." name="replyCaption">
            </div>
         </div>
        </section>
   </div>
</div>
<style>
hr{margin: 0;}
.section1{width: 600px; height: 600px; display: inline-block; float: left; position: relative; }
.leftBtn{ height: 25px; width: 25px; border-radius: 150px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-position: -324px -40px; border: none; margin: 8px 8px 8px 0; left:0; margin-top: 50%; position: absolute; }
.rightBtn{ height: 25px; width: 25px; border-radius: 150px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-position: -324px -72px; border: none; margin: 8px 8px 8px 0; right:0; margin-top: 50%; position: absolute; }    
.popImageContainer{ width: 100%; max-height: 600px; }
.section2{ width: 335px; height: 600px; display: inline-block; }
.s2_1{ width: 335px; height: 78px; }
.s2_1_1{ padding: 10px; }
.s2_1_1_1{ width: 50px; height: 50px; display: inline-block; float: left; border-radius: 150px;}
.s2_1_1_2{ width: 235px; height: 50px; margin-left: 10px; display: inline-block; }
.nickname{ font-weight: bold; }
.s2_2{ width: 335px; height: 372px; }
.s2_2_1{ width: 315px; height: 352px; overflow-y:scroll; padding: 10px; }
.replyContainer{ margin-top: 20px; bottom: 0; }
.reply{ margin-bottom: 4px; }
.s2_3{ width: 335px; height: 88px; }
.s2_3_1{ padding: 10px; }
.likeBtn{ height: 24px; width: 24px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); border: none; background-color: #fff; margin: 8px 8px 8px 0; font-size: 0;}
.replyBtn{ height: 24px; width: 24px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-position: -306px -289px; background-color: #fff; margin: 8px; margin-left: 4px; border: none; font-size: 0;}
.storeBtn{ height: 24px; width: 24px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-color: #fff; margin: 8px; margin-left: 4px; border: none; float: right; font-size: 0;}   
.s2_4{ width: 335px; height: 56px; }
.s2_4_1{ padding: 10px; }
.replyRegist{ font-size: 15px; border: none; width: 261px; height: 23px; }
</style>
</script>

<script>
console.log(jsonList);
$(document).ready(function(){
   getPostList();
   function getPostList(){
      
      //포스트 피드
      //$("body").append("<div class='postContainer' style='width:100%; height:auto;'></div>");
      
      $("body").append("<div class='postContainerWrp' style='width:100%; height:100%;'></div>");
      $(".postContainerWrp").append("<div class='postContainer'></div>");
      //데이터 담을 변수
      var data="";
      //태그 or 지역 검색 일때
      var elseList=jsonList;
      
      //태그 or 지역검색이 아니고 user정보를 가져올때(user프로필 페이지)
      if(elseList=="profile"){
         
         $.ajax({
            url:"/post/" + uid,
            datatype:"json",
            async:false,
            success:function(userdata){
               data=$(userdata);
            }
         })
         
         console.log(data);
         //게시물이 없을 때
         if($(data).length==0 && uid!=${login.id}){
            $(".postContainer").html("<div>아직 등록된 게시글이 없어요 ㅠㅠ</div>");
            return;
         }else if($(data).length==0 && uid==${login.id}){
            $(".postContainer").html("<div>소중한 순간들을 포착하여 공유해보세요</div>");
            return;
         }
      }else if(elseList.length==0 && typeof(uid)=="number"){
         $(".postContainer").html("<div>아직 저장된 게시글이 없어요 ㅠㅠ</div>");
      }else{
         try{
            data = elseList;
            console.log(data);
            throw new SyntaxError();
         }catch(e){
            console.log(e);
         }
      }
      
      $("#keywordTitle").after("<h5>게시물 "+data.length+" 개</h5>")
      
      //게시물이 있을 때
      if(data.length%3==0){
         for (i = 0; i < data.length/3; i++) {
            $(".postContainer").append("<div class='postLiner' style='display:inline-block;'>")
         }
      }else{
         for (i = 0; i < parseInt(data.length/3)+1; i++) {
            $(".postContainer").append("<div class='postLiner' style='display:inline-block;'>")
         }
      }
      
      for (i = 0; i < $(".postLiner").length; i++) {
         for (j = 0; j < 3; j++) {
            $(".postLiner:eq("+i+")").append("<div class='imageContainer' style='height:100%; width:100% ;'>")
         }
      }
      $(data).each(function(index){
         var url=this.url.split('|');
         var img = "<img class='postImage' title='"+this.id+"' style='height:100%; width:100%;' src='/displayFile?fileName="+url[0]+"' />";
         var str = "<div><span>좋아요:"+this.likeCount+" / 댓글:"+this.replyCount+"</span></div>";
         $(".imageContainer:eq("+index+")").append(img);
         
         $(".imageContainer:eq("+index+")").on("click", function(){
            var pid=$(this).children("img").attr("title");
            $.ajax({
               type:"post",
               url:"/post/detail",
               headers:{
                  "X-HTTP-Method-Override" : "POST"
               },
               data:{postid:pid},
               datatype:"json",
               success:function(data){
                  if(data!=null){
                     //이미지 배열화
                     data.urlList=data.url.split('|');
                     //handlebar추가
                     var source=$("#modalPost").html();
                     var post=Handlebars.compile(source);
                     var postmodal=post(data);
                     $("body").append(postmodal);
                     //이미지 잘라서 삽입
                     for (var i in data.urlList) {
                        //$(".popImageContainer").append("<img class='popPostImage' src='/displayFile?fileName="+data.urlList[i]+"' style='display:none;' />")
                        $(".popImageContainer").attr("src", "/displayFile?fileName="+data.urlList[i])
                        if(i!=0){
                           $(".popImageContainer").css("display", "none");   
                        }
                     }
                     
                     //좋아요버튼 삽입
                     if(data.isLike=='0'){
                        $(".btnContainer").prepend("<span><button class='likeBtn' style='background-position: -26px -349px;'>♡</button></span>")
                     }else{
                        $(".btnContainer").prepend("<span><button class='likeBtn' style='background-position: 0 -349px;'>♥</button></span>")
                     }
                     
                     //저장하기 버튼 삽입
                     if(data.isStore=='0'){
                        $(".btnContainer").append("<span><button class='storeBtn' style='background-position: -78px -349px;'>□</button></span>")
                     }else{
                        $(".btnContainer").append("<span><button class='storeBtn' style='background-position: -182px -349px;'>■</button></span>")
                     }
                     
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
                     
                     reply();
                     like();
                     likerList();
                     store();
                     searchFilter();
                  }
               }
            })
         })
      })
   };
})
//각 게시물에 댓글리스트 등록 처음 4개 이후 +20개씩('댓글 더보기' 기능이 수행)
function reply(){
   $(".replyContainer").each(function(){
      var pid=$(this).attr("title"); //게시물 id값 title에 넣어서 이동
      var limit = $(this).data("limit"); //댓글 출력제한자
      var replyContainer = this;
      
      $.getJSON("/reply/post/" + pid, function(rpldata){
         if(rpldata.length==0){
            $(replyContainer).html("");
         }
         
         // 게시물에 대한 댓글리스트 + 삭제버튼(해당 유저의 게시글일 경우만)
         var replystr="";
         $(rpldata).each(function(index){
            //댓글 최신 4개까지만 우선 출력 및 제한자에 따른 댓글 출력
            if( $(rpldata).length-(4+15*limit) <= index && index < $(rpldata).length ){ //20개씩 더 출력
               replystr +="<div class='reply' title='"+this.id+"'>"+
                  "<a href='/member/"+this.username+"'><span class='nickname'>" + this.username +"</span></a>"+this.comment;
               
               if(this.userid==${login.id}){
                  replystr+="<a class='replyDelete' onclick='javascript:deleteReply(this);' ><strong>Ｘ</strong></a></li>";
               }else{
                  replystr+="</div>";
               };
               
               $(replyContainer).html(replystr);
            }
         });
         
         //전체 댓글 수가 4개 이하 or 제한자*20+4개면 댓글더보기 삭제
          if(rpldata.length<=4+15*limit){ //20개씩 더 출력
             $(replyContainer).children(".moreReply").remove();
         }else if($(replyContainer).siblings(".moreReply")[0]==undefined){
            $(replyContainer).prepend("<div class='moreReply'><a href='javascript:;'>댓글더보기</a></div>");
         }
         
         //댓글더보기 클릭시 제한자 +1 및 댓글 목록 재출력
         $(replyContainer).children(".moreReply").on("click", function(){
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
   if(enter==13&&comment.trim().length>0){
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
               $(thisTag).val("");
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
//게시물 저장하기 + 저장하기 취소 
function store(){
   $(".storeBtn").on("click", function(){
      var postid=$(this).parents(".btnContainer").attr("title");
      var storeBtn=this;
      if($(this).css("background-position")=="-78px -349px"){
         var type="post";
         var url ="/post/"+postid+"/store";
         var headers="{'X-HTTP-Method-Override' : 'POST'}";
         var val="-182px -349px";
         
      }else if($(this).css("background-position")=="-182px -349px"){
         var type="delete";
         var url ="/post/"+postid+"/takeaway";
         var headers="{'X-HTTP-Method-Override' : 'DELETE'}";
         var val="-78px -349px";
      }
      $.ajax({
         type: type,
         url: url,
         headers: headers,
         dataType:"text",
         success:function(result){
            if(result=="SUCCESS"){
               $(storeBtn).css("background-position", val);
            };
         }
      });
   });
};
//게시물 좋아요 + 좋아요 취소
function like(){
   $(".likeBtn").on("click", function(){
      var postid=$(this).parents(".btnContainer").attr("title");
      var likeBtn=this;
      
      if($(this).css("background-position")=="-26px -349px"){
         var type="post";
         var url ="/post/"+postid+"/like";
         var headers="{'X-HTTP-Method-Override' : 'POST'}";
         var val="0px -349px";
         
      }else if($(this).css("background-position")=="0px -349px"){
         var type="delete";
         var url ="/post/"+postid+"/unlike";
         var headers="{'X-HTTP-Method-Override' : 'DELETE'}";
         var val="-26px -349px";
      }
      $.ajax({
         type: type,
         url: url,
         headers: {headers},
         dataType:"text",
         success:function(result){
            if(result=="SUCCESS"){
               $(likeBtn).css("background-position", val);
               likerList();
            };
         }      
      });
   });
};
//좋아요 count+list
function likerList(){
   $(".likeContainer").each(function(){
      var pid=$(this).attr("title");
      var likeContainer = this;
      $.getJSON("/post/" + pid + "/likerlist", function(data){
         var likerList="";
         var data=$(data)
         if(data.length>0){
            $(likeContainer).children("span").html(data.length);
            $(likeContainer).on("click", function(){
               ///list append 추가예정
            });
         }else if(data.length==0){
            $(likeContainer).children("span").html(0);
         }
      }); 
   });
};
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
 var slideIndex = 1;
/* showDivs(slideIndex); */
function plusDivs(n) {
    showDivs(slideIndex += n);
}
function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("popPostImage");
    if (n > x.length) {slideIndex = 1} 
    if (n < 1) {slideIndex = x.length} ;
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none"; 
    }
     x[slideIndex-1].style.display = "block";
}
/* function changePic(){
   $(".popImageContainer").children().on("click", function(event){
      if($(this).parent().children(":first")==$(this).parent().children(":last")){
         return;
      }else if($(this)[0]==$(this).parent().children(":last")[0]){
         $(this).css("display", "none");
         $(this).parent().children(":first").css("display", "");
      }else{
         $(this).css("display", "none");
         $(this).next().css("display", "");
      }
   })
} */
//css - 카테고리별 게시물 필터링
$("#categoryList li a").click(function(){
   var customType=$(this).data("filter");
   $(".post").hide().filter(function(){
      return $(this).data("filter") === customType || customType==="all";
      }).show();
})
//css - 댓글달기 버튼 클릭시 커서 포커스
function replyCursor(thisBtn){
   var postid=$(this).parents(".btnContainer").attr("title");
   $(".s2_4_1[title="+postid+"]").children("input").focus();
}
</script>

</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<header>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</header>
<style>
.postModal {
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
.postModal-content {
    background-color: #fefefe;
    margin: auto;
    border: 1px solid #888;
    width: 940px;
    height: 600px;
}

.postContainerWrp{
   text-align : center;
   margin-top: 35px;
}


.postContainer{
    width : 879px;
   display: inline-block;
}
.postLiner{
   display:flex !important; 
   width:100%;
   max-width:879px;
   max-height:293px;
   display: inline-block;
}
.imageContainer{
   height:100%;
   width:33%;
   max-width: 293px;
   max-height: 293px;
   padding: 3px 3px 3px 3px;
}
.imageContainer > img{
   overflow:hidden;
}
._header > div{
   display: inline-block;
}
._sideSeparator{
   display: inline-block;
   vertical-align: middle;
}
._sideSeparator:eq(0){
   max-height:100%
}
._sideSeparator:eq(2){
   overflow:auto;
}
</style>

<body>

<script id="modalPost" type="text/x-handlebars-template">
<div id="myModal" class="postModal">
   <span class="close">&times;</span>
   <div class="postModal-content">
      
      <!--사진 및 동영상 -->    
      <section class="section1">
         <!-- 화살표 (사진변경) -->
         <input class="leftBtn" type="button">
         <input class="rightBtn" type="button">
            <img class="popImageContainer">
        </section>

      <section class="section2">
         <div class="s2_1">
            <div class="s2_1_1">
               <a href="/member/{{usernickname}}">
                  <img class="s2_1_1_1">   <!-- 프사 -->
               </a>
               <span class="s2_1_1_2">
                  <a href="/member/{{usernickname}}">
                     <p class="nickname">{{usernickname}}</p>  <!-- 닉네임 -->
                  </a>
                  <a class="_postLocation" href="/search/locations?location={{location}}">
                     <p class="location">{{location}}</p> <!-- 위치 -->
                  </a>
               </span>
            </div>
         </div>

            <hr/>
            
         <div class="s2_2">
            <div class="s2_2_1" id="post{{postid}}">
               <a href="/member/{{usernickname}}"><span class="nickname">{{usernickname}}</span></a>  <!-- 닉네임 -->
               <span class="caption">{{caption}}</span>
               <div class="replyContainer" title="{{postid}}" data-limit=0>
               </div>
               <time datetime=""+{{regdate}}>{{regdate}}</time>
            </div> 
         </div>

            <hr/>
 
         <div class="s2_3">
            <div class="s2_3_1">
               <div class="btnContainer" title="{{postid}}">
                  <button class="replyBtn" onclick="replyCursor(this)">댓글달기</button>
               </div>
               <a class="likeContainer" title="{{postid}}">좋아요 <span>0</span>개(링크미구현)</a>
            </div>
         </div>

            <hr/>

         <div class="s2_4">
            <div class="s2_4_1" title="{{postid}}">
               <!-- 댓글달기 -->
               <input class="replyRegist" onkeypress="registReply(this, event);" type="textarea" placeholder="댓글 달기..." name="replyCaption">
            </div>
         </div>
        </section>
   </div>
</div>
<style>
hr{margin: 0;}
.section1{width: 600px; height: 600px; display: inline-block; float: left; position: relative; }
.leftBtn{ height: 25px; width: 25px; border-radius: 150px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-position: -324px -40px; border: none; margin: 8px 8px 8px 0; left:0; margin-top: 50%; position: absolute; }
.rightBtn{ height: 25px; width: 25px; border-radius: 150px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-position: -324px -72px; border: none; margin: 8px 8px 8px 0; right:0; margin-top: 50%; position: absolute; }    
.popImageContainer{ width: 100%; max-height: 600px; }
.section2{ width: 335px; height: 600px; display: inline-block; }
.s2_1{ width: 335px; height: 78px; }
.s2_1_1{ padding: 10px; }
.s2_1_1_1{ width: 50px; height: 50px; display: inline-block; float: left; border-radius: 150px;}
.s2_1_1_2{ width: 235px; height: 50px; margin-left: 10px; display: inline-block; }
.nickname{ font-weight: bold; }
.s2_2{ width: 335px; height: 372px; }
.s2_2_1{ width: 315px; height: 352px; overflow-y:scroll; padding: 10px; }
.replyContainer{ margin-top: 20px; bottom: 0; }
.reply{ margin-bottom: 4px; }
.s2_3{ width: 335px; height: 88px; }
.s2_3_1{ padding: 10px; }
.likeBtn{ height: 24px; width: 24px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); border: none; background-color: #fff; margin: 8px 8px 8px 0; font-size: 0;}
.replyBtn{ height: 24px; width: 24px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-position: -306px -289px; background-color: #fff; margin: 8px; margin-left: 4px; border: none; font-size: 0;}
.storeBtn{ height: 24px; width: 24px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-color: #fff; margin: 8px; margin-left: 4px; border: none; float: right; font-size: 0;}   
.s2_4{ width: 335px; height: 56px; }
.s2_4_1{ padding: 10px; }
.replyRegist{ font-size: 15px; border: none; width: 261px; height: 23px; }
</style>
</script>

<script>
console.log(jsonList);
$(document).ready(function(){
   getPostList();
   function getPostList(){
      
      //포스트 피드
      //$("body").append("<div class='postContainer' style='width:100%; height:auto;'></div>");
      
      $("body").append("<div class='postContainerWrp' style='width:100%; height:100%;'></div>");
      $(".postContainerWrp").append("<div class='postContainer'></div>");
      //데이터 담을 변수
      var data="";
      //태그 or 지역 검색 일때
      var elseList=jsonList;
      
      //태그 or 지역검색이 아니고 user정보를 가져올때(user프로필 페이지)
      if(elseList=="profile"){
         
         $.ajax({
            url:"/post/" + uid,
            datatype:"json",
            async:false,
            success:function(userdata){
               data=$(userdata);
            }
         })
         
         console.log(data);
         //게시물이 없을 때
         if($(data).length==0 && uid!=${login.id}){
            $(".postContainer").html("<div>아직 등록된 게시글이 없어요 ㅠㅠ</div>");
            return;
         }else if($(data).length==0 && uid==${login.id}){
            $(".postContainer").html("<div>소중한 순간들을 포착하여 공유해보세요</div>");
            return;
         }
      }else if(elseList.length==0 && typeof(uid)=="number"){
         $(".postContainer").html("<div>아직 저장된 게시글이 없어요 ㅠㅠ</div>");
      }else{
         try{
            data = elseList;
            console.log(data);
            throw new SyntaxError();
         }catch(e){
            console.log(e);
         }
      }
      
      $("#keywordTitle").after("<h5>게시물 "+data.length+" 개</h5>")
      
      //게시물이 있을 때
      if(data.length%3==0){
         for (i = 0; i < data.length/3; i++) {
            $(".postContainer").append("<div class='postLiner' style='display:inline-block;'>")
         }
      }else{
         for (i = 0; i < parseInt(data.length/3)+1; i++) {
            $(".postContainer").append("<div class='postLiner' style='display:inline-block;'>")
         }
      }
      
      for (i = 0; i < $(".postLiner").length; i++) {
         for (j = 0; j < 3; j++) {
            $(".postLiner:eq("+i+")").append("<div class='imageContainer' style='height:100%; width:100% ;'>")
         }
      }
      $(data).each(function(index){
         var url=this.url.split('|');
         var img = "<img class='postImage' title='"+this.id+"' style='height:100%; width:100%;' src='/displayFile?fileName="+url[0]+"' />";
         var str = "<div><span>좋아요:"+this.likeCount+" / 댓글:"+this.replyCount+"</span></div>";
         $(".imageContainer:eq("+index+")").append(img);
         
         $(".imageContainer:eq("+index+")").on("click", function(){
            var pid=$(this).children("img").attr("title");
            $.ajax({
               type:"post",
               url:"/post/detail",
               headers:{
                  "X-HTTP-Method-Override" : "POST"
               },
               data:{postid:pid},
               datatype:"json",
               success:function(data){
                  if(data!=null){
                     //이미지 배열화
                     data.urlList=data.url.split('|');
                     //handlebar추가
                     var source=$("#modalPost").html();
                     var post=Handlebars.compile(source);
                     var postmodal=post(data);
                     $("body").append(postmodal);
                     
                     //프로필 사진 삽입
                     if(data.profilephoto!=null){
                    	 $(".s2_1_1_1").attr("src", "/displayFile?fileName="+data.profilephoto)
                     }else{
                    	 $(".s2_1_1_1").attr("src", "/resources/img/emptyProfile.jpg")
                     }
                     
                     //이미지 잘라서 삽입
                     for (var i in data.urlList) {
                        //$(".popImageContainer").append("<img class='popPostImage' src='/displayFile?fileName="+data.urlList[i]+"' style='display:none;' />")
                        $(".popImageContainer").attr("src", "/displayFile?fileName="+data.urlList[i])
                        if(i!=0){
                           $(".popImageContainer").css("display", "none");   
                        }
                     }
                     
                     //좋아요버튼 삽입
                     if(data.isLike=='0'){
                        $(".btnContainer").prepend("<span><button class='likeBtn' style='background-position: -26px -349px;'>♡</button></span>")
                     }else{
                        $(".btnContainer").prepend("<span><button class='likeBtn' style='background-position: 0 -349px;'>♥</button></span>")
                     }
                     
                     //저장하기 버튼 삽입
                     if(data.isStore=='0'){
                        $(".btnContainer").append("<span><button class='storeBtn' style='background-position: -78px -349px;'>□</button></span>")
                     }else{
                        $(".btnContainer").append("<span><button class='storeBtn' style='background-position: -182px -349px;'>■</button></span>")
                     }
                     
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
                     
                     reply();
                     like();
                     likerList();
                     store();
                     searchFilter();
                  }
               }
            })
         })
      })
   };
})
//각 게시물에 댓글리스트 등록 처음 4개 이후 +20개씩('댓글 더보기' 기능이 수행)
function reply(){
   $(".replyContainer").each(function(){
      var pid=$(this).attr("title"); //게시물 id값 title에 넣어서 이동
      var limit = $(this).data("limit"); //댓글 출력제한자
      var replyContainer = this;
      
      $.getJSON("/reply/post/" + pid, function(rpldata){
         if(rpldata.length==0){
            $(replyContainer).html("");
         }
         
         // 게시물에 대한 댓글리스트 + 삭제버튼(해당 유저의 게시글일 경우만)
         var replystr="";
         $(rpldata).each(function(index){
            //댓글 최신 4개까지만 우선 출력 및 제한자에 따른 댓글 출력
            if( $(rpldata).length-(4+15*limit) <= index && index < $(rpldata).length ){ //20개씩 더 출력
               replystr +="<div class='reply' title='"+this.id+"'>"+
                  "<a href='/member/"+this.username+"'><span class='nickname'>" + this.username +"</span></a>"+this.comment;
               
               if(this.userid==${login.id}){
                  replystr+="<a class='replyDelete' onclick='javascript:deleteReply(this);' ><strong>Ｘ</strong></a></li>";
               }else{
                  replystr+="</div>";
               };
               
               $(replyContainer).html(replystr);
            }
         });
         
         //전체 댓글 수가 4개 이하 or 제한자*20+4개면 댓글더보기 삭제
          if(rpldata.length<=4+15*limit){ //20개씩 더 출력
             $(replyContainer).children(".moreReply").remove();
         }else if($(replyContainer).siblings(".moreReply")[0]==undefined){
            $(replyContainer).prepend("<div class='moreReply'><a href='javascript:;'>댓글더보기</a></div>");
         }
         
         //댓글더보기 클릭시 제한자 +1 및 댓글 목록 재출력
         $(replyContainer).children(".moreReply").on("click", function(){
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
   if(enter==13&&comment.trim().length>0){
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
               $(thisTag).val("");
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
//게시물 저장하기 + 저장하기 취소 
function store(){
   $(".storeBtn").on("click", function(){
      var postid=$(this).parents(".btnContainer").attr("title");
      var storeBtn=this;
      if($(this).css("background-position")=="-78px -349px"){
         var type="post";
         var url ="/post/"+postid+"/store";
         var headers="{'X-HTTP-Method-Override' : 'POST'}";
         var val="-182px -349px";
         
      }else if($(this).css("background-position")=="-182px -349px"){
         var type="delete";
         var url ="/post/"+postid+"/takeaway";
         var headers="{'X-HTTP-Method-Override' : 'DELETE'}";
         var val="-78px -349px";
      }
      $.ajax({
         type: type,
         url: url,
         headers: headers,
         dataType:"text",
         success:function(result){
            if(result=="SUCCESS"){
               $(storeBtn).css("background-position", val);
            };
         }
      });
   });
};
//게시물 좋아요 + 좋아요 취소
function like(){
   $(".likeBtn").on("click", function(){
      var postid=$(this).parents(".btnContainer").attr("title");
      var likeBtn=this;
      
      if($(this).css("background-position")=="-26px -349px"){
         var type="post";
         var url ="/post/"+postid+"/like";
         var headers="{'X-HTTP-Method-Override' : 'POST'}";
         var val="0px -349px";
         
      }else if($(this).css("background-position")=="0px -349px"){
         var type="delete";
         var url ="/post/"+postid+"/unlike";
         var headers="{'X-HTTP-Method-Override' : 'DELETE'}";
         var val="-26px -349px";
      }
      $.ajax({
         type: type,
         url: url,
         headers: {headers},
         dataType:"text",
         success:function(result){
            if(result=="SUCCESS"){
               $(likeBtn).css("background-position", val);
               likerList();
            };
         }      
      });
   });
};
//좋아요 count+list
function likerList(){
   $(".likeContainer").each(function(){
      var pid=$(this).attr("title");
      var likeContainer = this;
      $.getJSON("/post/" + pid + "/likerlist", function(data){
         var likerList="";
         var data=$(data)
         if(data.length>0){
            $(likeContainer).children("span").html(data.length);
            $(likeContainer).on("click", function(){
               ///list append 추가예정
            });
         }else if(data.length==0){
            $(likeContainer).children("span").html(0);
         }
      }); 
   });
};
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
 var slideIndex = 1;
/* showDivs(slideIndex); */
function plusDivs(n) {
    showDivs(slideIndex += n);
}
function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("popPostImage");
    if (n > x.length) {slideIndex = 1} 
    if (n < 1) {slideIndex = x.length} ;
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none"; 
    }
     x[slideIndex-1].style.display = "block";
}
/* function changePic(){
   $(".popImageContainer").children().on("click", function(event){
      if($(this).parent().children(":first")==$(this).parent().children(":last")){
         return;
      }else if($(this)[0]==$(this).parent().children(":last")[0]){
         $(this).css("display", "none");
         $(this).parent().children(":first").css("display", "");
      }else{
         $(this).css("display", "none");
         $(this).next().css("display", "");
      }
   })
} */
//css - 카테고리별 게시물 필터링
$("#categoryList li a").click(function(){
   var customType=$(this).data("filter");
   $(".post").hide().filter(function(){
      return $(this).data("filter") === customType || customType==="all";
      }).show();
})
//css - 댓글달기 버튼 클릭시 커서 포커스
function replyCursor(thisBtn){
   var postid=$(this).parents(".btnContainer").attr("title");
   $(".s2_4_1[title="+postid+"]").children("input").focus();
}
</script>

</body>
>>>>>>> cbf5822 03.29-1
</html>