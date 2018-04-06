<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");
%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js sidebar-large lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js sidebar-large lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js sidebar-large lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js sidebar-large">
<!--<![endif]-->

<head>
<!-- BEGIN META SECTION -->
<meta charset="utf-8">
<title>이메일 보내기(관리자)|OUR PLANNERS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="" name="description" />
<meta content="themes-lab" name="author" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/favicon.png">
<!-- END META SECTION -->
<!-- BEGIN MANDATORY STYLE -->
<link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/icons/icons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/plugins.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/style.min.css" rel="stylesheet">
<link href="#" rel="stylesheet" id="theme-color">

<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>



<!-- END  MANDATORY STYLE -->
<!-- BEGIN PAGE LEVEL STYLE -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/summernote/summernote.css">
<!-- END PAGE LEVEL STYLE -->
<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/modernizr/modernizr-2.6.2-respond-1.1.0.min.js"></script>

<script>
	$(document).ready(function() {
		loadEmail();
		
		$('#email_send_btn').on('click', emailSend);
		$('#saveEmailBtn').on('click', saveEmail);
	});
	function loadEmail() {
		var saveFlag = localStorage.getItem("email_save_flag");
		
		if(saveFlag!=null & saveFlag=='Y'){
			if (confirm("임시저장된 메일이 있습니다. 불러 오시겠습니까? ")) {
				
				var to = localStorage.getItem("email_to");
				if (to != null) {
					$("input[type='text'][name='to']").val(to);
				}
				var subject = localStorage.getItem("email_subject");
				if (subject != null) {
					$("input[type='text'][name='subject']").val(subject);
				}
				var content = localStorage.getItem("email_content");
				if (content != null) {
					//alert(content);
					//$('textarea[name="content"]').html(content);
					$('#content').summernote('editor.pasteHTML', content);
				}
				
				localStorage.clear();
				
			}else{
				localStorage.clear();
			}
		}		
	}
	function saveEmail() {
	
		localStorage.setItem("email_save_flag", "Y");
		
		localStorage.setItem("email_to", $("input[type='text'][name='to']").val());
		
		localStorage.setItem("email_subject", $("input[type='text'][name='subject']").val());
		
		var contents = $('.summernote').code();
		$('textarea[name="content"]').html($('.summernote').code());
		var ir1 = $("#content").val();
		localStorage.setItem("email_content", contents);
		popLayerMsg("임시 저장 되었습니다.");
	}
	function checkEmail(email) {
		//이메일 유효성 검사
		var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		//한글 들어가 있는지 확인
		var isHan = /[ㄱ-ㅎ가-힣]/g;
		if (!isEmail.test(email) || isHan.test(email)) {
			popLayerMsg("이메일 주소를 다시 확인해주세요.");
			return false;
		}
		return true;
	}
	function alertMailing() {
		popLayerMsg("메일 발송중 입니다.");
	}
	function emailSend() {
		if ($("input[type='text'][name='to']").val() == "") {
			alert("받는 사람을 입력해주세요");
			$("input[type='text'][name='to']").focus();
			return;
		}
		if (!checkEmail($("input[type='text'][name='to']").val())) {
			$("input[type='text'][name='to']").focus();
			return false;
		}
		if ($("input[type='text'][name='subject']").val() == "") {
			alert("제목 을 입력해주세요");
			$("input[type='text'][name='subject']").focus();
			return;
		}
		var contents = $('.summernote').code();
		$('textarea[name="content"]').html($('.summernote').code());
		var ir1 = $("#content").val();
		if (ir1 == "" || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>') {
			alert("내용을 입력해주세요");
			$('textarea[name="content"]').focus();
			return;
		}
		var url = "${pageContext.request.contextPath}/mail/mail_send.json";
		var to = $("input[type='text'][name='to']").val();
		var subject = $("input[type='text'][name='subject']").val();
		var params = "to=" + to + "&subject=" + $("input[type='text'][name='subject']").val() + "&content=" + contents
		//popLayerMsg(url+"?"+params);
		popLayerMsg("메일 발송중 입니다.");
		//var jsonparams = JSON.stringify(${joinInfo}); 
		$('#email_send_btn').off('click', emailSend);
		$('#email_send_btn').css({
			'background-color' : 'gray'
		});
		$('#email_send_btn').on('click', alertMailing);
		$.ajax({
			type : 'post',
			url : url,
			dataType : 'json', //dataType에 데이터 타입 넣기
			data : params,
			success : function(data) { //success에 성공했을 때 동작 넣기.
				//중복되지 않은 경우
				if (data.result == "success") {
					popLayerMsg("메일이 발송 되었습니다.");
					emailReset();
					//$('#email_send_btn').css({'background-color': 'white'});
					$('#email_send_btn').removeAttr("style");
					$('#email_send_btn').on('click', emailSend);
					localStorage.clear();
				}
				//중복된 경우
				else {
					popLayerMsg("메일 발송 오류");
					//$('#email_send_btn').css({'background-color': 'white'});
					$('#email_send_btn').removeAttr("style");
					$('#email_send_btn').on('click', emailSend);
					//document.getElementById("Span").innerText = "이미 사용중이거나 탈퇴한 아이디입니다."+data.result;
				}
			},
			error : function() {
				popLayerMsg("AJAX Error 발생" + e.status + ":" + e.statusText);
			}
		});
	}
	function emailReset() {
		$('form').each(function() {
			this.reset();
		});
		//내용 클리어
		$('.summernote').code("");
	}
	///mail/mail_send.json?to=&subject=&content
