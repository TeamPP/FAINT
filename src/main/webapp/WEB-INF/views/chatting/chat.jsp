<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>! ! ! Chatting Page ! ! !</title>
<script type="text/javascript" src="/resources/board/js/jquery-1.12.1.js"></script>
<script type="text/javascript" src="/resources/board/js/sockjs-1.0.3.min.js"></script>
<script type="text/javascript">

	var chatSock = null;
	
	var message = {};
	
	$(document).ready(function(){
		chatSock = new SockJS("/board/echo-ws");
		chatSock.onmessage = function(evt){
			console.log(evt.data);
			//alert(evt.data);
			$("#chatMessage").append(evt.data + "<br/>");
			$("#chatMessage").scrollTop(99999999);
		};
		
		$("#message").keyup(function(event) {
			if (event.keyCode == 13) {
				$("#sendMessage").click();
			}
		});
		
		
		$("#sendMessage").click(function(){
			if ( $("#message").val() != "" ) {
				
				message = {};
				message.message = $("#message").val();
				message.type = "all";
				message.to = "all";
				
				var to = $("#to").val();
				if ( to != "" ) {
					message.type = "one";
					message.to = to;
				}
				
				chatSock.send(JSON.stringify(message));
				$("#chatMessage").append("나 -> " + $("#message").val() + "<br/>");
				$("#chatMessage").scrollTop(99999999);
				
				$("#message").val("");
			}
		});
		
	});

</script>
</head>
<body>
	채팅페이지이에요.
	
	<input type="text" id="to" />
	<input type="text" id="message" />
	<input type="button" id="sendMessage" value="메시지 보내기" />
	
	<div id="chatMessage" style="overflow: auto; max-height: 500px;"></div>
	
</body>
</html>