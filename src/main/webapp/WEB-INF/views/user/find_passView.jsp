<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
</head>

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.vo" var="login" />
<body>
<div class="container">
	<div id="passwordreset" style="margin-left:-15px;margin-right:-15px">
                    <div class="panel panel-info" style="margin-bottom:0px">
                        <div class="panel-heading">
                            <div class="panel-title">비밀번호 찾기</div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="#">아이디 찾기</a></div>
                        </div>  
                        <div class="panel-body" >
                            <form:form id="signupform" class="form-horizontal" role="form" commandName = "userDto" action="find_pass" method="post">
                          		  <div class="form-group">
                                    <label for="email" class="col-md-2 control-label">아이디</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="id" value="${login.id}"placeholder="이메일 아이디 입력">
                                    </div>
                                   	    <div class="col-md-offset-2 col-md-10">
	                                    	<div style="color:red ; margin-top:2px" >
	                                     		<form:errors path="bId"/>
	                                     		<form:errors />
	                                    	</div>
	                                    </div>
                                	</div>
   
                                <div class="form-group" style="margin-left:82%">
                                    <!-- Button -->
                                                  
                                    <div class="col-md-offset-10 col-md-9">
                                        <button id="btn-signup" type="submit" class="btn btn-warning">확인</button>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                            	가입하신 이메일로 비밀번호를 전송해드리겠습니다.
                                        </div>
                                    </div>
                                </div>    
                                
                            </form:form>
                         </div>
                    </div>
         </div> 
    </div>

</body>
</sec:authorize>
</html>