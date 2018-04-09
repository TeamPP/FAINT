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
<title>회원관리|OUR PLANNERS</title>
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
<!-- END  MANDATORY STYLE -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/modernizr/modernizr-2.6.2-respond-1.1.0.min.js"></script>


<script>
	$(document).ready(function() {
		getMemberListByAdmin(1);
	});
	function memberAdminPaging(nowPage, is_admin, member_type) {
		getMemberListByAdmin(nowPage, is_admin, member_type);
	}
	//리스트 가져오기
	function getMemberListByAdmin(nowPage, is_admin, member_type) {
		nowPage = typeof nowPage !== 'undefined' ? nowPage : 1;
		is_admin = typeof is_admin !== 'undefined' ? is_admin : "";
		member_type = typeof member_type !== 'undefined' ? member_type : "";
		var url = "${pageContext.request.contextPath}/admin/json/member_list.json";
		var inHTML = "";
		var inHTMLPaging = "";
		$("#memberTBody").empty();
		var params = "nowPage=" + nowPage + "&is_admin=" + is_admin + "&member_type=" + member_type;
		//alert(url + params);
		$.ajax({
			url : url,
			dataType : "json",
			type : "get",
			data : params,
			contentType : "text/html; charset=utf-8",
			success : function(data) {
				$.each(data.memberLists, function(index, memberObj) { // each로 모든 데이터 가져와서 items 배열에 넣고
					//<span class="label label-default"><i class="fa fa-tag f-10 p-r-5 c-gray-light"></i> jquery</span>
					inHTML += "<tr>";
					inHTML += "<td class=\"\">";
					inHTML += "	<input type=\"checkbox\" class=\"id\" id=\"id\" name=\"id\" value=\""+memberObj.id+"\" />";
					inHTML += "</td>";
					inHTML += "<td class=\"\">";
					inHTML += "" + memberObj.id + "";
					inHTML += "</td>";
					inHTML += "<td class=\"\">";
					inHTML += "" + memberObj.nickname + "";
					inHTML += "</td>";
					inHTML += "<td class=\"\">";
					inHTML += "" + memberObj.email + "";
					inHTML += "</td>";
					inHTML += "<td class=\"\">";
					inHTML += "" + memberObj.regdate + "";
					inHTML += "</td>";
					inHTML += "<td class=\"\">";
					if (memberObj.prilevel ==9)
						inHTML += "관리자";
					else {
						if (memberObj.prilevel == 1)
							inHTML += "회원님 ";
						else if (memberObj.prilevel == 0)
							inHTML += "가입대기중 ";
					}
					inHTML += "</td>";
					inHTML += "<td class=\"\">";
					inHTML += "<a href=\"${pageContext.request.contextPath}/member/myinfo?action=modifyAdmin&modify_id=" + memberObj.id + "\"target=\"_blank\">조회/수정</a>";
					inHTML += "</td>";
					inHTML += "</tr>";
				});//each끝
				inHTML += "<div class=\"row text-center\">";
				inHTML += "<ul class=\"pagination\" id=\"memberPagingDiv\">";
				inHTML += "</ul> </div>";
				inHTML += "		</div>";
				inHTML += "		</div>";
				$("#memberTBody").html(inHTML);
				$("#memberPagingDiv").html(data.pagingDiv);
			},
			error : function(e) {
				popLayerMsg("AJAX Error 발생" + e.status + ":" + e.statusText);
			}
		});
	}



</script>

</head>

<body data-page="members">

	<!-- BEGIN TOP MENU -->
	<%@include file="common/common_top.jsp"%>
	<!-- END TOP MENU -->
	<!-- BEGIN WRAPPER -->
	<div id="wrapper">

		<!--  left side bar -->
		<%@include file="common/common_left.jsp"%>


		<!-- BEGIN MAIN CONTENT -->
		<div id="main-content">
			<div class="top-page clearfix">
				<div class="page-title pull-left">
					<h3 class="pull-left">
						<strong>회원 관리</strong>
					</h3>
				</div>
				<div class="pull-right">
					<a href="${pageContext.request.contextPath}/admin/regist" class="btn btn-primary m-t-10"><i class="fa fa-plus p-r-10"></i> 회원 생성</a>
				</div>
			</div>
			<div class="top-menu">
				<a href="#"><strong>모든 회원</strong></a><span class="label label-default m-l-10">9</span> <span class="c-gray p-l-10 p-r-5">|</span> <a href="#">최고 관리자</a><span class="label label-default m-l-10">2</span> <span class="c-gray p-l-10 p-r-5">|</span> <a href="#">개인 회원</a><span class="label label-default m-l-10">3</span> <span class="c-gray p-l-10 p-r-5">|</span> <a href="#">기업 회원</a><span class="label label-default m-l-10">4</span>
			</div>
			<div class="row">
				<form id="adminMemberListForm">
					<div class="col-md-12 col-sm-12 col-xs-12 table-responsive">
						<div class="filter-checkbox pull-right">
							<button id="checkedMemberDeleteBtn" type="button" class="btn btn-danger">삭제</button>

						</div>
						<table id="posts-table" class="table table-tools table-striped">
							<%-- <colgroup>
							<col width="10px" />
							<col width="120px" />
							<col width="*" />
							<col width="80px" />
							<col width="80px" />
							<col width="150px" />
							<col width="120px" />
						</colgroup> --%>
							<thead>
								<tr>
									<th style="min-width: 50px">

										<input type="checkbox" id="toggle_check_all" class="check_all" />
									</th>
									<th>아이디</th>
									<th>이름</th>
									<th>이메일</th>
									<th>가입일</th>
									<th>회원구분</th>
									<th>조회/수정</th>
									<!-- <th class="text-center">접속상태</th> -->
								</tr>
							</thead>
							<tbody id="memberTBody">

								<tr>
									<td>
										<input type="checkbox" />
									</td>
									<td>
										<a href="post_edit.html">Geolocation API</a>
									</td>
									<td>
										<a href="profil_edit.html">Fred Aster</a>
									</td>
									<td>
										<a href="#">Javascript</a>
									</td>
									<td>
										<span class="label label-default"><i class="fa fa-tag f-10 p-r-5 c-gray-light"></i> map</span> <span class="label label-default"><i class="fa fa-tag f-10 p-r-5 c-gray-light"></i> jquery</span>
									</td>
									<td>06/10/2014</td>
									<td>5</td>
									<!-- <td class="text-center">
                                    <span class="label label-success w-300">Online</span>
                                </td> -->
								</tr>

							</tbody>
						</table>
					</div>
				</form>

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

	<!-- 모달창 메시지 -->
<%@ include file="/WEB-INF/views/common/modal_msg.jsp"%>
	<!--// 모달창 메시지 -->

	<!-- BEGIN MANDATORY SCRIPTS -->

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
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/quicksearch/jquery.quicksearch.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/members.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/application.js?v=155"></script>
</body>
</html>