<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>
   
<!--제이쿼리 라이브러리  -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 모달 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 업로드 관련 확장자 필터링 스크립트 -->
<script type="text/javascript" src="../../resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="/resources/css/header.css" type="text/css">
<link rel="stylesheet" href="/resources/css/animation.css" type="text/css">

<!-- 길이제한 함수, 해쉬태그 필터링 -->
<script type="text/javascript" src="../../resources/js/common.js"></script>

<!-- 웹소켓 -->
<script type="text/javascript" src="../../resources/js/sockjs-1.0.0.min.js"></script>
<script type="text/javascript" src="../../resources/js/stomp.js"></script>

<!-- 아이콘 부트스트랩  -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 이미지 필터 -->
<!-- <link rel="stylesheet" href="https://cssgram-cssgram.netdna-ssl.com/cssgram.min.css"> -->
<style>

body {
	font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,
					"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji",
					"Segoe UI Symbol" !important;
	background-color: white !important;
					"Segoe UI Symbol";
}

.headerPhoto{
   width: 38px;
   height: 38px;
   display: inline-block;
   border-radius: 150px;  /* 프사 둥글게 */
   vertical-align: baseline !important;
}
.show {display:block;}
#search-modal-content::after {
    border-color: transparent transparent #fff;
    border-style: solid;
    border-width: 0 10px 10px;
    height: 0;
    left: 98px;
    top: -10px;
    width: 0;
    z-index: 3;
	content: " ";
	position: absolute;
}
#follow-modal-content::after {
    border-color: transparent transparent #fff;
    border-style: solid;
    border-width: 0 10px 10px;
    height: 0;
    right: 40.5%;
    top: -10px;
    width: 0;
    z-index: 3;
	content: " ";
	position: absolute;
}
.modal.fade {
	top: 8%;
}

</style>

</head>
<body>
<div class="row" id="header" style="width:102%;">
    <div class="col-sm-12" style="height: 100px; background-color: white;">
        <div class="row" id="col2" style="width:100%;">

            <div class="col-sm-4" id="logo" style="height: 100%;">
                <a href="/main">
                    <img class="faintlogo" src="/resources/image/realogo.png">
                </a>
            </div>

            <div class="col-sm-4" id="search" style="height: 100%;">
                <form class="search-form" action="/search/search" method="get">
                    <input type="search" placeholder="Search" class="search-input" name='inputKeyword' id='keywordInput' value="${keyword}"
                     list="results" data-toggle="modal" data-target="#searchModal" data-backdrop="true" autocomplete="off">
                 <button type="submit" class="search-button">
                     <img class="searchbtn" src="/resources/image/search_icon/search.png">
                 </button>
                                 <div class="search-option">
                     <div>
                         <input class="type-all" name="type" type="radio" value="" id="type-all">
                         <label for="type-all">
                             <svg class="edit-pen-title">
                                 <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#all"></use>
                             </svg>
                             <!-- <span>All</span> -->
                         </label>
                     </div>

                     <div>
                         <input class="type-users" name="type" type="radio" value="" id="type-users">
                         <label for="type-users">
                             <svg class="edit-pen-title">
                                 <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use>
                             </svg>
                             <!-- <span>Users</span> -->
                         </label>
                     </div>

                     <div>
                         <input class="type-hashtags" name="type" type="radio" value="" id="type-hashtags">
                         <label for="type-hashtags">
                             <svg class="edit-pen-title">
                                 <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#hashtag"></use>
                             </svg>
                             <!-- <span>Hashtag</span> -->
                         </label>
                     </div>

                     <div>
                         <input class="type-locations" name="type" type="radio" value="" id="type-locations">
                         <label for="type-locations">
                             <svg class="edit-pen-title">
                                 <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#locations"></use>
                             </svg>
                             <!-- <span>Locations</span> -->
                         </label>
                     </div>

                 </div>
             </form>     
		
         </div>

