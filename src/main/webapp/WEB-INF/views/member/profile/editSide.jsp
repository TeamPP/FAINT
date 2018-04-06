<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div class="_mleeu">
	<ul>
		<li><a class="<c:out value="${reqURL == '/member/profile/edit'? '_fvhml _t0stc' : '_fvhml _etlo6'}" />"
		 id="profileModify" href="edit">프로필편집</a></li> 
		<!-- 비밀번호 변경 -->
		<li><a class="<c:out value="${reqURL == '/member/profile/passwordChange'? '_fvhml _t0stc' : '_fvhml _etlo6'}" />"
		id="passwordModify" href="passwordChange">비밀번호 변경</a></li> 
		<li><a class="<c:out value="${reqURL == '/member/profile/blockedUser'? '_fvhml _t0stc' : '_fvhml _etlo6'}" />"
		id="blockedUser" href="blockedUser">차단된 사용자</a></li>
	</ul>
	
</div>
</body>
</html>