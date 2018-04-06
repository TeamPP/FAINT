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
</head>

<body data-page="profil_edit">
    	<!-- BEGIN TOP MENU -->
	<%@include file="common/common_top.jsp"%>
	<!-- END TOP MENU -->
	<!-- BEGIN WRAPPER -->
	<div id="wrapper">

		<!--  left side bar -->
		<%@include file="common/common_left.jsp"%>
        <!-- BEGIN MAIN CONTENT -->
        <div id="main-content">
            <div class="page-title"> <i class="icon-custom-left"></i>
                <h2>Parameters <small>here you can update your info &amp; notifications settings</small></h2>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <form action="#"  class="form-horizontal" role="form" id="settings">
                            <!-- BEGIN TABS -->
                            <div class="tabbable tabbable-custom form">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#general_settings" data-toggle="tab">INFOS</a></li>
                                    <li><a href="#email_settings" data-toggle="tab">NOTIFICATIONS</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="space20"></div>
                                    <div class="tab-pane active" id="general_settings">
                                        <div class="row profile">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <ul class="list-unstyled profile-nav col-md-3">
                                                            <li>
                                                                <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar4_big.png" alt="avatar 4"/>
                                                            </li>
                                                        </ul>
                                                        <div class="col-md-9">
                                                            <div class="row">
                                                                <div class="col-md-12 profile-info">
                                                                    <h1>John Addams</h1>
                                                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt laoreet dolore magna aliquam tincidunt erat volutpat laoreet dolore magna aliquam tincidunt erat volutpat.</p>
                                                                    <div class="m-t-10"></div>
                                                                    <ul class="list-unstyled list-inline">
                                                                        <li class="m-r-20"><i class="fa fa-map-marker p-r-5 c-dark"></i> New York</li>
                                                                        <li class="m-r-20"><i class="fa fa-calendar p-r-5 c-purple"></i> July 2012</li>
                                                                        <li class="m-r-20"><i class="fa fa-briefcase p-r-5 c-brown"></i> Webmaster</li>
                                                                        <li class="m-r-20"><i class="fa fa-star p-r-5 c-blue"></i> Moderator</li>
                                                                        <li><i class="fa fa-heart p-r-5 c-red"></i> Swimming</li>
                                                                    </ul>
                                                                    <div class="m-t-20"></div>
                                                                    <a href="profil.html" class="btn btn-dark">See my Profil</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="alert alert-block alert-info fade in width-100p">
                                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                            <h5>Your profil is visible by all users. <a href="#">Edit my parameters</a></h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row profile-classic">
                                                    <div class="col-md-12 m-t-20">
                                                        <div class="panel">
                                                            <div class="panel-title line">
                                                                <div class="caption"><i class="fa fa-phone c-gray m-r-10"></i> CONTACT</div>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div class="row">
                                                                    <div class="control-label c-gray col-md-3">Email:</div>
                                                                    <div class="col-md-6">
                                                                        <input type="text" class="form-control" id="field-1" value="john@yahoo.com">
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="control-label c-gray col-md-3">Phone:</div>
                                                                    <div class="col-md-6">
                                                                        <input type="text" class="form-control" id="field-1" value="02 988 774">
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="control-label c-gray col-md-3">Mobile:</div> 
                                                                    <div class="col-md-6">
                                                                        <input type="text" class="form-control" id="field-1" value="06 336 22 44 55">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row profile-classic">
                                                    <div class="col-md-12">
                                                        <div class="panel">
                                                            <div class="panel-title line">
                                                                <div class="caption"><i class="fa fa-info c-gray m-r-10"></i> ABOUT</div>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div class="row">
                                                                    <div class="control-label col-md-3 p-t-0">Member since:</div> 
                                                                    <div class="col-md-6">July 2012</div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="control-label col-md-3 p-t-0">Invited by:</div> 
                                                                    <div class="col-md-6"><a href="#">John Pharell</a></div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="control-label col-md-3">Surname:</div> 
                                                                    <div class="col-md-6">
                                                                        <input type="text" class="form-control" id="field-1" value="Tod"></div>

                                                                </div>
                                                                <div class="row">
                                                                    <div class="control-label col-md-3">Hobbies:</div> 
                                                                    <div class="col-md-6">
                                                                        <input type="text" class="form-control" id="field-1" value="football, basket"></div>
                                                                </div>
                                                                
                                                                <div class="row">
                                                                    <div class="control-label col-md-3">Fun facts:</div> 
                                                                    <div class="col-md-6">
                                                                        <input type="text" class="form-control" id="field-1" value="Love to go in space"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row profile-classic">
                                                    <div class="col-md-12">
                                                        <div class="panel">
                                                            <div class="panel-title line">
                                                                <div class="caption"><i class="fa fa-group c-gray m-r-10"></i> FAMILY</div>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div class="row">
                                                                <div class="control-label col-md-3">Children:</div> 
                                                                <div class="col-md-6">
                                                                    <input type="text" class="form-control" id="field-1" value="William"></div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="control-label col-md-3">Dogs:</div> 
                                                                    <div class="col-md-6">
                                                                        <input type="text" class="form-control" id="field-1" value="Marley">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row profile-classic">
                                                    <div class="col-md-12">
                                                        <div class="panel">
                                                            <div class="panel-title line">
                                                                <div class="caption"><i class="fa fa-home c-gray m-r-10"></i> ADDRESS</div>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div class="row">
                                                                    <div class="control-label col-md-3">Street:</div> 
                                                                    <div class="col-md-6">
                                                                        <input type="text" class="form-control" id="field-1" value="25 Jump Street">
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="control-label col-md-3">City:</div> 
                                                                    <div class="col-md-6">
                                                                        <input type="text" class="form-control" id="field-1" value="New York">
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="control-label col-md-3">Zip Code:</div> 
                                                                    <div class="col-md-6">
                                                                        <input type="text" class="form-control" id="field-1" value="10 007">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row profile-classic">
                                                    <div class="col-md-12">
                                                        <div class="panel">
                                                            <div class="panel-title line">
                                                                <div class="caption"><i class="fa fa-bar-chart-o c-gray m-r-10"></i> PERSONAL STATS</div>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div class="row">
                                                                    <div class="control-label col-md-3 p-t-0">ARTICLES:</div> 
                                                                    <div class="col-md-9">4</div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="control-label col-md-3 p-t-0">ANSWERS:</div> 
                                                                    <div class="col-md-9">2</div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="control-label col-md-3 p-t-0">PICTURES:</div> 
                                                                    <div class="col-md-9">1</div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="control-label col-md-3 p-t-0">EVENTS:</div> 
                                                                    <div class="col-md-9">1</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div> 
                                                <div class="col-sm-12">
                                                    <div class="align-center">
                                                        <button class="btn btn-primary m-r-20">Validate</button>
                                                        <button type="reset" class="btn btn-default">Cancel</button>
                                                    </div>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="email_settings">
                                        <p class="m-t-20">You will receive your notification here youremail@yahoo.fr <a href="#"><strong>Change my email</strong></a></p>
                                        <div class="m-t-10"></div>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="col-md-3"></th>
                                                    <th class="col-md-3">
                                                    <strong>INSTANTLY</strong><br/>
                                                    <span>receive an email directly after update</span>
                                                    </th>
                                                    <th class="col-md-3"><strong>DAYLY</strong><br/>
                                                    <span>receive one email by day with all updates</span>
                                                    </th>
                                                    <th class="col-md-3"><strong>NO EMAIL</strong><br/>
                                                    <span>See updates only when I sign in.</span>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td colspan="4"><strong>MESSAGES</strong></td>
                                                </tr>
                                                <tr>
                                                    <td>My contacts</td>
                                                    <td>
                                                        <input type="radio" name="contacts" value="1" checked/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="contacts" value="2"/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="contacts" value="3"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Other people</td>
                                                    <td>
                                                        <input type="radio" name="people" value="1"/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="people" value="2" checked/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="people" value="3"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Smallads</td>
                                                    <td>
                                                        <input type="radio" name="smallads" value="1"/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="smallads" value="2" checked/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="smallads" value="3" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>News</td>
                                                    <td>
                                                        <input type="radio" name="news" value="1" checked/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="news" value="2"/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="news" value="3"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Recommandations</td>
                                                    <td>
                                                        <input type="radio" name="recommandations" value="1"/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="recommandations" value="2"/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="recommandations" value="3" checked/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Important Alerts (<a href="#" class="c-blue">SMS</a>)</td>
                                                    <td>
                                                        <input type="radio" name="alerts" value="1" checked/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="alerts" value="2"/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="alerts" value="3"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Messages sent by email</td>
                                                    <td colspan="3">
                                                        <label>
                                                            <input type="checkbox" checked>Send me a confirmation when I send an email.
                                                        </label>   
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Welcome message</td>
                                                    <td colspan="3">
                                                        <label>
                                                            <input type="checkbox" checked>Send a message when someone thanks me for my message.
                                                        </label> 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4"><strong>MEMBERS</strong></td>
                                                </tr>
                                                <tr>
                                                    <td>New members</td>
                                                    <td colspan="3">
                                                        <label>
                                                            <input type="checkbox" checked>Send me a confirmation when I send an email.
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Contacts not verified</td>
                                                    <td colspan="3">
                                                        <label>
                                                            <input type="checkbox" checked>Send me a message.
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4"><strong>PICTURES</strong></td>
                                                </tr>
                                                <tr>
                                                    <td>New Pictures</td>
                                                    <td>
                                                        <input type="radio" name="pics" value="option1" checked/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="pics" value="option1"/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="pics" value="option1"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Pictures from friends</td>
                                                    <td colspan="3">
                                                        <label>
                                                            <input type="checkbox" checked>Send me an email
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4"><strong>ANSWERS</strong></td>
                                                </tr>
                                                <tr>
                                                    <td>New Answer from users</td>
                                                    <td>
                                                        <input type="radio" name="answers" value="1" checked/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="answers" value="2"/>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="answers" value="3"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Answer one of my message</td>
                                                    <td colspan="3">
                                                        <label>
                                                            <input type="checkbox" checked>Send me an email when someone answer one of my message.
                                                        </label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="row">
                                            
                                            <div class="col-sm-12">
                                            <div class="align-center m-t-20">
                                                <button class="btn btn-primary m-r-20">Validate</button>
                                                <button type="reset" class="btn btn-default">Cancel</button>
                                            </div>
                                        </div> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--END TABS-->
                        </form>=
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
                <span>
                    <i class="online"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3"/>
                    <div class="chat-name">Alexa Johnson</div>
                    <div class="pull-right badge badge-danger hide">3</div>
                    <div >Los Angeles</div>
                </span>
                <ul class="chat-messages">
                    <li class="img"><span><div class="chat-detail"><img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3"/><div class="chat-bubble">Hi you!</div></div></span>
                    </li>
                    <li class="img"><span><div class="chat-detail"><img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3"/><div class="chat-bubble">You there?</div></div></span>
                    </li>
                    <li class="img"><span><div class="chat-detail"><img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3"/><div class="chat-bubble">Let me know when you come back</div></div></span>
                    </li>
                    <div class="chat-input">
                        <input type="text" class="form-control form-control send-message" placeholder="Type your message" />
                    </div>
                </ul>
            </li>
            <li class="img no-arrow">
                <span>
                    <i class="online"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar2.png" alt="avatar 2"/>
                    <div class="chat-name">Bobby Brown</div>
                    <div>New York</div>
                </span>
                <ul class="chat-messages">
                    <div class="chat-input">
                        <input type="text" class="form-control form-control send-message" placeholder="Type your message" />
                    </div>
                </ul>
            </li>
            <li class="img no-arrow">
                <span>
                    <i class="busy"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar13.png" alt="avatar 13"/>
                    <div class="chat-name">Fred Smith</div>
                    <div>Atlanta</div>
                </span>
                <ul class="chat-messages">
                    <div class="chat-input">
                        <input type="text" class="form-control form-control send-message" placeholder="Type your message" />
                    </div>
                </ul>
            </li>
            <li class="img no-arrow">
                <span>
                    <i class="away"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar4.png" alt="avatar 4"/>
                    <div class="chat-name">James Miller</div>
                    <div>Seattle</div>
                </span>
                <ul class="chat-messages">
                    <div class="chat-input">
                        <input type="text" class="form-control form-control send-message" placeholder="Type your message" />
                    </div>
                </ul>
            </li>
            <li class="img no-arrow">
                <span>
                    <i class="online"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar5.png" alt="avatar 5"/>
                    <div class="chat-name">Jefferson Jackson</div>
                    <div>Los Angeles</div>
                </span>
                <ul class="chat-messages">
                    <div class="chat-input">
                        <input type="text" class="form-control form-control send-message" placeholder="Type your message" />
                    </div>
                </ul>
            </li>
            <li class="mm-label label-big m-t-30">OFFLINE</li>

            <li class="img no-arrow">
                <span>
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar6.png" alt="avatar 6"/>
                    <div class="chat-name">Jordan</div>
                    <div>Savannah</div>
                </span>
                <ul class="chat-messages">
                    <div class="chat-input">
                        <input type="text" class="form-control form-control send-message" placeholder="Type your message" />
                    </div>
                </ul>
            </li>
            <li class="img no-arrow">
                <span>
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar7.png" alt="avatar 7"/>
                    <div class="chat-name">Kim Addams</div>
                    <div>Birmingham</div>
                </span>
                <ul class="chat-messages">
                    <div class="chat-input">
                        <input type="text" class="form-control form-control send-message" placeholder="Type your message" />
                    </div>
                </ul>
            </li>
            <li class="img no-arrow">
                <span>
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar8.png" alt="avatar 8"/>
                    <div class="chat-name">Meagan Miller</div>
                    <div>San Francisco</div>
                </span>
                <ul class="chat-messages">
                    <div class="chat-input">
                        <input type="text" class="form-control form-control send-message" placeholder="Type your message" />
                    </div>
                </ul>
            </li>
            <li class="img no-arrow">
                <span>
                        <i class="offline"></i>
                        <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar9.png" alt="avatar 9"/>
                        <div class="chat-name">Melissa Johnson</div>
                        <div>Austin</div>
                    </span>
                <ul class="chat-messages">
                    <div class="chat-input">
                        <input type="text" class="form-control form-control send-message" placeholder="Type your message" />
                    </div>
                </ul>
            </li>
            <li class="img no-arrow">
                <span>
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar12.png" alt="avatar 12"/>
                    <div class="chat-name">Nicole Smith</div>
                    <div>San Diego</div>
                </span>
                <ul class="chat-messages">
                    <div class="chat-input">
                        <input type="text" class="form-control form-control send-message" placeholder="Type your message" />
                    </div>
                </ul>
            </li>
            <li class="img no-arrow">
                <span>
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar11.png" alt="avatar 11"/>
                    <div class="chat-name">Samantha Harris</div>
                    <div>Salt Lake City</div>
                </span>
                <ul class="chat-messages">
                    <div class="chat-input">
                        <input type="text" class="form-control form-control send-message" placeholder="Type your message" />
                    </div>
                </ul>
            </li>
            <li class="img no-arrow">
                <span>
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar10.png" alt="avatar 10"/>
                    <div class="chat-name">Scott Thomson</div>
                    <div>Los Angeles</div>
                </span>
                <ul class="chat-messages">
                    <div class="chat-input">
                        <input type="text" class="form-control form-control send-message" placeholder="Type your message" />
                    </div>
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
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/application.js"></script>
</body>


</html>