<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.vo" var="login" />
         <div class="col-sm-4" id="menu" style="height: 100%;">
             <div class="pull-right">
                 <a class="explore" href="/explore/expage">
					<img src="/resources/image/header_icon/explore-icon.png">
                 </a>
                 <a class="new-post" href="/post/register">
					<img src="/resources/image/header_icon/newpost-icon.png">
                 </a>
                 <a class="recommend" href="/recommend/recompage">
					<img src="/resources/image/header_icon/recommend-icon.png">
                 </a>
                 <a class="follow-list" list="results" data-toggle="modal" data-target="#followModal" data-backdrop="true" autocomplete="off">
                 	<svg class="heart-svg">
                    	<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#heart"></use>
                    </svg>
                 </a>
                 
                 <a class="account" href="/member/${login.nickname}">
                     <c:choose>
                             <c:when test="${login.profilephoto ne null && login.profilephoto != ''}">
                                <img class="headerPhoto" src="http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122${login.profilephoto}" /> 
                             </c:when>
                             <c:otherwise>
                                <img class="headerPhoto" src="/resources/img/emptyProfile.jpg" />
                             </c:otherwise>
                          </c:choose>
                 </a>
                 <div class="dropdown">
                     <div class="dropbtn" onclick="myFunction()">${login.nickname}
                         <div id="myDropdown" class="dropdown-content">
                             <sec:authorize access="hasRole('ROLE_USER')">
                                 <form action="<c:url value='/logout'/>" method="post" class="logoutForm">
                                     <a class="logout">LOGOUT</a>
                                     <button type="submit" class="btn btn-default" style="display:none;">로그아웃</button>
                                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                 </form>
                             </sec:authorize>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
       </sec:authorize>
      
      	                        	             <!--Follow Modal -->
		<div class="modal fade" id="followModal" role="dialog" aria-hidden="false">
	        <div class="modal-content" id="follow-modal-content">
	            <div class="modal-header" id="follow-header-modal">
	                <ul id="follow-results">
						
					</ul>
	            </div>
	        </div>
		</div>
      
     </div>
 </div>
 
 <div class="col-sm-12">
         <div class="row" style="width:100%; height:70px;">
             <div class="col-sm-4"></div>
             <div class="col-sm-4">
             <c:choose>
				<c:when test="${reqURL == '/main'}">
	                <div class="row" style="width:100%; height:100%;">
	                    <div class="col-sm-2"></div>
	                    <div class="col-sm-8">
	                        <span class="catefilter" id="1">CATEGORY</span>
	                        <div class="cate-option">
	                                <div>
	                                    <input name="type" type="radio" value="type-cateAll" id="type-cateAll" data-filter="all" tabindex="-1"  onclick="cateClick(this)">
	                                    <label for="type-cateAll">
	                                        <svg class="edit-pen-title">
	                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#cateAll"></use>
	                                        </svg>
	                                        <span>All</span>
	                                    </label>
	                                </div>
	    
	                                <div>
	                                    <input name="type" type="radio" value="type-travel" id="type-travel" data-filter="1" tabindex="-1"  onclick="cateClick(this)">
	                                    <label for="type-travel">
	                                        <svg class="edit-pen-title">
	                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#travel"></use>
	                                        </svg>
	                                        <span>Travel</span>
	                                    </label>
	                                </div>
	    
	                                <div>
	                                    <input name="type" type="radio" value="type-movie" id="type-movie" data-filter="2" tabindex="-1"  onclick="cateClick(this)">
	                                    <label for="type-movie">
	                                        <svg class="edit-pen-title">
	                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#movie"></use>
	                                        </svg>
	                                        <span>Movie</span>
	                                    </label>
	                                </div>
	    
	                                <div>
	                                    <input name="type" type="radio" value="type-music" id="type-music" data-filter="3" tabindex="-1"  onclick="cateClick(this)">
	                                    <label for="type-music">
	                                        <svg class="edit-pen-title">
	                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#music"></use>
	                                        </svg>
	                                        <span>Music</span>
	                                    </label>
	                                </div>
	    
	                                <div>
	                                    <input name="type" type="radio" value="type-food" id="type-food" data-filter="4" tabindex="-1"  onclick="cateClick(this)">
	                                    <label for="type-food">
	                                        <svg class="edit-pen-title">
	                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#food"></use>
	                                        </svg>
	                                        <span>Food</span>
	                                    </label>
	                                </div>
	    
	                                <div>
	                                    <input name="type" type="radio" value="type-writing" id="type-writing" data-filter="5" tabindex="-1"  onclick="cateClick(this)">
	                                    <input name="type" type="radio" value="type-cateAll" id="type-cateAll" data-filter="all" tabindex="-1"  onclick="cateClick(this)" />
	                                    <label for="type-cateAll">
	                                        <svg class="edit-pen-title">
	                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#cateAll"></use>
	                                        </svg>
	                                        <span>All</span>
	                                    </label>
	                                </div>
	    
	                                <div>
	                                    <input name="type" type="radio" value="type-travel" id="type-travel" data-filter="1" tabindex="-1"  onclick="cateClick(this)" />
	                                    <label for="type-travel">
	                                        <svg class="edit-pen-title">
	                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#travel"></use>
	                                        </svg>
	                                        <span>Travel</span>
	                                    </label>
	                                </div>
	    
	                                <div>
	                                    <input name="type" type="radio" value="type-movie" id="type-movie" data-filter="2" tabindex="-1"  onclick="cateClick(this)" />
	                                    <label for="type-movie">
	                                        <svg class="edit-pen-title">
	                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#movie"></use>
	                                        </svg>
	                                        <span>Movie</span>
	                                    </label>
	                                </div>
	    
	                                <div>
	                                    <input name="type" type="radio" value="type-music" id="type-music" data-filter="3" tabindex="-1"  onclick="cateClick(this)" />
	                                    <label for="type-music">
	                                        <svg class="edit-pen-title">
	                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#music"></use>
	                                        </svg>
	                                        <span>Music</span>
	                                    </label>
	                                </div>
	    
	                                <div>
	                                    <input name="type" type="radio" value="type-food" id="type-food" data-filter="4" tabindex="-1"  onclick="cateClick(this)" />
	                                    <label for="type-food">
	                                        <svg class="edit-pen-title">
	                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#food"></use>
	                                        </svg>
	                                        <span>Food</span>
	                                    </label>
	                                </div>
	    
	                                <div>
	                                    <input name="type" type="radio" value="type-writing" id="type-writing" data-filter="5" tabindex="-1"  onclick="cateClick(this)" />
	                                    <label for="type-writing">
	                                        <svg class="edit-pen-title">
	                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#writing"></use>
	                                        </svg>
	                                        <span>Writing</span>
	                                    </label>
	                                </div>
	                            </div>
	                    </div>
	                    <div class="col-sm-2"></div>
	                </div>
               	</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
		
                	</div>
                <div class="col-sm-4"></div>
            </div>
    </div>
</div>

 <div class="row" style="width:100%">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">
	
	             <!--Search Modal -->
		<div class="modal fade" id="searchModal" role="dialog" aria-hidden="false">
		        <div class="modal-content" id="search-modal-content">
		            <div class="modal-header" id="search-header-modal">
		                <div id="results"></div>
		            </div>
		        </div>
		</div>
		
	</div>
	<div class="col-sm-4"></div>
</div>

