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
    
	<style>
	span{ display: inline-block;
	}
	.postModal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 15vh; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content */
.postModal-content {
    background-color: #fefefe;
    margin: auto;
    width: 935px;
    height: 600px;
}

.postContainerWrp{
   text-align : center;
   margin-top: 35px;
}


.postContainer{
   display: inline-block;
   width: 935px;
   max-width: 935px; !important
}
.postLiner{
   display:flex !important; 
   width:100%;
   display: inline-block;
}
.imageContainer{
   height:100%;
   width:33%;
   margin: 0.5% 0.5% 0.5% 0.5%;
   position: relative;
}
.imageContainer > img{
   overflow:hidden;
   object-fit:cover;
   cursor:pointer;
}
.imageContainer > div{
	position: absolute;
	background-color: rgba(0,0,0,0.5);
	top:0;
	bottom:0;
	left:0;
	right:0;
	text-align:center;
	vertical-align:middle;
	color: white;
	font-size: 21px;
	line-height: 100%;
	cursor:pointer;
}
.imageContainer > div > span{
	top:0;
	bottom:0;
	left:0;
	right:0;
	margin-top:45%;
}
.multiFile{
	position: absolute;
	height: 39px;
	width: 39px;
	background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png");
	background-position: -360px -104px;
	right: 8px;
	top: 8px; 
}
.likeIcon{
	height: 21px;
	width: 21px;
	background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png");
	background-position: -404px -156px;
	color: rgba(0,0,0,0);
}
.replyIcon{
	height: 21px;
	width: 21px;
	background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png");
	background-position: -404px -115px;
	color: rgba(0,0,0,0);
}
</style>
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
                <a href="#">여행</a><span class="label label-default m-l-10">18</span> <span class="c-gray p-l-10 p-r-5">|</span>
                <a href="#">영상</a><span class="label label-default m-l-10">42</span> <span class="c-gray p-l-10 p-r-5">|</span>
                <a href="#">음악</a><span class="label label-default m-l-10">4</span>
                <a href="#">음식</a><span class="label label-default m-l-10">4</span>
                <a href="#">글귀</a><span class="label label-default m-l-10">4</span>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 table-responsive">
                    <div class="filter-checkbox">
                        <select>
                        	<option value="id">아이디</option>
                            <option value="email">이메일</option>
                            <option value="nickname">닉네임</option>
                            <option value="category">카테고리</option>
                        </select>
                        <input type = "text" name = "searchbox"/>
                        <button type="submit" class="btn btn-default" onclick="search()">검색</button>
                        <button type="submit" class="btn btn-default" onclick="deletebox()">삭제</button>
                        <button type="submit" class="btn btn-default" onclick="blockbox()">게시글 차단</button>
                    </div>

                    <table id="posts-table" class="table table-tools table-striped">
                       <thead>
							<tr>
								<th style="min-width: 50px"><input type="checkbox" class="check_all" /></th>
								<th>번호</th>	
								<th>이메일</th>
								<th>사용자 이름</th>
								<th>카테고리</th>
								<th>작성한 날짜</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${APList}" var="PostVO">
								<tr>
									<td><input name="check" type="checkbox" value="${PostVO.postid}"></td>
									<td><a href="/member/${PostVO.nickname}">${PostVO.postid}</a></td>
									<td><a href="/member/${PostVO.nickname}">${PostVO.nickname}</a></td>
									<td><a href="/member/${PostVO.nickname}">${PostVO.email}</a></td>
									<c:choose>
										<c:when test = "${PostVO.cateid == 1}"><td>여행</td></c:when>
										<c:when test = "${PostVO.cateid == 2}"><td>영화</td></c:when>
										<c:when test = "${PostVO.cateid == 3}"><td>음악</td></c:when>
										<c:when test = "${PostVO.cateid == 4}"><td>음식</td></c:when>
										<c:when test = "${PostVO.cateid == 5}"><td>글귀</td></c:when>
									</c:choose>
									<td><fmt:formatDate value="${PostVO.regdate}" type="both" pattern="yy년 MM월 dd일 HH시mm분ss초"/></td>
									<td id = "postRead" onclick = "postRead(this)"><button  value = "${PostVO.postid}">게시물 상세보기</button></td>
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
    
