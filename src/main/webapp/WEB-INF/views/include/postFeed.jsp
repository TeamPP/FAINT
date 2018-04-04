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
    padding-top: 15vh; /* Location of the box */
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
    width: 940px;
    height: 600px;
}

.postContainerWrp{
   text-align : center;
   margin-top: 35px;
}


.postContainer{
   display: inline-block;
   width: 935px;
   max-width: 935px; !important
}
.postLiner{
   display:flex !important; 
   width:100%;
   display: inline-block;
}
.imageContainer{
   height:100%;
   width:33%;
   margin: 0.5% 0.5% 0.5% 0.5%;
   position: relative;
}
.imageContainer > img{
   overflow:hidden;
   object-fit:cover;
   cursor:pointer;
}
.imageContainer > div{
	position: absolute;
	background-color: rgba(0,0,0,0.5);
	top:0;
	bottom:0;
	left:0;
	right:0;
	text-align:center;
	vertical-align:middle;
	color: white;
	font-size: 21px;
	line-height: 100%;
	cursor:pointer;
}
.imageContainer > div > span{
	top:0;
	bottom:0;
	left:0;
	right:0;
	margin-top:45%;
   object-fit:cover;
   cursor:pointer;
}
.imageContainer > div{
	position: absolute;
	background-color: rgba(0,0,0,0.5);
	top:0;
	bottom:0;
	left:0;
	right:0;
	text-align:center;
	vertical-align:middle;
	color: white;
	font-size: 21px;
	line-height: 100%;
	cursor:pointer;
}
.imageContainer > div > span{
	top:0;
	bottom:0;
	left:0;
	right:0;
	margin-top:45%;
}
.multiFile{
	position: absolute;
	height: 39px;
	width: 39px;
	background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png");
	background-position: -360px -104px;
	right: 8px;
	top: 8px; 
}
.likeIcon{
	height: 21px;
	width: 21px;
	background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png");
	background-position: -404px -156px;
	color: rgba(0,0,0,0);
}
.replyIcon{
	height: 21px;
	width: 21px;
	background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png");
	background-position: -404px -115px;
	color: rgba(0,0,0,0);
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

.mainBox {
  width: 100%;
  height: auto;
  position: fixed;
  bottom: 5%;
  left: 43%;
  text-align: center;
  display: none;
  z-index: 2;
}
  .inBox {
    display: inline-block;
    width: 100px;
    height: 100px;
    background-color: #f1f1f1;
    border-radius: 50%;
    line-height: 70px;
  }
  .inBox:hover {
  background-color: #000;
  transition: all linear 0.5s;
  }
</style>

<body>

<script id="modalPost" type="text/x-handlebars-template">
<div id="myModal" class="postModal">
   <span class="close">&times;</span>
   <div class="postModal-content">
      
      <!--사진 및 동영상 -->    
		<section class="section1">
			<div class="popImageContainer">
			</div>
			<!-- 왼쪽 이미지 이동 버튼 -->
			<a class="_5wmqs _pak6p coreSpriteLeftChevron" role="button" id="moveLeft" style ="display: none" onclick="moveLeft()">
				<i class="fa fa-chevron-circle-left" style="font-size: 30px; color: lightgray;"></i>
			</a>

			<!-- 오른쪽 이미지 이동 버튼 -->
			<a class="_5wmqs _by8kl coreSpriteRightChevron" role="button" id="moveRight" onclick="moveRight()">
				<i class="fa fa-chevron-circle-right" style="font-size: 30px; color: lightgray;"></i>
			</a>

			<!-- 사진 몇개인지 표시 -->
			<div class=" _g5463"> 
				<table class="positionDot">
					<tbody>
						<tr>
						</tr>
					</tbody>
				</table>
			</div>
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
            
         <div class="s2_2">
            <div class="s2_2_1" id="post{{postid}}">
               <a href="/member/{{usernickname}}"><span class="nickname">{{usernickname}}</span></a>  <!-- 닉네임 -->
               <span class="caption">{{caption}}</span>
               <div class="replyContainer" title="{{postid}}" data-limit=0>
               </div>
            </div> 
         </div>
 
         <div class="s2_3">
            <div class="s2_3_1">
               <div class="btnContainer" title="{{postid}}">
                  <button class="replyBtn" onclick="replyCursor(this)">댓글달기</button>
               </div>
               <a class="likeContainer" title="{{postid}}">좋아요 <span>0</span>개(링크미구현)</a>
            </div>
         </div>

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
.section1{width: 600px; height: 600px; display: inline-block; float: left; position: relative; background-color: black; }
#moveLeft > i{ height: 25px; width: 25px; border-radius: 150px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-position: -324px -40px; border: none; margin: 8px 8px 8px; left:0; margin-top: 50%; position: absolute; }
#moveRight > i{ height: 25px; width: 25px; border-radius: 150px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-position: -324px -72px; border: none; margin: 8px 8px 8px 0; right:0; margin-top: 50%; position: absolute; }    
.popPostImage{ position: absolute; max-width: 100%; max-height: 100%; width: auto; height: auto; margin: auto; top: 0; bottom: 0; left: 0; right: 0; }
.section2{ width: 335px; height: 100%; display: inline-block; text-align: center; padding-left: 20px; padding-right: 20px; }
.s2_1{ padding-top: 20px; padding-bottom: 20px; height: 78px; text-align: left; border-bottom: 1.3px solid #efefef; }
.s2_1_1{ height: 100%; display: inline-block; }
.s2_1_1_1{ width: 45px; height: 45px; display: inline-block; float: left; border-radius: 50%; }
.s2_1_1_2{ width: 235px; margin-left: 10px; display: inline-block; }
.nickname{ font-weight: bold; }
.s2_2{ width: 100%; height: auto; padding-top: 16px; padding-bottom: 16px; text-align: left; border-bottom: 1.3px solid #efefef; }
.s2_2_1{ width: 100%; height: 352px; overflow-y: auto; }
.replyContainer{ margin-top: 20px; bottom: 0; }
.reply{ margin-bottom: 4px; }
.s2_3{ width: 100%; height: 85px; text-align: left; border-bottom: 1.3px solid #efefef; }
.s2_3_1{ padding: 10px 0 10px 0; height: 100%;}
.likeBtn{ height: 24px; width: 24px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); border: none; background-color: #fff; margin: 0 8px 8px 0; font-size: 0;}
.replyBtn{ height: 24px; width: 24px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-position: -306px -289px; background-color: #fff; margin: 0 8px 8px 0; border: none; font-size: 0;}
.storeBtn{ height: 24px; width: 24px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-color: #fff; margin-left: 842%; border: none; font-size: 0;}
.s2_4{ width: 100%; height: auto; }
.s2_4_1{ padding: 10px 0 10px 0; }
.replyRegist{ font-size: 15px; border: none; width: 100%; height: auto; }
</style>
</script>

<script>
console.log(jsonList);

//body로딩 후
$(document).ready(function(){

	//viewport크기 관리
    $(window).resize(function(){
    	if(parseInt($(".postContainer").css("max-width")) <= parseInt($(window).width())){
    		//viewport크기에 따른 컨테이너 가로값 조정
    		$(".postContainer").css("width", "935px;");
        //viewport크기에 따른 사진이미지 높이 값 조정
    	}else if(parseInt($(".postContainer").css("max-width")) >= parseInt($(window).width())){
    		$(".postContainer").css("width", $(window).width());
        	$(".postLiner").height($(".postLiner").width()*0.33);
    	}
	})
   getPostList();

})

//포스트 피드 띄우는 함수
function getPostList(){
   var height=$(window).scrollTop();
	$(".postContainerWrp").remove();
	
   //포스트 피드
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
      
      //게시물이 없을 때
      if($(data).length==0 && uid!=${login.id}){
         $(".postContainer").html("<div>아직 등록된 게시글이 없어요 ㅠㅠ</div>");
         return;
      }else if($(data).length==0 && uid==${login.id}){
         $(".postContainer").html("<div>소중한 순간들을 포착하여 공유해보세요</div>");
         return;
      }
   //for store.jsp
   }else if(elseList.length==0 && typeof(uid)=="number"){
      $(".postContainer").html("<div>아직 저장된 게시글이 없어요 ㅠㅠ</div>");
   
   //for search/location.jsp
   }else{
      try{
         data = elseList;
         throw new SyntaxError();
      }catch(e){
     	 //syntaxError메세지 던지기
      }
   }
   
   $("#keywordTitle").after("<h5>게시물 "+data.length+" 개</h5>")
   
   //게시물이 있을 때
   if(data.length%3==0){
 	 lenn = 100/(data.length/3);
 	 console.log(lenn);
 	 
      for (i = 0; i < data.length/3; i++) {
     	 console.log("aaaaaaaaaaa");
         $(".postContainer").append("<div class='postLiner' style='display:inline-block;'>")
      }
   }else{
      for (i = 0; i < parseInt(data.length/3)+1; i++) {
         $(".postContainer").append("<div class='postLiner' style='display:inline-block; '>")
      }
   }
   
   $(".postLiner").height($(".postLiner").width()*0.33);
   
   for (i = 0; i < $(".postLiner").length; i++) {
      for (j = 0; j < 3; j++) {
         $(".postLiner:eq("+i+")").append("<div class='imageContainer' style='width:100%; height:auto;'>")
      }
   }
   
   $(data).each(function(index){
      var url=this.url.split('|').reverse(); //쿼리문에서 역순으로 붙어오기때문에 reverse사용
      var img = "<img class='postImage' title='"+this.id+"' style='height:100%; width:100%; object-fit:cover;' src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+url[0]+"' />";
      
      //이미지 많을때 아이콘
      if(url.length>1){ img += "<i class='multiFile'></i>"; }
      
      $(".imageContainer:eq("+index+")").append(img);
      
      var str = "<div style='display:none;'><i class='likeIcon'>aa</i><span>\t"+this.likeCount+"개 </span> \t <i class='replyIcon'>aa</i><span> \t"+this.replyCount+"개</span></div>";
      
      $(".imageContainer:eq("+index+")").append(str);
      
      //이미지에 마우스올릴 때
      $(".postImage").mouseenter( function(){
   	  	 $(".postImage").siblings("div").css("display", "none");
    	 $(this).siblings("div").css("display", "block")
    	 });
      
      //이미지에서 벗어날 때
      $(".postImage").siblings("div").mouseleave(function(event){ $(this).css("display", "none"); });
      
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
                  //handlebar추가
                  var source=$("#modalPost").html();
                  var post=Handlebars.compile(source);
                  var postmodal=post(data);
                  $("body").append(postmodal);
                  
                  //프로필 사진 삽입
                  if(data.profilephoto!=null){
                 	 $(".s2_1_1_1").attr("src", "http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+data.profilephoto)
                  }else{
                 	 $(".s2_1_1_1").attr("src", "/resources/img/emptyProfile.jpg")
                  }
                  
              //이미지 배열화
              var urlList=data.url.split('|');
              	//첨부 이미지or영상 수
                 var len = urlList.length;
              	if(len == 1){
              		$("#moveRight").css("display", "none");
              	}
				//이미지 잘라서 삽입
                 for (var i in urlList) {
                 	
                 	//이미지일 경우(upload.js func)
                 	if(checkImageType(urlList[i])){
                         $(".popImageContainer").append("<img class='popPostImage' id='image"+i+"' src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+urlList[i]+"'/>")
                         if(i!=0){$("#image"+i).css("display", "none");}
                     
                     //영상일 경우(upload.js func)
                 	}else if(checkVideoType(urlList[i])){
                 		$(".popImageContainer").append("<video class='popPostImage' id='video"+i+"' loop='true' autoplay src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+urlList[i]+"'/>")
                 		if(i!=0){$("#video"+i).css("display", "none"); $("#video"+i).autoplay=false; }
                 	
                 	//이미지나 영상타입이 아닐경우	
                 	}else{
                 		alert("지원하지 않는 타입의 파일형식을 포함하고 있음")
                 	}
                  }
				
				//길이조정
				$(".popPostImage").each(function(){
					if(this.naturalWidth <= this.naturalHeight){
						$(this).css("min-height", "100%");
					}else{
						$(this).css("min-width", "100%");
					}
				})
                  
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
                     //영상일 경우(upload.js func)
                 	}else if(checkVideoType(urlList[i])){
                 		$(".popImageContainer").append("<video class='popPostImage' id='video"+i+"' loop='true' autoplay src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+urlList[i]+"'/>")
                 		if(i!=0){$("#video"+i).css("display", "none"); $("#video"+i).autoplay=false; }
                 	
                 	//이미지나 영상타입이 아닐경우	
                 	}else{
                 		alert("지원하지 않는 타입의 파일형식을 포함하고 있음")
                 	}
                  }
				
				//길이조정
				$(".popPostImage").each(function(){
					if(this.naturalWidth <= this.naturalHeight){
						$(this).css("min-height", "100%");
					}else{
						$(this).css("min-width", "100%");
					}
				})
                  
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
                  
                  //게시물 수정버튼 삽입
                  if(data.userid==${login.id}){
                	  $(".btnContainer").append("<span><a href='/post/"+data.postid+"/postEditor'>더보기</a></span>")
                  }
                  
                  //modal창 보이기
                  $("#myModal").css("display","block");
                  
                  //modal끄기 메서드-바깥부분
                  $("#myModal").click(function(event){
                     if(event.target==this){
                     //영상일 경우(upload.js func)
                 	}else if(checkVideoType(urlList[i])){
                 		$(".popImageContainer").append("<video class='popPostImage' id='video"+i+"' loop='true' autoplay src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+urlList[i]+"'/>")
                 		if(i!=0){$("#video"+i).css("display", "none"); $("#video"+i).autoplay=false; }
                 	
                 	//이미지나 영상타입이 아닐경우	
                 	}else{
                 		alert("지원하지 않는 타입의 파일형식을 포함하고 있음")
                 	}
                  }
				
				//길이조정
				$(".popPostImage").each(function(){
					if(this.naturalWidth <= this.naturalHeight){
						$(this).css("min-height", "100%");
					}else{
						$(this).css("min-width", "100%");
					}
				})
                  
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
                  
                  //게시물 수정버튼 삽입
                  if(data.userid==${login.id}){
                	  $(".btnContainer").append("<span><a href='/post/"+data.postid+"/postEditor'>더보기</a></span>")
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
   var height=$(window).scrollTop(height);
};

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
        
        //댓글더보기 관련
        var replyLimit = 4; //최초댓글 표시 수
     	var replyMore = 10; //댓글더보기 클릭 시 추가되는 댓글 수
     	
        $(rpldata).each(function(index){
            console.log(this);
        	//댓글 최신 4개까지만 우선 출력 및 제한자에 따른 댓글 출력
            if( $(rpldata).length-(replyLimit+replyMore*limit) <= index && index < $(rpldata).length ){ //10개씩 더 출력
               replystr +="<div class='reply' title='"+this.id+"'>"+
                  "<a href='/member/"+this.username+"'><span class='nickname'>" + this.username +"</span></a>\t<span>"+this.comment+"</span>";
               
               if(this.userid==${login.id} || this.postwriter==${login.id}){
                  replystr+="<a class='replyDelete' onclick='javascript:deleteReply(this);' style='cursor:pointer; float:right;' >X</a></li>";
               }else{
                  replystr+="</div>";
               };
               
               $(replyContainer).html(replystr);
            }
         });
         
         //전체 댓글 수가 4개 이하 or 제한자*10+4개면 댓글더보기 삭제
          if(rpldata.length<=replyLimit+replyMore*limit){ //20개씩 더 출력
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
               //댓글 창 스크롤 아래로
               $(".s2_2_1").scrollTop($(".s2_2_1").height());
               getPostList();
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
            getPostList();
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
               getPostList();
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

//css - 모달창 사진이동버튼
		
		//오른쪽으로 넘기기
		function moveRight(){
			var len = $(".popPostImage").length-1;
			var curIdx = parseInt($(".popPostImage:visible").index());
			var curObj = $(".popPostImage:visible");
			var nextObj = curObj.next();
			//if(curObj.next("script").length == 1){
			//	nextObj = curObj.next().next();
			//}else{
			//	nextObj = curObj.next();
			//}
			
			////다음객체 비율 조정
			//nextObj.parent("div").css("padding-bottom", nextObj.height()/6+"%");
			//console.log(filesArr);
			//console.log(filesArr[curIdx+1]);
			
			//이미지 전환
			curObj.css("display","none");
			nextObj.css("display","block");
			
			//비디오 재생
			if(curObj.next("video").length == 1){
				nextObj.get(0).play();
			}
			//버튼 보이기
			$("#moveLeft").css("display","block");
			if(len == curIdx+1){
				$("#moveRight").css("display","none");
			}
			//현재 표시 이미지 위치 변경
			$("._5zbvx:eq("+curIdx+")").removeClass(" _c0g09");
			$("._5zbvx:eq("+(curIdx+1)+")").addClass(" _c0g09");
		}

		//이미지 왼쪽으로 넘기기
		function moveLeft(){
			var len = $(".popPostImage").length-1;
			var curIdx = parseInt($(".popPostImage:visible").index());
			var curObj = $(".popPostImage:visible");
			var prevObj = curObj.prev();
			//if(curObj.prev("script").length == 1){
			//	prevObj = curObj.prev().prev();
			//}else{
			//	prevObj = curObj.prev();
			//}
			
			//이전객체 비율 조정
			//prevObj.parent("div").css("padding-bottom", prevObj.height()/6+"%");
			
			//이미지 전환
			curObj.css("display","none");
			prevObj.css("display","block");
			
			//비디오 재생
			if(curObj.prev("video").length == 1){
				prevObj.get(0).play();
			}
			
			//버튼 보이기
			$("#moveRight").css("display","block");
			if(curIdx - 1 == 0){
				$("#moveLeft").css("display","none");
			}

			//현재 표시 이미지 위치 변경
			$("._5zbvx:eq("+curIdx+")").removeClass(" _c0g09");
			$("._5zbvx:eq("+(curIdx-1)+")").addClass(" _c0g09");
		}


//css - 모달창 사진이동버튼
		
		//오른쪽으로 넘기기
		function moveRight(){
			var len = $(".popPostImage").length-1;
			var curIdx = parseInt($(".popPostImage:visible").index());
			var curObj = $(".popPostImage:visible");
			var nextObj = curObj.next();
			//if(curObj.next("script").length == 1){
			//	nextObj = curObj.next().next();
			//}else{
			//	nextObj = curObj.next();
			//}
			
			////다음객체 비율 조정
			//nextObj.parent("div").css("padding-bottom", nextObj.height()/6+"%");
			//console.log(filesArr);
			//console.log(filesArr[curIdx+1]);
			
			//이미지 전환
			curObj.css("display","none");
			nextObj.css("display","block");
			
			//비디오 재생
			if(curObj.next("video").length == 1){
				nextObj.get(0).play();
			}else if(curObj.is("video")){
				curObj.get(0).pause();
			}
			//버튼 보이기
			$("#moveLeft").css("display","block");
			if(len == curIdx+1){
				$("#moveRight").css("display","none");
			}
			//현재 표시 이미지 위치 변경
			$("._5zbvx:eq("+curIdx+")").removeClass(" _c0g09");
			$("._5zbvx:eq("+(curIdx+1)+")").addClass(" _c0g09");
		}

		//이미지 왼쪽으로 넘기기
		function moveLeft(){
			var len = $(".popPostImage").length-1;
			var curIdx = parseInt($(".popPostImage:visible").index());
			var curObj = $(".popPostImage:visible");
			var prevObj = curObj.prev();
			//if(curObj.prev("script").length == 1){
			//	prevObj = curObj.prev().prev();
			//}else{
			//	prevObj = curObj.prev();
			//}
			
			//이전객체 비율 조정
			//prevObj.parent("div").css("padding-bottom", prevObj.height()/6+"%");
			
			//이미지 전환
			curObj.css("display","none");
			prevObj.css("display","block");
			
			//비디오 재생
			if(curObj.prev("video").length == 1){
				prevObj.get(0).play();
			}else if(curObj.is("video")){
				curObj.get(0).pause();
			}
			
			//버튼 보이기
			$("#moveRight").css("display","block");
			if(curIdx - 1 == 0){
				$("#moveLeft").css("display","none");
			}

			//현재 표시 이미지 위치 변경
			$("._5zbvx:eq("+curIdx+")").removeClass(" _c0g09");
			$("._5zbvx:eq("+(curIdx-1)+")").addClass(" _c0g09");
		}


//css - 모달창 사진이동버튼
		
		//오른쪽으로 넘기기
		function moveRight(){
			var len = $(".popPostImage").length-1;
			var curIdx = parseInt($(".popPostImage:visible").index());
			var curObj = $(".popPostImage:visible");
			var nextObj = curObj.next();
			//if(curObj.next("script").length == 1){
			//	nextObj = curObj.next().next();
			//}else{
			//	nextObj = curObj.next();
			//}
			
			////다음객체 비율 조정
			//nextObj.parent("div").css("padding-bottom", nextObj.height()/6+"%");
			//console.log(filesArr);
			//console.log(filesArr[curIdx+1]);
			
			//이미지 전환
			curObj.css("display","none");
			nextObj.css("display","block");
			
			//비디오 재생
			if(curObj.next("video").length == 1){
				nextObj.get(0).play();
			}else if(curObj.is("video")){
				curObj.get(0).pause();
			}
			//버튼 보이기
			$("#moveLeft").css("display","block");
			if(len == curIdx+1){
				$("#moveRight").css("display","none");
			}
			//현재 표시 이미지 위치 변경
			$("._5zbvx:eq("+curIdx+")").removeClass(" _c0g09");
			$("._5zbvx:eq("+(curIdx+1)+")").addClass(" _c0g09");
		}

		//이미지 왼쪽으로 넘기기
		function moveLeft(){
			var len = $(".popPostImage").length-1;
			var curIdx = parseInt($(".popPostImage:visible").index());
			var curObj = $(".popPostImage:visible");
			var prevObj = curObj.prev();
			//if(curObj.prev("script").length == 1){
			//	prevObj = curObj.prev().prev();
			//}else{
			//	prevObj = curObj.prev();
			//}
			
			//이전객체 비율 조정
			//prevObj.parent("div").css("padding-bottom", prevObj.height()/6+"%");
			
			//이미지 전환
			curObj.css("display","none");
			prevObj.css("display","block");
			
			//비디오 재생
			if(curObj.prev("video").length == 1){
				prevObj.get(0).play();
			}else if(curObj.is("video")){
				curObj.get(0).pause();
			}
			
			//버튼 보이기
			$("#moveRight").css("display","block");
			if(curIdx - 1 == 0){
				$("#moveLeft").css("display","none");
			}

			//현재 표시 이미지 위치 변경
			$("._5zbvx:eq("+curIdx+")").removeClass(" _c0g09");
			$("._5zbvx:eq("+(curIdx-1)+")").addClass(" _c0g09");
		}

//css - 카테고리별 게시물 필터링
$("#categoryList li a").click(function(){
   var customType=$(this).data("filter");
   $(".post").hide().filter(function(){
      return $(this).data("filter") === customType || customType==="all";
      }).show();
})
//css - 댓글달기 버튼 클릭시 커서 포커스
function replyCursor(thisBtn){
   $(".replyRegist").focus();
}
</script>

</body>
</html>