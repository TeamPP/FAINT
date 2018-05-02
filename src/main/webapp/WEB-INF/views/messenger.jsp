<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<!-- 메신저 아이콘 & 폰트 -->
<link rel='stylesheet prefetch' href='https://cdn.materialdesignicons.com/1.1.70/css/materialdesignicons.min.css'>
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:300'>


<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<style>

 @keyframes anim-excited {
  50% {
    transform: scale(0.8) translateY(-30px) rotateY(180deg);
  }
}
@keyframes anim-dialog {
  0% {
    transform: translateY(-300px);
  }
  1% {
    display: block;
  }
  100% {
    transform: translateY(0);
  }
}
@keyframes anim-context {
  0% {
    height: 0;
    opacity: 0;
    padding: 0 0 0 5px;
  }
  50% {
    height: auto;
    opacity: 0.4;
    padding: 10px 0 10px 15px;
  }
  100% {
    opacity: 1;
    padding: 10px 0 10px 45px;
  }
}
@keyframes fade {
  0% {
    opacity: 0;
    transform: translateX(-300px);
  }
  100% {
    opacity: 1;
    transform: translateX(0);
  }
}
@keyframes fade-up {
  0% {
    opacity: 0;
    transform: translateY(-300px);
  }
  100% {
    opacity: 1;
    transform: translateX(0);
  }
}
@keyframes navgrow {
  100% {
    width: 100%;
  }
}
@keyframes anim-overlay {
  0% {
    transform: translateY(-200px);
    border-radius: 100%;
    width: 100px;
    height: 100px;
  }
  100% {
    transform: translateY(0);
    background: rgba(0, 0, 0, 0.7);
    width: 100%;
    height: 100%;
    right: 0;
    top: 0;
    border-radius: 0;
  }
}
@keyframes anim-mat-ripple-tiny {
  0% {
    opacity: 0;
  }
  20% {
    opacity: 0.5;
  }
  100% {
    transform: scale(15);
    opacity: 0;
  }
}
@keyframes anim-mat-ripple {
  0% {
    opacity: 0;
  }
  20% {
    opacity: 0.5;
  }
  100% {
    transform: scale(40);
    opacity: 0;
  }
}
/* @media (max-width: 1000px) {
  body {
    background: none;
    background-size: auto;
  }
  #hangout {
    width: 100% !important;
    height: 100% !important;
  }
  #head .mdi-chevron-down,
  .mdi-chevron-up,
  .mdi-fullscreen,
  .mdi-fullscreen-exit {
    display: none;
  }
} */
canvas {
  cursor: crosshair;
}
.center {
  text-align: center;
}
.ripple {
  width: 10px;
  height: 10px;
  background-color: rgba(0, 0, 0, 0.4);
  border-radius: 100%;
  animation: anim-mat-ripple 0.55s 1 cubic-bezier(0, 0.005, 0, 0.99);
  position: absolute;
}
.ripple.tiny {
  animation: anim-mat-ripple-tiny 0.55s 1 cubic-bezier(0, 0.005, 0, 0.99);
  position: absolute;
}
.ripple.bright {
  background-color: rgba(255, 255, 255, 0.4);
}
.overlay {
  border-radius: 100%;
  width: 0px;
  height: 0px;
  position: absolute;
  right: 50%;
  top: 50%;
  z-index: 80;
}
.overlay.add {
  animation: anim-overlay 0.41337s 1 cubic-bezier(0.995, 0, 0, 0.995);
  animation-fill-mode: forwards;
}
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
*:focus {
  outline: 0;
}
#hangout {
  background-color: white;
  height: 635px;
  width: 400px;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
  transition: all 0.444s cubic-bezier(0.7, 0, 0.3, 1);
  overflow: hidden;
  margin: auto;
  position: fixed;
  bottom: 0;
  right: 0;
  z-index: 30;
  position: fixed;
}
#hangout.collapsed {
  height: 55px;
  width: 195px !important;
  box-shadow: none;
}
#hangout.collapsed #content {
  opacity: 0;
  height: 0;
}
#hangout.collapsed .control.nav {
  height: 0;
  opacity: 0;
}
#head {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  display: flex;
  height: 55px;
  padding: 17px 0 0 25px;
  z-index: 90;
  transition: all 0.333s ease-in-out;
}
#head .mdi-chevron-down,
#head .mdi-chevron-up {
  margin: 0 15px 0 auto;
  font-size: 1.5em;
  cursor: pointer;
}
#head .mdi-menu,
#head .mdi-arrow-left {
  font-size: 1.5em;
  color: white;
  margin-right: 12px;
  cursor: pointer;
}
#head .mdi-fullscreen,
#head .mdi-fullscreen-exit {

  font-size: 1.5em;
  color: white;
  margin-right: 5px;
  cursor: pointer;
}
#head h1 {
  margin-top: 1px;
  font-size: 1em;
  color: white;
  font-weight: normal;
}
#content {
  height: calc(100% - 55px);
  height: -moz-calc(100% - 55px);
  height: -webkit-calc(100% - 55px);
  overflow-y: auto;
  background-color: white;
  transition: all 0.444s cubic-bezier(0.7, 0, 0.3, 1);
  margin-top: 55px;
}
#content.chat {
  background-color: #e5e5e5;
}
.card {
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  background-color: white;
  position: absolute;
  transition: width 0.4s cubic-bezier(0.7, 0, 0.3, 1);
}
.card.dialog {
  width: 350px;
  height: 130px;
  padding: 20px;
  margin: auto;
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  animation: anim-dialog 0.344s 1 cubic-bezier(0.84, 0.64, 0.03, 0.765);
  animation-fill-mode: alternate;
  display: none;
  z-index: 80;
}
.card.dialog h4 {
  margin-bottom: 30px;
}
.card.dialog .btn-container {
  text-align: right;
}
.card.dialog .btn {
  margin-left: 10px;
  cursor: pointer;
  font-weight: bold;
  color: #3f51b5;
  font-size: 0.85em;
  text-transform: uppercase;
  position: relative;
  top: -31px;
}
.card.menu {
  padding-top: 50px;
  bottom: 0;
  height: 100%;
  width: 0;
  z-index: 80;
  overflow: hidden;
}
.card.menu .header {
  padding: 25px 0 0 0;
  width: 100%;
  height: 200px;
  background: url(https://thumbs.gfycat.com/FastThreadbareIndigowingedparrot-size_restricted.gif);
  background-size: cover;
  background-repeat: no-repeat;
  text-align: center;
  text-shadow: 2px 2px 0px black;
  margin: 0 0 15px 0;
}
.card.menu .header img {
  width: 100px;
  height: 100px;
  border-radius: 100%;
  margin: 0 0 10px 0;
  transform-style: preserve-3d;
}
.card.menu .header img.excite {
  animation: anim-excited 0.777s 1 ease-out;
  animation-fill-mode: forwards;
}
.card.menu .header h4 {
  color: white;
  font-size: 2em;
  font-weight: bold;
}
.card.menu .content {
  padding: 15px;
}
.card.menu.open {
  width: 400px;
  display: block;
}
.list-phone,
.list-text,
.list-account,
.list-chat {
  display: none;
  height: 100%;
  overflow-y: hidden;
}
.scroll{
    border-radius: 15px 0px 0px 0px;
    
    overflow-y: scroll;
    overflow-x: hidden;
    height: 490px;
   	width: calc(100% + 17px);
   	width: -moz-calc(100% + 17px);
   	width: -webkit-calc(100% + 17px);
}
.list-phone.shown,
.list-text.shown,
.list-account.shown,
.list-chat.shown {
  display: block;
  animation: fade 0.444s 1 ease-out;
  animation-fill-mode: alternate;
}
.list-phone .meta-bar,
.list-text .meta-bar,
.list-account .meta-bar,
.list-chat .meta-bar {
  border-bottom: 1px solid #7daefe;
  padding: 0 0 0 25px;
  height: 40px;
  position: relative;
  width: 100%;
  background-color: white;
}
.list-phone .meta-bar.chat,
.list-text .meta-bar.chat,
.list-account .meta-bar.chat,
.list-chat .meta-bar.chat {
  border-top: 1px solid lightgrey;
  background: white;
  border-bottom: none;
  position: absolute;
  bottom: 50px;
}
.list-chat.shown {
  animation: fade-up 0.444s 1 ease-out;
}
ul.chat {
  width: 100%;
  height: 100%;
  padding: 0;
  margin: 0;
}
ul.chat li {
  padding: 15px 25px 15px 25px;
  display: inline-flex;
  width: 100%;
  display: flex;
  flex-flow: row wrap;
  justify-content: flex-start;
  transition: all 0.18s ease-in;
  position: relative;
}
ul.chat li img {
  height: 42px;
  width: 42px;
  border-radius: 100%;
}
ul.chat li .message {
  padding: 10px 20px 10px 20px;
  font-size: 0.9em;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  min-width: 10%;
  position: relative;
  background: white;
  border-radius: 5px;
}
ul.chat li .message:after {
  content: '';
  position: absolute;
  border-style: solid;
  border-width: 8px 8px 8px 0;
  border-color: transparent white;
  display: block;
  width: 0;
  z-index: 1;
  left: -8px;
  top: 3px;
}
ul.chat li[class="notMyMsg"] {
  flex-direction: row-reverse;
}
ul.chat li[class="notMyMsg"] .message {
  background-color: #f5f5f5;
}
ul.chat li[class="notMyMsg"] .message:after {
  right: -8px;
  left: auto;
  border-width: 8px 0 8px 8px;
  border-color: transparent #f5f5f5;
}
ul.list {
  width: 100%;
  height: 100%;
  padding: 0;
  margin: 0;
}
ul.list li {
  cursor: pointer;
  padding: 15px 25px 15px 25px;
  display: inline-flex;
  width: 100%;
  display: flex;
  flex-flow: row wrap;
  justify-content: flex-start;
  transition: all 0.18s ease-in;
  position: relative;
  overflow: hidden;
}
ul.list li.context {
  box-shadow: inset -1px 20px 4px -14px rgba(50, 50, 50, 0.3);
  color: white;
  animation: anim-context 0.35s 1 ease-out;
  overflow: hidden;
  animation-fill-mode: forwards;
}
ul.list li.context i {
  opacity: 0.5;
  font-size: 1.2em;
  margin-right: 20px;
  transition: opacity 0.3s ease-out;
}
ul.list li.context i:hover {
  opacity: 1;
}
ul.list li.active {
  background: #f4f4f4;
}
ul.list li.active > .mdi-menu-down {
  opacity: 1;
}
ul.list li:hover {
  background: #f4f4f4;
}
ul.list li:hover > .mdi-menu-down {
  opacity: 1;
}
ul.list li img {
  height: 42px;
  width: 42px;
  border-radius: 100%;
}
ul.list li .name {
  font-weight: bold;
  padding: 10px 0 10px 20px;
  display: flex;
  justify-content: space-between;
}
ul.list li .content-container{
	word-break: break-all;
    text-overflow: ellipsis;
    overflow: hidden;
    width: 75%;
}
ul.list li .content-container .name {
  font-weight: bold;
  padding: 0 0 0 20px;
  font-size: 1em;
}
ul.list li .content-container .txt {
  padding: 0 0 0 20px;
  font-size: 0.9em;
  white-space: nowrap;
}
ul.list li .content-container .meta {
  font-size: 0.7em;
  padding: 0 0 0 20px;
  color: #999;
}
ul.list li .time {
  font-size: 0.8em;
  margin: 13px 0 0 auto;
}
ul.list li .mdi-menu-down {
  font-size: 1.5em;
  color: #676767;
  opacity: 0;
  transition: opacity 0.15s ease-out;
  margin: 10px 0 0 auto;
}
ul.nav {
  position: absolute;
  list-style-type: none;
  width: 100%;
  height: 50px;
  border-top: 1px solid #eceded;
  background-color: white;
  z-index: 10;
  bottom: 0;
  transition: all 0.333s ease-in-out;
}
ul.nav li.active:after {
  content: "";
  display: block;
  width: 0;
  height: 10px;
  margin: 0 auto;
  background-color: white;
  margin-top: 6px;
  animation: navgrow 0.222s 1 ease-in;
  animation-fill-mode: forwards;
}
ul.nav li {
  height: 50px;
  overflow: hidden;
  display: inline-block;
  width: 49.5%;
  text-align: center;
  font-size: 1.7em;
  color: #676767;
  cursor: pointer;
  padding: 10px 0 10px 0;
  transition: all 0.18s ease-in;
  position: relative;
}
ul.nav li:hover {
  background: #f4f4f4;
}
.mdi-send {
  color: #666666;
  font-size: 1.2em;
  cursor: pointer;
}
input.nostyle {
  border: 0;
  width: 90%;
  padding: 12px 0 12px 0;
  background: transparent;
}
.i-group {
  position: relative;
  margin-bottom: 45px;
}
.i-group label {
  color: #999;
  font-size: 18px;
  font-weight: normal;
  position: absolute;
  pointer-events: none;
  left: 5px;
  top: 10px;
  transition: all 0.2s ease;
}
.i-group input {
  font-size: 18px;
  padding: 10px 10px 10px 5px;
  display: block;
  background: #fafafa;
  color: #636363;
  width: 100%;
  border: none;
  border-radius: 0;
  border-bottom: 1px solid #757575;
}
.i-group input:focus {
  outline: none;
}
.i-group input:focus ~ label,
.i-group input.used ~ label {
  top: -20px;
  transform: scale(0.75);
  left: -2px;
}
.bar {
  position: relative;
  display: block;
  width: 100%;
}
.bar:before,
.bar:after {
  content: '';
  height: 2px;
  width: 0;
  bottom: 1px;
  position: absolute;
  background: purple;
  transition: all 0.2s ease;
}
.bar:before {
  left: 50%;
}
.bar:after {
  right: 50%;
}
input:focus ~ .bar:before,
input:focus ~ .bar:after {
  width: 50%;
}
body {
  font-family: 'Roboto';
  background: url('http://feelgrafix.com/data_images/out/28/999895-cosmos.jpg');
  background-size: cover;
}

</style>

</head>

 <body>

     <style id="dynamic-styles"></style>
     
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.vo" var="login" />

		<div id="hangout" class="collapsed">
			<!-- 헤드 -->
			<div id="head" class="style-bg">
				<i class="mdi mdi-arrow-left"></i>
				<i class="mdi mdi-fullscreen"></i>
				<i class="mdi mdi-menu"></i>
				<h1 id="myName">${login.nickname}</h1>
				<i class="mdi mdi-chevron-up"></i>
			</div>
			<div id="content">
				<div class="overlay"></div>

				<div class="card menu">
					<div class="header">
						<c:choose>
							<c:when test="${login.profilephoto ne null && login.profilephoto != ''}">
								<img src="http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122${login.profilephoto}" />
							</c:when>
							<c:otherwise>
								<img src="/resources/img/emptyProfile.jpg" />
							</c:otherwise>
						</c:choose>
						<h4>${login.nickname}</h4>
					</div>
					<div class="content">

						<div class="i-group">
							<input type="text" id="username"><span class="bar"></span>
							<label>내 소개</label>
						</div>
						<br />
						<div class="center">
							<canvas id="colorpick" width="250" height="220"></canvas>
						</div>
					</div>
				</div>
				
				<!-- 유저리스트 -->
				<div class="list-account">
					<div class="meta-bar">
						<input class="nostyle search-filter" type="text"
							placeholder="Search" />
					</div>
					<div class="scroll">
					<ul class="list mat-ripple">
					</ul>
					</div>
				</div>
				
				<!-- 채팅방 리스트 -->
				<div class="list-text">
					<div class="scroll">
					<ul class="list mat-ripple">
					</ul>
					</div>
				</div>
				
				<!-- 채팅창 -->
				<div class="list-chat">
					<div class="scroll">
					<ul class="chat">
					</ul>
					</div>
					<div class="meta-bar chat">
						<input class="nostyle chat-input" type="text"
							placeholder="Message..." /> <i class="mdi mdi-send"></i>
					</div>
					
					
				</div>
				
				<!-- 하단메뉴 -->
				<ul class="nav control mat-ripple tiny">
					<li data-route=".list-account">
						<i class="mdi mdi-account-multiple"></i>
					</li>
					<li data-route=".list-text">
						<i class="mdi mdi-comment-text"></i>
					</li>
				</ul>
			</div>

			<div id="contact-modal" data-mode="add" class="card dialog">
				<h4>Add Contact</h4>
				<div class="i-group">
					<input type="text" id="new-user"><span class="bar"></span>
					<label>Name</label>
				</div>

				<div class="btn-container">
					<span class="btn save">확인</span> <span class="btn cancel">취소</span>
				</div>

			</div>

		</div>



		<script>
		
		//채팅창 가져오기
		function getChat(roomid){
			
	    	$.getJSON("/getChat/"+roomid, function(data){
	    		console.log(data);
	    		var list="";
	    		
	    		$(data).each(function(){
	    			// 나의 메세지,타인 메세지 구분
	    			if(this.senderNickname == "${login.nickname}"){
	    				list += "<li><img ";
	    			}else{
	    				list += "<li class='notMyMsg'><img ";
	    			}

	    			// 프로필 사진이 있는경우 | 없는 경우
	   				if(this.profilephoto != null && this.profilephoto != ""){
	   					list += "src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122" + this.profilephoto + "' />";
	               	}else if(this.profilephoto == null || this.profilephoto == ""){
	               		list += "src='/resources/img/emptyProfile.jpg' />";
	               	}
	   				
	   				list += "<div class='message' style='word-break: break-word; max-width: 235px;'>" + this.comment + "</div>";
	   				
	   				//읽음 상태표시
	   				if(this.readstatus!=0){
	   					list += "<div style='color: #ffa845; padding: 25px 5px 0 5px;'><time style='font-size: 0.8em;'>" + this.readstatus + "</time></div>";	
	   				}
	   				
	   				//시간
	   				list += "<div style='padding: 25px 5px 0 5px;'><time style='font-size: 0.8em;'>" + new Date(this.sendtime.time).toLocaleString([], { hour: '2-digit', minute: '2-digit' }) + "</time></div></li>";	
	   				
	   				
	    		})
	    		
	    		$(".list-chat > .scroll > ul").html(list);
	    		$('.list-chat').data("rid", roomid);
	    		
	    		$(".scroll").scrollTop($(".scroll")[2].scrollHeight);
	    	})
		}
		
		//메신저 채팅리스트 불러오기
		getChatList()
		function getChatList(){
			$.getJSON("/getChatList", function(data){
	    		var cur_Scroll_Location = $(".scroll:eq(1)").scrollTop();
	    		var list="";
				if($(data).length!=0){
	    			$(data).each(function(){
	    				console.log(this.usersPhoto);

	    				list += "<li data-rid='"+this.id+"'><img ";
	    				
	    				if(this.usersPhoto!=null){
	    					var userPhotoArray = this.usersPhoto.split("|");
	    				}else if(this.usersPhoto==null){
	    					list+="src='/resources/img/emptyProfile.jpg' />";
	    				}
	    				
	    				if(userPhotoArray!=undefined && userPhotoArray.length==1){
	    	            	list+="src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+this.usersPhoto+"' />";
	    	            	
	    				}else if(userPhotoArray!=undefined && userPhotoArray.length>1){
	    					
	    					if(userPhotoArray[0] != "" || userPhotoArray[0] != null){
	    	            		list+="src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+userPhotoArray[0]+"' />";
	    	            	}else{
	    	            		list+="src='/resources/img/emptyProfile.jpg' />";
	    	            	}
	    					
	    				}
	    				
	    				var userNicknameArray = this.usersNickname.split("|");
	    				
						if(userNicknameArray.length == 1){
							list += "<div class='content-container'><span class='name'>"+userNicknameArray[0]+"</span>";	
						}else{
							list += "<div class='content-container'><span class='name'>"
							for(var i in userNicknameArray){
								list += userNicknameArray[i]+", ";
								if( i == userNicknameArray.length-1){
									list += userNicknameArray[i]+"</span>";
								}
							}
						}
	    				
	    				
	    				list += "<span class='txt' style='word-break:break-all;'>" + this.lastMessage + "</span></div>";
	    				
	    				list += "<span class='time'>" + createDateWithCheck(this.lastMessageDate) + "</span></li>";
	    				
	    			})
	    		}
	    		$(".list-text > .scroll > .mat-ripple.list").html(list);
	    		$(".scroll").scrollTop(cur_Scroll_Location);
	    	})
		}

		//메신저 유저리스트 불러오기
		getMessengerUserList();
    	function getMessengerUserList(){
    		 $.getJSON("/member/following/" + ${login.id}, function(data){
    			  var cur_Scroll_Location = $(".scroll:eq(0)").scrollTop();
    		      var $data=$(data)
    		      if($data.length!=0){
    		         //following onclick 메서드 적용(follow리스트뜨도록)
    		        var followingList="";
    	            $data.each(function(){
    	            	
    	               followingList+="<li data-uid='" + this.id + "'><img ";
    	               	// 프로필 사진이 있는경우 | 없는 경우
    	            	if(this.profilephoto != null){
    	            		followingList+="src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+this.profilephoto+"' />";
    	            	}else{
    	            		followingList+="src='/resources/img/emptyProfile.jpg' />";
    	            	}
    	               	
    	               	followingList+="<span class='name'>" + this.nickname + "</span><i class='mdi mdi-menu-down'></i> </li>";

    	            })
    	            
    	            //모달창 불러오기
    	            $(".list-account > .scroll > .mat-ripple.list").html(followingList);
    		            
    		        };
    		        $(".scroll").scrollTop(cur_Scroll_Location);
   		      });
   		   };
    	
   		// 스크롤 휠클릭 이벤트 막기
        $(".scroll").mousedown(function(e) {
        	if(e.which==2){
        		e.preventDefault();	
        	}
        });
        
        // 하단메뉴 data-route 태그중 list-account태그일경우를 찾기위한 변수 // 채팅타겟 저장
        var GLOBALSTATE = {
            route: '.list-account',
        };

        // GLOBALSTATE.route값에 따라 show/hide 구별 - 초기값 ".list-account"
        setRoute(GLOBALSTATE.route);
        
        
        $('.nav > li[data-route="' + GLOBALSTATE.route + '"]').addClass('active');

        // ul 내부 클릭 효과 주기 (0.53초)
        $('ul.mat-ripple').on('click', 'li', function(event) {
            //하단 메뉴 ul > li
        	if ($(this).parent().hasClass('tiny')) {
                var $ripple = $('<div class="ripple tiny"></div>');
            
            //기본 리스트 ul > li
            } else {
                var $ripple = $('<div class="ripple"></div>');
            }
            var x = event.offsetX;
            var y = event.offsetY;

            var $me = $(this);

            $ripple.css({
                top: y,
                left: x
            });

            $(this).append($ripple);

            setTimeout(function() {
                $me.find('.ripple').remove();
            }, 530)
        });

        //현재 로그인 유저정보 설정
        setName("${login.nickname}");

        // 로컬저장소에 있는 메신저 색상 가져오기
        if (localStorage.getItem('color') !== null) {
            var colorarray = JSON.parse(localStorage.getItem('color'));
            stylechange(colorarray);
        } else {
            var colorarray = [51,102,153,1]; // 15 157 88 = #0f9d58
            localStorage.setItem('color', JSON.stringify(colorarray));
            stylechange(colorarray);
        }

        // 메신저 사용자 이름 설정
        function setName(name) {
        	//이름값 없을경우 본인, 아닐경우 변수 
            $.trim(name) === '' || $.trim(name) === null ? name = '${login.nickname}' : name = name;
            $('#myName').text(name);
            //사용자 개인 프로필 - input
            $('#username').val('${login.name}').addClass('used');
          	//사용자 개인 프로필 - header
            $('.card.menu > .header > h4').text(name);
        }

        // dynamic-styles태그에 color값 삽입하여 메뉴 스타일 동적 변경
        function stylechange(arr) {
            var x = 'rgba(' + arr[0] + ',' + arr[1] + ',' + arr[2] + ',1)';
            $('#dynamic-styles').text('.dialog h4 {color: ' + x + '} .i-group input:focus ~ label,.i-group input.used ~ label {color: ' + x + ';} .bar:before,.bar:after {background:' + x + '} .i-group label {color: ' + x + ';} ul.nav > li.active {color:' + x + '} .style-tx {color: ' + x + ';}.style-bg {background:' + x + ';color: white;}@keyframes navgrow {100% {width: 100%;background-color: ' + x + ';}} ul.list li.context {background-color: ' + x + '}');
        }

        //내부 모달끄기
        function closeModal() {
        	//닉네임 편집 모달 value제거
            $('#new-user').val('');
            //오버레이(검은배경) 제거
            $('.overlay').removeClass('add');
          	//내부 모달 fadeout
            $('#contact-modal').fadeOut();
          	//save버튼 click 리스너 off
            $('#contact-modal').off('click', '.btn.save');
        }
		
        //내부 모달 활성화
        function setModal(mode, $ctx) {
            var $mod = $('#contact-modal');
            switch (mode) {
            	//인물 메뉴클릭시
                case 'add':
                	$mod.find('.i-group').show();
                    $mod.find('h4').text('Add Contact');
                    break;
				
                //기존 사용자 변경클릭시
                case 'edit':
                    $mod.find('h4').text('Edit Contact');
                    $mod.find('.i-group').show();
                    $mod.find('#new-user').val($ctx.text()).addClass('used');
                    break;
                    
                //유저 삭제 시
                case 'delete':
                    $mod.find('h4').text('정말 팔로우를 끊으시겠습니까?');
                    $mod.find('.i-group').hide();
                    $(".card .dialog").css("height", "130px");
                    break;
            }

            $mod.fadeIn();
            $('.overlay').addClass('add');
            $mod.find('#new-user').focus();
        }
		
        //채팅창 나가기
        $('.mdi-arrow-left').on('click', function() {
            $('.shown').removeClass('shown');
            //인물리스트로부터 왔지만 메세지 입력하지않고 돌아왔을 때 or 아닐 때
            if($('.list-chat').data("curTarget")!=undefined){
            	$('.nav li:eq(0)').trigger("click")
            }else{
            	$('.nav li:eq(1)').trigger("click")
            }
            
            //채팅창 데이터 지우기
            $('.list-chat').removeData("curTarget");
            $('.list-chat').removeData("rid");
          	//채팅창 대화기록 삭제
            $(".list-chat > .scroll > ul").html("");
        });

        // 특정 메뉴활성화 함수
        function setRoute(route) {
            GLOBALSTATE.route = route;
            $(route).addClass('shown');

          	//채팅창 보이기
            if (route === '.list-chat') {
            	//메뉴 버튼 가리기
                $('.mdi-menu').hide();
                //채팅 메뉴로 돌아가기 버튼-헤더
                $('.mdi-arrow-left').show();
                //채팅창
                $('#content').addClass('chat');
            } else {
                $('#content').removeClass('chat');
                $('.mdi-menu').show();
                $('.mdi-arrow-left').hide();
            }
        }

        // 색상 캔버스 활성화 위해 이미지값 넣기
        var cv = document.getElementById('colorpick');
        var ctx = cv.getContext('2d');
        var img = new Image();
        // Meh .. Thx 2 Browser Security i need BASE64
        img.src = 'data:image/gif;base64,R0lGODlh8gDYAPepAP///8yZ/zNm////Zsz/ZmbM//+ZZplm/zPMzMz/M//MZmb/mZkz/8wAzMz/mcwA/wD/mf//AMwz//8A//8AAP/MmTPM////mZn/mf8AZmb/zGb/ZgD/zAD//5mZ/wCZmf+ZzAD/AP+Z/wDMAJn/Zpn/zDPMM5nM//9mzP+Zmcxm/5nMAP8zmf9QUGaZ/2YA/wBmzGb//zMz/wBmmQAA/wAzzDMzzDOZ/wBm/2aZAACZAADMZgCZzP8zzJn/M8wzmWZm/wDM//8zAMwAAGb/M8wAmQCZM8zMAMxmmQCZ//9mAMxmAADMmf9mmcyZAP/MAMwAZv9mZv9m//+ZM/+ZAMz/zMz//8zM/zOZMwBmZpmZZmZmM5kAmZkAzGYAM2YAzJkAM5kA/2ZmmQBmADNmAJkzmTMzAGaZmTMzmZlmMzOZZpkzZpkAADNmzMwzAJkzADNmmZlmAIAAAAAzmQAAzAAAmf//zAAAZmYzAAAzZpkzMwAzAGYAZv/M///MzAo7CmwKbLFjYwo7bGw7CgoKbJ1sCmOKsQo7nZ0KCs47CoUKCgoKnQoKzmOK2J07CqmpxgpsbGwKzmNjsbFjsZ0K/4qKYzs7CjtsCrGKY7FjigpsCmOxY50KO2wKO2OxisbGqZ0KnanGxp0Kzv/Ozv//zs7O///O/87//87/zv///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDoxNUIxREUxODJBRTMxMUU1ODYyMkREQ0Q3NUZENjdFMCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDoxNUIxREUxOTJBRTMxMUU1ODYyMkREQ0Q3NUZENjdFMCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjE1QjFERTE2MkFFMzExRTU4NjIyRERDRDc1RkQ2N0UwIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjE1QjFERTE3MkFFMzExRTU4NjIyRERDRDc1RkQ2N0UwIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEg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';

        img.onload = function() {
            ctx.drawImage(img, 0, 0, img.width, img.height);
        };


        //유저 프로필 상에서 input태그 포커스 잃었을 때 - 사용자이름 저장 및 프로필 이미지 한바퀴도는 액션
        $('#username').on('blur', function() {
            setName($(this).val());

            $('.card.menu > .header > img').addClass('excite');
            setTimeout(function() {
                $('.card.menu > .header > img').removeClass('excite');
            }, 800);

        });

        // Dirty Colorpicker(스타일창 클릭시)
        $('#colorpick').on('mousedown', function(eventDown) {
            var x = eventDown.offsetX;
            var y = eventDown.offsetY;

            if (eventDown.button === 0) {
                $('.card.menu > .header > img').addClass('excite');
                setTimeout(function() {
                    $('.card.menu > .header > img').removeClass('excite');
                }, 800);

                var imgData = ctx.getImageData(x, y, 1, 1).data;
                localStorage.setItem('color', JSON.stringify(imgData));
                stylechange(imgData);
            }
        });
		
        //채팅 발송 - 클릭
        $('.mdi-send').on('click', function() {

        	if( $(".chat").children("li").length == 0){
        		var targetNickname = $('.list-chat').data("curTarget");
        		stompClient.send("/app/chat/create/" + targetNickname, {},
        				JSON.stringify({ 'sender': '${login.id}', 'senderNickname': '${login.nickname}', 'senderEmail': '${login.email}', 'comment': $('.chat-input').val() }));
        		//채팅창 데이터 값 삭제
        		$('.list-chat').removeData("curTarget");
        	}else if( $(".chat").children("li").length >= 1 ){
        		var roomid = $('.list-chat').data("rid");
        		stompClient.send("/app/chat/sendMsg", {},
        				JSON.stringify({ 'roomid': roomid+"", 'sender': '${login.id}', 'senderNickname': '${login.nickname}', 'senderEmail': '${login.email}', 'comment': $('.chat-input').val() }));
        	}

            $('.chat-input').val('');
        });
        
      	//채팅 발송 - 엔터
        $('.chat-input').on('keyup', function(event) {
            event.preventDefault();
            var enter=event.keyCode||event.which;
            var comment=$('.chat-input').val().trim();
            if (enter==13 && comment.trim().length>0) {
                $('.mdi-send').trigger('click');
            }
        });
      	
      	//채팅리스트 클릭이벤트
        $('.list-text > .scroll > .list').on('click', 'li', function() {
        	var roomid=$(this).data("rid");
			getChat(roomid);
			
            // timeout just for eyecandy...
            setTimeout(function() {
            	
                $('.shown').removeClass('shown');
                $('.list-chat').addClass('shown');
                setRoute('.list-chat');
                $(".scroll").scrollTop($(".scroll")[2].scrollHeight);
                $('.chat-input').focus();
                
            }, 300);
        });

        // 친구목록 리스트 클릭이벤트
        $('.list-account > .scroll > .list').on('click', 'li', function() {
        	//목록 active활성화 모두제거
            $(this).parent().children().removeClass('active');
        	//수정 및 삭제버튼 제거
            $(this).parent().find('.context').remove();
            //클릭한 리스트에만 active활성화
            $(this).addClass('active');
            //클릭대상
            var $TARGET = $(this);
            
            //클릭한 대상이 이미 수정 및 삭제버튼을 가지지 않을 경우
            if (!$(this).next().hasClass('context')) {

                var $ctx = $('<li class="context"><i class="mdi mdi-comment"></i><i class="mdi mdi-home"></i><i class="mdi mdi-delete"></i></li>');
                
                //채팅하기 버튼
                $ctx.on('click', '.mdi-comment', function() {

                	//이미 있는 채팅방인지
                	var noRoom=true;
                	$(".content-container > .name").each(function(){
                		if($(this).html()==$TARGET.find('span').html()){
                			$(this).trigger("click");
                			noRoom=false;
                			return false;
                			
                		}
                	})
                	
                	//채팅방 div에 현재 타겟값 저장
                	if(noRoom){
                		$('.list-chat').data("curTarget", $TARGET.find('span').html());
                	}
                	
                    // timeout just for eyecandy...
                    setTimeout(function() {
                        $('.shown').removeClass('shown');

                        $('.list-chat').addClass('shown');
                        setRoute('.list-chat');
            			$(".scroll").scrollTop($(".scroll")[2].scrollHeight);
                        $('.chat-input').focus();
                    }, 300);
                    
                });
                
              	//방문하기 버튼
                $ctx.on('click', '.mdi-home', function() {
                	window.location = "/member/" + $TARGET.find(".name").html();
                });
				
              	//삭제버튼
                $ctx.on('click', '.mdi-delete', function() {
                	//팔로우 해제 - 모달
                	//타겟삭제
                	//팔로우 해제
                	setModal('delete', $TARGET);
                	var followFlg=false;
                    $('#contact-modal').one('click', '.btn.save', function() {
                        var userid = $TARGET.data("uid");
                        console.log(userid);
                        if(followFlg){return;}
                        followFlg=true;
                        $.ajax({
                            type: "delete",
                            url: "/member/unfollow/"+userid,
                            headers:"{'X-HTTP-Method-Override' : 'DELETE'}",
                            dataType:"text",
                            beforeSend : function(xhr)
                            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                            },
                            success:function(result){
                               if(result=="SUCCESS"){
                            	   
                            	   if(window.location.pathname.substr(0,8) == "/member/"){
                               			followed();
                                       	following();
                               		}
	                                
	                                closeModal();
	                                
	                                $TARGET.remove();
	                                followFlg=false;

                               }
                            }
                         });
                        
                    });
                    
                });

				//대화 및 삭제버튼 삽입
                $(this).after($ctx);
            }
        });

        // 하단메뉴 활성화
        $('.nav li').on('click', function() {
            $(this).parent().children().removeClass('active');
            $(this).addClass('active');
            $('.shown').removeClass('shown');
            $(".list-chat > .scroll > ul").html("");
            var route = $(this).data('route');
            $(route).addClass('shown');
            setRoute(route);
        });
		
        //화면 최대화
        $('#head').on('click', '.mdi-fullscreen', function() {
            $(this).removeClass('mdi-fullscreen').addClass('mdi-fullscreen-exit');
            $('#hangout').css({
                width: '100%'
            });
        });
		
      	//화면 일반크기
        $('#head').on('click', '.mdi-fullscreen-exit', function() {
            $(this).removeClass('mdi-fullscreen-exit').addClass('mdi-fullscreen');
            $('#hangout').css({
                width: '400px'
            });
        });

        //현재 프로필 메뉴 오픈 및 오버레이 활성화
        $('#head .mdi-menu').on('click', function() {
            $('.menu').toggleClass('open');
            $('.overlay').toggleClass('add');
        });

        // 최소화 최대화 버튼
        $('#head .mdi-chevron-up').on('click', function() {
            if ($('#hangout').hasClass('collapsed')) {
                $(this).removeClass('mdi-chevron-up').addClass('mdi-chevron-down');
                $('#hangout').removeClass('collapsed');	
            } else {
                $(this).removeClass('mdi-chevron-down').addClass('mdi-chevron-up');
                $('#hangout').addClass('collapsed');
            }

        });

        // 유저 검색
        $('.search-filter').on('keyup', function() {
            var filter = $(this).val();
            $(GLOBALSTATE.route + ' .list > li').filter(function() {
                var regex = new RegExp(filter, 'ig');

                if (regex.test($(this).text())) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });

        // 모달창 나가기 버튼
        $('#contact-modal').on('click', '.btn.cancel', function() {
            closeModal();
        });

        // 새로운 유저
        $('#new-user').on('keydown', function(event) {
            switch (event.which) {
                case 13:
                    event.preventDefault();
                    $('.btn.save').trigger('click');
                    break;

                case 27:
                    event.preventDefault();
                    $('.btn.cancel').trigger('click');
                    break;
            }

        });
        
        </script>
        
</sec:authorize>
  
  </body>
</html>