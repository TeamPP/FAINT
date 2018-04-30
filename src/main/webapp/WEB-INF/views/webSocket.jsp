<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../../resources/js/sockjs.js"></script>
<script type="text/javascript" src="../../resources/js/stomp.js"></script>

<style>
.msgBtn{
	float: right;
	position: fixed;
	bottom: 5px;
	right: 0;
	width: 232px;
	height: 41px;
	cursor: pointer;
    padding: 0px 16px;
	z-index: 11;
	background-color: #7c6868;
	border-radius: 0px 0px 0px 15px;
	color:#f8f8f8;
	text-align: center;
	-webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
	-moz-box-sizing: border-box;    /* Firefox, other Gecko */
	box-sizing: border-box;
	line-height: 8px;
}
.messenger > i{
	font-size: 80px;
}
.followHide{
	display: none;
}
.followWrp{
	float: right;
	position: fixed;
	bottom: 0;
	right: 0;
	width: 232px;
	margin: 90px 0 46px 0;
	z-index: 11;
	overflow: hidden;
}
#scroll{
	bottom: 0;
	width:255px;
	border-radius: 15px 0px 0px 0px;
	max-height: 799px;
	overflow-y: scroll;
}
#followList{
	width: 232px;
	padding-left: 0;
	margin-bottom: 0;
}
.messengerUser{
	border-bottom: solid 1px #efefef;
	background-color: rgba(0, 0, 0, 0.5);
	width: 200px;
	height: 30px;
	padding: 8px 16px;
	list-style: none;
	font-size: 14px;
	box-sizing: content-box;
}

.messengerUser:hover{
	background-color: rgba(255, 255, 255, 0.5);
	cursor: pointer;
}

.followPhoto{
	width: 33px;
	height: 33px;
	display: inline-block;
	float: left;
	border-radius: 150px;  /* 프사 둥글게 */
}
table{
	float: right;
	vertical-align: middle;
	height: 100%;
}
.switch{
    width: 8px;
    height: 8px;
    background-color: lightgray;
    border-radius:50%;
}
/*---*CHAT*-----*/
#chat .panel-heading{
    background: #6799FF;
    background-position: center 30%;
}
#chat .panel-heading, #chat .panel-heading a {
    color:#fff ;
}
#chat .messages{
    box-shadow:none;
    background: #6799FF;
    
}
#chat .base_sent .messages{
    background: #6799FF;
    border-radius: 8px 8px 0px 8px;
    -webkit-border-radius: 8px 8px 0px 8px;
    color: #fff;
    border-bottom:1px solid #6799FF;
    position: right;
}
#chat .base_sent::after{
    top:0px;
    width: 0;
    height: 0;
    border-top:10px solid transparent;
    border-right: 10px solid #6799FF;
    
    border-bottom: 0px solid transparent;
    
}
#chat .base_receive .messages{
    background: #9DC8C8;
    border-radius: 0 8px 8px 8px;
    border-bottom:1px solid #9DC8C8;
    color:#fff;
    
}
#chat .base_receive::before{
    width: 0;
    height: 0;
    border-top: 0px solid transparent;
    border-right: 10px solid #9DC8C8;
    border-bottom: 10px solid transparent;
}

#chat .msg_container_base{
    background:#fff;
}
#chat time{ color:#fff; font-style: oblique; }

.chatBlock{
display:block;
}
/* .chatNone{
display:none;
} */

  

#btn-chat{
	background: #FFE400;
	border: none;
	height: 44px;
	margin-left: 5px;
}
</style>

</head>

<body>

