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
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <title>Insert title here</title>
 <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
 <script type="text/javascript" src="../../resources/js/sockjs.js"></script>
 
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
.chatNone{
	float: right;
	position: fixed;
	bottom: 0;
	right: 0;
	width: 232px;
	margin: 90px 0 30px 0;
	z-index: 11;
	
}
.textMessage{
	posistion:relative;
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
    width:70px;
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
    height: 300px;
   overflow:auto;
  
 }
 #chat time{ color:#fff; font-style: oblique; }
 
 .chatBlock{
 display:block;
 }
 .chatHide{}
.chatNone{
 display:none;
 }
 
   
 
 #btn-chat{
 	background: #FFE400;
 	border: none;
 	height: 44px;
 	margin-left: 5px;
 }
 </style>
 
 </head>
 
 <body>

	
 	<div class="msgBtn" onclick="msgPopup()"><i class="material-icons">people</i><p>Messenger</p></div>
    <div class="followWrp followHide" sytle="width:200px; display:inline-block;"><div id="scroll"><ul id="followList"></ul></div></div>

    <div class="followWrp followHide" sytle="width:200px; display:inline-block;"><div id="scroll"><ul id="followList" onclick="getChat()"></ul></div></div>
 	
 	<sec:authorize access="isAuthenticated()">
 	<sec:authentication property="principal.vo" var="login" />
 	
 
	  <script src="/resources/js/sockjs.js"></script>
<script src="/resources/js/sockjs.min.js"></script>
	<script type="text/javascript">
 	
		console.log("!23");
	<script type="text/javascript">
		
 		followList();
 		function followList(){
 			 $.getJSON("/member/following/" + ${login.id}, function(data){
 			      var data=$(data)
			      console.log(data);
 			      if(data.length!=0){
 			         //following onclick 메서드 적용(follow리스트뜨도록)
 			        var followingList="";
 		            data.each(function(){
 		            	
 		               
		               followingList+="<li class='messengerUser' onclick='msgPopup1()'> <a href='javascript:;'> <img class='followPhoto' ";
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
			        
			        
 			        //소켓 생성
 					var sock;
 					
 					//웸소켓을 '/echo' url로 연결한다.
 					sock = new SockJS("/echo");
 					
 					sock.onopen=function(){
 						console.log("연결됨");
 					}
 			        
					var accessUserList;
					
 					//메세지 핸들링
					
 					sock.onmessage = onMessage;
 			        
 					//종료 핸들링
 					sock.onclose = onClose;
 					
 			      });
 			   };
 			   
 			   
 		
 		$(document).ready(function() {
 			//엔터치면 전송
 			$("#message").keypress(function(key){
 				var enter=key.keyCode||key.which;
 				 if(enter==13){
 					 sendMessage();
 					 $(this).val("");
 				 }
 			})
 			//전송누르면 전송
 		    $("#sendBtn").click(function() {
 		        sendMessage();
 		    });
 			
 		});
 		
  		function sendMessage() {
 			sock.send($("#message").val());
		
 		}
 		
 		function onMessage(evt) {
			
		    var data = evt.data;
 		    
			var curUserList = JSON.parse(data);
			data = JSON.parse(evt.data);
 			
			console.log("curUserList"+curUserList)
		    
			$(".switch").each(function(){
				if(jQuery.inArray($(this).attr("id"), curUserList) != -1){
					$(this).css("background-color", "springgreen");
				}else if(jQuery.inArray($(this).attr("id"), curUserList) == -1){
					$(this).css("background-color", "lightgray");
				}
			})
			//접속과 함께 메신저의 유저정보 확인
			if(data.initUserList!=null){
				//accessUserList에 팔로우하고 있는 사람중 접속자 리스트 받아옴
				accessUserList = data.initUserList;
				
				console.log(accessUserList);
				
				$(".switch").each(function(){
					if(jQuery.inArray($(this).attr("id"), curUserList.accessList) != -1){
						$(this).css("background-color", "springgreen");
					}else if(jQuery.inArray($(this).attr("id"), curUserList.accessList) == -1){
						$(this).css("background-color", "lightgray");
				}
			})
			}
 
 		}
 
 		function onClose(evt) {
 		    $("#data").append("연결 끊김");
 		}
 		
 		function msgPopup(){
 			$(".followWrp").toggleClass("followHide");
		}
		function msgPopup1(){
			$(".chatNone").toggleClass("chatHide");
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
 </body>

 </html> 