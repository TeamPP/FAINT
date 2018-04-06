<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!--참고로 jstl쓰려면 추가  -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--제이쿼리 라이브러리  -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<!--검색창 부트스트랩  -->  
<link rel="stylesheet" href="/resources/bootstrap/css/nav-style.css"> 
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<body>

		유저검색 페이지입니다. 
		
	
	<!--키워드 넣는 박스  -->
<%-- 	<form action="userPage" method="get">
	Search: <input type="text" placeholder="Search.." name="inputKeyword" id='Input' value='@${nickname}'  >
	<input type="button" value="submit">
	</form> --%>
	
	
			<nav class="navbar navbar-default"  >
        <div class="nav-wrap">
             <a class="logo pull-left" href="#"></a>
            <form class="search-form" action="/search/search" method="get">
                <input class="textInput" type="text" name='inputKeyword' id='Input' value='@${nickname}'
                placeholder="검색" title="사람검색@ 태그검색# 위치검색*">
                <span class="search-icon"></span>
            </form>
             <span class="pull-right">
                <a class="new-post" href="#"></a>
                <a class="follow-list" href="#"></a>
                <a class="account" href="#"></a>
            </span> 
        </div>
    </nav>  
	

            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover" id="tablebar">
                <tbody>
                <tr  class="scrollLocation">
                  <th>ROW</th>
                  <th>NAME</th>
                  <th>NICKNAME</th>
                  <th>PROFILEPHOTO</th>
                </tr>
                
                
                <c:forEach items="${userList}" var="userVO" >
                    <!--  class="listToChange"  -->
                    <tr class="listToChange" id="tablecontent">
                        <!--class="scrolling"  -->
                        <td  class="scrolling" data-row="${userVO.row}">${userVO.row}</td>
                        <td>${userVO.name}</td>
                        <td>${userVO.nickname}</td>
                        <td>${userVO.profilephoto}</td>
                    </tr>
                </c:forEach>
                
              </tbody></table>
            </div>
            <!-- /.box-body -->

 
<script type="text/javascript">     
$(function () {
	var lastrow=0; 
	//var lastrow = $(".scrolling:last").attr("data-row");
    // 1. 스크롤 이벤트 발생
    $(window).scroll(function(){ // ① 스크롤 이벤트 최초 발생
        /* 
            =================   다운 스크롤인 상태  ================
        */ 
            // down-scroll : 현재 게시글 다음의 글을 불러온다.
            console.log("down-scroll");
             
            // 2. 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
            if (  $(document).height() <= $(window).scrollTop() + $(window).height()+20){ //② 현재스크롤의 위치가 화면의 보이는 위치보다 크다면
            	console.log("스크롤 다 내림");
                // 3. class가 scrolling인 것의 요소 중 마지막인 요소를 선택한 다음 그것의 data-id속성 값을 받아온다.
                //      즉, 현재 뿌려진 게시글의 마지막 bno값을 읽어오는 것이다.( 이 다음의 게시글들을 가져오기 위해 필요한 데이터이다.)
             //  var lastrow = $(".scrolling:last").attr("data-row");
              lastrow=lastrow+10;
                console.log("lastrow :"+lastrow);
                 
                //var keyword = $("#Input").val();
                var keyword="${keyword }";
                console.log("keyword :"+keyword);
                
                
                // 4. ajax를 이용하여 현재 뿌려진 게시글의 마지막 bno를 서버로 보내어 그 다음 20개의 게시물 데이터를 받아온다.
                $.ajax({
                    type : 'post',  // 요청 method 방식
                    url : '/ScrollUsers',    // 요청할 서버의 url
                    headers : {
                        //"Content-Type" : "application/json",
                        "X-HTTP-Method-Override" : "POST"
                    },  
                    dataType : 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
                    data : { // 서버로 보낼 데이터 명시
                    	"row" : lastrow,
                    	 "keyword" : keyword
                    },
                    success : function(data){// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
                         
                        var str = "";
                         
                        // 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
                        if(data != ""){
                            //6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다.
                            $(data).each(
                                // 7. 새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
                                function(){
                                    console.log(this);     
                                    str +=  "<tr class=" + "'listToChange'" + ">"
                                        +       "<td class=" +  "'scrolling'" + " data-row='" + this.row +"'>"
                                        +           this.row
                                        +       "</td>"
                                        +       "<td>" + this.name + "</td>"      
                                        +       "<td>" + this.nickname + "</td>"
                                        +       "<td>" + this.profilephoto + "</td>"
                                        +   "</tr>";
                                         
                            });// each
                            // 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.
                            // $(".listToChange").empty();// 셀렉터 태그 안의 모든 텍스트를 지운다.                       
                           
                              console.log("lastrow :"+lastrow);
                            $(".listToChange:last").after(str);
                           // $(".scrollLocation").append(str);
                                 
                        }// if : data!=null
         
                    }// success
                });// ajax
                 
       
    }
     });// scroll event
});
</script>

</body>

</html>