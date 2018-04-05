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

<body data-page="faq">
   	<!-- BEGIN TOP MENU -->
		<%@include file="common/common_top.jsp" %>
	<!-- END TOP MENU -->
	<!-- BEGIN WRAPPER -->
	<div id="wrapper">
	
	<!--  left side bar -->
	<%@include file ="common/common_left.jsp" %>
        <!-- BEGIN MAIN CONTENT -->
        <div id="main-content">
            <div class="page-title"> <i class="icon-custom-left"></i>
                <h2>FAQ <small>questions &amp; answers</small></h2>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="control-bar sandbox-control-bar">
                        <div class="m-b-20">
                            <span class="btn btn-danger m-r-10 m-b-10 filter active" data-filter="all">All</span>
                            <span class="btn btn-danger m-r-10 m-b-10 filter" data-filter=".category-1">Company</span>
                            <span class="btn btn-danger m-r-10 m-b-10 filter" data-filter=".category-2">eCommerce</span>
                            <span class="btn btn-danger m-r-10 m-b-10 filter" data-filter=".category-3">Webdesign</span>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <p>Proin vel ultrices erat. Etiam et enim libero. Duis sollicitudin auctor faucibus. Duis tristique feugiat velit quis lobortis. Euismod molestie mi, ac lobortis enim cursus in. Curabitur nulla risus, ultricies vel lacinia a, tincidunt in leo.</p>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="panel-group panel-accordion dark-accordion">
                                    <div class="faq gallery config-open">
                                        <div class="row" id="faq">
                                            <div class="mix category-1 col-lg-12 panel panel-default" data-value="1">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" data-toggle="collapse" data-parent="#faq" href="#question1">
                                                            <strong class="c-gray-light">1.</strong> Our Company Mission
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="question1" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <p>The world is changing all around us. To continue to thrive as a business over the next ten years and beyond, we must look ahead, understand the trends and forces that will shape our business in the future and move swiftly to prepare for what's to come. We must get ready for tomorrow today. That's what our 2020 Vision is all about. It creates a long-term destination for our business and provides us with a "Roadmap" for winning together with our bottling partners.</p>
                                                        <ol>
                                                            <li>To inspire moments of optimism and happiness...</li>
                                                            <li>To create value and make a difference.</li>
                                                            <li>Pellentesque rhoncus arcu sed nisl vulputate ultrices.</li>
                                                            <li>In eget dolor nec tortor tempor blandit.</li>
                                                        </ol>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mix category-1 col-lg-12 panel panel-default" data-value="2">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" data-toggle="collapse" data-parent="#faq" href="#question2">
                                                            <strong class="c-gray-light">2.</strong> Our Philosophy
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="question2" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <p>The world is changing all around us. To continue to thrive as a business over the next ten years and beyond, we must look ahead, understand the trends and forces that will shape our business in the future and move swiftly to prepare for what's to come. We must get ready for tomorrow today. That's what our 2020 Vision is all about. It creates a long-term destination for our business and provides us with a "Roadmap" for winning together with our bottling partners.</p>
                                                        <ol>
                                                            <li>To inspire moments of optimism and happiness...</li>
                                                            <li>To create value and make a difference.</li>
                                                            <li>Pellentesque rhoncus arcu sed nisl vulputate ultrices.</li>
                                                            <li>In eget dolor nec tortor tempor blandit.</li>
                                                        </ol>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mix category-1 col-lg-12 panel panel-default" data-value="3">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" data-toggle="collapse" data-parent="#faq" href="#question3">
                                                            <strong class="c-gray-light">3.</strong> Our Vision
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="question3" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                                                        <ol>
                                                            <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                                                            <li>Mauris dictum tempor magna, sit amet venenatis elit sodales sagittis.</li>
                                                            <li>Pellentesque rhoncus arcu sed nisl vulputate ultrices.</li>
                                                            <li>In eget dolor nec tortor tempor blandit.</li>
                                                        </ol>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mix category-2 col-lg-12 panel panel-default" data-value="4">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" data-toggle="collapse" data-parent="#faq" href="#question4">
                                                            <strong class="c-gray-light">4.</strong> Delivery Time
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="question4" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                                                        <ol>
                                                            <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                                                            <li>Mauris dictum tempor magna, sit amet venenatis elit sodales sagittis.</li>
                                                            <li>Pellentesque rhoncus arcu sed nisl vulputate ultrices.</li>
                                                            <li>In eget dolor nec tortor tempor blandit.</li>
                                                        </ol>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mix category-1 col-lg-12 panel panel-default" data-value="5">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" data-toggle="collapse" data-parent="#faq" href="#question5">
                                                            <strong class="c-gray-light">5.</strong> Our Values
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="question5" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                                                        <ol>
                                                            <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                                                            <li>Mauris dictum tempor magna, sit amet venenatis elit sodales sagittis.</li>
                                                            <li>Pellentesque rhoncus arcu sed nisl vulputate ultrices.</li>
                                                            <li>In eget dolor nec tortor tempor blandit.</li>
                                                        </ol>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mix category-2 col-lg-12 panel panel-default" data-value="6">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" data-toggle="collapse" data-parent="#faq" href="#question6">
                                                            <strong class="c-gray-light">6.</strong> Politic of return
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="question6" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                                                        <ol>
                                                            <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                                                            <li>Mauris dictum tempor magna, sit amet venenatis elit sodales sagittis.</li>
                                                            <li>Pellentesque rhoncus arcu sed nisl vulputate ultrices.</li>
                                                            <li>In eget dolor nec tortor tempor blandit.</li>
                                                        </ol>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mix category-3 col-lg-12 panel panel-default" data-value="7">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" data-toggle="collapse" data-parent="#faq" href="#question7">
                                                            <strong class="c-gray-light">7.</strong> Graphic proposal
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="question7" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                                                        <ol>
                                                            <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                                                            <li>Mauris dictum tempor magna, sit amet venenatis elit sodales sagittis.</li>
                                                            <li>Pellentesque rhoncus arcu sed nisl vulputate ultrices.</li>
                                                            <li>In eget dolor nec tortor tempor blandit.</li>
                                                        </ol>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mix category-3 col-lg-12 panel panel-default" data-value="8">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" data-toggle="collapse" data-parent="#faq" href="#question8">
                                                            <strong class="c-gray-light">8.</strong> Color Style
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="question8" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                                                        <ol>
                                                            <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                                                            <li>Mauris dictum tempor magna, sit amet venenatis elit sodales sagittis.</li>
                                                            <li>Pellentesque rhoncus arcu sed nisl vulputate ultrices.</li>
                                                            <li>In eget dolor nec tortor tempor blandit.</li>
                                                        </ol>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mix category-2 col-lg-12 panel panel-default" data-value="9">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" data-toggle="collapse" data-parent="#faq" href="#question9">
                                                            <strong class="c-gray-light">9.</strong> Contact &amp; Address
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="question9" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                                                        <ol>
                                                            <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                                                            <li>Mauris dictum tempor magna, sit amet venenatis elit sodales sagittis.</li>
                                                            <li>Pellentesque rhoncus arcu sed nisl vulputate ultrices.</li>
                                                            <li>In eget dolor nec tortor tempor blandit.</li>
                                                        </ol>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
    <!-- END MANDATORY SCRIPTS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/gallery-mixitup/jquery.mixitup.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/faq.js"></script>    
    <!-- END  PAGE LEVEL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/application.js"></script>
</body>
</html>
