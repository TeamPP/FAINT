<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <!DOCTYPE html>
<html>
<head><title>로그인 페이지</title></head>
<body>
	<h1>로그인 페이지</h1>
	<form action="<c:url value='/login-processing'/>" method="post">
		<input type="email" name="email" placeholder="이메일 입력" required>
		<input type="password" name="password" placeholder="비밀번호 입력" required>
		<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
		<input type="submit" value="로그인">
	</form>
	<a href="<c:url value='/join.do'/>">회원가입</a>
	<c:if test="${ param.error == 'login' }">
		<p style="color:#FF0000">이메일 혹은 비밀번호를 잘못 입력하셨습니다.</p>
	</c:if>
	<c:if test="${ param.logout == 'true' }">
		<p style="color:#FF0000">로그아웃 하였습니다.</p>
	</c:if>
</body>
</html> --%>




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

    <link rel="shortcut icon" href="/resources/images/favicon/idea.ico" type="image/x-icon" />
    <link rel="icon"  href="/resources/images/favicon/idea.ico"  type="image/x-icon"  />
    <title>FFFFAAAAIIIINNT</title>
    <!--필수 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no">

    <%--애니메이션 효과--%>
    <link rel="stylesheet" href="/resources/dist/css/animate.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css">
    <%--이모티콘--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="/resources/bootstrap-social.css" rel="stylesheet">

    <!-- jquery load -->

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
    <%--bootstrap--%>
    <%--<link rel="stylesheet" href="/resources/dist/css/bootstrap.css">--%>
    <%--<link rel="stylesheet" href="/resources/dist/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" href="/resources/dist/css/_bootswatch.scss">--%>
    <link href="https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0-beta.3/sketchy/bootstrap.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="/resources/dist/css/_variables.scss">--%>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="/resources/dist/js/bootstrap.min.js"></script>



    <link href="/resources/dist/css/home.css" rel="stylesheet">
    <%--jquery--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%--스크롤 애니메이션--%>
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <%--첨부파일--%>
    <script src="/resources/dist/js/upload.js"></script>

    
    <style>
        .naver{
            background-color:#1EC800;
            margin-top: 5px;
            color:white;
        }
        .naverImg{
            /*background-color:#1EC800;*/
            height:32px;
            margin:auto;
            padding-right:4px;
            padding-left:4px;
            padding:3px;
        }
        /*.naverImg:hover {*/
        /*!*box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);*!*/
        /*background-color: #00b300;*/
        /*}*/
        .naver:hover{
            /*box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);*/
            background-color: #00b300;
            color:white;
        }


        .navbar {
            margin-bottom: 20px;
        }

    </style>
    
<link href="/resources/dist/css/login.css" rel="stylesheet">
<div  id="login">
    <div class="wrapper fadeInDown text-center">

        <div class="card border-secondary mb-3" style="max-width: 20rem;" id="formContent">

            <div class="card-header" style="background-color: black">


                <h1 class="text-white hn">Log in</h1>

            </div>
            <div class="card-body text-secondary" id="formFooter">

                <!-- Login Form -->
                <form name="login" action="<c:url value='/login-processing'/>"method="post">


                    <input type="text" class="form-control" id="email" name="email" placeholder="가입한 Email을 입력해주세요12" autofocus>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password를 입력해주세요" >
                    <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
                    <input type="submit" class="form-control btn btn-primary" value="로그인"/>

                </form>
                	<c:if test="${ param.error == 'login' }">
						<p style="color:#FF0000">이메일 혹은 비밀번호를 잘못 입력하셨습니다.</p>
					</c:if>
					<c:if test="${ param.logout == 'true' }">
						<p style="color:#FF0000">로그아웃 하였습니다.</p>
					</c:if>

             
                <div>
                    <%--<a href="/user/githubLogin">--%>
                    <%--<img width="100%" height="50" src="/resources/images/github.png"/>--%>
                    <%--</a>--%>
                    <a class="btn btn-block btn-social btn-google naver"  href="/user/naverLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-google']);">
                        <img class="naverImg ml-2" src="/resources/images/naver.png"/> Sign in with Naver
                    </a>
                    <a class="btn btn-block btn-social btn-google" href="/user/googleLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-google']);">
                        <span class="fa fa-google mt-1 ml-2"></span> Sign in with Google
                    </a>
                   <!--  <a class="btn btn-block btn-social btn-github" href="/user/githubLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-github']);">
                        <span class="fa fa-github mt-1 ml-2"></span> Sign in with GitHub
                    </a> -->
                </div>

                <button type="button" class="btn btn-block btn-social btn-tumblr" style="width:49%;margin-top: 4px;display: inline-block;text-align: center;padding-left: 0px;padding-right:0px;" onclick="location.href='/user/register'">회원가입</button>
                <button type="button" class="btn btn-block btn-social btn-tumblr" style="width:49%;margin-top: 4px;;display: inline-block;text-align: center;padding-left: 0px;padding-right:0px;" onclick="location.href='/user/findPassword'">비밀번호 찾기</button></div>


        </div>
    </div>

</div>
	