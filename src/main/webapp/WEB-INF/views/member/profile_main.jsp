<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach items="${list}" var="UserVO">

<div>

	<label>profile test</label>
		<ul>
			<li><a href="/member/profile?nickname=${UserVO.nickname}">email = ${UserVO.email}</a></li>
			<li>password = ${UserVO.password}</li>
			<li>name = ${UserVO.name}</li>
			<li>nickname = ${UserVO.nickname}</li>
			<li>phonenumber = ${UserVO.phonenumber}</li>
			<li>website = ${UserVO.website}</li>
			<li>intro = ${UserVO.intro}</li>
		</ul>
</div>

</c:forEach>

<h1>----------------------------------------------</h1>
	
</body>
</html>