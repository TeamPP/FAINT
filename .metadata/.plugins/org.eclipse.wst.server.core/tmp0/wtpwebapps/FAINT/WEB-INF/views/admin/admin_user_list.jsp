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
<!--[if gt IE 8]><!--> <html class="no-js sidebar-large"> <!--<![endif]-->

<head>
    <!-- BEGIN META SECTION -->
    <meta charset="utf-8">
    <title>Pixit - Responsive Boostrap3 Admin</title>
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
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/modernizr/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    
    <!-- 모달 부트스트랩 -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/js/upload.js"></script>
    <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" >
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>

<body data-page="posts" class="posts">
   	<!-- BEGIN TOP MENU -->
		<%@include file="common/common_top.jsp" %>
	<!-- END TOP MENU -->
	<!-- BEGIN WRAPPER -->
	<div id="wrapper">
	
	<!--  left side bar -->
	<%@include file ="common/common_left.jsp" %>
        <!-- BEGIN MAIN CONTENT -->
        <div id="main-content">
            <div class="top-page clearfix">
                <div class="page-title pull-left">
                    <h3 class="pull-left"><strong>Manage Articles</strong></h3>
                </div>
                 <div class="pull-right">
                    <a href="post_edit.html" class="btn btn-primary m-t-10"><i class="fa fa-plus p-r-10"></i> Add a Post</a>
                </div>
            </div>
            <div class="top-menu">
                <a href="#"><strong>All</strong></a><span class="label label-default m-l-10">112</span> <span class="c-gray p-l-10 p-r-5">|</span>
                <a href="#">Draft</a><span class="label label-default m-l-10">18</span> <span class="c-gray p-l-10 p-r-5">|</span>
                <a href="#">Deleted</a><span class="label label-default m-l-10">42</span> <span class="c-gray p-l-10 p-r-5">|</span>
                <a href="#">Scheduled</a><span class="label label-default m-l-10">4</span>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 table-responsive">
                    <div class="filter-checkbox">
                        <select>
                            <option value="">Bulk Actions</option>
                            <option value="delete">Deleted</option>
                            <option value="publish">Published</option>
                            <option value="draft">Draft</option>
                        </select>
                        <a href="#" class="btn btn-default">Apply</a>
                        <button type="submit" class="btn btn-default" onclick="deletebox()">삭제</button>
                        <button type="submit" class="btn btn-default" onclick="PStopBox()">영구정지</button>
                        <button type="submit" class="btn btn-default" onclick="StopBox()">정지</button>
                    </div>
                    <table id="posts-table" class="table table-tools table-striped">
                       <thead>
							<tr>
								<th style="min-width: 50px"><input type="checkbox"
									class="check_all" /></th>
								<th>번호</th>	
								<th>이메일</th>
								<th>이름</th>
								<th>사용자 이름</th>
								<th>연락처</th>
								<th>웹사이트</th>
								<th>성별</th>
								<th>유저 권한</th>
								<th>생성된 날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${AUList}" var="UserVO" varStatus = "status">
								<tr>
									<c:choose>
										<c:when test = "${UserVO.prilevel != 9 }">
										<td><input name="check" type="checkbox" value="${UserVO.id}"></td></c:when>
										<c:otherwise>
										<td><input name="check" type="checkbox" value="${UserVO.id}" disabled></td>
										</c:otherwise>
									</c:choose>
									<td><a href="/member/${UserVO.nickname}">${UserVO.id}</a></td>
									<td><a href="/member/${UserVO.nickname}">${UserVO.email}</a></td>
									<td><a href="/member/${UserVO.nickname}">${UserVO.name}</a></td>
									<td><a href="/member/${UserVO.nickname}">${UserVO.nickname}</a></td>
									<td>${UserVO.phonenumber}</td>
									<td><a href="http://${UserVO.website}">${UserVO.website}</a></td>
									<c:choose>
										<c:when test ="${UserVO.sex == 1}"><td>남성</td></c:when>
										<c:when test ="${UserVO.sex == 2}"><td>여성</td></c:when>
										<c:otherwise><td>자웅동체</td></c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test ="${UserVO.prilevel == 0}"><td>미인증</td></c:when>
										<c:when test ="${UserVO.prilevel == 1}"><td>일반</td></c:when>
										<c:when test ="${UserVO.prilevel == 4}"><td>정지</td></c:when>
										<c:when test ="${UserVO.prilevel == 5}"><td>영구정지</td></c:when>
										<c:when test ="${UserVO.prilevel == 9}"><td>관리자</td></c:when>
										<c:otherwise><td>x</td></c:otherwise>
									</c:choose>
									<td><fmt:formatDate value="${UserVO.regdate}" type="both" pattern="yyyy년 MM월 dd일 HH시mm분ss초 E요일"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
                </div>
            </div>
            <div class="box-footer">
				<div class="text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link"
								href="${pageMaker.startPage - 1}" tabindex="-1">&laquo;</a></li>
						</c:if>
 						<c:if test="${not pageMaker.prev}">
							<li class="page-item"><a class="page-link"
								href="${pageMaker.startPage - 1}" tabindex="-1">&laquo;</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var='idx'>
							<li <c:out value="${pageMaker.ac.page == idx?'class =active page-item':'class =page-item' }"/>><a
										class="page-link" href="${idx}">${idx }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item"><a class="page-link" href="${pageMaker.endPage +1}">&raquo;</a></li>
						</c:if>
						<c:if test="${not pageMaker.next || pageMaker.endPage <= 0}">
							<li class="page-itemv"><a class="page-link" href="${pageMaker.endPage}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
    </div>
	<form id="jobForm">
		<input type="hidden" name="page" value="${pageMaker.ac.page}">
		<input type='hidden' name="perPageNum" value="${pageMaker.ac.perPageNum}">
	</form>
    <!-- END WRAPPER -->
    <!-- BEGIN CHAT MENU -->
    <nav id="menu-right">
        <ul>
            <li class="mm-label label-big">ONLINE</li>
            <li class="img no-arrow have-message">
                <span class="inside-chat">
                    <i class="online"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3"/>
                    <span class="chat-name">Alexa Johnson</span>
                    <span class="pull-right badge badge-danger hide">3</span>
                    <span>Los Angeles</span>
                </span>
                <ul class="chat-messages">
                    <li class="img">
                        <span>
                            <span class="chat-detail">
                                <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3"/>
                                <span class="chat-bubble"><span class="bubble-inner">Hi you!</span></span>
                            </span>
                        </span>
                    </li>
                    <li class="img">
                        <span>
                            <span class="chat-detail">
                                <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3"/>
                                <span class="chat-bubble"><span class="bubble-inner">You there?</span></span>
                            </span>
                        </span>
                    </li>
                    <li class="img">
                        <span>
                            <span class="chat-detail">
                                <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3"/>
                                <span class="chat-bubble">
                                    <span class="bubble-inner">Let me know when you come back</span>
                                </span>
                            </span>
                        </span>
                    </li>
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="online"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar2.png" alt="avatar 2"/>
                    <span class="chat-name">Bobby Brown</span>
                    <span>New York</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="busy"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar13.png" alt="avatar 13"/>
                    <span class="chat-name">Fred Smith</span>
                    <span>Atlanta</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="away"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar4.png" alt="avatar 4"/>
                    <span class="chat-name">James Miller</span>
                    <span>Seattle</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="online"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar5.png" alt="avatar 5"/>
                    <span class="chat-name">Jefferson Jackson</span>
                    <span>Los Angeles</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="mm-label label-big m-t-30">OFFLINE</li>

            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar6.png" alt="avatar 6"/>
                    <span class="chat-name">Jordan</span>
                    <span>Savannah</span>
                </span>
                <ul class="chat-messages">
                   <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar7.png" alt="avatar 7"/>
                    <span class="chat-name">Kim Addams</span>
                    <span>Birmingham</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar8.png" alt="avatar 8"/>
                    <span class="chat-name">Meagan Miller</span>
                    <span>San Francisco</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                        <i class="offline"></i>
                        <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar9.png" alt="avatar 9"/>
                        <span class="chat-name">Melissa Johnson</span>
                        <span>Austin</span>
                    </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar12.png" alt="avatar 12"/>
                    <span class="chat-name">Nicole Smith</span>
                    <span>San Diego</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar11.png" alt="avatar 11"/>
                    <span class="chat-name">Samantha Harris</span>
                    <span>Salt Lake City</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar10.png" alt="avatar 10"/>
                    <span class="chat-name">Scott Thomson</span>
                    <span>Los Angeles</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>
    <!-- END CHAT MENU -->
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
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/datatables/dynamic/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/datatables/dataTables.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/datatables/dataTables.tableTools.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/blog.js"></script>
    <!-- END  PAGE LEVEL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/application.js"></script>
    