<svg xmlns="http://www.w3.org/2000/svg" width="0" height="0" display="none">
    <symbol id="search" viewBox="0 0 32 32">
      <path d="M 19.5 3 C 14.26514 3 10 7.2651394 10 12.5 C 10 14.749977 10.810825 16.807458 12.125 18.4375 L 3.28125 27.28125 L 4.71875 28.71875 L 13.5625 19.875 C 15.192542 21.189175 17.250023 22 19.5 22 C 24.73486 22 29 17.73486 29 12.5 C 29 7.2651394 24.73486 3 19.5 3 z M 19.5 5 C 23.65398 5 27 8.3460198 27 12.5 C 27 16.65398 23.65398 20 19.5 20 C 15.34602 20 12 16.65398 12 12.5 C 12 8.3460198 15.34602 5 19.5 5 z"></path>
    </symbol>
    <symbol id="all" viewBox="0 0 448 512">
        <path xmlns="http://www.w3.org/2000/svg" d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z"/>
    </symbol>
    <symbol id="user" viewBox="0 0 1000 1000">
        <g>
            <path d="M500.1,596.1c-78.3,0-151.9-30.5-207.2-85.8C237.5,454.9,207,381.4,207,303.1c0-78.3,30.5-151.9,85.8-207.2C348.2,40.5,421.8,10,500.1,10c78.3,0,151.9,30.5,207.2,85.8c55.4,55.4,85.8,128.9,85.8,207.2c0,78.3-30.5,151.9-85.8,207.2C651.9,565.7,578.3,596.1,500.1,596.1z M500.1,75.3c-125.6,0-227.7,102.2-227.7,227.7c0,125.6,102.2,227.7,227.7,227.7c125.6,0,227.7-102.2,227.7-227.7C727.8,177.5,625.6,75.3,500.1,75.3z"/>
            <path d="M891.4,957.1c0,18.2,14.7,32.9,32.9,32.9c18.2,0,32.9-14.7,32.9-32.9s-14.7-32.9-32.9-32.9C906.2,924.1,891.4,938.9,891.4,957.1z"/>
            <path d="M42.6,956.9c0,18.3,14.8,33.1,33.1,33.1c18.3,0,33.1-14.8,33.1-33.1s-14.8-33.1-33.1-33.1C57.4,923.9,42.6,938.7,42.6,956.9z"/>
            <path d="M500.1,597.2c205,0,374.7,158.3,391.3,359.1h66.1c-3.5-50.4-15.2-99.4-34.9-146c-23.1-54.6-56.2-103.6-98.2-145.7c-42.1-42.1-91.1-75.2-145.7-98.3c-56.6-23.9-116.6-36-178.5-36c-61.9,0-121.9,12.1-178.5,36c-54.6,23.1-103.6,56.2-145.7,98.3c-42.1,42.1-75.2,91.1-98.3,145.7c-19.7,46.6-31.4,95.6-34.9,146h66.1C125.3,755.5,295.1,597.2,500.1,597.2z"/>
        </g>
    </symbol>
    <symbol id="locations" viewBox="0 0 384 512">
        <path d="M172.268 501.67C26.97 291.031 0 269.413 0 192 0 85.961 85.961 0 192 0s192 85.961 192 192c0 77.413-26.97 99.031-172.268 309.67-9.535 13.774-29.93 13.773-39.464 0zM192 272c44.183 0 80-35.817 80-80s-35.817-80-80-80-80 35.817-80 80 35.817 80 80 80z"/>
    </symbol>
    <symbol id="hashtag" viewBox="0 0 448 512">
        <path d="M440.667 182.109l7.143-40c1.313-7.355-4.342-14.109-11.813-14.109h-74.81l14.623-81.891C377.123 38.754 371.468 32 363.997 32h-40.632a12 12 0 0 0-11.813 9.891L296.175 128H197.54l14.623-81.891C213.477 38.754 207.822 32 200.35 32h-40.632a12 12 0 0 0-11.813 9.891L132.528 128H53.432a12 12 0 0 0-11.813 9.891l-7.143 40C33.163 185.246 38.818 192 46.289 192h74.81L98.242 320H19.146a12 12 0 0 0-11.813 9.891l-7.143 40C-1.123 377.246 4.532 384 12.003 384h74.81L72.19 465.891C70.877 473.246 76.532 480 84.003 480h40.632a12 12 0 0 0 11.813-9.891L151.826 384h98.634l-14.623 81.891C234.523 473.246 240.178 480 247.65 480h40.632a12 12 0 0 0 11.813-9.891L315.472 384h79.096a12 12 0 0 0 11.813-9.891l7.143-40c1.313-7.355-4.342-14.109-11.813-14.109h-74.81l22.857-128h79.096a12 12 0 0 0 11.813-9.891zM261.889 320h-98.634l22.857-128h98.634l-22.857 128z"/>
    </symbol>
    <symbol id="special" viewBox="0 0 32 32">
      <path d="M 4 4 L 4 5 L 4 27 L 4 28 L 5 28 L 27 28 L 28 28 L 28 27 L 28 5 L 28 4 L 27 4 L 5 4 L 4 4 z M 6 6 L 26 6 L 26 26 L 6 26 L 6 6 z M 16 8.40625 L 13.6875 13.59375 L 8 14.1875 L 12.3125 18 L 11.09375 23.59375 L 16 20.6875 L 20.90625 23.59375 L 19.6875 18 L 24 14.1875 L 18.3125 13.59375 L 16 8.40625 z M 16 13.3125 L 16.5 14.40625 L 17 15.5 L 18.1875 15.59375 L 19.40625 15.6875 L 18.5 16.5 L 17.59375 17.3125 L 17.8125 18.40625 L 18.09375 19.59375 L 17 19 L 16 18.40625 L 15 19 L 14 19.59375 L 14.3125 18.40625 L 14.5 17.3125 L 13.59375 16.5 L 12.6875 15.6875 L 13.90625 15.59375 L 15.09375 15.5 L 15.59375 14.40625 L 16 13.3125 z"></path>
    </symbol>
    <symbol id="cateAll" viewBox="0 0 448 512">
        <path d="M0 32h214.6v214.6H0V32zm233.4 0H448v214.6H233.4V32zM0 265.4h214.6V480H0V265.4zm233.4 0H448V480H233.4V265.4z"/>
    </symbol>
    <symbol id="travel" viewBox="0 0 576 512">
        <path d="M472 200H360.211L256.013 5.711A12 12 0 0 0 245.793 0h-57.787c-7.85 0-13.586 7.413-11.616 15.011L209.624 200H99.766l-34.904-58.174A12 12 0 0 0 54.572 136H12.004c-7.572 0-13.252 6.928-11.767 14.353l21.129 105.648L.237 361.646c-1.485 7.426 4.195 14.354 11.768 14.353l42.568-.002c4.215 0 8.121-2.212 10.289-5.826L99.766 312h109.858L176.39 496.989c-1.97 7.599 3.766 15.011 11.616 15.011h57.787a12 12 0 0 0 10.22-5.711L360.212 312H472c57.438 0 104-25.072 104-56s-46.562-56-104-56z"/>
    </symbol>
    <symbol id="movie" viewBox="0 0 512 512">
        <path d="M488 64h-8v20c0 6.6-5.4 12-12 12h-40c-6.6 0-12-5.4-12-12V64H96v20c0 6.6-5.4 12-12 12H44c-6.6 0-12-5.4-12-12V64h-8C10.7 64 0 74.7 0 88v336c0 13.3 10.7 24 24 24h8v-20c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v20h320v-20c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v20h8c13.3 0 24-10.7 24-24V88c0-13.3-10.7-24-24-24zM96 372c0 6.6-5.4 12-12 12H44c-6.6 0-12-5.4-12-12v-40c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v40zm0-96c0 6.6-5.4 12-12 12H44c-6.6 0-12-5.4-12-12v-40c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v40zm0-96c0 6.6-5.4 12-12 12H44c-6.6 0-12-5.4-12-12v-40c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v40zm272 208c0 6.6-5.4 12-12 12H156c-6.6 0-12-5.4-12-12v-96c0-6.6 5.4-12 12-12h200c6.6 0 12 5.4 12 12v96zm0-168c0 6.6-5.4 12-12 12H156c-6.6 0-12-5.4-12-12v-96c0-6.6 5.4-12 12-12h200c6.6 0 12 5.4 12 12v96zm112 152c0 6.6-5.4 12-12 12h-40c-6.6 0-12-5.4-12-12v-40c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v40zm0-96c0 6.6-5.4 12-12 12h-40c-6.6 0-12-5.4-12-12v-40c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v40zm0-96c0 6.6-5.4 12-12 12h-40c-6.6 0-12-5.4-12-12v-40c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v40z"/>
    </symbol>
    <symbol id="music" viewBox="0 0 512 512">
        <path d="M470.4 1.5l-304 96C153.1 101.7 144 114 144 128v264.6c-14.1-5.4-30.5-8.6-48-8.6-53 0-96 28.7-96 64s43 64 96 64 96-28.7 96-64V220.5l272-85.9v194c-14.1-5.4-30.5-8.6-48-8.6-53 0-96 28.7-96 64s43 64 96 64 96-28.7 96-64V32c0-21.7-21.1-37-41.6-30.5z"/>
    </symbol>
    <symbol id="food" viewBox="0 0 416 512">
        <path d="M207.9 15.2c.8 4.7 16.1 94.5 16.1 128.8 0 52.3-27.8 89.6-68.9 104.6L168 486.7c.7 13.7-10.2 25.3-24 25.3H80c-13.7 0-24.7-11.5-24-25.3l12.9-238.1C27.7 233.6 0 196.2 0 144 0 109.6 15.3 19.9 16.1 15.2 19.3-5.1 61.4-5.4 64 16.3v141.2c1.3 3.4 15.1 3.2 16 0 1.4-25.3 7.9-139.2 8-141.8 3.3-20.8 44.7-20.8 47.9 0 .2 2.7 6.6 116.5 8 141.8.9 3.2 14.8 3.4 16 0V16.3c2.6-21.6 44.8-21.4 48-1.1zm119.2 285.7l-15 185.1c-1.2 14 9.9 26 23.9 26h56c13.3 0 24-10.7 24-24V24c0-13.2-10.7-24-24-24-82.5 0-221.4 178.5-64.9 300.9z"/>
    </symbol>
    <symbol id="writing" viewBox="0 0 512 512">
        <path d="M497.9 142.1l-46.1 46.1c-4.7 4.7-12.3 4.7-17 0l-111-111c-4.7-4.7-4.7-12.3 0-17l46.1-46.1c18.7-18.7 49.1-18.7 67.9 0l60.1 60.1c18.8 18.7 18.8 49.1 0 67.9zM284.2 99.8L21.6 362.4.4 483.9c-2.9 16.4 11.4 30.6 27.8 27.8l121.5-21.3 262.6-262.6c4.7-4.7 4.7-12.3 0-17l-111-111c-4.8-4.7-12.4-4.7-17.1 0zM124.1 339.9c-5.5-5.5-5.5-14.3 0-19.8l154-154c5.5-5.5 14.3-5.5 19.8 0s5.5 14.3 0 19.8l-154 154c-5.5 5.5-14.3 5.5-19.8 0zM88 424h48v36.3l-64.5 11.3-31.1-31.1L51.7 376H88v48z"/>
    </symbol>
    <symbol id="heart" viewBox="0 0 485.3 485.3">
    	<path d="M349.6,28.95c-36.3,0-70.5,14.2-96.2,39.9l-10.6,10.6L232,68.65c-25.7-25.7-59.9-39.9-96.2-39.9     c-36.2,0-70.3,14.1-96,39.8S0,128.35,0,164.65s14.2,70.4,39.9,96.1l190.5,190.5l0.4,0.4c3.3,3.3,7.7,4.9,12,4.9     c4.4,0,8.8-1.7,12.1-5l190.5-190.5c25.7-25.7,39.9-59.8,39.9-96.1s-14.1-70.5-39.8-96.1C419.9,43.05,385.8,28.95,349.6,28.95z      M421.2,236.75l-178.3,178.4L64.2,236.45c-19.2-19.2-29.8-44.7-29.9-71.9c0-27.1,10.5-52.6,29.7-71.8     c19.2-19.1,44.7-29.7,71.7-29.7c27.2,0,52.7,10.6,72,29.9l22.9,22.9c6.4,6.4,17.8,6.4,24.3,0l22.8-22.8     c19.2-19.2,44.8-29.8,71.9-29.8s52.6,10.6,71.8,29.8c19.2,19.2,29.8,44.7,29.7,71.9C451.1,192.05,440.5,217.55,421.2,236.75z"/>
    </symbol>
    <symbol id="heart-effect" viewBox="0 0 219.839 219.839">
	<g>
		<path d="M64.92,18.919c-0.663,0-1.2-0.537-1.2-1.2v-5.447c0-0.663,0.537-1.2,1.2-1.2      c0.663,0,1.2,0.537,1.2,1.2v5.447C66.12,18.382,65.583,18.919,64.92,18.919z"/>
		<path d="M46.858,22.513c-0.471,0-0.917-0.279-1.108-0.741l-2.085-5.033      c-0.254-0.612,0.037-1.314,0.649-1.567c0.608-0.254,1.313,0.038,1.567,0.649l2.085,5.033c0.254,0.612-0.037,1.314-0.65,1.567      C47.167,22.483,47.011,22.513,46.858,22.513z"/>
		<path d="M31.545,32.744c-0.307,0-0.614-0.117-0.849-0.352l-3.852-3.853c-0.469-0.469-0.469-1.229,0-1.697      c0.469-0.469,1.228-0.469,1.697,0l3.852,3.853c0.469,0.469,0.469,1.229,0,1.697C32.159,32.627,31.852,32.744,31.545,32.744z"/>
		<path d="M98.295,32.744c-0.307,0-0.614-0.117-0.849-0.352c-0.469-0.469-0.469-1.229,0-1.697l3.853-3.853      c0.469-0.469,1.229-0.469,1.697,0c0.469,0.469,0.469,1.229,0,1.697l-3.853,3.853C98.909,32.627,98.602,32.744,98.295,32.744z"/>
		<path d="M82.982,22.513c-0.153,0-0.309-0.029-0.459-0.092c-0.612-0.253-0.903-0.955-0.649-1.567      l2.085-5.033c0.254-0.611,0.955-0.903,1.567-0.649c0.612,0.253,0.903,0.955,0.649,1.567l-2.085,5.033      C83.899,22.233,83.453,22.513,82.982,22.513z"/>
	</g>
    </symbol>
    <symbol id="full-heart" viewBox="0 0 492.719 492.719">
    	<path d="M492.719,166.008c0-73.486-59.573-133.056-133.059-133.056c-47.985,0-89.891,25.484-113.302,63.569    c-23.408-38.085-65.332-63.569-113.316-63.569C59.556,32.952,0,92.522,0,166.008c0,40.009,17.729,75.803,45.671,100.178    l188.545,188.553c3.22,3.22,7.587,5.029,12.142,5.029c4.555,0,8.922-1.809,12.142-5.029l188.545-188.553    C474.988,241.811,492.719,206.017,492.719,166.008z" fill="#D80027"/>
    </symbol>
  </svg>
  
  <c:choose>
		<c:when test="${reqURL == '/main'}">
			<div class="empty" style="height:220px;"></div>
		</c:when>
		<c:otherwise>
			<div class="empty" style="height:150px;"></div>
		</c:otherwise>
	</c:choose>

