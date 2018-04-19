<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</style>

</head>

<body>

	<div class="msgBtn" onclick="msgPopup()"><i class="material-icons">people</i><p>Messenger</p></div>
    <div class="followWrp followHide" sytle="width:200px; display:inline-block;"><div id="scroll"><ul id="followList"></ul></div></div>
    
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.vo" var="login" />
	

	
	<script type="text/javascript">
		console.log("!23");
		followList();
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
					sock = new SockJS("/echo");
					
					sock.onopen=function(){
						console.log("연결됨");
					}
			        
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
		    
			$(".switch").each(function(){
				if(jQuery.inArray($(this).attr("id"), curUserList) != -1){
					$(this).css("background-color", "springgreen");
				}else if(jQuery.inArray($(this).attr("id"), curUserList) == -1){
					$(this).css("background-color", "lightgray");
				}
			})

		}

		function onClose(evt) {
		    $("#data").append("연결 끊김");
		}
		
		function msgPopup(){
			$(".followWrp").toggleClass("followHide");
		}

	</script>
</sec:authorize>
    
</body>

</html>