<script>
function deletebox(){
	var checkArr = []; 
	$('input:checkbox[name=check]:checked').each(function () {
		checkArr.push($(this).val());
	});
	
	var allData = {"check" : checkArr};
	
		$.ajax({
			type : 'post',
			url : '/admin/user/delete',
			dataType : 'text',
			data : allData,
			success : function(result){
				if(result="SUCCESS"){
				alert("삭제 완료");
				
				}
			}
		});
    } 
function PStopBox(){
	var checkArr = []; 
	$('input:checkbox[name=check]:checked').each(function () {
		checkArr.push($(this).val());
	});
	
	var allData = {"check" : checkArr};
	
	$.ajax({
		type : 'post',
		url : '/admin/user/pstop',
		dataType : 'text',
		data : allData,
        beforeSend : function(xhr)
        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(result){
			if(result="SUCCESS"){
			alert("영구 정지 완료");
			}
		}
	});
}

function StopBox(){
	var checkArr = []; 
	$('input:checkbox[name=check]:checked').each(function () {
		checkArr.push($(this).val());
	});
		
	var allData = {"check" : checkArr};
		
		$.ajax({
			type : 'post',
			url : '/admin/user/stop',
			dataType : 'text',
			data : allData,
	        beforeSend : function(xhr)
	        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(result){
				if(result="SUCCESS"){
				alert("계정 정지 완료");
				}
			}
		});
	}

$(".pagination li a").on("click", function(event) {
	event.preventDefault();
	var targetPage = $(this).attr("href");
	var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "<c:url value='/admin/user'/>").attr("method", "get");
		jobForm.submit();
});
</script>
</body>
</html>


