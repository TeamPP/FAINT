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
<script type="text/javascript" src="../../resources/js/stomp.js"></script>

<style>
.isFlw{
	float: right;
	font-size: 12px;
	font-weight: 400;
	cursor: pointer;
	background: 0 0;
	border-color: #dbdbdb;
	color: #262626;
	border-style: solid;
	border-width: 1px;
	line-height: 26px;
	border-radius: 2px;
	padding: 0 5px 0 5px;
}
.flwActive{
	background-color: #53505e !important;
	color: white !important;
}
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

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.vo" var="login" />

	<script type="text/javascript">
		
	//웸소켓을 '/hello' end point로 연결한다.
	var socket = new SockJS('/hello');
	var stompClient = Stomp.over(socket);
	stompClient.connect({}, function(frame) {
        console.log('Connected: ' + frame);
        
      	//==========================================알림==========================================
        noticeList();
        
      	//나에대한 follow,reply,like알림 구독
      	stompClient.subscribe('/notify/${login.id}', function(message){
            if(message.body=="SUCCESS"){
				noticeList();
            }
        });
      	
       	//나에대한 tagging알림 구독
      	stompClient.subscribe('/notify/${login.nickname}', function(message){
            if(message.body=="SUCCESS"){
				noticeList();
            }
        });
      	
      	//게시물 작성시 태깅 알림보내기
      	if(typeof(tagMessage) != "undefined"){
      		for(var i in targetId){
    			stompClient.send("/app/notify/" + targetId[i] + "/tagging/" + targetPost + "/post", {}, JSON.stringify({ 'nickname': '${login.nickname}' }));
    		}
      	}
      	
     	//==========================================메신저==========================================
       	//나에대한 채팅방생성 및 메시지 수신 알림(roomid값 받음)
      	stompClient.subscribe('/chatWait/${login.nickname}', function(message){
            if(message.body!="FAIL" && message.body!=null && message.body!=""){
            	var roomid = message.body;
            	getChatList();
            	getChat(roomid);
            	
            }else{
            	alert("메세지 전송에 실패하였습니다");
            }
        });
    	  
    	  
    });
	
	var date="";
    //알림 리스트 가져오기
	function noticeList(){
  		$.getJSON("/getNotice/", function(data){
  			console.log(data);
  			var list="";
  			$(data).each(function(){
  				list += "<li class='_75ljm  _3qhgf'><div class='_db0or'><div class='_3oz7p'><a class='_pg23k _jpwof _gvoze' style='width: 34px; height: 34px;' href='/member/"+this.fromid+"'><img class='_rewi8'";
  				
                // 프로필 사진이 있는경우 | 없는 경우
   				if(this.profilephoto != null){
   					list += "src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+this.profilephoto+"' /></a></div></div>";
               	}else if(this.profilephoto == null || this.profilephoto == ""){
               		list += "src='/resources/img/emptyProfile.jpg' /></a></div></div>";
               	}
                
   				list += "<div class='_b96u5'><a class='_2g7d5 notranslate _nodr2' href='/member/"+this.fromid+"'>" + this.fromid + "</a>님이 ";
               	
                if(this.type=="F"){
                	
                	//시간
                	list += "회원님을 팔로우하였습니다. <time class='_3lema _6g6t5'>" + createDateWithCheck(this.regdate.time) + "</time></div>";
                	
                	// 팔로우하고있는 경우 | 팔로우하지 않는 경우 | 본인인 경우
                	if(this.isFlw > 0){
                		list += "<button class='isFlw flwActive' data-uid='"+this.fromUserId+"'>팔로잉</button></li>";
                   
                    }else if(this.isFlw==0 && this.fromUserId!=${login.id}){
                    	list += "<button class='isFlw' data-uid='"+this.fromUserId+"'>팔로우</button></li>";
                       
                    }else{
                    	list += "</div>";
                    }
                	
                }else if(this.type=="T"){
                	list += "회원님을 태그하였습니다. ";
                	
                }else if(this.type=="L"){
                	list += "회원님의 게시물에 좋아요를 눌렀습니다. ";
                	
                }else if(this.type=="R"){
                	list += "회원님의 게시물에 댓글을 남겼습니다. ";
                }
                
                if(this.type!="F"){
                	
                	//시간
                	list += "<time class='_3lema _6g6t5'>" + createDateWithCheck(this.regdate.time) + "</time></div>";
                	
                	//이미지 필터
                	if(this.filter==""){
                		list += "<div class='_g0ya9'><a class='_gvoze _3q5ui' href=''><img style='border-radius:0px' class='followPhoto' "; 
                	}else{
                		list += "<div class='_g0ya9'><a class='_gvoze _3q5ui' href=''><img style='border-radius:0px' class='followPhoto " + this.filter + "' ";
                	}
                	list += "src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+this.postPhoto+"' /></a></div></li>";
                	
                }
  			})
  			$("#follow-results").html(list);
  			
  			//알림 리스트가 없을 경우
  		   	if($("#follow-results").children().length==0) {
				$("#follow-results").html("<div class='_oznku'><div class='noresult'>새로운 알림이 없습니다.</div></div>");
				$("#follow-header-modal").css("height", "62px");
			}
  			
  			//팔로우 메서드 등록
  			follow();
  		});
	}
	
	
	//1. 팔로우 알림
	function notifyFollow(userid){
		stompClient.send("/app/notify/" + userid + "/follow", {}, {});
	}
	
	//2. 태깅 알림 (등록되는 - 댓글일때만 (자기소개는 가지않음)) -replyRegist() , post/register.jsp
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
            stompClient.send("/app/notify/" + person + "/tagging/" + postid + "/reply", {}, JSON.stringify({ 'nickname': '${login.nickname}' }));
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
	
	//4. 댓글 알림
	function test(writer){
		var a= stompClient.send("/app/notify/" + writer + "/hi", {}, {});
		console.log(a);
	}
		
	</script>
</sec:authorize>

</html>