</script>

</head>

<body data-page="email_compose">
	<!-- BEGIN TOP MENU -->
	<%@include file="common/common_top.jsp"%>
	<!-- END TOP MENU -->
	<!-- BEGIN WRAPPER -->
	<div id="wrapper">

		<!--  left side bar -->
		<%@include file="common/common_left.jsp"%>

		<!-- BEGIN MAIN CONTENT -->
		<div id="main-content" class="send-message">
			<div class="page-title">
				<i class="icon-custom-left"></i>
				<h3>
					<strong>메일</strong> 보내기
				</h3>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<div class="border-bottom">
										<div class="pull-left">
											<a href="javascript:history.back();" class=" btn btn-default"><i class="fa fa-arrow-left fa-fw"></i> 뒤로가기</a>
										</div>
										<div class="pull-left p-l-20">
											<a href="javascript:;" id="saveEmailBtn" class=" btn btn-success"><i class="fa fa-floppy-o fa-fw"></i> 임시저장</a>
										</div>
										<div class="clearfix m-b-20"></div>
									</div>
									<form class="form-horizontal p-t-20" role="form">
										<div class="form-group">
											<label for="to" class="col-sm-2 control-label">받는사람:</label>
											<div class="col-sm-10">
												<div class="input-group">
													<input type="text" class="form-control" name="to" id="to" /> <span class="input-group-addon bg-white cursor-pointer" data-toggle="collapse" data-target="#cc"> CC/BCC <span class="caret"></span>
													</span>
												</div>
											</div>
										</div>

										<div id="cc" class="collapse">
											<div class="form-group">
												<label for="Cc" class="col-sm-2 control-label">참조:</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="Cc" />
												</div>
											</div>
											<div class="form-group">
												<label for="Bcc" class="col-sm-2 control-label">숨은참조:</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="Bcc">
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="Bcc" class="col-sm-2 control-label">보내는 사람:</label>
											<div class="col-sm-6">
												<div class="btn-group">
													<button type="button" class="btn btn-default dropdown-toggle width-230" data-toggle="dropdown">
														<i class="fa fa-ellipsis-horizontal"></i><span class="float-left"><strong>faint@faint.com</strong></span> <span class="float-right"><i class="fa fa-angle-down"></i></span>
													</button>
													<ul class="dropdown-menu">
														<li><a href="#">faint@faint.com</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="Bcc" class="col-sm-2 control-label">서명:</label>
											<div class="col-sm-6">
												<div class="btn-group">
													<button type="button" class="btn btn-default dropdown-toggle width-230" data-toggle="dropdown">
														<i class="fa fa-ellipsis-horizontal"></i><span class="float-left"><strong>Signature</strong></span> <span class="float-right"><i class="fa fa-angle-down"></i></span>
													</button>
													<ul class="dropdown-menu">
														<li><a href="#">Signature</a></li>
													</ul>
												</div>
											</div>
										</div>
										
										

										<div class="form-group">
											<label for="subject" class="col-sm-2 control-label">제목:</label>
											<div class="col-sm-10">
												<div class="input-group">
													<input type="text" class="form-control" name="subject" id="subject" />
												</div>
											</div>
										</div>

										<div class="clearfix"></div>
										<textarea class="summernote" name="content" id="content"></textarea>

										<div class="text-center footer-message">
											<a href="javascript:;" onclick="emailReset()" class="btn btn-default"><i class="fa fa-times-circle"></i> 리셋</a> <a href="javascript:;" id="email_send_btn" class="btn btn-primary"><i class="fa fa-share fa-fw"></i> 메일 전송</a>
										</div>

									</form>




								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT -->


	</div>
	<!-- END WRAPPER -->
	<!-- BEGIN CHAT MENU -->
	<nav id="menu-right">
		<ul>
			<li class="mm-label label-big">ONLINE</li>
			<li class="img no-arrow have-message"><span class="inside-chat"> <i class="online"></i> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3" /> <span class="chat-name">Alexa Johnson</span> <span class="pull-right badge badge-danger hide">3</span> <span>Los Angeles</span>
			</span>
				<ul class="chat-messages">
					<li class="img"><span> <span class="chat-detail"> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3" /> <span class="chat-bubble"><span class="bubble-inner">Hi you!</span></span>
						</span>
					</span></li>
					<li class="img"><span> <span class="chat-detail"> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3" /> <span class="chat-bubble"><span class="bubble-inner">You there?</span></span>
						</span>
					</span></li>
					<li class="img"><span> <span class="chat-detail"> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3" /> <span class="chat-bubble"> <span class="bubble-inner">Let me know when you come back</span>
							</span>
						</span>
					</span></li>
					<li><span class="chat-input"> <input type="text" class="form-control send-message" placeholder="Type your message" />
					</span></li>
				</ul></li>
			<li class="img no-arrow"><span class="inside-chat"> <i class="online"></i> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar2.png" alt="avatar 2" /> <span class="chat-name">Bobby Brown</span> <span>New York</span>
			</span>
				<ul class="chat-messages">
					<li><span class="chat-input"> <input type="text" class="form-control send-message" placeholder="Type your message" />
					</span></li>
				</ul></li>
			<li class="img no-arrow"><span class="inside-chat"> <i class="busy"></i> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar13.png" alt="avatar 13" /> <span class="chat-name">Fred Smith</span> <span>Atlanta</span>
			</span>
				<ul class="chat-messages">
					<li><span class="chat-input"> <input type="text" class="form-control send-message" placeholder="Type your message" />
					</span></li>
				</ul></li>
			<li class="img no-arrow"><span class="inside-chat"> <i class="away"></i> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar4.png" alt="avatar 4" /> <span class="chat-name">James Miller</span> <span>Seattle</span>
			</span>
				<ul class="chat-messages">
					<li><span class="chat-input"> <input type="text" class="form-control send-message" placeholder="Type your message" />
					</span></li>
				</ul></li>
			<li class="img no-arrow"><span class="inside-chat"> <i class="online"></i> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar5.png" alt="avatar 5" /> <span class="chat-name">Jefferson Jackson</span> <span>Los Angeles</span>
			</span>
				<ul class="chat-messages">
					<li><span class="chat-input"> <input type="text" class="form-control send-message" placeholder="Type your message" />
					</span></li>
				</ul></li>
			<li class="mm-label label-big m-t-30">OFFLINE</li>

			<li class="img no-arrow"><span class="inside-chat"> <i class="offline"></i> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar6.png" alt="avatar 6" /> <span class="chat-name">Jordan</span> <span>Savannah</span>
			</span>
				<ul class="chat-messages">
					<li><span class="chat-input"> <input type="text" class="form-control send-message" placeholder="Type your message" />
					</span></li>
				</ul></li>
			<li class="img no-arrow"><span class="inside-chat"> <i class="offline"></i> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar7.png" alt="avatar 7" /> <span class="chat-name">Kim Addams</span> <span>Birmingham</span>
			</span>
				<ul class="chat-messages">
					<li><span class="chat-input"> <input type="text" class="form-control send-message" placeholder="Type your message" />
					</span></li>
				</ul></li>
			<li class="img no-arrow"><span class="inside-chat"> <i class="offline"></i> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar8.png" alt="avatar 8" /> <span class="chat-name">Meagan Miller</span> <span>San Francisco</span>
			</span>
				<ul class="chat-messages">
					<li><span class="chat-input"> <input type="text" class="form-control send-message" placeholder="Type your message" />
					</span></li>
				</ul></li>
			<li class="img no-arrow"><span class="inside-chat"> <i class="offline"></i> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar9.png" alt="avatar 9" /> <span class="chat-name">Melissa Johnson</span> <span>Austin</span>
			</span>
				<ul class="chat-messages">
					<li><span class="chat-input"> <input type="text" class="form-control send-message" placeholder="Type your message" />
					</span></li>
				</ul></li>
			<li class="img no-arrow"><span class="inside-chat"> <i class="offline"></i> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar12.png" alt="avatar 12" /> <span class="chat-name">Nicole Smith</span> <span>San Diego</span>
			</span>
				<ul class="chat-messages">
					<li><span class="chat-input"> <input type="text" class="form-control send-message" placeholder="Type your message" />
					</span></li>
				</ul></li>
			<li class="img no-arrow"><span class="inside-chat"> <i class="offline"></i> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar11.png" alt="avatar 11" /> <span class="chat-name">Samantha Harris</span> <span>Salt Lake City</span>
			</span>
				<ul class="chat-messages">
					<li><span class="chat-input"> <input type="text" class="form-control send-message" placeholder="Type your message" />
					</span></li>
				</ul></li>
			<li class="img no-arrow"><span class="inside-chat"> <i class="offline"></i> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar10.png" alt="avatar 10" /> <span class="chat-name">Scott Thomson</span> <span>Los Angeles</span>
			</span>
				<ul class="chat-messages">
					<li><span class="chat-input"> <input type="text" class="form-control send-message" placeholder="Type your message" />
					</span></li>
				</ul></li>
		</ul>
	</nav>
	<!-- END CHAT MENU -->

	<!-- 모달창 -->
<%@ include file="/WEB-INF/views/common/modal_msg.jsp"%>
	<!-- //모달창 끝 -->

	<!-- BEGIN MANDATORY SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery-1.11.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery-migrate-1.2.1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery-ui/jquery-ui-1.10.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery-mobile/jquery.mobile-1.4.2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/bootstrap-dropdown/bootstrap-hover-dropdown.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/bootstrap-select/bootstrap-select.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/mcustom-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/mmenu/js/jquery.mmenu.min.all.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/nprogress/nprogress.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/charts-sparkline/sparkline.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/breakpoints/breakpoints.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/numerator/jquery-numerator.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
	<!-- END MANDATORY SCRIPTS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/summernote/summernote.min.js"></script>
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>
	<!-- include summernote css/js-->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>



	<!-- END PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/application.js"></script>
	<script>
		$(document).ready(function() {
			$('.summernote').summernote({
				height : 300, // set editor height
				minHeight : null, // set minimum height of editor
				maxHeight : null, // set maximum height of editor
				focus : true
			// set focus to editable area after initializing summernote
			});
		});
	</script>
</body>

</html>