<script>
// 로그아웃 버튼 클릭 이벤트
$(".logout").click(function() {
	$(".logoutForm").submit();
})
//검색창 그림자
$('.search-input').focus(function () {
    $(this).parent().addClass('focus');
}).blur(function () {
    $(this).parent().removeClass('focus');
})
// 로그아웃 메뉴 펼치기
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}
// 이름 누르면 메뉴 dropdown
window.onclick = function (event) {
    if (!event.target.matches('.dropbtn')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
}
// 카테고리 움직이기
$(".catefilter").click(function() {
    if($(".catefilter").attr("id")=="1"){
        $(".catefilter").animate({"left": "-=20%"}, "slow");
        $(".cate-option").fadeIn("slow");
        $(".catefilter").attr("id", "2");
        $(".cate-option").css("visibility", "visible");
        $(".catefilter").css("color", "black");
    } else {
        $(".cate-option").fadeOut();
        $(".cate-option").css("visibility", "hidden");
        $(".catefilter").animate({"left": "+=20%"}, "slow");
        $(".catefilter").attr("id", "1")
        $(".catefilter").css("color", "#999");
    }
})
// 검색 결과 없을 때 enter키 막기
$(".search-form").submit(function(event) { 
   if($("._oznku").text()=="검색 결과가 없습니다.") {
      return false;
      }
   
   // enter치면 목록에서 첫번째꺼로 페이지 이동
   else if($("._ndl3t").length>=1) {
      document.getElementsByClassName("_ndl3t _4jr79")[0].click();
      return false;
      }
   
   return true;
   }); 
// 검색 필터 적용하기 위한 value값
$('.search-option input').click(function() {
	$(".search-option input").attr("value", "0");
	$(this).attr("value", "1");
});
</script>

<script>
searchAjax();
function searchAjax(){
   
   if($("#keywordInput").val()=="") {
      $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
      $("#search-header-modal").css("height", "51px");
   }
   
   $("#keywordInput").keyup(function(event){
	 if (event.keyCode == '40' && $(".results").length!=null) {
		 console.log("아래로눌럿다");
	 } else if(event.keyCode == '38' && $(".results").length!=null) {
		 console.log("위로눌럿다");
	 } else if(event.keyCode == '37' && $(".results").length!=null) {
		 //왼쪽 방향키 막기
		 console.log("왼쪽막았다");
	 } else if(event.keyCode == '39' && $(".results").length!=null) {
		 //오른쪽 방향키 막기
		 console.log("오른쪽막았다");
	 }
      
	 // 방향키를 제외한 다른 키 눌렀을 때
	 else {
	      var words = $("#keywordInput").val();
	       //$(this).val( $(this).val().replace(/ /g, '') );      //공백삭제
	       
	      // 키워드 받아서 공백 제거하고 저장
	      var chgwords = words;
	      var splitArray = chgwords.split(' ');
	      var searchwords='';
	      var bfsearchwords = '';
	      
	      for(i in splitArray) {
	         chgwords = splitArray[i];
	         if(chgwords.indexOf(" ")==0) {
	            var chgwords = words.substring(chgwords.lastIndexOf(" "));
	         }
	         bfsearchwords += chgwords;
	      }
	      console.log("searchwords----------->" + bfsearchwords);
	             if(bfsearchwords=="") {
	    		if($("#type-all").attr("value")=="1") {
	    			searchwords +='';
	    		} else if($("#type-users").attr("value")=="1") {
	    			searchwords +='@';
	    		} else if($("#type-hashtags").attr("value")=="1") {
	    			searchwords +='#';
	    		} else if($("#type-locations").attr("value")=="1") {
	    			searchwords += '%';
	    		}
	    		searchwords += bfsearchwords;
	      } else {
	    	  if(bfsearchwords.charAt(0)=="#" || bfsearchwords.charAt(0)=="@" || bfsearchwords.charAt(0)=="%") {
	      		if($("#type-all").attr("value")=="1") {
	      			bfsearchwords.charAt(0)='';
	    		} else if($("#type-users").attr("value")=="1") {
	    			bfsearchwords.charAt(0)='@';
	    		} else if($("#type-hashtags").attr("value")=="1") {
	    			bfsearchwords.charAt(0)='#';
	    		} else if($("#type-locations").attr("value")=="1") {
	    			bfsearchwords.charAt(0)='%';
	    		}
	      		searchwords=bfsearchwords;
	      		
	    	  } else {
	      		if($("#type-all").attr("value")=="1") {
	    			searchwords +='';
	    		} else if($("#type-users").attr("value")=="1") {
	    			searchwords +='@';
	    		} else if($("#type-hashtags").attr("value")=="1") {
	    			searchwords +='#';
	    		} else if($("#type-locations").attr("value")=="1") {
	    			searchwords += '%';
	    		}
	    		searchwords += bfsearchwords;
	    	  }
	      } 
	      
	      console.log("searchwords----------->>>" + searchwords);
	      
	      /* 검색 단어가 있으면 일치하는 것 출력 */
	      if(searchwords!=''){
	         $.ajax({
	            type:"POST",
	            url: "/explore/searchData/",
	            headers:{
	               "Content-Type" : "application/json",
	               "X-HTTP-Method-Override" : "POST"
	            },
	            async: false,
	            data: searchwords,
	            beforeSend : function(xhr)
	            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            //dataType: "text",
	            success: function(result){
	            	
	            	/* result를 searchwords와 비교해서 score순으로 정렬하기 */
	                for(var i=0; i<result.length; i++) {
	                    if(searchwords.length>0) {
	                        for(var a=0; a<searchwords.length; a++) {
	                            if(result[i].type==0 && result[i].tagname!=null){
	                            	// 특수문자 자르고
	                            	tagname=result[i].tagname.substring(1);
	                            	
	                               for(var b=a; b<tagname.length; b++) {
	                                  if(searchwords.charAt(a)==tagname.charAt(b)) {
	                                     if(a==b && tagname.indexOf(searchwords)==0) {
	                                        result[i].score += 3;
	                                     } else if(a==b) {
	                                    	 result[i].score += 2;
	                                     }
	                                    	 result[i].score += 1;
	                                     }
	                                  }
	                               } /* tagname if문 끝 */
	                            
	                            else if(result[i].nickname!=null) {
	                            	// 특수문자 자르고
	                               nickname = result[i].nickname.substring(1);
	                               
	                               // nickname O name O => 둘 다 있는 경우
	                              if(result[i].name!=null) {
	                            	// 특수문자 자르고
	                            	name = result[i].name.substring(1);
	                               for(var b=a; b<name.length; b++) {
	                                  if(searchwords.charAt(a)==name.charAt(b)) {
	                                      if(a==b && name.indexOf(searchwords)==0) {
	                                    	  result[i].score += 3;
	                                       } else if(a==b) {
	                                    	   result[i].score += 2;
	                                      } 
	                                    	  result[i].score += 1;
	                                     }
	                               } /* name for문 끝 */
	                             }
	                              
	                               // nickname O name X => nickname만 있을 경우
	                               for(var b=a; b<nickname.length; b++) {
	                                  if(searchwords.charAt(a)==nickname.charAt(b)) {
	                                      if(a==b && nickname.indexOf(searchwords)==0) {
	                                    	  result[i].score += 3;
	                                       } else if(a==b) {
	                                    	   result[i].score += 2;
	                                      } else {
	                                    	  result[i].score += 1;
	                                         }
	                                     } 
	                                  } /* nickname for문 끝 */
	                                  
	                            }/* nickname&name elseif끝 */
	                            
	                            else if(result[i].type==2 && result[i].location!=null) {
	                            	
	                               for(var b=a; b<result[i].location.length; b++) {
	                                  if(searchwords.charAt(a)==result[i].location.charAt(b)) {
											if(a==b) {
	                                        	result[i].score += 2;
	                                       }
	                                    	   result[i].score += 1;
	                                     }
	                                  }
	                            } /* location elseif문 끝 */
	                            
	                            else {
	                               result[i].score=0;
	                            }
	                            
	                        }/* for문 끝 */
	                     }
	                }/* for문 끝 */
	                
	               // score를 비교하여 점수 높은 순으로 출력하기
	                for(var i=0;i<result.length;i++) {
	                  for(var j=i+1; j<result.length; j++) {
	                     if(result[j].score>result[i].score) {
	                        var temp = result[i];
	                        result[i] = result[j];
	                        result[j] = temp;
	                      }
	                    }
	               }
	                
	                console.log("결과값--- "+JSON.stringify(result));
	                 
	                // 검색 첫 글자가 문자일 때
	                if(result!="" && searchwords[0]!='#' && searchwords[0]!='@' && searchwords[0]!='%') {
	                   var count = 0;
	                   var str = ' ';
	                   for(var i=0; i<result.length; i++) {
	                       if(result[i].type==0 && result[i].tagname!=null) {
	                          console.log("태그다");
	                          str+="<a class='_ndl3t _4jr79 hashtag' onclick='unloadCheck()'  href='/search/tags?name="+result[i].tagname.substring(1)+"'>"
	                                +"<div class='_o92vn'>"
	                                +"<span class='_po4xn coreSpriteHashtag'><img src='/resources/image/search_icon/hashtag.svg' style='height:23px; width:23px;'></span>"
	                                +"<div class='_poxna'>"
	                                +"<div class='_lv0uf'>"
	                                +"<span class='_b01op'>"+result[i].tagname+"</span>"
	                                +"</div>"
	                                +"<div class='_2ph7c'>"
	                                +"<span class=''>게시물 <span class=''>"+result[i].postedtagCnt+"개</span></span>"
	                                +"</div></div></div></a>";
	                       }
	                                         
	                       // 사람 검색
	                       else if(result[i].type==1 && result[i].nickname!=null) {
	                          console.log("이름이다");
	                          str+="<a class='_ndl3t _4jr79 user' onclick='unloadCheck()' href='/member/"+result[i].nickname.substring(1)+"'>"
	                                +"<div class='_o92vn'>";
	                                
	                                //프로필사진
	                                //result[i].profilephoto.length==0 || result[i].profilephoto == "" 
	                                if(result[i].profilephoto == null){
	                                  str+="<span class='_po4xn coreSpriteHashtag'><img src='/resources/img/emptyProfile.jpg'; style='height:24px; width:24px; border-radius:50%;'></span>";
	                                }else{
	                                  str+="<span class='_po4xn coreSpriteHashtag'><img src='/displayFile?fileName="+result[i].profilephoto+"'; style='height:24px; width:24px; border-radius:50%;'></span>";
	                                }
	                                
	                          str+="<div class='_poxna'>"
	                                +"<div class='_lv0uf'>"
	                                +"<span class='_b01op'>"+result[i].nickname+"</span>"
	                                +"</div>"
	                                +"<div class='_2ph7c'>";
	                                if(result[i].name!=null) {
	                                   str+="<span class=''><span class=''>"+result[i].name.substring(1)+"</span></span>";
	                                } else {
	                                   str+="<span class=''><span class=''></span></span>";
	                                }
	                           str+="</div></div></div></a>";
	                       }
	                                         
	                        // 로케이션 검색
	                       else if(result[i].type==2 && result[i].location!=null) {
	                          console.log("지역이다");
	                          str+="<a class='_ndl3t _4jr79 location' onclick='unloadCheck()'  href='/search/locations?location="+result[i].location.substring(1)+"'>"
	                                +"<div class='_o92vn'>"
	                                +"<span class='_po4xn coreSpriteHashtag'><img src='/resources/image/search_icon/location.svg' style='height:23px; width:23px;'></span>"
	                                +"<div class='_poxna'>"
	                                +"<div class='_lv0uf'>"
	                                +"<span class='_b01op'>"+result[i].location.substring(1)+"</span>"
	                                +"</div>"
	                                +"<div class='_2ph7c'>"
	                                +"</div></div></div></a>";
	                       } 
	                       
	                       else if(result[i].score==0){
	                          count ++;
	                     	  }
	                       
	                       else {
	                          $("#results").html("");
	                      	 }
	                       
	                       if(count>=3 && result.length==3) {
	                          $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
	                          $("#search-header-modal").css("height", "51px");
	                       } else {
	                          $("#search-header-modal").css("height", "196px");
	                          $("#results").html(str);
	                      	 }
	                      	
	                   }/* for문 끝 */
	                   
	                } /* 문자 검색 끝 */
	                // 검색 문자 첫 글자가 #인 경우
	               else if(searchwords[0]=="#") {
	                  var count = 0;
	                  var str = '';
	                  for(i=0; i<result.length; i++) {
	                        if(result[i].type==0 && result[i].tagname!=null) {
	                            console.log("태그다");
	                            str+="<a class='_ndl3t _4jr79 hashtag' onclick='unloadCheck()'  href='/search/tags?name="+result[i].tagname.substring(1)+"'>"
	                                  +"<div class='_o92vn'>"
	                                  +"<span class='_po4xn coreSpriteHashtag'><img src='/resources/image/search_icon/hashtag.svg' style='height:23px; width:23px;'></span>"
	                                  +"<div class='_poxna'>"
	                                  +"<div class='_lv0uf'>"
	                                  +"<span class='_b01op'>"+result[i].tagname+"</span>"
	                                  +"</div>"
	                                  +"<div class='_2ph7c'>"
	                                  +"<span class=''>게시물 <span class=''>"+result[i].postedtagCnt+"개</span></span>"
	                                  +"</div></div></div></a>"
	                                  }
	                           else if(result[i].tagname==null){
	                             count ++;
	                             $("#results").html("");
	                          }
	                 	 }
	                 		
	                       if(count>=3 && result.length==3) {
	                    	   console.log(">>>"+result.length);
	                          $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
	                          $("#search-header-modal").css("height", "51px");
	                     	  } else {
	                     		 $("#search-header-modal").css("height", "196px");
	                     		 $("#results").html(str);
	                     	  }
	               } /* #검색 끝 */
	               
	                // 검색 첫 글자가 @인 경우
	               else if(searchwords[0]=="@") {
	                 var count = 0;
	                 var str = ' ';
	                 for(var i=0; i<result.length; i++) {
	                    if(result[i].type==1 && result[i].nickname!=null) {
	                          console.log("이름이다");
	                        str+="<a class='_ndl3t _4jr79 user' onclick='unloadCheck()' href='/member/"+result[i].nickname.substring(1)+"'>"
	                                   +"<div class='_o92vn'>";
	                                   
	                             //프로필사진
	                             //result[i].profilephoto.length==0 || result[i].profilephoto == "" 
	                             if(result[i].profilephoto == null){
	                               str+="<span class='_po4xn coreSpriteHashtag'><img src='/resources/img/emptyProfile.jpg'; style='height:24px; width:24px; border-radius:50%;'></span>";
	                                } else{
	                               str+="<span class='_po4xn coreSpriteHashtag'><img src='/displayFile?fileName="+result[i].profilephoto+"'; style='height:24px; width:24px; border-radius:50%;'></span>";
	                                   }
	                             
	                       str+="<div class='_poxna'>"
	                             +"<div class='_lv0uf'>"
	                             +"<span class='_b01op'>"+result[i].nickname+"</span>"
	                             +"</div>"
	                             +"<div class='_2ph7c'>";
	                             if(result[i].name!=null) {
	                                str+="<span class=''><span class=''>"+result[i].name.substring(1)+"</span></span>";
	                             } else {
	                                str+="<span class=''><span class=''></span></span>";
	                             }
	                          str+="</div></div></div></a>";
	                    }
	                        
	                     else if(result[i].nickname==null){
	                         count ++;
	                         $("#results").html("");
	                      }
	                 }
	                    if(count>=3 && result.length==3) {
	                 	   console.log(">>>"+result.length);
	                       $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
	                       $("#search-header-modal").css("height", "51px");
	                  	  } else {
	                  		$("#search-header-modal").css("height", "196px");
	                  		 $("#results").html(str);
	                  	  }
	               } /* @ 검색 끝 */
	               
	               // 검색 문자 첫 글자가 %인 경우
	               else if(searchwords[0]=="%") {
	                  var count = 0;
	                  var str = '';
	                  for(i=0; i<result.length; i++) {
	                        if(result[i].type==2 && result[i].location!=null) {
	                            console.log("지역이다");
	                            str+="<a class='_ndl3t _4jr79 location' onclick='unloadCheck()'  href='/search/locations?location="+result[i].location.substring(1)+"'>"
		                            +"<div class='_o92vn'>"
		                            +"<span class='_po4xn coreSpriteHashtag'><img src='/resources/image/search_icon/location.svg' style='height:23px; width:23px;'></span>"
		                            +"<div class='_poxna'>"
		                            +"<div class='_lv0uf'>"
		                            +"<span class='_b01op'>"+result[i].location.substring(1)+"</span>"
		                            +"</div>"
		                            +"<div class='_2ph7c'>"
		                            +"</div></div></div></a>";
	                                  }
	                           else if(result[i].location==null){
	                             count ++;
	                             $("#results").html("");
	                          }
	                 	 }
	                 		
	                       if(count>=3) {
	                    	   console.log(">>>"+result.length);
	                          $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
	                          $("#search-header-modal").css("height", "51px");
	                     	  } else {
	                     		 $("#search-header-modal").css("height", "196px");
	                     		 $("#results").html(str);
	                     	  }
	               } /* %검색 끝 */
	                
	               else {
	                  console.log("검색문else로왔다");
	                  $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
	                  $("#search-header-modal").css("height", "51px");
	               }
	               
	            }, /* success  끝 */
	            
	            error: function(e){
	               if(e.status==500) {
	                  console.log("에러로갓니?");
	                  $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
	                  $("#search-header-modal").css("height", "51px");
	               //throw e.responseText;
	               }
	            }/* error 끝 */
	            
	         }); /* ajax 끝 */
	      }      /* if 끝 */
	      
	      // enter 안 먹음
	      else if(searchwords=="") {
	          $("#results").html("<div class='_oznku'><div class='noresult'>검색 결과가 없습니다.</div></div>");
	          $("#search-header-modal").css("height", "51px");
	       }
	      
	      else{
	         console.log("그럼여기구나");
	      }
	 }
      
   }) /* keyup() 끝 */
}      /* searchAjax() 끝 */

//follow여부확인하여 팔로우/팔로우취소
function follow(){
	var followFlg=false;
	//이벤트 중복 제거를 위해 off먼저 선언
   $(".isFlw").off("click").on("click", function(event){
	  event.preventDefault();
	  var $this=$(this);
      var userid=$this.data("uid");
      if(followFlg){return;}
      
      followFlg=true;
      if( !($this.hasClass("flwActive")) ){
         var type="post";
         var url ="/member/follow/"+userid;
         var header="{'X-HTTP-Method-Override' : 'POST'}";
         $this.toggleClass("flwActive")
         $this.html("팔로잉");
      }else if( $this.hasClass("flwActive") ){
         var type="delete";
         var url ="/member/unfollow/"+userid;
         var header="{'X-HTTP-Method-Override' : 'DELETE'}";
         $this.toggleClass("flwActive");
         $this.html("팔로우");
      }
      
      $.ajax({
         type: type,
         url: url,
         headers:header,
         dataType:"text",
         beforeSend : function(xhr)
         {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
         success:function(result){
            if(result=="SUCCESS"){
            	
         	   if(window.location.pathname.substr(0,8) == "/member/"){
          			followed();
                  	following();
          		}
                //팔로우할경우 소켓 알림
                if($this.hasClass("flwActive")){
                    notifyFollow(userid);
                }
                
              	//메신저 유저목록 갱신
            	getMessengerUserList();
                //알림창 팔로우 여부 갱신
                noticeList();
                
                followFlg=false;
            }
         }
      });
   });
}
</script>

<jsp:include page="/WEB-INF/views/webSocket.jsp" flush="false" />
<jsp:include page="/WEB-INF/views/messenger.jsp" flush="false" />

</body>
</html>