<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		
		<!-- Bootstrap core CSS -->
		<link href="assets/css/bootstrap.css" rel="stylesheet">
		<link href="assets/css/note_content_view.css" rel="stylesheet">
		
	
	</head>
<body style="background-color:#f2f2f2;">
<div class="container" >
	<div>
	    
	    <div class="col-md-8 col-md-offset-3" style="padding-top:100px; padding-right:70px;padding-left:70px; height:100%; background-color: #FFFFFF">
	   
	    		<h1 style="color:rgb(30,180,200); margin-bottom:30px;">받은 쪽지 보기</h1>
		    		
    		<form action="reply_view?Id=${noteDto.id}" method="POST">
    		    
    		    <div class="form-group" style="margin-bottom:20px;">
    		        <label for="title">보낸 사람</label>
    		        <input type="text" value="${noteDto.sender}" class="form-control" name="Sender" />
    		    </div>
    		    
    		    <div class="form-group"style="margin-bottom:20px;">
    		        <label for="title">받은 사람</label>
    		        <input type="text" value="${noteDto.receiver}" class="form-control" name="Receiver" />
    		    </div>
    		    
    		    <div class="form-group">
    		        <label for="description">쪽지 내용</label>
    		        <textarea rows="10" class="form-control" name="Content" >${noteDto.content}</textarea>
    		    </div>
    		    
    		    
    		    <div class="form-group pull-right" style="margin-top:30px;">
    		        <button type="submit" class="btn btn-primary">
    		            답장 보내기
    		        </button>
				    		 <button type="button" class="btn btn-success" onclick="window.location.replace('receive_delete?Id=${noteDto.id}')"/>
				    	  	   쪽지 삭제
				     	  </button>
			    
    		        
    		    </div>
    		 </form>
    		   
		</div>
		
	</div>
</div>

</body>
</html>