<ul class="notice"></ul>
<div class="msgBtn" onclick="msgPopup()"><i class="material-icons">people</i><p>Messenger</p></div>
<div class="followWrp followHide" sytle="width:200px; display:inline-block;"><div id="scroll"><ul id="followList" onclick="getChat()"></ul></div></div>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.vo" var="login" />

	<script type="text/javascript">
		
	//웸소켓을 '/hello' end point로 연결한다.
	var socket = new SockJS('/hello');
	var stompClient = Stomp.over(socket);
	stompClient.connect({}, function(frame) {
        console.log('Connected: ' + frame);
        
      	//나에대한 follow,reply,like알림 구독
      	stompClient.subscribe('/notify/${login.id}', function(message){
            console.log("123");
      		$.getJSON("/getNotice/", function(data){
      			console.log(data);
      		});
            console.log("456");
            
        });
      	//나에대한 tagging알림 구독
      	stompClient.subscribe('/notify/${login.nickname}', function(message){
            

        	console.log(message.body);
            
        });
      	
    });
	
	
	//1. 팔로우 알림
	function notifyFollow(userid){
		stompClient.send("/app/notify/" + userid + "/follow", {}, {});
	}
	
	//2. 태깅 알림 (등록되는 포스트/댓글일때만 (자기소개는 가지않음)) -replyRegist() , post/register.jsp
	function notifyTagging(text, postid){
		
      //2-1. split() 함수처리하기 (from common.js)
      text = split(text);
      //2-2. 공백으로 나누기
      var splitArray = text.split(" ");
      //2-3. 특수문자 
      var special = "!$%^&*()-=+<>?_";
      
      //2-5. 알람처리
      for(var i in splitArray){
         var word = splitArray[i];
         //두글자 이상이면서, 첫글자가 @이면서 , 두번째글자가 특수문자가 아니면 링크처리
         if(splitArray[i].length!=1 && (word.indexOf("@")==0 && special.indexOf(splitArray[i].charAt(1))==-1)){
            var person=word.substring(word.lastIndexOf("@")+1);
            stompClient.send("/app/notify/" + person + "/tagging/" + postid, {}, JSON.stringify({ 'nickname': '${login.nickname}' }));
         }
      }
      
	}
	
	//3. 좋아요 알림
	function notifyLike(writer, postid){
		stompClient.send("/app/notify/" + writer + "/like/" + postid, {}, {});
	}
	
	//4. 댓글 알림
	function notifyReply(writer, postid){
		stompClient.send("/app/notify/" + writer + "/reply/" + postid, {}, {});
	}
	
	
	function disconnect() {
        if (stompClient != null) {
            stompClient.disconnect();
        }
    }
		
	
	followList();
	function followList(){
		 $.getJSON("/member/following/" + ${login.id}, function(data){
		      var data=$(data)
		      if(data.length!=0){
		         //following onclick 메서드 적용(follow리스트뜨도록)
		        var followingList="";
	            data.each(function(){
	            	
	               
	               followingList+="<li class='messengerUser'> <a href='javascript:;'> <img class='followPhoto' ";
	               	// 프로필 사진이 있는경우 | 없는 경우
	            	if(this.profilephoto != null){
	            		followingList+="src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+this.profilephoto+"' /></a>&nbsp &nbsp";
	            	}else{
	            		followingList+="src='/resources/img/emptyProfile.jpg' /></a>&nbsp &nbsp";
	            	}
	               	// 이름이 있는 경우 | 없는 경우
	               	if(this.name != null){
	               		followingList+="<div style='display:inline-block; line-height:16px;'><a style='font-weight:bold;' href='javascript:;'>" + this.nickname + "</a><p style='margin:0;'>"+this.name+"</p></div>"
	               	}else{
	               		followingList+="<a style='font-weight:bold; line-height: 28px;' href='javascript:;'>" + this.nickname + "</a>"
	               	}
	               	
	               	followingList+="<table><tbody style='display:table-cell;'><td class='switch' id="+this.email+"></td></tbody></table></li>";
	            })
	            //모달창 불러오기
	            $("#followList").append(followingList);
		            
		        };
		        function getChat(){
		        	$.ajax({ 
		        		type:'POST',
		        		url:'/chatting/chatView22',
		        			headers : {
		        			"Content-Type" : "application/json",
		        			"X-HTTP-Method-Override" : "POST"}, 
		        		dataType:'json',
		        		beforeSend : function(xhr)
		                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		                },
		        		data:JSON.stringify({
		        			
		        		}),
		        		success:function(result){ 
		        			console.log("채팅을 시작하지 ");
		        			console.log(result+"result 타입은??");
		        			
		        			//console.log(result[0].msgRegist);
		        			
		        			var message = "";
		        			
		        		 	console.log(message+"11message");
		        			for(var i=0;i<result.length;i++){
		        				if(result != null){
		        					console.log("result11"+result)
		        					message = "<div class='row msg_container base_receive'><div class='col-md-10 col-xs-10' style='padding:0;'>12313<div class='messages msg_receive'>"
		        						+ result[i].message + "<br><time>"
		        						+ result[i].msgRegist + "</time>111</div></div></div>";
		        					$('.msg_container_base').append(message);
		        				}else{
		        					message = "<div class='#'><div class='col-md-10 col-xs-10' style='padding:0;'><div class='messages msg_sent'>"
		        						+ result[i].message + "<br>11<time>"
		        						+ result[i].msgRegist + "</time></div></div></div>";
		        					$('.msg_container_base').append(message);
		        				}
		        				
		        				$('.msg_container_base').scrollTop(9999);
		        			}
		        		}
		                
		        	}); //$.ajax 끝
		        }
		      });
		   };
			   
			   
		
	function msgPopup(){
		$(".followWrp").toggleClass("followHide");
	} 
		
	</script>
