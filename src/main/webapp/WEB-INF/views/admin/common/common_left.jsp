<%@page import="com.faint.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 관리자 페이지 전용 Sidebar -->
		<!-- BEGIN MAIN SIDEBAR -->
		<nav id="sidebar">
			<div id="main-menu">
				<ul class="sidebar-nav">
					<!-- <span class="label label-danger pull-right">New</span> -->
					<li><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fa fa-dashboard"></i><span class="sidebar-text"> 관리자 DASHBOARD</span></a></li>

					<li><a href="${pageContext.request.contextPath}" target="_blank"><i class="glyph-icon flaticon-frontend"></i><span class="sidebar-text">홈으로</span></a></li>


					<li><a href="#"><i class="glyph-icon flaticon-account"></i><span class="sidebar-text">관리자 계정 관리</span><span class="fa arrow"></span></a>
						<ul class="submenu collapse">
							<li><a href="${pageContext.request.contextPath}/admin/profile"><span class="sidebar-text">프로필</span></a></li>
							<li><a href="${pageContext.request.contextPath}/admin/profile/modify"><span class="sidebar-text">계정 설정</span></a></li>

							<li><a href="${pageContext.request.contextPath}/admin/regist"><span class="sidebar-text">관리자 계정 생성</span></a></li>
							<li><a href="${pageContext.request.contextPath}/admin/lockscreen"><span class="sidebar-text">화면 잠금</span></a></li>
							<li><a href="${pageContext.request.contextPath}/admin/session_timeout"><span class="sidebar-text">Session Timeout</span></a></li>
						</ul></li>

					<li><a href="#"><i class="glyph-icon flaticon-pages"></i><span class="sidebar-text">서비스 관리</span><span class="fa arrow"></span></a>
						<ul class="submenu collapse">
							<li><a href="${pageContext.request.contextPath}/admin/member"><span class="sidebar-text">회원 관리</span></a></li>
							<li><a href="${pageContext.request.contextPath}/admin/board"><span class="sidebar-text">게시글 관리<span class="label label-dark pull-right">Hot</span></span></a></li>
							<li><a href="${pageContext.request.contextPath}/admin/comment"><span class="sidebar-text">댓글 관리</span></a></li>
							<li><a href="${pageContext.request.contextPath}/admin/notice"><span class="sidebar-text">공지사항</span></a></li>
							<li><a href="${pageContext.request.contextPath}/admin/faq"><span class="sidebar-text">자주 묻는 질문</span></a></li>


						</ul></li>



					<li><a href="#"><i class="glyph-icon flaticon-email"></i><span class="sidebar-text">메시지</span><span class="fa arrow"></span></a>
						<ul class="submenu collapse">
							<li><a href="${pageContext.request.contextPath}/admin/message"><span class="sidebar-text">쪽지함</span></a></li>
							<li><a href="${pageContext.request.contextPath}/admin/email"><span class="sidebar-text">이메일 작성</span></a></li>
						</ul></li>

					<li><a href="#"><i class="fa fa-pencil"></i><span class="sidebar-text">스킨 설정</span> <span class="fa arrow"></span></a>
						<ul class="submenu collapse">
							<li><a href="#" data-style="dark" class="theme-color"><span class="sidebar-text">Dark Skin</span></a></li>
							<li><a href="#" data-style="light" class="theme-color"><span class="sidebar-text">Light Skin</span></a></li>
							<li><a href="#" data-style="cafe" class="theme-color"><span class="sidebar-text">Cafe Skin</span></a></li>
							<li><a href="#" data-style="blue" class="theme-color"><span class="sidebar-text">Blue Skin</span></a></li>
							<li><a href="#" data-style="red" class="theme-color"><span class="sidebar-text">Red Skin</span></a></li>
							<li><a href="#" data-style="green" class="theme-color"><span class="sidebar-text">Green Skin</span></a></li>
						</ul></li>

					<li><a href="${pageContext.request.contextPath}/admin/charts"><i class="glyph-icon flaticon-charts2"></i><span class="sidebar-text">차트 보기</span><span class="pull-right label label-primary">6</span></a></li>


				</ul>
			</div>
			<div class="footer-widget">
				<div class="footer-gradient"></div>
				<div id="sidebar-charts">
					<div class="sidebar-charts-inner">
						<div class="sidebar-charts-left">
							<div class="sidebar-chart-title">Orders</div>
							<div class="sidebar-chart-number">1,256</div>
						</div>
						<div class="sidebar-charts-right" data-type="bar" data-color="theme">
							<span class="dynamicbar1"></span>
						</div>
					</div>
					<hr class="divider">
					<div class="sidebar-charts-inner">
						<div class="sidebar-charts-left">
							<div class="sidebar-chart-title">Income</div>
							<div class="sidebar-chart-number">$47,564</div>
						</div>
						<div class="sidebar-charts-right" data-type="bar" data-color="theme">
							<span class="dynamicbar2"></span>
						</div>
					</div>
					<hr class="divider">
					<div class="sidebar-charts-inner">
						<div class="sidebar-charts-left">
							<div class="sidebar-chart-title">Visits</div>
							<div class="sidebar-chart-number" id="number-visits">147,687</div>
						</div>
						<div class="sidebar-charts-right" data-type="bar" data-color="theme">
							<span class="dynamicbar3"></span>
						</div>
					</div>
				</div>
				<div class="sidebar-footer clearfix">
					<a class="pull-left" href="${pageContext.request.contextPath}/admin/profile/modify" data-rel="tooltip" data-placement="top" data-original-title="Settings"><i class="glyph-icon flaticon-settings21"></i></a> <a class="pull-left toggle_fullscreen" href="#" data-rel="tooltip" data-placement="top" data-original-title="Fullscreen"><i class="glyph-icon flaticon-fullscreen3"></i></a> <a class="pull-left" href="${pageContext.request.contextPath}/admin/lockscreen" data-rel="tooltip" data-placement="top" data-original-title="Lockscreen"><i class="glyph-icon flaticon-padlock23"></i></a> <a class="pull-left" href="${pageContext.request.contextPath}/admin/logout" data-rel="tooltip" data-placement="top" data-original-title="Logout"><i class="fa fa-power-off"></i></a>
				</div>
			</div>
		</nav>
		<!-- END MAIN SIDEBAR -->
		
<!-- //Sidebar -->