<!-- post개별 게시물 모달팝업 -->
<script id="modalPost" type="text/x-handlebars-template">
<div id="myModal" class="postModal">
   <span class="close">&times;</span>
   <div class="postModal-content">
      
      <!--사진 및 동영상 -->    
		<section class="section1">
			<div class="popImageContainer">
			</div>
			<!-- 왼쪽 이미지 이동 버튼 -->
			<a class="_5wmqs _pak6p coreSpriteLeftChevron" role="button" id="moveLeft" style ="display: none" onclick="moveLeft()">
				<i class="fa fa-chevron-circle-left"></i>
			</a>

			<!-- 오른쪽 이미지 이동 버튼 -->
			<a class="_5wmqs _by8kl coreSpriteRightChevron" role="button" id="moveRight" onclick="moveRight()">
				<i class="fa fa-chevron-circle-right"></i>
			</a>

			<!-- 사진 몇개인지 표시 -->
			<div class=" _g5463"> 
				<table class="positionDot">
					<tbody>
						<tr>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

      <section class="section2">
         <div class="s2_1">
            <div class="s2_1_1">
               <a href="/member/{{usernickname}}">
                  <img class="s2_1_1_1">   <!-- 프사 -->
               </a>
               <span class="s2_1_1_2">
                  <a href="/member/{{usernickname}}">
                     <p class="nickname">{{usernickname}}</p>  <!-- 닉네임 -->
                  </a>
                  <a class="_postLocation" href="/search/locations?location={{location}}">
                     <p class="location">{{location}}</p> <!-- 위치 -->
                  </a>
               </span>
            </div>
         </div>
            
         <div class="s2_2">
            <div class="s2_2_1" id="post{{postid}}">
               <a href="/member/{{usernickname}}"><span class="nickname">{{usernickname}}</span></a>  <!-- 닉네임 -->
               <span class="caption">{{caption}}</span>
               <div class="replyContainer" title="{{postid}}" data-limit=0>
               </div>
            </div> 
         </div>
 
         <div class="s2_3">
            <div class="s2_3_1">
               <div class="btnContainer" title="{{postid}}">
               </div>
               <a class="likeContainer" title="{{postid}}">좋아요 <span>0</span>개</a>
            </div>
         </div>

         <div class="s2_4">
            <div class="s2_4_1" title="{{postid}}">
               <!-- 댓글달기 -->
               <input class="replyRegist" onkeypress="registReply(this, event);" type="textarea" placeholder="댓글 달기..." name="replyCaption">
            </div>
         </div>
        </section>
   </div>
