<%@page import="com.faint.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	//ajax json데이터 캐쉬 방지
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
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
    <link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/plugins.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/style.css" rel="stylesheet">
    <link href="#" rel="stylesheet" id="theme-color">
    <!-- END  MANDATORY STYLE -->
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/modernizr/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<body data-page="mailbox" class="mailbox-page">
    
    	<!-- BEGIN TOP MENU -->
		<%@include file="common/common_top.jsp" %>
	<!-- END TOP MENU -->
	<!-- BEGIN WRAPPER -->
	<div id="wrapper">
	
	<!--  left side bar -->
	<%@include file ="common/common_left.jsp" %>
	
        <!-- BEGIN MAIN CONTENT -->
        <div id="main-content" class="page-mailbox">
            <div class="row" data-equal-height="true">
                <div class="col-md-4 list-messages">
                    <div class="panel panel-default">
                        <div class="panel-body messages">
                            <div class="input-group input-group-lg border-bottom">
                                <span class="input-group-btn">
                                    <a href="" class="btn"><i class="fa fa-search"></i></a>
                                  </span>
                                <input type="text" class="form-control bd-0 bd-white" placeholder="Search">
                            </div>
                            <div id="messages-list" class="panel panel-default withScroll" data-height="window" data-padding="90">
                                <div class="message-item media">
                                    <div class="pull-left text-center">
                                        <div class="pos-rel message-checkbox">
                                            <input type="checkbox" data-style="flat-red">
                                        </div>
                                        <div>
                                            <strong><i class="fa fa-paperclip"></i> 2</strong>
                                        </div>
                                    </div>
                                    <div class="message-item-right">
                                        <div class="media">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3_big.png" alt="avatar 3" width="50" class="pull-left">
                                            <div class="media-body">
                                                <small class="pull-right">23 Sept</small>
                                                <h5 class="c-dark"><strong>John Snow</strong></h5>
                                                <h4 class="c-dark">Reset your account password</h4>
                                            </div>
                                        </div>
                                        <p class="f-14 c-gray">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
                                    </div>
                                </div>
                                <div class="message-item media message-active">
                                    <div class="pull-left text-center">
                                        <div class="pos-rel message-checkbox">
                                            <input type="checkbox" data-style="flat-red">
                                        </div>
                                        <div>
                                            <strong><i class="fa fa-paperclip"></i> 2</strong>
                                        </div>
                                    </div>
                                    <div class="message-item-right">
                                        <div class="media">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar4_big.png" alt="avatar 4" width="50" class="pull-left">
                                            <div class="media-body">
                                                <small class="pull-right">23 Sept</small>
                                                <h5><strong>Jerry Smith</strong></h5>
                                                <h4>Re: Check Dropbox</h4>
                                            </div>
                                        </div>
                                        <p class="f-14">Hello Steve, I have added new files in your Dropbox in order to show you how to...</p>
                                    </div>
                                </div>
                                <div class="message-item media">
                                    <div class="pull-left text-center">
                                        <div class="pos-rel message-checkbox">
                                            <input type="checkbox" data-style="flat-red">
                                        </div>
                                        <div>
                                            <strong><i class="fa fa-paperclip"></i> 2</strong>
                                        </div>
                                    </div>
                                    <div class="message-item-right">
                                        <div class="media">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar5_big.png" alt="avatar 5" width="50" class="pull-left">
                                            <div class="media-body">
                                                <small class="pull-right">23 Sept</small>
                                                <h5 class="c-dark"><strong>John Snow</strong></h5>
                                                <h4 class="c-dark">Reset your account password</h4>
                                            </div>
                                        </div>
                                        <p class="f-14 c-gray">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
                                    </div>
                                </div>
                                <div class="message-item media">
                                    <div class="pull-left text-center">
                                        <div class="pos-rel message-checkbox">
                                            <input type="checkbox" data-style="flat-red">
                                        </div>
                                        <div>
                                            <strong><i class="fa fa-paperclip"></i> 2</strong>
                                        </div>
                                    </div>
                                    <div class="message-item-right">
                                        <div class="media">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar10_big.png" alt="avatar 10" width="50" class="pull-left">
                                            <div class="media-body">
                                                <small class="pull-right">23 Sept</small>
                                                <h5 class="c-dark"><strong>Jerry Smith</strong></h5>
                                                <h4 class="c-dark">Check Dropbox</h4>
                                            </div>
                                        </div>
                                        <p class="f-14 c-gray">Hello Steve, I have added new files in your Dropbox in order to show you how to...</p>
                                    </div>
                                </div>
                                <div class="message-item media">
                                    <div class="pull-left text-center">
                                        <div class="pos-rel message-checkbox">
                                            <input type="checkbox" data-style="flat-red">
                                        </div>
                                        <div>
                                            <strong><i class="fa fa-paperclip"></i> 2</strong>
                                        </div>
                                    </div>
                                    <div class="message-item-right">
                                        <div class="media">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar7_big.png" alt="avatar 7" width="50" class="pull-left">
                                            <div class="media-body">
                                                <small class="pull-right">23 Sept</small>
                                                <h5 class="c-dark"><strong>John Snow</strong></h5>
                                                <h4 class="c-dark">Reset your account password</h4>
                                            </div>
                                        </div>
                                        <p class="f-14 c-gray">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
                                    </div>
                                </div>
                                <div class="message-item media">
                                    <div class="pull-left text-center">
                                        <div class="pos-rel message-checkbox">
                                            <input type="checkbox" data-style="flat-red">
                                        </div>
                                        <div>
                                            <strong><i class="fa fa-paperclip"></i> 2</strong>
                                        </div>
                                    </div>
                                    <div class="message-item-right">
                                        <div class="media">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar9_big.png" alt="avatar 9" width="50" class="pull-left">
                                            <div class="media-body">
                                                <small class="pull-right">23 Sept</small>
                                                <h5 class="c-dark"><strong>Jerry Smith</strong></h5>
                                                <h4 class="c-dark">Check Dropbox</h4>
                                            </div>
                                        </div>
                                        <p class="f-14 c-gray">Hello Steve, I have added new files in your Dropbox in order to show you how to...</p>
                                    </div>
                                </div>
                                <div class="message-item media">
                                    <div class="pull-left text-center">
                                        <div class="pos-rel message-checkbox">
                                            <input type="checkbox" data-style="flat-red">
                                        </div>
                                        <div>
                                            <strong><i class="fa fa-paperclip"></i> 2</strong>
                                        </div>
                                    </div>
                                    <div class="message-item-right">
                                        <div class="media">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar8_big.png" alt="avatar 8" width="50" class="pull-left">
                                            <div class="media-body">
                                                <small class="pull-right">23 Sept</small>
                                                <h5 class="c-dark"><strong>John Snow</strong></h5>
                                                <h4 class="c-dark">Reset your account password</h4>
                                            </div>
                                        </div>
                                        <p class="f-14 c-gray">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
                                    </div>
                                </div>
                                <div class="message-item media">
                                    <div class="pull-left text-center">
                                        <div class="pos-rel message-checkbox">
                                            <input type="checkbox" data-style="flat-red">
                                        </div>
                                        <div>
                                            <strong><i class="fa fa-paperclip"></i> 2</strong>
                                        </div>
                                    </div>
                                    <div class="message-item-right">
                                        <div class="media">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar11_big.png" alt="avatar 11" width="50" class="pull-left">
                                            <div class="media-body">
                                                <small class="pull-right">23 Sept</small>
                                                <h5 class="c-dark"><strong>Jerry Smith</strong></h5>
                                                <h4 class="c-dark">Check Dropbox</h4>
                                            </div>
                                        </div>
                                        <p class="f-14 c-gray">Hello Steve, I have added new files in your Dropbox in order to show you how to...</p>
                                    </div>
                                </div>
                                <div class="message-item media">
                                    <div class="pull-left text-center">
                                        <div class="pos-rel message-checkbox">
                                            <input type="checkbox" data-style="flat-red">
                                        </div>
                                        <div>
                                            <strong><i class="fa fa-paperclip"></i> 2</strong>
                                        </div>
                                    </div>
                                    <div class="message-item-right">
                                        <div class="media">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar12_big.png" alt="avatar 12" width="50" class="pull-left">
                                            <div class="media-body">
                                                <small class="pull-right">23 Sept</small>
                                                <h5 class="c-dark"><strong>John Snow</strong></h5>
                                                <h4 class="c-dark">Reset your account password</h4>
                                            </div>
                                        </div>
                                        <p class="f-14 c-gray">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
                                    </div>
                                </div>
                                <div class="message-item media">
                                    <div class="pull-left text-center">
                                        <div class="pos-rel message-checkbox">
                                            <input type="checkbox" data-style="flat-red">
                                        </div>
                                        <div>
                                            <strong><i class="fa fa-paperclip"></i> 2</strong>
                                        </div>
                                    </div>
                                    <div class="message-item-right">
                                        <div class="media">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar13_big.png" alt="avatar 13" width="50" class="pull-left">
                                            <div class="media-body">
                                                <small class="pull-right">23 Sept</small>
                                                <h5 class="c-dark"><strong>Jerry Smith</strong></h5>
                                                <h4 class="c-dark">Check Dropbox</h4>
                                            </div>
                                        </div>
                                        <p class="f-14 c-gray">Hello Steve, I have added new files in your Dropbox in order to show you how to...</p>
                                    </div>
                                </div>
                                <div class="message-item media">
                                    <div class="pull-left text-center">
                                        <div class="pos-rel message-checkbox">
                                            <input type="checkbox" data-style="flat-red">
                                        </div>
                                        <div>
                                            <strong><i class="fa fa-paperclip"></i> 2</strong>
                                        </div>
                                    </div>
                                    <div class="message-item-right">
                                        <div class="media">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar1_big.png" alt="avatar 1" width="50" class="pull-left">
                                            <div class="media-body">
                                                <small class="pull-right">23 Sept</small>
                                                <h5 class="c-dark"><strong>John Snow</strong></h5>
                                                <h4 class="c-dark">Reset your account password</h4>
                                            </div>
                                        </div>
                                        <p class="f-14 c-gray">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
                                    </div>
                                </div>
                                <div class="message-item media">
                                    <div class="pull-left text-center">
                                        <div class="pos-rel message-checkbox">
                                            <input type="checkbox" data-style="flat-red">
                                        </div>
                                        <div>
                                            <strong><i class="fa fa-paperclip"></i> 2</strong>
                                        </div>
                                    </div>
                                    <div class="message-item-right">
                                        <div class="media">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar5_big.png" alt="avatar 5" width="50" class="pull-left">
                                            <div class="media-body">
                                                <small class="pull-right">23 Sept</small>
                                                <h5 class="c-dark"><strong>John Snow</strong></h5>
                                                <h4 class="c-dark">Reset your account password</h4>
                                            </div>
                                        </div>
                                        <p class="f-14 c-gray">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
                                    </div>
                                </div>
                                <div class="message-item media">
                                    <div class="pull-left text-center">
                                        <div class="pos-rel message-checkbox">
                                            <input type="checkbox" data-style="flat-red">
                                        </div>
                                        <div>
                                            <strong><i class="fa fa-paperclip"></i> 2</strong>
                                        </div>
                                    </div>
                                    <div class="message-item-right">
                                        <div class="media">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar10_big.png" alt="avatar 10" width="50" class="pull-left">
                                            <div class="media-body">
                                                <small class="pull-right">23 Sept</small>
                                                <h5 class="c-dark"><strong>Jerry Smith</strong></h5>
                                                <h4 class="c-dark">Check Dropbox</h4>
                                            </div>
                                        </div>
                                        <p class="f-14 c-gray">Hello Steve, I have added new files in your Dropbox in order to show you how to...</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-8 email-hidden-sm detail-message">
                    <div id="message-detail" class="panel panel-default withScroll" data-height="window" data-padding="40">
                        <div class="panel-heading messages message-result">
                            <div class="message-action-btn clearfix p-t-20">
                                <div class="pull-left">
                                    <div id="go-back" data-rel="tooltip" title="Go back" class="icon-rounded m-r-10 email-go-back"><i class="fa fa-hand-o-left"></i>
                                    </div>
                                    <div data-rel="tooltip" title="Reply" class="icon-rounded m-r-10"><i class="fa fa-reply"></i>
                                    </div>
                                    <div data-rel="tooltip" title="Forward" class="icon-rounded m-r-10"><i class="fa fa-long-arrow-right"></i>
                                    </div>
                                    <div data-rel="tooltip" title="Remove from favs" class="icon-rounded heart-red m-r-10"><i class="fa fa-heart"></i>
                                    </div>
                                    <div data-rel="tooltip" title="Print" class="icon-rounded m-r-10"><i class="fa fa-print"></i>
                                    </div>
                                    <div data-rel="tooltip" title="Move to trash" class="icon-rounded m-r-10"><i class="fa fa-trash-o"></i>
                                    </div>
                                </div>
                                <div class="pull-right">
                                    <div data-rel="tooltip" title="Prev" class="icon-rounded m-r-10"><i class="fa fa-angle-double-left"></i>
                                    </div>
                                    <div data-rel="tooltip" title="Next" class="icon-rounded m-r-10"><i class="fa fa-angle-double-right"></i>
                                    </div>
                                    <div data-rel="tooltip" title="Parameters" class="icon-rounded gear m-r-10"><i class="fa fa-gear"></i>
                                    </div>
                                </div>
                            </div>
                            <h2 class="p-t-20 w-500">Re: Check Dropbox</h2>
                        </div>
                        <div class="panel-body messages message-result">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="p-20">
                                        <div class="message-item media">
                                            <div class="message-item-right">
                                                <div class="media">
                                                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar4_big.png" alt="avatar 4" width="50" class="pull-left">
                                                    <div class="media-body">
                                                        <small class="pull-right">23 Sept</small>
                                                        <h5 class="c-dark"><strong>Jerry Smith</strong></h5>
                                                        <p class="c-gray">jerry.smith@gmail.com</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="message-body">
                                        <p>Hi John,</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus, libero corporis ipsam voluptatibus suscipit eos expedita sapiente omnis voluptatum ea! Culpa, vitae eaque quis modi voluptatum quisquam ullam. Modi,
                                            tempora!</p>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                        <p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>
                                        <p>Thanks
                                            <br>Jerry</p>
                                        <div class="message-attache">
                                            <div class="media">
                                                <i class="fa fa-paperclip pull-left fa-2x"></i>
                                                <div class="media-body">
                                                    <div><a href="" class="strong text-regular">Project.zip</a>
                                                    </div>
                                                    <span>12 MB</span>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="media">
                                                <i class="fa fa-file pull-left fa-2x"></i>
                                                <div class="media-body">
                                                    <div><a href="" class="strong text-regular">Contract.pdf</a>
                                                    </div>
                                                    <span>228 KB</span>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="message-between"></div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="p-20">
                                        <h3 class="message-title">Check Dropbox</h3>
                                        <div class="message-item media">
                                            <div class="message-item-right">
                                                <div class="media">
                                                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar7_big.png" alt="avatar 7" width="50" class="pull-left">
                                                    <div class="media-body">
                                                        <small class="pull-right">22 Sept</small>
                                                        <h5 class="c-dark"><strong>John Snow</strong></h5>
                                                        <p class="c-gray">john.snow@gmail.com</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="message-body">
                                        <p>Hi Jerry,</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus, libero corporis ipsam voluptatibus suscipit eos expedita sapiente omnis voluptatum ea! Culpa, vitae eaque quis modi voluptatum quisquam ullam. Modi,
                                            tempora!</p>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                        <p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>
                                        <p>Thanks
                                            <br>John</p>
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
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/mailbox.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
    <!-- END MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/application.js"></script>
</body>

</html>

