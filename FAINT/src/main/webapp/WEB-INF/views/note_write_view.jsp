<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- Bootstrap core CSS -->
		<link href="assets/css/bootstrap.css" rel="stylesheet">
		<!--external css-->
		<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
		
		<!-- Custom styles for this template -->
		<link href="assets/css/style.css" rel="stylesheet">
		<link href="assets/css/style-responsive.css" rel="stylesheet">
		<link href="assets/css/table-responsive.css" rel="stylesheet">
		<link href="assets/list_css/comboBox.css" rel="stylesheet">
		<link href="assets/list_css/search.css" rel="stylesheet">
		<link href="assets/css/note_write_view.css" rel="stylesheet" />
		<script src="assets/js/jquery.js"></script>
	    <script src="assets/js/jquery-1.8.3.min.js"></script>
	    <script src="assets/js/bootstrap.min.js"></script>
	    <script src="assets/js/jquery.scrollTo.min.js"></script>
	    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
	    <script src="assets/js/jquery.sparkline.js"></script>
</head>

<body>

<div>  
  <form:form id="contact" action="write" method="post">
    <h3>쪽지 보내기</h3>
    <fieldset>
      <input placeholder="보내는 사람" type="text" name="Sender" value="${sender}" tabindex="1" required >
    </fieldset>
    <fieldset>
      <input placeholder="받는 사람" type="text" name="Receiver" value="${receiver}" tabindex="2" required>
    </fieldset>
    <fieldset>
      <textarea rows="5" placeholder="쪽지 내용을 입력해주세요." name="Content" tabindex="3" required ></textarea>
    </fieldset>
    <fieldset>
      <button type="submit" id="contact-submit" data-submit="보내는중..">전송</button>
    </fieldset>
  </form:form>
 
  
</div>



</body>
</html>