</div>
<style>
.postModal-content { position: relative; background-color: #fefefe; margin: auto; width: 935px; height: 600px; }
.postModal-content > i { position: absolute; font-size: 80px; color: white; top: 44%; }
.postLeft {left: -7%; cursor: pointer;}
.postRight {right: -7%; cursor: pointer;}
.section1{width: 600px; height: 600px; display: inline-block; float: left; position: relative; background-color: black; }
#moveLeft > i{ border-radius: 150px; border: none; margin: 8px 8px 8px; left:0; margin-top: 48%; position: absolute; font-size: 30px; color: white; opacity: 0.7;}
#moveRight > i{ border-radius: 150px; border: none; margin: 8px 8px 8px 0; right:0; margin-top: 48%; position: absolute; font-size: 30px; color: white; opacity: 0.8;}    
.popPostImage{ position: absolute; max-width: 100%; max-height: 100%; width: auto; height: auto; margin: auto; top: 0; bottom: 0; left: 0; right: 0; }
.section2{ width: 335px; height: 100%; display: inline-block; text-align: center; padding-left: 20px; padding-right: 20px; }
.s2_1{ padding-top: 20px; padding-bottom: 20px; height: 78px; text-align: left; border-bottom: 1.3px solid #efefef; }
.s2_1_1{ height: 100%; display: inline-block; }
.s2_1_1_1{ width: 45px; height: 45px; display: inline-block; float: left; border-radius: 50%; }
.s2_1_1_2{ width: 235px; margin-left: 10px; display: inline-block; }
.nickname{ font-weight: bold; }
.s2_2{ width: 100%; height: auto; padding-top: 16px; padding-bottom: 16px; text-align: left; border-bottom: 1.3px solid #efefef; }
.s2_2_1{ width: 100%; height: 352px; overflow-y: auto; }
.replyContainer{ margin-top: 20px; bottom: 0; }
.reply{ margin-bottom: 4px; }
.s2_3{ width: 100%; height: 85px; text-align: left; border-bottom: 1.3px solid #efefef; }
.s2_3_1{ padding: 10px 0 10px 0; height: 100%;}
.storeBtn{ height: 24px; width: 24px; background-image: url("http://hyunjoolee.pythonanywhere.com/static/images/sprites/fef349.png"); background-color: #fff; margin-left: 1140%; border: none; font-size: 0;}
.s2_4{ width: 100%; height: auto; }
.s2_4_1{ padding: 10px 0 10px 0; }
.replyRegist{ font-size: 15px; border: none; width: 100%; height: auto; float: left; }
.likeContainer{ font-weight: bold; cursor: default; margin-bottom : 100px;}
</style>
</script>

<!-- 좋아요 list Modal -->
<script id="modalLiker" type="text/x-handlebars-template">
<section class="section3">
	<div class="likersTitle">
		<div class="likersClose"><i class="material-icons">clear</i></div>
		<strong>좋아요</strong>
	</div>
	<ul id="likersContainer"></ul>
</section>

<style>
.section3{ width: 335px; height: 100%; display: inline-block; text-align: left; }
.likersClose { width:20px; height:20px; cursor: pointer; float:left; }
.likersTitle{ width: 100%; height: 7%; padding: 10px; font-size: 17px; text-align: center; border-bottom: 1.3px solid #efefef; }
.oneofList{ border-bottom: solid 1px #efefef; width: 100%; height: 53px; padding: 10px 16px; float: left; }
#likersContainer{ height: 93%; overflow-y: auto; width: 100%; list-style:none; padding:0; margin:0;}
.isFlw{ float: right; font-size: 12px; font-weight: 400; cursor: pointer; background: 0 0; border-color: #dbdbdb; color: #262626; border-style: solid;
	border-width: 1px; line-height: 26px; border-radius: 2px; }
.followPhoto{ width: 33px; height: 33px; display: inline-block; float: left; border-radius: 150px;  /* 프사 둥글게 */ }
a{ font-weight: bold; }
</style>
</script>

<!-- 선택메뉴창 팝업 -->
<script id="modalTemplate" type="text/x-handlebars-template">
   <div class="_pfyik" role="dialog" onclick="callRemoveDialog(event)">
   <div class="_23gmb"></div>
   <div class="_o0j5z" onclick="callRemoveDialog(event)">
   <div class="_784q7" id="modalChangeProfilePhoto" onclick="callRemoveDialog(event)">
   <ul class="_cepxb">
   </ul>
   </div>
   </div>
      <button class="_dcj9f"  onclick="callRemoveDialog(event)">닫기</button>
   </div>
<style>
._pfyik{background-color:rgba(0,0,0,.5);bottom:0;-webkit-box-pack:justify;-webkit-justify-content:space-between;-ms-flex-pack:justify;justify-content:space-between;left:0;overflow-y:auto;-webkit-overflow-scrolling:touch;position:fixed;right:0;top:0;z-index:3}
._dcj9f{background:0 0;border:0;cursor:pointer;height:36px;outline:0;overflow:hidden;position:absolute;right:0;top:0;z-index:4}
._dcj9f::before{color:#fff;content:'\00D7';display:block;font-size:36px;font-weight:600;line-height:36px;padding:0;margin:0}
._784q7{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;margin:auto;max-width:935px;pointer-events:auto;width:100%}
._23gmb{bottom:0;left:0;pointer-events:none;position:fixed;right:0;top:0;z-index:2}
._23gmb *{pointer-events:auto}
._o0j5z{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;min-height:100%;overflow:auto;width:auto;z-index:3}
@media (min-width:481px){._o0j5z{padding:0 40px;pointer-events:none;-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}
._o0j5z::after,._o0j5z::before{content:'';display:block;-webkit-flex-basis:40px;-ms-flex-preferred-size:40px;flex-basis:40px;-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0}}
@media (max-width:480px){._23gmb,._dcj9f{display:none}}

._h74gn{background:#fff;border:0;color:#262626;cursor:pointer;font-size:16px;font-weight:400;line-height:50px;margin:0;overflow:hidden;padding:0 16px;text-align:center;text-overflow:ellipsis;white-space:nowrap;width:100%}
._h74gn:hover{background-color:#efefef}
._hql7s,._o2wxh{background-color:#fff;border-bottom:1px solid #dbdbdb}
._o2wxh:last-child{border-bottom-width:0}
._hql7s{color:#999;font-size:16px;font-weight:600;line-height:50px;text-align:center}
@media (min-width:736px){._hql7s,._o2wxh{min-width:510px}}
@media (min-width:414px) and (max-width:735px){._cepxb,._hql7s,._o2wxh{width:100%}}
@media (min-width:414px){._cepxb{margin:0 auto}}
</style>
</script>

<script> 
$(".pagination li a").on("click", function(event) {
	event.preventDefault();
	var targetPage = $(this).attr("href");
	var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "<c:url value='/admin/reply'/>").attr("method", "get");
		jobForm.submit();
});

function deletebox(){
	var checkArr = []; 
	$('input:checkbox[name=check]:checked').each(function() {
		checkArr.push($(this).val());
	});
	
	var allData = {"check" : checkArr};
	
		$.ajax({
			type : 'post',
			url : '/admin/post/delete',
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
    
function blockbox(){
	var checkArr = []; 
	$('input:checkbox[name=check]:checked').each(function() {
		checkArr.push($(this).val());
	});
	
	var allData = {"check" : checkArr};
	
		$.ajax({
			type : 'post',
			url : '/admin/post/block',
			dataType : 'text',
			data : allData,
	         beforeSend : function(xhr)
	         {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	         },
			success : function(result){
				if(result="SUCCESS"){
				alert("게시글 비공개 완료");	
				}
			}
		});
}


   
function postRead(data){
    var pid = $(data).children("button").val();
    var curIndex=$(".imageContainer").index(this);

    	   $.ajax({
    	      type:"post",
    	      url:"/post/detail",
    	      headers:{
    	         "X-HTTP-Method-Override" : "POST"
    	      },
    	      beforeSend : function(xhr)
              {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              },
    	      data:{ postid : pid},
    	      datatype:"json",
    	      success:function(data){
    	         if(data!=null){
    	            //handlebar추가
    	            var source=$("#modalPost").html();
    	            var post=Handlebars.compile(source);
    	            var postmodal=post(data);
    	            $("body").append(postmodal);
    	            
    	            //현재 위치값 저장
    	            $(".postModal-content").data("index", curIndex);
    	          	//현재 위치값을 통해 움직이는 버튼 삭제 여부 결정
    	            if($(".imageContainer:has(img)").length==1){
    	            	$(".postModal-content > i").remove();
    	            }else if(curIndex == $(".imageContainer:has(img)").length-1){
    	            	$(".postRight").remove();
    	            }else if(curIndex == 0){
    	            	$(".postLeft").remove();
    	            }
    	          	
    	            //프로필 사진 삽입
    	            if(data.profilephoto!=null){
    	           	 $(".s2_1_1_1").attr("src", "http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+data.profilephoto)
    	            }else{
    	           	 $(".s2_1_1_1").attr("src", "/resources/img/emptyProfile.jpg")
    	            }
    	            
    		        //이미지 배열화
    		        var urlList=data.url.split('|');
    	        	//첨부 이미지or영상 수
    	          	var len = urlList.length;
    	        	if(len == 1){
    	        		$("#moveRight").css("display", "none");
    	        	}
    				//이미지 잘라서 삽입
    	          	for (var i in urlList) {
    	           	
    		           	//이미지일 경우(upload.js func)
    		           	if(checkImageType(urlList[i])){
    	                	$(".popImageContainer").append("<img class='popPostImage' id='image"+i+"' src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+urlList[i]+"'/>")
    	                	if(i!=0){$("#image"+i).css("display", "none");}
    	               
    					//영상일 경우(upload.js func)
    	           		}else if(checkVideoType(urlList[i])){
    		           		$(".popImageContainer").append("<video class='popPostImage' id='video"+i+"' loop='true' autoplay src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+urlList[i]+"'/>")
    		           		if(i!=0){$("#video"+i).css("display", "none"); $("#video"+i).autoplay=false; }
    	           	
    					//이미지나 영상타입이 아닐경우	
    	           		}else{
    	           			alert("지원하지 않는 타입의 파일형식을 포함하고 있음")
    	           		}
    	            
    	          	}
    				
    				//이미지 길이조정
    				$(".popPostImage").each(function(){
    				 	if(this.naturalWidth <= this.naturalHeight){
    						$(this).css("min-height", "100%");
    					}else if(this.naturalWidth > this.naturalHeight){
    						$(this).css("min-width", "100%");
    					}
    				})
    	            
    	            //저장하기 버튼 삽입
    	            if(data.isStore=='0'){
    	               $(".btnContainer").append("<span><button class='storeBtn' style='background-position: -78px -349px;'>저장하기</button></span>")
    	            }else{
    	               $(".btnContainer").append("<span><button class='storeBtn' style='background-position: -182px -349px;'>저장하기 취소</button></span>")
    	            }
    	            
    	            
    	            //modal창 보이기
    	            $("#myModal").css("display","block");
    	            
    	            //modal끄기 메서드-바깥부분
    	            $("#myModal").click(function(event){
    	               if(event.target==this){
    	                  $("#myModal").css("display","none");
    	                  $("#myModal").remove();
    	               }
    	            })
    	           

    	            
    	            //modal끄기 메서드-버튼부분
    	            $(".close:eq(0)").on("click", function(){
    	               $("#myModal").css("display","none");
    	               $("#myModal").remove();
    	            })
    	            
    	            //포스트 움직이기 버튼 함수 적용
    	    		$(".postLeft").on("click", function(){
    	    			var curIndex=$(".postModal-content").data("index");
    	    			$(".close:eq(0)").trigger("click");
    	    			$(".imageContainer:eq("+(curIndex-1)+")").trigger("click");
    	    		});
    	    		$(".postRight").on("click", function(){
    	    			var curIndex=$(".postModal-content").data("index");
    	    			$(".close:eq(0)").trigger("click");
    	    			$(".imageContainer:eq("+(curIndex+1)+")").trigger("click");
    	    		});
    	            
    	            reply();
    	            likerList();
    	            store();
    	         }
    	      }
    	 })
    }
	

    //메뉴 모달 취소버튼 - CSS처리
    function callRemoveDialog(event){
       if(typeof event != "undefined"){
          event.stopPropagation();
       }
       $("body").attr("sytle","");
       $("body").attr("aria-hidden","false");
       $("div[role='dialog']").remove();
    }

    //각 게시물에 댓글리스트 등록 처음 4개 이후 +20개씩('댓글 더보기' 기능이 수행)
    function reply(){
       $(".replyContainer").each(function(){
          var pid=$(this).attr("title"); //게시물 id값 title에 넣어서 이동
          var limit = $(this).data("limit"); //댓글 출력제한자
          var replyContainer = this;
          
          $.getJSON("/reply/post/" + pid, function(rpldata){
             if(rpldata.length==0){
                $(replyContainer).html("");
             }
             
            // 게시물에 대한 댓글리스트 + 삭제버튼(해당 유저의 게시글일 경우만)
            var replystr="";
            
            //댓글더보기 관련
            var replyLimit = 4; //최초댓글 표시 수
         	var replyMore = 10; //댓글더보기 클릭 시 추가되는 댓글 수
         	
            $(rpldata).each(function(index){
            	//댓글 최신 4개까지만 우선 출력 및 제한자에 따른 댓글 출력
                if( $(rpldata).length-(replyLimit+replyMore*limit) <= index && index < $(rpldata).length ){ //10개씩 더 출력
                   replystr +="<div class='reply' title='"+this.id+"'>"+
                      "<a href='/member/"+this.username+"'><span class='nickname'>" + this.username +"</span></a>\t<span>"+this.comment+"</span>";
                   
                   if(this.userid==${login.id} || this.postwriter==${login.id}){
                      replystr+="<a class='replyDelete' onclick='javascript:deleteReply(this);' style='cursor:pointer; float:right;' ><i class='material-icons' style='color:lightgray; font-size:18px;'>clear</i></a></li>";
                   }else{
                      replystr+="</div>";
                   };
                   
                   $(replyContainer).html(replystr);
                }
             });
             
             //전체 댓글 수가 4개 이하 or 제한자*10+4개면 댓글더보기 삭제
              if(rpldata.length<=replyLimit+replyMore*limit){ //20개씩 더 출력
                 $(replyContainer).children(".moreReply").remove();
             }else if($(replyContainer).siblings(".moreReply")[0]==undefined){
                $(replyContainer).prepend("<div class='moreReply'><a href='javascript:;'>댓글더보기</a></div>");
             }
             
             //댓글더보기 클릭시 제한자 +1 및 댓글 목록 재출력
             $(replyContainer).children(".moreReply").on("click", function(){
                $(replyContainer).data("limit", limit+1);
                reply();
             })
             //댓글 및 게시물에 태그 검색 필터
          });
       });
    }
    //댓글등록함수 = 댓글입력창에서 onkeypress로 작동 (태그 객체와 event키값 매개변수로 받음)
    function registReply(thisTag, key){
       var enter=key.keyCode||key.which;
       var comment=$(thisTag).val();
       if(enter==13&&comment.trim().length>0){
          var userid=${login.id};
          var postid=$(thisTag).parent().attr("title");
          $.ajax({
             type:"post",
             url:"/reply",
             headers:{
                "Content-Type" : "application/json",
                "X-HTTP-Method-Override" : "POST"
             },
             beforeSend : function(xhr)
             {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
             },
             dataType:"text",
             data:JSON.stringify({
                postid:postid,
                userid:userid,
                comment:comment.trim()
             }),
             success:function(result){
                if(result=="SUCCESS"){
                   reply();
                   $(thisTag).val("");
                   //댓글 창 스크롤 아래로
                   $(".s2_2_1").scrollTop($(".s2_2_1").height());
                   getPostList();
                };
             }
          });
       }
    }
    //댓글 삭제함수 = 댓글 삭제버튼에서 사용(태그객체 받음)
    function deleteReply(thisTag){
       var rid=$(thisTag).parent().attr("title");
       $.ajax({
          type:"delete",
          url:"/reply/"+rid,
          headers:{
             "Content-Type" : "application/json",
             "X-HTTP-Method-Override" : "DELETE"
          },
          beforeSend : function(xhr)
          {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
          },
          dataType:"text",
          success:function(result){
             if(result=="SUCCESS"){
                //리플리스트 초기화 및 게시물의 댓글 피드 재호출
                reply();
                getPostList();
             };
          }
       });
    }

    //게시물 저장하기 + 저장하기 취소 
    function store(){
    	var storeFlg=false;
       $(".storeBtn").on("click", function(){
          var postid=$(this).parents(".btnContainer").attr("title");
          var storeBtn=this;
          if(storeFlg){return;};
          storeFlg=true;
          if($(this).css("background-position")=="-78px -349px"){
             var type="post";
             var url ="/post/"+postid+"/store";
             var headers="{'X-HTTP-Method-Override' : 'POST'}";
             var val="-182px -349px";
             
          }else if($(this).css("background-position")=="-182px -349px"){
             var type="delete";
             var url ="/post/"+postid+"/takeaway";
             var headers="{'X-HTTP-Method-Override' : 'DELETE'}";
             var val="-78px -349px";
          }
          $.ajax({
             type: type,
             url: url,
             headers: headers,
             dataType:"text",
             beforeSend : function(xhr)
             {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
             },
             success:function(result){
                if(result=="SUCCESS"){
                   $(storeBtn).css("background-position", val);
                   storeFlg=false;
                };
             }
          });
       });
    };


    //좋아요 count+list
    function likerList(){
       $(".likeContainer").each(function(){
          var pid=$(this).attr("title");
          var likeContainer = this;
          
          $.getJSON("/post/" + pid + "/likerlist", function(data){
             var likerList="";
             var data=$(data)
             //좋아요 갯수가 1개 이상일때
             if(data.length>0){
                $(likeContainer).children("span").html(data.length);
                $(likeContainer).css("cursor", "pointer");
                
                //좋아요 리스트 클릭함수
                $(likeContainer).on("click", function(){
                    //원래 내용
                    $(".section2").hide();
                    
                	//handlebar추가
                    var source=$("#modalLiker").html();
                    var post=Handlebars.compile(source);
                    var postmodal=post(data);
                    $(".postModal-content").append(postmodal);
                    
                    var likers="";
                    data.each(function(){
            			console.log(this);
                        likers+="<li class='oneofList'><a href='/member/"+this.nickname+"'><img class='followPhoto' ";
                        
                       	// 프로필 사진이 있는경우 | 없는 경우
        				if(this.profilephoto != null){
        					likers+="src='http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122"+this.profilephoto+"' /></a>&nbsp &nbsp";
                    	}else{
                    		likers+="src='/resources/img/emptyProfile.jpg' /></a>&nbsp &nbsp";
                    	}
                       	// 이름이 있는 경우 | 없는 경우
                       	if(this.name != null){
                       		likers+="<div style='display:inline-block; line-height:16px;'><a href='/member/"+this.nickname+"'>" + this.nickname + "</a><p style='margin:0;'>"+this.name+"</p></div>"
                       	}else{
                       		likers+="<a style='line-height: 28px;' href='/member/"+this.nickname+"'>" + this.nickname + "</a>"
                       	}
                       	
                    })
                    
                    $("#likersContainer").html(likers)

                    
                    $(".likersClose").on("click", function(){
                    	$(".section3").remove();
                    	$(".section2").show();
                    })
                    
                });
                
                
             }else if(data.length==0){
                $(likeContainer).children("span").html(0);
             }
          }); 
       });
    };

    //css - 모달창 사진이동버튼
    		
    		//오른쪽으로 넘기기
    		function moveRight(){
    			var len = $(".popPostImage").length-1;
    			var curIdx = parseInt($(".popPostImage:visible").index());
    			var curObj = $(".popPostImage:visible");
    			var nextObj = curObj.next();
    			
    			//이미지 전환
    			curObj.css("display","none");
    			nextObj.css("display","block");
    			
    			//비디오 재생
    			if(curObj.next("video").length == 1){
    				nextObj.get(0).play();
    			}else if(curObj.is("video")){
    				curObj.get(0).pause();
    			}
    			//버튼 보이기
    			$("#moveLeft").css("display","block");
    			if(len == curIdx+1){
    				$("#moveRight").css("display","none");
    			}
    			//현재 표시 이미지 위치 변경
    			$("._5zbvx:eq("+curIdx+")").removeClass(" _c0g09");
    			$("._5zbvx:eq("+(curIdx+1)+")").addClass(" _c0g09");
    		}

    		//이미지 왼쪽으로 넘기기
    		function moveLeft(){
    			var len = $(".popPostImage").length-1;
    			var curIdx = parseInt($(".popPostImage:visible").index());
    			var curObj = $(".popPostImage:visible");
    			var prevObj = curObj.prev();
    			
    			//이미지 전환
    			curObj.css("display","none");
    			prevObj.css("display","block");
    			
    			//비디오 재생
    			if(curObj.prev("video").length == 1){
    				prevObj.get(0).play();
    			}else if(curObj.is("video")){
    				curObj.get(0).pause();
    			}
    			
    			//버튼 보이기
    			$("#moveRight").css("display","block");
    			if(curIdx - 1 == 0){
    				$("#moveLeft").css("display","none");
    			}

    			//현재 표시 이미지 위치 변경
    			$("._5zbvx:eq("+curIdx+")").removeClass(" _c0g09");
    			$("._5zbvx:eq("+(curIdx-1)+")").addClass(" _c0g09");
    		}


</script>
</body>
</html>


