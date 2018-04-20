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
</head>

<body data-page="profil">

	<!-- BEGIN TOP MENU -->
	<%@include file="common/common_top.jsp"%>
	<!-- END TOP MENU -->
	<!-- BEGIN WRAPPER -->
	<div id="wrapper">

		<!--  left side bar -->
		<%@include file="common/common_left.jsp"%>

		<!-- BEGIN MAIN CONTENT -->
		<div id="main-content" class="page-profil">
			<div class="row">

				<!-- BEGIN PROFIL SIDEBAR -->
				<div class="col-md-3 profil-sidebar">
					<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/me.jpg" class="img-responsive" alt="profil">
					<div class="p-20">
						<div class="profil-sidebar-element">
							<h4>ABOUT ME</h4>
							<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis pra quem é amistosis quis leo.</p>
						</div>
						<div class="profil-sidebar-element">
							<h4 class="pull-left">FRIENDS</h4>
							<div class="sidebar-number pull-right">42</div>
							<div class="clearfix m-b-10"></div>
							<h5 class="pull-left">MUTUAL FRIENDS</h5>
							<div class="sidebar-number pull-right">7</div>
							<div class="clearfix"></div>
							<div class="row">
								<div class="p-10 clearfix">
									<div class="col-md-2 col-sm-3 col-xs-4">
										<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar1_big.png" class="img-small-friend" alt="avatar 1">
									</div>
									<div class="col-md-2 col-sm-3 col-xs-4">
										<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar2_big.png" class="img-small-friend" alt="avatar 2">
									</div>
									<div class="col-md-2 col-sm-3 col-xs-4">
										<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3_big.png" class="img-small-friend" alt="avatar 3">
									</div>
									<div class="col-md-2 col-sm-3 col-xs-4">
										<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar4_big.png" class="img-small-friend" alt="avatar 4">
									</div>
									<div class="col-md-2 col-sm-3 col-xs-4">
										<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar5_big.png" class="img-small-friend" alt="avatar 5">
									</div>
									<div class="col-md-2 col-sm-3 col-xs-4">
										<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/more.jpg" class="img-small-friend" alt="">
									</div>
								</div>
							</div>
							<p>You and John are not friend yet</p>
							<div>
								<button type="button" class="btn btn-block btn-blue bd-0 no-bd">
									<i class="glyphicon glyphicon-user"></i> Add John to my friends list
								</button>
							</div>
						</div>
						<div class="profil-sidebar-element">
							<h4>PERSONAL STATS</h4>
							<p class="c-gray m-t-0">
								<i>Last connection: 2 days ago</i>
							</p>
							<h5>AVERAGE RATING</h5>
							<div id="stars" class="starrr pull-left">
								<span class="fa .fa-star fa-star"></span> <span class="fa .fa-star fa-star"></span> <span class="fa .fa-star fa-star"></span> <span class="fa .fa-star fa-star"></span> <span class="fa .fa-star fa-star-o"></span>
							</div>
							<div class="sidebar-number pull-right">4/5</div>
							<div class="clearfix"></div>
							<h5>MY SHARING</h5>
							<p class="m-t-0">
								<span class="c-blue"><strong>15</strong></span> Replies
							</p>
							<p class="m-t-0">
								<span class="c-blue"><strong>8</strong></span> Messages
							</p>
							<p class="m-t-0">
								<span class="c-blue"><strong>24</strong></span> Questions
							</p>
						</div>
						<div class="profil-sidebar-element">
							<h4>SOCIAL SHARING</h4>
							<div class="social-btn-small">
								<a href="#" class="zocial icon facebook m-0">Sign in with Facebook</a>
							</div>
							<div class="social-btn-small">
								<a href="#" class="zocial icon twitter m-0">Sign in with Twitter</a>
							</div>
							<div class="social-btn-small">
								<a href="#" class="zocial icon googleplus m-0">Sign in with Google+</a>
							</div>
						</div>
					</div>
				</div>
				<!-- END PROFIL SIDEBAR -->

				<!-- BEGIN PROFIL CONTENT -->
				<div class="col-md-9 profil-content m-t-20">
					<h2>
						HI! I'M <span class="c-blue">JOHN</span>
					</h2>
					<div class="row">
						<div class="col-md-12 profil-presentation">
							<p>
								<i class="fa fa-quote-left c-blue"></i> I love to travel all around the world and discover new countries. Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis pra quem é amistosis quis leo. <i class="fa fa-quote-right c-blue"></i>
							</p>
						</div>
					</div>
					<h4>MY GROUPS</h4>
					<div class="row profil-groups">
						<div class="col-md-6">
							<div class="row border-gray">
								<div class="col-xs-4">
									<div class="row">
										<div class="col-md-6 col-sm-6 col-xs-6 thumb">
											<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/nature1.jpg" class="img-small-friend" alt="">
										</div>
										<div class="col-md-6 col-sm-6 col-xs-6 thumb">
											<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/nature2.jpg" class="img-small-friend" alt="">
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 col-sm-6 col-xs-6 thumb">
											<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/nature3.jpg" class="img-small-friend" alt="">
										</div>
										<div class="col-md-6 col-sm-6 col-xs-6 thumb">
											<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/nature4.jpg" class="img-small-friend" alt="">
										</div>
									</div>
								</div>
								<div class="col-xs-8 p-0 profil-group">
									<h4 class="c-blue">Nature</h4>
									<p>
										<strong>654 members</strong>
									</p>
									<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis pra quem é amistosis quis leo.</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row border-gray">
								<div class="col-xs-4">
									<div class="row">
										<div class="col-md-6 col-sm-6 col-xs-6 thumb">
											<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/construction1.jpg" class="img-small-friend" alt="">
										</div>
										<div class="col-md-6 col-sm-6 col-xs-6 thumb">
											<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/construction2.jpg" class="img-small-friend" alt="">
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 col-sm-6 col-xs-6 thumb">
											<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/construction3.jpg" class="img-small-friend" alt="">
										</div>
										<div class="col-md-6 col-sm-6 col-xs-6 thumb">
											<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/construction4.jpg" class="img-small-friend" alt="">
										</div>
									</div>
								</div>
								<div class="col-xs-8 p-0 profil-group">
									<h4 class="c-blue">Construction</h4>
									<p>
										<strong>654 members</strong>
									</p>
									<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis pra quem é amistosis quis leo.</p>
								</div>
							</div>
						</div>
						<div class="col-md-12 border-bottom p-t-20"></div>
					</div>
					<h4>MY REVIEWS</h4>
					<div class="row profil-review">
						<div class="col-md-6">
							<div class="p-20">
								<div class="row">
									<div class="col-xs-3 col-md-3 p-r-10">
										<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/review1.png" alt="review 1" class="img-rounded img-responsive" />
									</div>
									<div class="col-xs-9 col-md-9 section-box">
										<h2>
											My Magazine <a href="#" target="_blank"></a>
										</h2>
										<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis.</p>
										<hr />
										<div class="row rating-desc">
											<div class="col-md-12">
												<div class="stars">
													<span class="fa .fa-star fa-star"></span> <span class="fa .fa-star fa-star"></span> <span class="fa .fa-star fa-star"></span> <span class="fa .fa-star fa-star"></span> <span class="fa .fa-star fa-star-o"></span>
												</div>
												(36)<span class="separator">|</span> <i class="fa fa-comments-o"></i> 100 Comments
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="p-20">
								<div class="row">
									<div class="col-xs-3 col-md-3 p-r-10">
										<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/review2.png" alt="jQuery2DotNet" class="img-rounded img-responsive" />
									</div>
									<div class="col-xs-9 col-md-9 section-box">
										<h2>
											My 2nd review <a href="#" target="_blank"></a>
										</h2>
										<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis.</p>
										<hr />
										<div class="row rating-desc">
											<div class="col-md-12">
												<div class="stars">
													<span class="fa .fa-star fa-star"></span> <span class="fa .fa-star fa-star"></span> <span class="fa .fa-star fa-star"></span> <span class="fa .fa-star fa-star-o"></span> <span class="fa .fa-star fa-star-o"></span>
												</div>
												(18)<span class="separator">|</span> <i class="fa fa-comments-o"></i> 54 Comments
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 border-bottom p-t-20"></div>
					</div>
					<h4>MY PICTURES</h4>
					<div class="row">
						<div class="col-md-12">
							<div>
								<div class="row form-group">
									<div class="col-xs-12 col-md-6">
										<div class="panel panel-default">
											<div class="panel-image">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/pics1.jpg" class="panel-image-preview" alt="pic 1" />
											</div>
											<div class="panel-footer text-center">
												<a href="#download"><span class="glyphicon glyphicon-download"></span></a> <a href="#facebook"><span class="fa fa-facebook"></span></a> <a href="#twitter"><span class="fa fa-twitter"></span></a> <a href="#share"><span class="glyphicon glyphicon-share-alt"></span></a>
											</div>
										</div>
									</div>
									<div class="col-xs-12 col-md-6">
										<div class="panel panel-default">
											<div class="panel-image">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/pics2.jpg" class="panel-image-preview" alt="pic 2" />
											</div>
											<div class="panel-footer text-center">
												<a href="#download"><span class="glyphicon glyphicon-download"></span></a> <a href="#facebook"><span class="fa fa-facebook"></span></a> <a href="#twitter"><span class="fa fa-twitter"></span></a> <a href="#share"><span class="glyphicon glyphicon-share-alt"></span></a>
											</div>
										</div>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-12 col-md-6">
										<div class="panel panel-default">
											<div class="panel-image">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/pics3.jpg" class="panel-image-preview" alt="pic 3" />
											</div>
											<div class="panel-footer text-center">
												<a href="#download"><span class="glyphicon glyphicon-download"></span></a> <a href="#facebook"><span class="fa fa-facebook"></span></a> <a href="#twitter"><span class="fa fa-twitter"></span></a> <a href="#share"><span class="glyphicon glyphicon-share-alt"></span></a>
											</div>
										</div>
									</div>
									<div class="col-xs-12 col-md-6">
										<div class="panel panel-default">
											<div class="panel-image">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/profil_page/pics4.jpg" class="panel-image-preview" alt="pic 4" />
											</div>
											<div class="panel-footer text-center">
												<a href="#download"><span class="glyphicon glyphicon-download"></span></a> <a href="#facebook"><span class="fa fa-facebook"></span></a> <a href="#twitter"><span class="fa fa-twitter"></span></a> <a href="#share"><span class="glyphicon glyphicon-share-alt"></span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- END PROFIL CONTENT -->
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
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/application.js"></script>
</body>

</html>
