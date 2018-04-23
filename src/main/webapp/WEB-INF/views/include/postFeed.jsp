<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<header>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>
</header>
<style>

.empty {
    height: 150px;
}

span{
	display: inline-block;
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
</style>

<jsp:include page="/WEB-INF/views/include/postModal.jsp" flush="false" />
<body>

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
	});
   getPostList();

});

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
         beforeSend : function(xhr)
         {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
         success:function(userdata){
        	 console.log(userdata);
            data=$(userdata);
         }
      });
      
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
   
   $("#keywordTitle").after("<h5>게시물 "+data.length+" 개</h5>");
   
   //게시물이 있을 때
   if(data.length%3==0){
	 	
 	 
	   for (i = 0; i < data.length/3; i++) {
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
      var url=this.url.split('|'); 
      var filterList = this.filter.split('|');
      console.log("url[0]:               "+url[0]);
      
      var tagStr = "";
      //이미지일 경우
      	if(checkImageType(url[0])){
      		tagStr ="<img class='postImage' data-postid='"+this.id+"' style='height:100%; width:100%; object-fit:cover;' src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+url[0]+"' />"; 
		//영상일 경우(upload.js func)
		}else if(checkVideoType(url[0])){
			tagStr ="<video class='postImage' data-postid='"+this.id+"' style='height:100%; width:100%; object-fit:fill;' src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+url[0]+"' ></video>";
 		}
      //이미지 많을때 아이콘
      if(url.length>1){ tagStr += "<i class='multiFile'></i>"; }
      
      $(".imageContainer:eq("+index+")").append(tagStr);
      
      //필터 적용
      $(".imageContainer:eq("+index+")").removeClass().addClass("imageContainer " + filterList[0]);
      
      var str = "<div style='display:none; user-select:none;'><i class='fas fa-heart'></i><span>&nbsp;"+this.likeCount+"개 </span>&nbsp;\t&nbsp;<i class='fas fa-comment'></i>&nbsp;<span>"+this.replyCount+"개</span></div>";
      
      $(".imageContainer:eq("+index+")").append(str);
      
      //이미지에 마우스올릴 때
      $(".postImage").mouseenter( function(){
   	  	 $(".postImage").siblings("div").css("display", "none");
    	 $(this).siblings("div").css("display", "block")
    	 });
      
      //이미지에서 벗어날 때
      $(".postImage").siblings("div").mouseleave(function(event){ $(this).css("display", "none"); });

   });
   
   //포스트 모달
   postModal("postFeed");
   
   var height=$(window).scrollTop(height);
};


//css - 카테고리별 게시물 필터링
$(".cate-option input").click(function(){
   var customType=$(this).data("filter");
   $(".post").hide().filter(function(){
      return $(this).data("filter") === customType || customType==="all";
      }).show();
})
//css - 댓글달기 버튼 클릭시 커서 포커스
function replyCursor(thisBtn){
   $(".replyRegist").focus();
}


function prevPost(){
	var curIndex=$(".postModal-content").data("index");
	$(".imageContainer:eq("+(curIndex-1)+")").click();
}
function nextPost(){
	var curIndex=$(".postModal-content").data("index");
	$(".imageContainer:eq("+(curIndex+1)+")").click();
}
</script>

</body>
</html>