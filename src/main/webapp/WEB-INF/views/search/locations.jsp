<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--헤더-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--제이쿼리 라이브러리  -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 모달 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
 <!-- 구글맵 api -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDzpqYW7uB7zVuh5_QgruzBNcsFt71fkI&callback=initMap" async="" defer=""></script>
 
 
 
<title>${keyword}</title>

<style>
h1, h5 {
   text-align: center;
}
#map{
width: 100%;
height: 300px; 
display: block;
margin-bottom:4%;
}
</style>


</head>
<body>
      
<!-- 구글 지도 -->
<div id="map" ></div>
<h1 id="keywordTitle">${keyword}</h1>


<!-- 구글지도 넣기  -->
<script>
$(document).ready(function() {
   //맵초기화
   initMap(); 
   
   var keyword="${keyword}";
   console.log(keyword);
   //keyword=keyword.substring(1,keyword.length);  //%빼고 keyword값 가져옥;
   //console.log("keyword %빼고:      "+keyword);
   geocoding(keyword);
});

var map, geocoder, marker;
function initMap(){
   var mapObj = document.getElementById('map');
   //맵 객체 없을땐 리턴
   if(mapObj == null || typeof mapObj == "undefined"){
      return;
   }
   geocoder = new google.maps.Geocoder();
   map = new google.maps.Map(mapObj, {
      center : {
      lat : -34.397, lng : 150.644},
      zoom : 14
   });
   marker = new google.maps.Marker();   
} 
//지오코딩
//이름으로 gps위치 얻기
function geocoding(str) {
   if(str == null || str =="" || typeof str == "undefined") return;
   var modalAddress = str;
   console.log(modalAddress);
   geocoder.geocode({
      'address' : modalAddress
   }, function(results, status) {
      if (status == 'OK') {
         marker.setPosition(results[0].geometry.location);
         marker.setMap(map);
         map.setCenter(results[0].geometry.location);
      } else {
         alert('검색결과가 없습니다.');
      }
   });
}
</script>

<script type="text/javascript">
   //postFeed로 전달될 데이터
   var jsonList = ${jsonList};
   var uid=null;
</script>

<!-- 메인피드 -->
<jsp:include page="/WEB-INF/views/include/postFeed.jsp" flush="false" />
   
   
</body>
</html>