</sec:authorize>
<!--  친구 클릭 시 그 팔로우와 대화 시작  -->
 <!-- =============== 채팅 모달 시작 ====================== -->
 
 
<div id="chatClick" onclick="getChat()" style="cursor:pointer;"></div> 
 
<div class="chatNone chatHide" id="chat" >      
    <div class="#" id="chat_window_1" style="margin-left:;">
        <div class="TextMessage">
<div class="chatNone" id="chat">      
    <div class="row chat-window col-xs-5 col-md-3" id="chat_window_1" style="margin-left:10px;">
        <div class="col-xs-12 col-md-12">
          	<div class="panel panel-default">
                 <div class="panel-heading top-bar">
                 	<div style="display:inline;">
               		<h4 class="panel-title" style="display:inline;"><span class="glyphicon glyphicon-comment"></span>&nbsp;DIRECT MESSAGE</h4>
                		<h4 class="panel-title" style="display:inline;"><span class="glyphicon glyphicon-comment"></span>&nbsp;${login.nickname }대화</h4>
                 	</div>
                	
             	</div>
             	
             	<!-- 내용이당 -->
             	<div class="panel-body msg_container_base">
           <!-- ===========이전 대화창가져 오기인데 아직 안된다 ============ -->  		
             	
          <!--========== 다 가져왓땅 =============-->    
          <!--========== 다 가져왓땅 =============-->  
                 </div>
                 <!-- 내용끝났땅 -->
                 
                 <!--입력 부분  -->
                 <div class="panel-footer">
                     <div class="input-group">
 <!--                         <input id="btn-input" type="text" class="form-control input-sm chat_input" /> -->
                         <textarea id="btn-input" class="form-control input-sm chat_input"></textarea>
                         <span class="input-group-btn">
                         <button class="btn btn-primary btn-sm" id="btn-chat">전송</button>
                         </span>
                     </div>
                 </div>
 			</div>
 		</div>
 	</div>
 </div>
 
 <!-- ===============1대1채팅 시 ======================  -->
   <script src="/resources/js/sockjs.js"></script>
 <script src="/resources/js/sockjs.min.js"></script>
 <script>
 

 //Get the modal
 var modal = document.getElementById('id01');
 // When the user clicks anywhere outside of the modal, close it
 window.onclick = function(event) {
     if (event.target == modal) {
         modal.style.display = "none";
     }
 }
 
