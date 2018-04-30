<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<!--헤더-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>
<head>

</head>

<body>

<h4>chatting page</h4>
메시지 내용 : <input type="text" id="message">
귓속말 대상 : <input type="text" id="to">
<input type="button" id="sendMessage" value="메시지 보내기">

<div id="chatMessage" style="overFlow: auto; max-height:500px;"></div>


<script type="text/javascript" src="/resources/js/sockjs.js"></script>
<script type="text/javascript" src="/resources/js/sockjs.min.js"></script>
<script>

console.log("!23");
followList();
console.log("login/id"+${login.id});
function followList(){
	 $.getJSON("/member/following/" + ${login.id}, function(data){
	      var data=$(data)
	      console.log(data);
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
	        
	        //소켓 생성
			var sock;
			
			//웸소켓을 '/echo' url로 연결한다.
			sock = new SockJS("/chat");
			
			sock.onopen=function(){
				console.log("연결됨");
			}
	        
			//메세지 핸들링
			sock.onmessage = onMessage;
	        
			//종료 핸들링
			sock.onclose = onClose;
			
	      });
	   };
var sock = null;
var message = {};

$(document).ready(function(){
	
	
	//웹 소켓을 지정한 url로 연결
	sock = new SockJS("/chat");
	
	//웹 소켓이 열리면 호출
	sock.onopen = function(){
		 message = {};
		message.message = "접속하였습니다.";
		message.type="all";
		message.receiver = "all";
		message.email = "${login.email}";
		
		//메시지 전송
		sock.send(JSON.stringify(message)); 
	}
	
	//메시지가 도착하면 호출
	sock.onmessage = function(evt){
		$('#chatMessage').append(evt.data + "<br/>");
	}
	
	//웹 소켓이 닫히면 호출
	sock.onclose = function(){
		//메시지 전송
		sock.send('채팅을 종료합니다.');
	}
	
	$("#message").keydown(function (key) {
        if (key.keyCode == 13) {
           $("#sendMessage").click();
        }
    });
	$('#sendMessage').click(function(){
		
		if($('#message').val() != ""){
			
			message = {};
			message.message = $('#message').val();
			message.type = "all";
			message.receiver = "all";
			message.email = "${login.email}";
			
			var to = $('#to').val();
			
			
			console.log("to"+to);
			if(to!=""){
				
				message.type=to;
				message.receiver = to;
			}
			
			console.log(to);
			//메시지 전송
		//	sock.send(JSON.stringify(message));
			
			$('#chatMessage').append(' ${login.nickname}' +message.type +'에게>>>>>>' + $('#message').val() + '<br/>');
			$('#message').val("");
		}
		
	});
});
</script>  
</body>
</html>