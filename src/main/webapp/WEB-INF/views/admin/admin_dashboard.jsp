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
<title>FAINT!!!!! - 관리자 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="" name="description" />
<meta content="themes-lab" name="author" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/favicon.png">
<!-- END META SECTION -->
<!-- BEGIN MANDATORY STYLE -->
<link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/icons/icons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/plugins.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/style.min.css" rel="stylesheet">
<link href="#" rel="stylesheet" id="theme-color">
<!-- END  MANDATORY STYLE -->
<!-- BEGIN PAGE LEVEL STYLE -->
<link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/fullcalendar/fullcalendar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/metrojs/metrojs.css" rel="stylesheet">
<!-- END PAGE LEVEL STYLE -->
<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/modernizr/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<body data-page="dashboard">
	<!-- BEGIN TOP MENU -->
		<%@include file="common/common_top.jsp" %>
	<!-- END TOP MENU -->
	<!-- BEGIN WRAPPER -->
	<div id="wrapper">
	
	<!--  left side bar -->
	<%@include file ="common/common_left.jsp" %>
	

<!-- 관리자 페이지 메인 컨텐츠 부분 -->
		<!-- BEGIN MAIN CONTENT -->
		<div id="main-content" class="dashboard">
			<div class="row m-t-20">
				<div class="col-md-3 col-sm-12">
					<div class="panel no-bd bd-3 panel-stat">
						<div class="panel-body bg-blue p-15">
							<div class="row m-b-10">
								<div class="col-xs-3">
									<i class="glyph-icon flaticon-visitors"></i>
								</div>
								<div class="col-xs-9">
									<div class="live-tile" data-mode="carousel" data-direction="vertical" data-delay="3500" data-height="56">
										<div>
											<small class="stat-title">Visits today</small>
											<h1 class="m-0 w-300">25 610</h1>
										</div>
										<div>
											<small class="stat-title">Visits yesterday</small>
											<h1 class="m-0 w-300">22 420</h1>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-6">
									<small class="stat-title">New Visitors</small>
									<div class="live-tile" data-mode="carousel" data-direction="vertical" data-delay="3500" data-height="30">
										<div>
											<h3 class="m-0 w-300">37.5%</h3>
										</div>
										<div>
											<h3 class="m-0 w-300">34.2%</h3>
										</div>
									</div>
								</div>
								<div class="col-xs-6">
									<small class="stat-title">Bounce Rate</small>
									<div class="live-tile" data-mode="carousel" data-direction="vertical" data-delay="3500" data-height="30">
										<div>
											<h3 class="m-0 w-500">5.6%</h3>
										</div>
										<div>
											<h3 class="m-0 w-500">7.4%</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-12">
					<div class="panel no-bd bd-3 panel-stat">
						<div class="panel-body bg-red p-15">
							<div class="row m-b-6">
								<div class="col-xs-3">
									<i class="glyph-icon flaticon-educational"></i>
								</div>
								<div class="col-xs-9">
									<small class="stat-title">PAGES VIEW</small>
									<h1 class="m-0 w-500">201k</h1>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-6">
									<small class="stat-title">Duration</small>
									<h3 class="m-0 w-500">18:25</h3>
								</div>
								<div class="col-xs-6">
									<small class="stat-title">Pages / visits</small>
									<h3 class="m-0 w-500">21</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-12">
					<div class="panel no-bd bd-3 panel-stat">
						<div class="panel-body bg-green p-15">
							<div class="row m-b-0">
								<div class="col-xs-3">
									<i class="glyph-icon flaticon-orders"></i>
								</div>
								<div class="col-xs-9">
									<small class="stat-title">ORDERS THIS MONTH</small>
									<div class="live-tile" data-delay="4000" data-animation-easing="fade" data-height="47">
										<div>
											<h1 class="m-0 w-500 bg-green">148</h1>
										</div>
										<div>
											<h1 class="m-0 w-500 bg-green">+28%</h1>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-6">
									<small class="stat-title">Last month</small>
									<div class="live-tile" data-delay="4000" data-animation-easing="fade" data-height="30">
										<div class="bg-green">
											<h3 class="m-0 w-500">126</h3>
										</div>
										<div class="bg-green">
											<h3 class="m-0 w-500">$12,545</h3>
										</div>
									</div>
								</div>
								<div class="col-xs-6">
									<small class="stat-title">Last week</small>
									<div class="live-tile" data-delay="4000" data-animation-easing="fade" data-height="30">
										<div class="bg-green">
											<h3 class="m-0 w-500">41</h3>
										</div>
										<div class="bg-green">
											<h3 class="m-0 w-500">$4,237</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-12">
					<div class="panel no-bd bd-3 panel-stat">
						<div class="panel-body bg-dark p-15">
							<div class="row m-b-6">
								<div class="col-xs-3">
									<i class="glyph-icon flaticon-incomes"></i>
								</div>
								<div class="col-xs-9">
									<small class="stat-title">INCOMES THIS MONTH</small>
									<h1 class="m-0 w-500">
										$<span class="animate-number" data-value="42567" data-animation-duration="1400">0</span>
									</h1>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-6">
									<small class="stat-title">Last month</small>
									<h3 class="m-0 w-500">
										$<span class="animate-number" data-value="38547" data-animation-duration="1400">0</span>
									</h3>
								</div>
								<div class="col-xs-6">
									<small class="stat-title">Last week</small>
									<h3 class="m-0 w-500">
										$<span class="animate-number" data-value="8754" data-animation-duration="1400">0</span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-8">
									<div id="graph-wrapper">
										<div class="graph-info p-r-10">
											<a href="javascript:void(0)" class="btn bg-green">Visitors</a> <a href="javascript:void(0)" class="btn bg-blue">Returning Visitors</a>
											<button id="bars" class="btn" disabled>
												<span></span>
											</button>
											<button id="lines" class="btn active" disabled>
												<span></span>
											</button>
										</div>
										<div class="h-300">
											<div class="h-300" id="graph-lines" style="width: 100%"></div>
											<div class="h-300" id="graph-bars" style="width: 100%"></div>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-lg-6 col-md-12">
											<h4 class="text-center c-gray">Bounce rate</h4>
											<div class="spark-chart-1"></div>
										</div>
										<div class="col-lg-6 col-md-12 hidden-md hidden-sm hidden-xs">
											<h4 class="text-center c-gray">Unique visitors</h4>
											<div class="spark-chart-2"></div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6 col-lg-offset-3 col-md-12">
											<h4 class="m-b-m50 m-t-30 text-center c-gray">Browsers</h4>
											<div id="donut-chart1" class="m-b-m30"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="panel no-bd bg-green">
						<div class="panel-heading clearfix pos-rel">
							<div class="pos-abs t-10 l-15 f-18">
								<i class="fa fa-list"></i>
							</div>
							<h2 class="panel-title width-100p text-center w-500 f-20 carrois">To Do List</h2>
							<div class="pos-abs t-10 r-5 f-18 cursor-pointer">
								<div class="glyph-icon flaticon-plus16 f-32"></div>
							</div>
						</div>
						<div class="panel-body bg-green p-t-0 p-b-10">
							<div class="row">
								<div class="col-md-12">
									<div class="row m-b-10">
										<input class="form-control" id="new-todo" placeholder="What needs to be done?" type="text" />
									</div>
									<div class="row" id="task-manager">
										<div class="task-actions clearfix">
											<div class="pull-left">
												<div>
													<input class="my_checkbox_all" type="checkbox">
												</div>
												<div class="p-l-40">Check All</div>
											</div>
											<div class="pull-right">
												<a href="#" class="create-task c-white p-r-10"><i class="fa fa-plus-circle"></i> Create Task</a> <a href="#" class="delete-task c-white p-r-10"><i class="fa fa-minus-circle"></i> Delete All Tasks</a>
											</div>
										</div>
										<ul id="sortable-todo">
											<li class="sortable col-md-12 m-b-10 bd-3 bg-opacity-20 fade in"><a href="#" class="pull-right c-white p-l-10" data-dismiss="alert"><i class="fa fa-times f-18"></i></a> <a href="#" class="pull-right c-white" data-dismiss="alert"><i class="fa fa-pencil f-18"></i></a>
												<div class="sortable-item">
													<div class="pos-rel">
														<input tabindex="13" type="checkbox" class="pull-left task-item">
													</div>
													<div class="p-l-40 pull-left">Find beautiful templates</div>
												</div></li>
											<li class="sortable col-md-12 m-b-10 bd-3 bg-opacity-20 fade in"><a href="#" class="pull-right c-white p-l-10" data-dismiss="alert"><i class="fa fa-times f-18"></i></a> <a href="#" class="pull-right c-white" data-dismiss="alert"><i class="fa fa-pencil f-18"></i></a>
												<div class="sortable-item">
													<div class="pos-rel">
														<input tabindex="13" type="checkbox" class="pull-left task-item">
													</div>
													<div class="p-l-40 pull-left">Create new design</div>
												</div></li>
											<li class="sortable col-md-12 m-b-10 bd-3 bg-opacity-20 fade in"><a href="#" class="pull-right c-white p-l-10" data-dismiss="alert"><i class="fa fa-times f-18"></i></a> <a href="#" class="pull-right c-white" data-dismiss="alert"><i class="fa fa-pencil f-18"></i></a>
												<div class="sortable-item">
													<div class="pos-rel">
														<input tabindex="13" type="checkbox" class="pull-left task-item">
													</div>
													<div class="p-l-40 pull-left">Go to Shop</div>
												</div></li>
											<li class="sortable col-md-12 m-b-10 bd-3 bg-opacity-20 fade in"><a href="#" class="pull-right c-white p-l-10" data-dismiss="alert"><i class="fa fa-times f-18"></i></a> <a href="#" class="pull-right c-white" data-dismiss="alert"><i class="fa fa-pencil f-18"></i></a>
												<div class="sortable-item">
													<div class="pos-rel">
														<input tabindex="13" type="checkbox" class="pull-left task-item">
													</div>
													<div class="p-l-40 pull-left">Buy a new bike</div>
												</div></li>
											<li class="sortable col-md-12 p-10 m-b-10 bd-3 bg-opacity-20 fade in"><a href="#" class="pull-right c-white p-l-10" data-dismiss="alert"><i class="fa fa-times f-18"></i></a> <a href="#" class="pull-right c-white" data-dismiss="alert"><i class="fa fa-pencil f-18"></i></a>
												<div class="sortable-item">
													<div class="pos-rel">
														<input tabindex="13" type="checkbox" class="pull-left">
													</div>
													<div class="p-l-40 pull-left">Write a book</div>
												</div></li>
										</ul>
									</div>
									<div class="row">
										<div id="todo-stats"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-default">
						<div class="panel-heading clearfix pos-rel">
							<div class="pos-abs t-10 l-15 f-18 c-gray">
								<i class="fa fa-search"></i>
							</div>
							<h2 class="panel-title width-100p c-blue text-center w-500 f-20 carrois">Contact</h2>
							<div class="pos-abs t-10 r-5 f-18 c-blue cursor-pointer">
								<div class="glyph-icon flaticon-plus16 f-32"></div>
							</div>
						</div>
						<div class="panel-body messages">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="withScroll" data-height="320">
										<a href="#" class="message-item media">
											<div class="media">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar1.png" alt="avatar 1" width="35" class="pull-left">
												<div class="media-body">
													<div class="pull-left">
														<p class="c-dark m-0">
															<strong>John Snow</strong>
														</p>
														<p class="c-gray m-0">cameso@it.com</p>
													</div>
													<div class="pull-right f-18 p-t-10">
														<i data-rel="tooltip" title="add to favs" data-placement="left" class="favs fa fa-star-o p-r-10"></i> <i data-rel="tooltip" title="send email" data-placement="left" class="fa fa-envelope-o p-r-10"></i> <i data-rel="tooltip" title="show phone" data-placement="left" class="fa fa-phone"></i>
													</div>
												</div>
											</div>
										</a> <a href="#" class="message-item media">
											<div class="media">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar2.png" alt="avatar 2" width="35" class="pull-left">
												<div class="media-body">
													<div class="pull-left">
														<p class="c-dark m-0">
															<strong>Jerry Smith</strong>
														</p>
														<p class="c-gray m-0">bugomi@vigu.com</p>
													</div>
													<div class="pull-right f-18 p-t-10">
														<i data-rel="tooltip" title="remove from favs" data-placement="left" class="favs fa fa-star p-r-10 c-orange"></i> <i data-rel="tooltip" title="send email" data-placement="left" class="fa fa-envelope-o p-r-10"></i> <i data-rel="tooltip" title="show phone" data-placement="left" class="fa fa-phone"></i>
													</div>
												</div>
											</div>
										</a> <a href="#" class="message-item media">
											<div class="media">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3" width="35" class="pull-left">
												<div class="media-body">
													<div class="pull-left">
														<p class="c-dark m-0">
															<strong>John Snow</strong>
														</p>
														<p class="c-gray m-0">cameso@it.com</p>
													</div>
													<div class="pull-right f-18 p-t-10">
														<i data-rel="tooltip" title="add to favs" data-placement="left" class="favs fa fa-star-o p-r-10"></i> <i data-rel="tooltip" title="send email" data-placement="left" class="fa fa-envelope-o p-r-10"></i> <i data-rel="tooltip" title="show address" data-placement="left" class="fa fa-home"></i>
													</div>
												</div>
											</div>
										</a> <a href="#" class="message-item media">
											<div class="media">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar4.png" alt="avatar 4" width="35" class="pull-left">
												<div class="media-body">
													<div class="pull-left">
														<p class="c-dark m-0">
															<strong>Jerry Smith</strong>
														</p>
														<p class="c-gray m-0">bugomi@vigu.com</p>
													</div>
													<div class="pull-right f-18 p-t-10">
														<i data-rel="tooltip" title="add to favs" data-placement="left" class="favs fa fa-star-o p-r-10"></i> <i data-rel="tooltip" title="send email" data-placement="left" class="fa fa-envelope-o p-r-10"></i> <i data-rel="tooltip" title="show phone" data-placement="left" class="fa fa-phone"></i>
													</div>
												</div>
											</div>
										</a> <a href="#" class="message-item media">
											<div class="media">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar5.png" alt="avatar 5" width="35" class="pull-left">
												<div class="media-body">
													<div class="pull-left">
														<p class="c-dark m-0">
															<strong>John Snow</strong>
														</p>
														<p class="c-gray m-0">cameso@it.com</p>
													</div>
													<div class="pull-right f-18 p-t-10">
														<i data-rel="tooltip" title="add to favs" data-placement="left" class="favs fa fa-star-o p-r-10"></i> <i data-rel="tooltip" title="send email" data-placement="left" class="fa fa-envelope-o p-r-10"></i> <i data-rel="tooltip" title="show address" data-placement="left" class="fa fa-home"></i>
													</div>
												</div>
											</div>
										</a> <a href="#" class="message-item media">
											<div class="media">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar6.png" alt="avatar 6" width="35" class="pull-left">
												<div class="media-body">
													<div class="pull-left">
														<p class="c-dark m-0">
															<strong>Jerry Smith</strong>
														</p>
														<p class="c-gray m-0">bugomi@vigu.com</p>
													</div>
													<div class="pull-right f-18 p-t-10">
														<i data-rel="tooltip" title="add to favs" data-placement="left" class="favs fa fa-star-o p-r-10"></i> <i data-rel="tooltip" title="send email" data-placement="left" class="fa fa-envelope-o p-r-10"></i> <i data-rel="tooltip" title="show phone" data-placement="left" class="fa fa-phone"></i>
													</div>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-stat bg-purple-gradient">
						<div class="panel-heading text-center p-10 p-b-0">
							<div class="pos-abs t-10 l-15 f-18 c-white">
								<i class="fa fa-dollar"></i>
							</div>
							<h2 class="panel-title c-white">Revenue</h2>
							<div class="pos-abs t-5 r-5 f-18 c-white cursor-pointer">
								<div class="glyph-icon flaticon-plus16 f-32"></div>
							</div>
						</div>
						<div class="panel-body p-0 bg-transparent">
							<div id="chart_revenue" style="height: 340px;"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 m-b-20">
					<div class="panel panel-default">
						<div class="panel-heading clearfix pos-rel">
							<div class="pos-abs top-12 l-15 f-18 c-gray">
								<i class="fa fa-comments-o"></i>
							</div>
							<h2 class="panel-title width-100p c-red text-center w-500 f-20 carrois">Email</h2>
							<div class="pos-abs t-10 r-5 f-18 c-red cursor-pointer">
								<div class="glyph-icon flaticon-plus16 f-32"></div>
							</div>
						</div>
						<div class="panel-body messages">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="withScroll" data-height="480">
										<a href="#" class="message-item media">
											<div class="media">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar13_big.png" alt="avatar 13" width="50" class="pull-left">
												<div class="media-body">
													<small class="pull-right">23 Sept</small>
													<h5 class="c-dark">
														<strong>John Snow</strong>
													</h5>
													<h4 class="c-dark">Reset your account password</h4>
												</div>
											</div>
											<p class="f-14 c-gray">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
										</a> <a href="#" class="message-item media">
											<div class="media">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar12_big.png" alt="avatar 12" width="50" class="pull-left">
												<div class="media-body">
													<small class="pull-right">23 Sept</small>
													<h5 class="c-dark">
														<strong>Jerry Smith</strong>
													</h5>
													<h4 class="c-dark">Check Dropbox</h4>
												</div>
											</div>
											<p class="f-14 c-gray">Hello Steve, I have added new files in your Dropbox in order to show you how to...</p>
										</a> <a href="#" class="message-item media">
											<div class="media">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar11_big.png" alt="avatar 11" width="50" class="pull-left">
												<div class="media-body">
													<small class="pull-right">23 Sept</small>
													<h5 class="c-dark">
														<strong>John Snow</strong>
													</h5>
													<h4 class="c-dark">Reset your account password</h4>
												</div>
											</div>
											<p class="f-14 c-gray">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
										</a> <a href="#" class="message-item media">
											<div class="media">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar10_big.png" alt="avatar 10" width="50" class="pull-left">
												<div class="media-body">
													<small class="pull-right">23 Sept</small>
													<h5 class="c-dark">
														<strong>Jerry Smith</strong>
													</h5>
													<h4 class="c-dark">Check Dropbox</h4>
												</div>
											</div>
											<p class="f-14 c-gray">Hello Steve, I have added new files in your Dropbox in order to show you how to...</p>
										</a> <a href="#" class="message-item media">
											<div class="media">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar9_big.png" alt="avatar 9" width="50" class="pull-left">
												<div class="media-body">
													<small class="pull-right">23 Sept</small>
													<h5 class="c-dark">
														<strong>John Snow</strong>
													</h5>
													<h4 class="c-dark">Reset your account password</h4>
												</div>
											</div>
											<p class="f-14 c-gray">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
										</a> <a href="#" class="message-item media">
											<div class="media">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar8_big.png" alt="avatar 8" width="50" class="pull-left">
												<div class="media-body">
													<small class="pull-right">23 Sept</small>
													<h5 class="c-dark">
														<strong>Jerry Smith</strong>
													</h5>
													<h4 class="c-dark">Check Dropbox</h4>
												</div>
											</div>
											<p class="f-14 c-gray">Hello Steve, I have added new files in your Dropbox in order to show you how to...</p>
										</a> <a href="#" class="message-item media">
											<div class="media">
												<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar7_big.png" alt="avatar 7" width="50" class="pull-left">
												<div class="media-body">
													<small class="pull-right">23 Sept</small>
													<h5 class="c-dark">
														<strong>John Snow</strong>
													</h5>
													<h4 class="c-dark">Reset your account password</h4>
												</div>
											</div>
											<p class="f-14 c-gray">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
										</a>
									</div>
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
	<!-- BEGIN MANDATORY SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery-1.11.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery-migrate-1.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery-ui/jquery-ui-1.11.2.min.js"></script>
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
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/metrojs/metrojs.min.js"></script>
	<script src='${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/fullcalendar/moment.min.js'></script>
	<script src='${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/fullcalendar/fullcalendar.min.js'></script>
	<%-- <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/google-maps/markerclusterer.js"></script>
	<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/google-maps/gmaps.js"></script> --%>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/charts-flot/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/charts-flot/jquery.flot.animator.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/charts-flot/jquery.flot.resize.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/charts-flot/jquery.flot.time.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/charts-morris/raphael.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/charts-morris/morris.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/calendar.js"></script>
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/dashboard.js"></script>
	<!-- END  PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/application.js?v=2"></script>

</body>
</html>