/* $.getJSON("/member/following/" + ${login.id}, function(data){
    var data=$(data)
    console.log(data);
followList(data);
console.log(followList);
console.log("das"+this.name);
console.log("das"+this.name);
console.log("das"+this.email);
console.log("das"+this.nickname);
data.each(function(){
	console.log("das"+this.name);
}); */
 function getChat(){
 	$.ajax({ 
 		type:'POST',
 		url:'/chatting/chatView22',
 			headers : {
 			"Content-Type" : "application/json",
 			"X-HTTP-Method-Override" : "POST"}, 
 		dataType:'json',
 		beforeSend : function(xhr)
         {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
 		data:JSON.stringify({
 			
 		}),
 		success:function(result){ 
 			console.log("채팅을 시작하지 ");
			console.log(result+"result 타입은??");
			console.log(result);
 			
			//console.log(result[0].msgRegist);
			console.log(result[0].msgRegist);
 			
 			var message = "";
 			
		 	console.log(message+"11message");
 			for(var i=0;i<result.length;i++){
				if(result != null){
				if(result[i].email == "admin"){
 					message = "<div class='row msg_container base_receive'><div class='col-md-10 col-xs-10' style='padding:0;'><div class='messages msg_receive'>"
 						+ result[i].message + "<br><time>"
 						+ result[i].msgRegist + "</time></div></div></div>";
 					$('.msg_container_base').append(message);
 				}else{
 					message = "<div class='row msg_container base_sent'><div class='col-md-10 col-xs-10' style='padding:0;'><div class='messages msg_sent'>"
						+ result[i].message + "<br>11<time>"
						+ result[i].message + "<br><time>"
 						+ result[i].msgRegist + "</time></div></div></div>";
 					$('.msg_container_base').append(message);
 				}
 				
 				$('.msg_container_base').scrollTop(9999);
 			}
 		}
 	}); //$.ajax 끝
 }
 
 
 var sock = null;
 var message = {};
 
 $(document).ready(function(){
 	
 	
 	//웹 소켓을 지정한 url로 연결
 	sock = new SockJS("/chat");
 	
 	//웹 소켓이 열리면 호출
 	sock.onopen = function(){
 		/* message = {};
 		message.message = "접속하였습니다.";
 		message.type="all";
 		message.receiver = "all";
 		message.email = "${login.email}";
 		message.email
 		//메시지 전송
 		sock.send(JSON.stringify(message)); */
 	}
 	
 	//메시지가 도착하면 호출
 	sock.onmessage = function(evt){
 		$('.msg_container_base').append(evt.data + "<br/>");
 		$('.msg_container_base').scrollTop(9999);
 	}
 	
 	//웹 소켓이 닫히면 호출
 	sock.onclose = function(){
 		//메시지 전송
 		sock.send('채팅을 종료합니다.');
 	}
 	
 	$("#btn-input").keydown(function (key) {
         if (key.keyCode == 13) {
            $("#btn-chat").click();
         }
     });
 
 	$('#btn-chat').click(function(){
 		
 		if($('#btn-input').val() != ""){
 			
 			message = {};
 			message.message = $('#btn-input').val();
 			message.type = "to";
 			message.receiver = "admin";
 			message.email = "${login.email}";
 			
			console.log(message.email+"이건 뭐지????1asd")
			console.log(message.email+"이건 뭐지????")
 			
 			var time = new Date();
 			
 			//메시지 전송
 			sock.send(JSON.stringify(message));
 			
 			$('.msg_container_base').append(
 					'<div class="row msg_container base_sent"> <div class="col-md-10 col-xs-10" style="padding:0;"><div class="messages msg_sent">'
 					+  $('#btn-input').val() +'<br><time>' + time.getHours() + ":" + time.getMinutes() +'</time></div></div></div>');
 			$('#btn-input').val("");
 			$('.msg_container_base').scrollTop(9999);
 		}
 	});
 	
 	$('#chatClick').click(function(){
 		if($('#chat').hasClass('chatNone')){
 			$('#chat').removeClass('chatNone');
 			$('#chat').addClass('chatBlock');	
 			$('.msg_container_base').scrollTop(9999);
 		}else{
 			$('#chat').removeClass('chatBlock');
 			$('#chat').addClass('chatNone');	
 		}
 	});
 })
 
 $(document).on('focus', '.panel-footer input.chat_input', function (e) {
     var $this = $(this);
     if ($('#minim_chat_window').hasClass('panel-collapsed')) {
         $this.parents('.panel').find('.panel-body').slideDown();
         $('#minim_chat_window').removeClass('panel-collapsed');
         $('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
     }
 });
 $(document).on('click', '#new_chat', function (e) {
     var size = $( ".chat-window:last-child" ).css("margin-left");
      size_total = parseInt(size) + 400;
     alert(size_total);
     var clone = $( "#chat_window_1" ).clone().appendTo( ".container" );
     clone.css("margin-left", size_total);
 });
 
</script>  
</html>