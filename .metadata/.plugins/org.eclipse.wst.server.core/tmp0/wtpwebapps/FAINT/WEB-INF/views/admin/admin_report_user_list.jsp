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
                    </div>
					<table id="posts-table" class="table table-tools table-striped">
						<thead>
							<tr>
								<th style="min-width: 50px"><input type="checkbox"
									class="check_all" /></th>
								<th>번호</th>
								<th>제목</th>
								<th>신고 유형</th>
								<th>신고 대상</th>
								<th>작성자</th>
								<th>작성한 날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ARUList}" var="ReportVO">
								<tr>
									<td style="min-width: 50px"><input name="check" type="checkbox" value="${ReportVO.id}"></td>
									<td id = 'readId'><input type = 'hidden'  value = "${ReportVO.id}">${ReportVO.id}</td>
									<td id = 'readTitle' onclick = 'reportRead(this)'><a href='javascript:;' 
									style="<c:if test="${ReportVO.isRead ne 0}"> color : black; </c:if>" >${ReportVO.title}</a></td>
									<c:choose>
										<c:when test = "${ReportVO.cateid == 1}"><td>스팸</td></c:when>
										<c:when test = "${ReportVO.cateid == 2}"><td>음란물</td></c:when>
										<c:when test = "${ReportVO.cateid == 3}"><td>편파적 발언 및 상징</td></c:when>
										<c:when test = "${ReportVO.cateid == 4}"><td>폭력 또는 폭력 위협</td></c:when>
										<c:when test = "${ReportVO.cateid == 5}"><td>마약 판매 및 홍보</td></c:when>
										<c:when test = "${ReportVO.cateid == 6}"><td>괴롭힘 및 따돌림</td></c:when>
										<c:when test = "${ReportVO.cateid == 7}"><td>사칭</td></c:when>
										<c:when test = "${ReportVO.cateid == 8}"><td>지적 재산권 침해</td></c:when>
										<c:when test = "${ReportVO.cateid == 9}"><td>자해</td></c:when>
										<c:when test = "${ReportVO.cateid == 10}"><td>미성년자</td></c:when>
										<c:otherwise><td>넌 누구냐</td></c:otherwise>
									</c:choose>
									<td id = "reportIsRead"><input type = 'hidden'  value = "${ReportVO.isRead}">
									<a href="/member/${ReportVO.nickname}">${ReportVO.nickname}</a></td>
									<td><a href="/member/${ReportVO.writer}">${ReportVO.writer}</a></td>
									<td id = "reportReportId"><input type = 'hidden'  value = "${ReportVO.reportid}"> 
									<fmt:formatDate value="${ReplyVO.regdate}" type="both" pattern="yy년 MM월 dd일 HH시mm분ss초"/></td>
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

<script id="modalRead" type="text/x-handlebars-template">
<div id="myReadModal" class="readModal">
	<span class="close">&times;</span>
	<div class="readModal-content">

    </div>
</div>

<style>
.readModal-content{
width: 700px;
height: 500px;
padding: 16px;
}

.readTitle{
width:100px; 
height:10px;

}

.readtLine{
width:10px;
margin-top: 0;
margin-bottom: 0;
}

.cancel{
font-size: 12px;
font-weight: 200px;
cursor: pointer;
background: 0 0;
border-color: #dbdbdb;
color: #262626;
border-style: solid;
border-width: 1px;
line-height: 26px;
border-radius: 2px;
}


.readModal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.readModal-content {
    background-color: #fefefe;
    margin: auto;
    border: 1px solid #888;
    width: 30%;
    height: 70%;
    overflow: auto;
}

/* The Close Button */
.close {
    color: #fefefe;
    float: right;
    font-size: 50px;
    font-weight: bold;
    right:1.5%;
    top:0%;
    cursor: pointer;
    
    background: 0 0;
    border: 0;
    cursor: pointer;
    height: 36px;
    outline: 0;
    position: absolute;
    z-index: 2;
}

</style>
</script>

    
<script>
function reportRead(data){
	var id = $(data).siblings('#readId').children("input").val();
	var userid = ${login.id};
	var ReportId = $(data).siblings('#reportReportId').children("input").val();
	var IsRead = $(data).siblings('#reportIsRead').children("input").val();
	
	console.log(id);
	console.log(userid);
	console.log(ReportId);
	console.log(IsRead);
	
	if(id != ReportId && userid != IsRead){
	  	$.ajax({
			type : 'post',
			url : '/admin/report/user/read/check',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				reportid : id,
				userid : userid
			}),
	         beforeSend : function(xhr)
	         {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	         },
			success : function(result) {
			}
		});
	}

	$.getJSON("/admin/report/user/read/" + id, function(data){
		if(data.length!=0){
			var reportList="";         	
				reportList+="<div class='readtitle'><strong>유저 신고</strong></div>";
				reportList+="<hr class = 'readLine'>";
				reportList+="<div class='box-body'>";
				reportList+="<div class='form-group'>";
				reportList+="<label for='title'>Title</label> <input type='text' id = 'title' class='form-control' value = "+data.title+" readonly>";
				reportList+="</div>";
				reportList+="<div class='form-group'>";
				reportList+="<label for='nickname'>Nickname</label> <input type='text' id = 'nickname' class='form-control' value = "+data.nickname+" readonly>";
				reportList+="</div>";
				reportList+="<div class='form-group'>";
				reportList+="<label for='writer'>Writer</label> <input type='text' id = 'writer' class='form-control' value= " +data.writer+ " readonly>";
				reportList+="</div>";
				reportList+="<div class='form-group'>";
				reportList+="<label for='caption'>Caption</label><textarea class='form-control' id = 'caption' rows='3' value = " + data.caption + " readonly>" + data.caption + "</textarea>";
				reportList+="</div>";
				reportList+="<div class='box-footer'>";
				reportList+="<button class='cancel'>취소</button>";
				reportList+="</div>";
				reportList+="</div>";

		      //모달창 불러오기
			var source=$("#modalRead").html();
			var read=Handlebars.compile(source);
			var readModal=read(data);
			$("body").append(readModal);
			$(".readModal-content").html(reportList);
		      
		      //modal창 보이기
			$("#myReadModal").css("display","block");
		      
		      //modal끄기 메서드-바깥부분
			$("#myReadModal").click(function(event){
		         if(event.target==this){
		            $("#myReadModal").css("display","none");
		            $("#myReadModal").remove();   
		         }
		    })
		      
		      //modal끄기 메서드-버튼부분
			$(".close:eq(0), .cancel:eq(0)").on("click", function(){
				event.preventDefault();
				$("#myReportModal").css("display","none");
				$("#myReportModal").remove();

			})
			}
		}); 
}
function deletebox(){
	var checkArr = []; 
	$('input:checkbox[name=check]:checked').each(function () {
		checkArr.push($(this).val());
	});
	
	var allData = {"check" : checkArr};
	
		$.ajax({
			type : 'post',
			url : 'admin/report/user/delete',
			dataType : 'text',
			data : allData,
	         beforeSend : function(xhr)
	         {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	         },
			success : function(result){
				if(result="SUCCESS"){
				alert("삭제 완료");
				
				}
			}
		});
}
$(".pagination li a").on("click", function(event) {
	event.preventDefault();
	var targetPage = $(this).attr("href");
	var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "<c:url value='/admin/report/user'/>").attr("method", "get");
		jobForm.submit();
});
</script>

</body>
</html>


