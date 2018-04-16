<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head><title>접근 제한 페이지</title></head>
<body>
	<h1>접근 제한 페이지</h1>
	<div>
		<span>${ email }님은 접근할 수 없는 페이지 입니다.</span>
	</div>
	
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $(function () {
      $("body").hide();
      $("body").fadeIn(1000);
     
      setTimeout(function(){$("body").fadeOut(1000);},1000);
      setTimeout(function(){location.href=history.go(-1)},2000);
    
    });
    
    </script>
</body>
</html>s