<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>
   
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cssgram-cssgram.netdna-ssl.com/cssgram.min.css">
<title>Insert title here</title>
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"></jsp:include>
<style>
._owark{-webkit-box-flex:1;-webkit-flex-grow:1;-ms-flex-positive:1;flex-grow:1;margin:0 auto;max-width:600px;position:relative;width:100%}
._gsusx{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-flow:row nowrap;-ms-flex-flow:row nowrap;flex-flow:row nowrap;max-width:935px}
._62ky5{display:block}
._k46tg{display:inline-block;margin-top:2px;vertical-align:middle}
._14b0y{margin-bottom:30px}
._d4oao{float:left;margin-right:28px;max-width:614px;width:100%}
._s5vjd:last-child{margin-bottom:0}
._7axot{-webkit-align-self:center;-ms-flex-item-align:center;align-self:center}
._qgv8j{-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;-webkit-box-pack:justify;-webkit-justify-content:space-between;-ms-flex-pack:justify;justify-content:space-between;padding-top:8px}
._m0zxo{position:fixed;bottom:0;left:0}._hw7lt{background:0 0;border:0;margin:0;padding:0}
@media (min-width:640px){._owark{padding-top:60px}._2wxtj{background:#fff;border-radius:3px;border:1px solid #efefef}._4sf0r,._7g4gl,._nx5in,._ouv75,._psd08,._s5vjd{background-color:#fff;margin-left:-1px;margin-right:-1px}._4sf0r,._nx5in,._ouv75,._psd08,._s5vjd{border-radius:3px;border:1px solid #e6e6e6}._2wxtj,._7g4gl,._s5vjd{margin-bottom:60px}._nx5in,._ouv75,._psd08{margin-bottom:20px}}
@media (max-width:640px){._owark{margin-bottom:10px}._nx5in,._ouv75,._psd08{border-bottom:1px solid #e6e6e6}._nx5in,._ouv75{background-color:#fff}}
@media (max-width:735px){._2wxtj,._s5vjd{margin-bottom:15px}._7g4gl{margin-bottom:30px}}

._havey,._sfpqp{-webkit-box-orient:vertical;-webkit-box-direction:normal;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column}._sfpqp{-webkit-box-orient:horizontal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row}


<!--헤더 -->
._622au{padding:0}._9dpug{border-bottom:1px solid #efefef}._9dpug._msz04{height:76px;padding:0 16px 16px}._5mwg7{height:60px;-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center;position:absolute}._ebcx9{padding:0 16px}
._8oo9w{margin-top:4px}._nlmjy{margin-bottom:8px}._277v9{-webkit-box-flex:1;-webkit-flex-grow:1;-ms-flex-positive:1;flex-grow:1;-webkit-flex-shrink:1;-ms-flex-negative:1;flex-shrink:1;min-height:0;overflow:auto}._277v9,._6d44r{margin-bottom:4px}._ti7l3{margin-top:4px}._e34hf{display:none}._fsupd ._ti7l3{min-height:48px}._5lms4 ._ti7l3{padding-right:26px}._fsupd ._9dpug{padding-right:40px}._fsupd ._5mwg7{right:10px;top:0}._5lms4 ._5mwg7{bottom:0;height:52px;right:10px;top:auto}._8n9ix._9445e ._8oo9w{margin-top:-34px}._4kplh{width:100%}._4kplh ._sxolz{background-color:#000;-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center;margin-right:335px;min-height:450px}._4kplh ._sxolz._mi48x{background-color:#fafafa}._4kplh ._9dpug{border-bottom:1px solid #efefef;height:78px;margin-right:0;padding:20px 0;position:absolute;right:24px;top:0;width:287px}._4kplh ._9dpug._msz04{height:98px;padding:0 0 20px}._4kplh ._ebcx9{bottom:0;-webkit-box-sizing:border-box;box-sizing:border-box;padding-left:24px;padding-right:24px;position:absolute;right:0;top:78px;width:335px}._4kplh ._ebcx9._6zn4x{top:98px}._4kplh ._8oo9w{border-top:1px solid #efefef;margin:0;-webkit-box-ordinal-group:3;-webkit-order:2;-ms-flex-order:2;order:2;padding-top:2px}._4kplh ._nlmjy{margin-bottom:4px;-webkit-box-ordinal-group:4;-webkit-order:3;-ms-flex-order:3;order:3}._4kplh ._277v9{margin:0 -24px auto;-webkit-box-ordinal-group:2;-webkit-order:1;-ms-flex-order:1;order:1;padding:12px 24px}._4kplh ._6d44r{margin-bottom:0;-webkit-box-ordinal-group:5;-webkit-order:4;-ms-flex-order:4;order:4}._4kplh ._ti7l3{-webkit-box-ordinal-group:6;-webkit-order:5;-ms-flex-order:5;order:5}._4kplh._5lms4 ._5mwg7{right:18px}@media (-webkit-min-device-pixel-ratio:2){._8n9ix ._9dpug{border-bottom-width:.5px}}
._7b8eu,._csp04{-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row}._7b8eu{height:60px;padding:16px;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center}._iuvin button{line-height:18px;padding:0}._csp04{-webkit-box-align:baseline;-webkit-align-items:baseline;-ms-flex-align:baseline;align-items:baseline}._6y8ij{max-width:100%}._s7b66{display:inline}._74oom{-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;-webkit-box-align:baseline;-webkit-align-items:baseline;-ms-flex-align:baseline;align-items:baseline;max-width:240px}._j56ec{-webkit-box-align:start;-webkit-align-items:flex-start;-ms-flex-align:start;align-items:flex-start;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-flex:1;-webkit-flex-grow:1;-ms-flex-positive:1;flex-grow:1;-webkit-flex-shrink:1;-ms-flex-negative:1;flex-shrink:1;margin-left:12px;overflow:hidden}._k32zm{padding-top:20px}._60iqg{display:block;max-width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}._eeohz{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;max-width:100%}._iadoq,._iadoq:visited{color:#262626;-webkit-box-flex:0;-webkit-flex-grow:0;-ms-flex-positive:0;flex-grow:0;-webkit-flex-shrink:1;-ms-flex-negative:1;flex-shrink:1}._hz9vr{-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0;margin-left:5px}._elp6f{color:#999;display:inline-block;max-width:100%}
._82odm{-webkit-align-self:center;-ms-flex-item-align:center;align-self:center;display:block;-webkit-box-flex:0;-webkit-flex:none;-ms-flex:none;flex:none}._qtgjd{cursor:pointer}._15vpm{-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;-webkit-tap-highlight-color:transparent;-webkit-touch-callout:none}
._pg23k{background-color:#fafafa;border-radius:50%;-webkit-box-sizing:border-box;box-sizing:border-box;display:block;-webkit-box-flex:0;-webkit-flex:0 0 auto;-ms-flex:0 0 auto;flex:0 0 auto;overflow:hidden;position:relative}._pg23k::after{border:1px solid rgba(0,0,0,.0975);border-radius:50%;bottom:0;content:"";left:0;pointer-events:none;position:absolute;right:0;top:0}._jpwof{cursor:pointer}._rewi8{height:100%;width:100%}
._2g7d5{font-weight:600;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;padding-left:5px;margin-left:-5px}


._km7ip {
    border-top: 1px solid #efefef;
    color: #999;
    -webkit-flex-shrink: 0;
    -ms-flex-negative: 0;
    flex-shrink: 0;
    font-size: 14px;
    line-height: 18px;
    min-height: 56px;
    -webkit-box-pack: center;
    -webkit-justify-content: center;
    -ms-flex-pack: center;
    justify-content: center;
    padding: 16px 0;
}
<!-- 글쓰기 -->
._b6i0l,._bilrf{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-flex:1;-webkit-flex-grow:1;-ms-flex-positive:1;flex-grow:1}._b6i0l{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;-webkit-flex-shrink:1;-ms-flex-negative:1;flex-shrink:1;position:relative}._bilrf{background:0 0;border:0;color:#262626;font-size:inherit;height:18px;max-height:80px;outline:0;padding:0;resize:none}
._bilrf:disabled{opacity:.3;pointer-events:none}
._bilrf::-webkit-input-placeholder,._bilrf:focus::-webkit-input-placeholder{color:#999}
._bilrf:-ms-input-placeholder,._bilrf::-ms-input-placeholder,._bilrf:focus:-ms-input-placeholder,._bilrf:focus::-ms-input-placeholder{color:#999}
._bilrf::placeholder,._bilrf:focus::placeholder{color:#999}
._55p7a{background:0 0;border:0;color:#3897f0;-webkit-box-flex:0;-webkit-flex-grow:0;-ms-flex-positive:0;flex-grow:0;-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0;font-size:16px;font-weight:500;padding:0 8px;margin-right:-8px}
._55p7a:disabled{color:#b4daff}


<!--이미지 보이는 부분 -->
._pak6p{left:0}._by8kl{right:0}._by8kl,._pak6p{cursor:pointer;display:block;margin-left:12px;margin-right:12px;opacity:0;overflow:hidden;position:absolute;pointer-events:auto;text-indent:0;top:50%}._k7ih4:hover ._by8kl,._k7ih4:hover ._pak6p{opacity:1;-webkit-transition:opacity .2s ease-out;transition:opacity .2s ease-out;-webkit-transition-delay:.1s;transition-delay:.1s}._8kphn{margin-top:-15px}._5wmqs{margin-top:-38px}._5zbvx,._jzfl1{border-radius:50%;height:6px;margin-left:2px;margin-right:2px;-webkit-transition:all .2s ease-in-out;transition:all .2s ease-in-out;width:6px}._5zbvx{background:#dbdbdb}._jzfl1{background:#fff;opacity:.4}._i22oc{opacity:1}._c0g09{background:#3897f0}._4ag49{table-layout:fixed}._4c7y4,._g5463{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center}._4c7y4{bottom:15px;left:6px;position:absolute;right:6px}._g5463{margin-bottom:15px;margin-top:15px}._8bjpz,._k7ih4{left:0;position:relative;top:0}._8bjpz,._l5mmu{display:block}._k7ih4 ._l4l38{left:0;position:absolute;right:0;top:0}
._e3il2{background-color:#efefef;display:block;width:100%}._4rbun{display:block;overflow:hidden;padding-bottom:100%}._2di5p,._si7dy{left:0;position:absolute;top:0}
._2di5p{
/* height:100%; */
-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;width:100%}._si7dy{bottom:0;right:0}
._6p9ga{background-color:transparent;border:0;cursor:pointer;padding:8px}
<!--하단 -->
._8scx2{display:block;overflow:hidden;text-indent:110%;white-space:nowrap}._gvoze:active{opacity:1}._fkers,._fkers:visited{color:#3897f0}
._hmd6j{-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row}
._eszkz{margin-left:-8px}
._eszkz,._mpkky,._p6oxf{display:inline-block}
._mpkky{margin-left:auto;margin-right:-8px}
._l9yih{background-color:transparent;border:0;cursor:pointer;padding:8px}._fyy4z{cursor:default;opacity:.3}
 
._1w76c{-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;-webkit-box-pack:end;-webkit-justify-content:flex-end;-ms-flex-pack:end;justify-content:flex-end}._3gwk6{-webkit-box-flex:1;-webkit-flex-grow:1;-ms-flex-positive:1;flex-grow:1;-webkit-flex-shrink:1;-ms-flex-negative:1;flex-shrink:1}
._nt9ow{display:block}._de460,._de460:visited,._nt9ow{color:#262626}._nzn1h,._nzn1h:visited{font-weight:600;color:#262626}._gu6vm{cursor:pointer}

._4a48i{margin-top:-5px;padding-top:5px;overflow-anchor:none;-webkit-overflow-scrolling:touch}._b0tqa{-webkit-box-flex:1;-webkit-flex-grow:1;-ms-flex-positive:1;flex-grow:1}._56pd5{margin-bottom:8px}._m3m1c{background:0 0;border:0;color:#999;font-size:inherit;margin:0;padding:0}._1s3cd{cursor:pointer}._9whrc{display:inline-block;margin:0 0 0 2px;position:static}._9whrc,._m3m1c{vertical-align:middle}


	.btn-circle {
        width: 30px;
        height: 30px;
        text-align: center;
        padding: 6px 0;
        font-size: 12px;
        line-height: 1.428571429;
        border-radius: 15px;
      }
      label.btn.btn-default.btn-circle.focus {
	    outline: none;
	}
     
.coreSpriteRightChevron, .coreSpriteRightPaginationArrow {
    background-position: -395px -430px;
    height: 30px;
    width: 30px;
    background-repeat: no-repeat;
}
.coreSpriteLeftChevron, .coreSpriteLeftPaginationArrow {
    background-position: -378px -317px;
    height: 30px;
    width: 30px;
}
	
     <!-- 사진 넘기기 -->
     ._jad47{display:block}._pak6p{left:0}._by8kl{right:0}
     ._by8kl,._pak6p{cursor:pointer;display:block;margin-left:12px;margin-right:12px;opacity:0;overflow:hidden;position:absolute;pointer-events:auto;top:50%}
     ._k7ih4:hover ._by8kl,._k7ih4:hover ._pak6p{opacity:1;-webkit-transition:opacity .2s ease-out;transition:opacity .2s ease-out;-webkit-transition-delay:.1s;transition-delay:.1s}._8kphn{margin-top:-15px}._5wmqs{margin-top:-38px}
     ._5zbvx,._jzfl1{border-radius:50%;height:6px;margin-left:2px;margin-right:2px;-webkit-transition:all .2s ease-in-out;transition:all .2s ease-in-out;width:6px}._5zbvx{background:#dbdbdb}._jzfl1{background:#fff;opacity:.4}._i22oc{opacity:1}._c0g09{background:#3897f0}._4ag49{table-layout:fixed}._4c7y4,._g5463{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center}._4c7y4{bottom:15px;left:6px;position:absolute;right:6px}._g5463{margin-bottom:15px;margin-top:15px}._8bjpz,._k7ih4{left:0;position:relative;top:0}._8bjpz,._l5mmu{display:block}._k7ih4 ._l4l38{left:0;position:absolute;right:0;top:0}
     
	
</style>

<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">


<body>

<span id="react-root" aria-hidden="false">

	<section class="_sq4bv _29u45">
	<main class="_8fi2q _2v79o" role="main">
	<section class ="_owark">
	<div class>
	<div>
	<div class="_havey">
	
	<article class="_s5vjd _622au _5lms4 _8n9ix _9445e">
		<form id="registerForm" role="form" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<!-- 프사, 닉네임 -->
		<header class="_7b8eu _9dpug">
			<div class="_82odm _i2o1o">
				<a class="_pg23k _jpwof _gvoze" href="/member/${postVO.usernickname}" style="width: 30px; height: 30px;">
				<img class="_rewi8" 
					<c:if test="${postVO.profilephoto ne null && postVO.profilephoto != '' }">
						src="http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122${postVO.profilephoto}"
					</c:if>
					<c:if test="${postVO.profilephoto eq null || postVO.profilephoto == '' }">
						src="../../resources/img/emptyProfile.jpg"
					</c:if>/>
				</a>
			</div>
			<div class="_j56ec">
				<div class="">
					<div class="_eeohz">
						<a class="_2g7d5 notranslate _iadoq" title="${postVO.usernickname }" href="/member/${postVO.usernickname}">${postVO.usernickname }</a>
					</div>
				</div>
				<div class="_60iqg">
					<a class="_q8ysx _6y8ij" id="address" title="" href="/search/locations?location=${postDTO.location }">${postVO.location }</a>
				</div>
			</div>
		</header>
		<div class="_sxolz">
			<div>
				<div class="_k7ih4">
					<div>
						<div class="_e3il2 _gxii9">
							<div class="_4rbun " id="imgdiv" >
							<c:forEach var="file" items='${files}' varStatus='status'>
							
								<c:if test="${file.fileType eq 'image'}">
										<img alt="이미지" class="_2di5p " id="image${status.index}" src="http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122${file.fileUrl }" srcset=""
										style="<c:out value="${status.index eq 0 ? '' : 'display: none;'}"/> ">
										
										<c:if test = "${status.index eq 0}">
											<script>
												$('#imgdiv').css("padding-bottom", $('#image${status.index}').height()/6+"%");
												$("#imgdiv").attr("class", "_4rbun ${file.filter}");
											</script>
										</c:if> 
									</c:if>
									<c:if test="${file.fileType eq 'video'}">
										<video class="_2di5p " id="video${status.index}" src="http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122${file.fileUrl }" loop="true" 
										<c:out value="${status.index eq 0 ? 'autoplay' : ''}"/>
										style="<c:out value="${status.index eq 0 ? '' : 'display: none;'}"/> ">
										<c:if test = "${status.index eq 0}">
											<script>
												document.getElementById('video${status.index}').onloadeddata = function() { 
													$('#imgdiv').css("padding-bottom", $(this).height()/6+"%");
													$("#imgdiv").attr("class", "_4rbun ${file.filter}");
												};
											</script>
										</c:if>
										</video>
								</c:if>
							</c:forEach>
						</div>
							<div class="_si7dy"></div>
						</div>
					</div>
					<!-- 왼쪽 이미지 이동 버튼 -->
					<a class="_5wmqs _pak6p coreSpriteLeftChevron" role="button" id="moveLeft" style ="display: none"><i class="fa fa-chevron-circle-left"style="font-size: 30px; color: lightgray;"></i></a>
					<!-- 오른쪽 이미지 이동 버튼 -->
					<a class="_5wmqs _by8kl coreSpriteRightChevron" role="button" id="moveRight" style="<c:out value="${fn:length(files) eq 1 ? 'display: none;' : ''}"/>">
					<i class="fa fa-chevron-circle-right" style="font-size: 30px; color: lightgray;"></i></a>
					<!-- 사진 몇개인지 표시 -->
					<div class=" _g5463"> 
						<table class="_4ag49">
							<tbody>
							<tr>
							<c:forEach var="file" items='${files}' varStatus='status'>
							<!-- 현재 표시중인 이미지 위치는  _c0g09 -->
							<c:choose>
							<c:when test="${status.index eq 0}">
							</c:when>							
							<c:when test="${status.index eq 1}">
								<td><div class="_5zbvx _c0g09"></div></td>
								<td><div class="_5zbvx"></div></td>
							</c:when>
							<c:otherwise>
								<td><div class="_5zbvx"></div></td>
							</c:otherwise>
							</c:choose>
							</c:forEach>
							</tr>
							</tbody>
						</table>
					</div>
					
					
				</div>	
			</div>
		</div>
		<div class="_ebcx9">
		<section class="_hmd6j _8oo9w"style="display: inline-block">
		<!-- 카테고리 선택 -->
	 	<div class="form-group" style="display: inline-block; margin-top: 5px; margin-bottom:0px">
	        <div data-toggle="buttons" style="display: inline-block;">
	          <label class="btn btn-default btn-circle">
	          	<input type="radio" id="cate1" name="categorys" value="1">
	          		<i class="glyphicon glyphicon-plane" checked></i>
	          	</label>
	          <label class="btn btn-default btn-circle">       
	          	<input type="radio" id="cate2" name="categorys" value="2">
	          	<i class="glyphicon glyphicon-film"></i>
	          	</label>
	          	<label class="btn btn-default btn-circle">       
	          		<input type="radio" id="cate3" name="categorys" value="3">
	          		<i class="glyphicon glyphicon-music"></i>
	    		</label>
	    		<label class="btn btn-default btn-circle">       
	          		<input type="radio" id="cate4" name="categorys" value="4">
	          		<i class="fa fa-cutlery"></i>
	    		</label><label class="btn btn-default btn-circle">       
	          		<input type="radio" id="cate5" name="categorys" value="5">
	          		<i class="fa fa-pencil"></i>
	    		</label>
	        </div>
	      </div>
	      	<!-- 읽어들인 정보로 카테고리 선택 -->
      		<script>
      			var idx = parseInt(${postVO.cateid})-1 ;
      			console.log(idx);
      			$(':radio[name="categorys"]:eq('+idx +')').click();
			</script>
	        <div style="display: inline-block; position:  absolute;top:5px;right:0;">
		        <!-- 위치 추가 -->
		        <label class="btn btn-default btn-circle" id="addLocation" >
		       			<i class="fa fa-map-o"></i>
		        </label>
	        </div>
        <!-- <input type="hidden" id='cateid' name='cateid' placeholder="Enter cateid"> -->
      </section>
	  		<section class="_km7ip _ti7l3" style="display:inline-block">
               <div class="_b6i0l" >
               		<textarea aria-label="설명 입력..." placeholder="설명 입력..." class="_bilrf" name="caption" autocomplete="off" autocorrect="off" style="height:36px; width:100%" maxlength="250">${postVO.caption}</textarea>
               		
               </div>
               <button type="button" class="btn btn-default btn-circle" id="btnSubmit" style="position:  absolute;top: 10px;right:  0;">
	       			<i class="glyphicon glyphicon-floppy-disk"></i>
	       		</button>
           </section>
		</div>
	
		<input type="hidden" id='cateid' name='cateid'>
		<input type="hidden" id='location' name='location'>
		<input type="hidden" id='userid' name='userid' value="${postVO.userid }">
		<input type="hidden" id='postid' name='id' value="${postVO.postid }"><!-- 게시글아이디 -->
		 
		</form> 
	</article>
	</div>
	</div>
	</div>
	</section>
	</main>
	<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
	</section>
	</span>
</body>
<!-- <script type="text/javascript" src="/resources/js/upload.js"></script> -->
<!-- 구글맵 api -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDzpqYW7uB7zVuh5_QgruzBNcsFt71fkI&callback=initMap" async="" defer=""></script>

<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="modalMapTemplate" type="text/x-handlebars-template"> 
	<div class="_pfyik" role="dialog" onclick="callRemoveDialog(event)">
	<div class="_23gmb"></div>
	<div class="_o0j5z" onclick="callRemoveDialog(event)">
	<div class="_784q7" id="modalChangeProfilePhoto" >
<div style="display: inline-block; width: 500px; height: 35px;text-align:right" >

		<input id="modalAddress" type="textbox" value="" placeholder="Enter address">
 <label class="btn btn-default btn-circle" id="findLocation" >
	       			<i class="fa fa-search"></i>
	        </label>		
 <label class="btn btn-default btn-circle" id="getLocation" >
	       			<i class="fa fa-map-marker"></i>
	        </label>
 <label class="btn btn-default btn-circle" id="confirm_button" >
	       			<i class="glyphicon glyphicon-ok"></i>
	        </label>
</div>
		<div id="map" style="width:500px; height:500px; display: block;"></div>
	</div>
		</div>
		<button class="_dcj9f"  onclick="callRemoveDialog(event)">닫기</button>
	</div> 
<style>
._pfyik{background-color:rgba(0,0,0,.5);bottom:0;-webkit-box-pack:justify;-webkit-justify-content:space-between;-ms-flex-pack:justify;justify-content:space-between;left:0;overflow-y:auto;-webkit-overflow-scrolling:touch;position:fixed;right:0;top:0;z-index:1}
._dcj9f{background:0 0;border:0;cursor:pointer;height:36px;outline:0;overflow:hidden;position:absolute;right:0;top:0;z-index:2}
._dcj9f::before{color:#fff;content:'\00D7';display:block;font-size:36px;font-weight:600;line-height:36px;padding:0;margin:0}
._784q7{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;margin:auto;max-width:935px;pointer-events:auto;width:100%}
._23gmb{bottom:0;left:0;pointer-events:none;position:fixed;right:0;top:0;z-index:0}
._23gmb *{pointer-events:auto}
._o0j5z{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;min-height:100%;overflow:auto;width:auto;z-index:1}
@media (min-width:481px){._o0j5z{padding:0 40px;pointer-events:none;-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}
._o0j5z::after,._o0j5z::before{content:'';display:block;-webkit-flex-basis:40px;-ms-flex-preferred-size:40px;flex-basis:40px;-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0}}
@media (max-width:480px){._23gmb,._dcj9f{display:none}}

._h74gn{background:#fff;border:0;color:#262626;cursor:pointer;font-size:16px;font-weight:400;line-height:50px;margin:0;overflow:hidden;padding:0 16px;text-align:center;text-overflow:ellipsis;white-space:nowrap;width:100%}
._h74gn:hover{background-color:#efefef}
._hql7s,._o2wxh{background-color:#fff;border-bottom:1px solid #dbdbdb}
._o2wxh:last-child{border-bottom-width:0}
._hql7s{color:#999;font-size:16px;font-weight:600;line-height:50px;text-align:center}
@media (min-width:736px){._hql7s,._o2wxh{min-width:510px}}
@media (min-width:414px) and (max-width:735px){._cepxb,._hql7s,._o2wxh{width:100%}}
@media (min-width:414px){._cepxb{margin:0 auto}}
</style>
</script>
 <script>
	$(document).ready(function() {
		
		//파일 리스트 생성
		var filesArr = ${files};
		
		//게시물 글자수 제한
		$("._bilrf").first().keyup(function(){
	        if ($(this).val().length > $(this).attr('maxlength')) {
	            alert('글자수는 ' + $(this).attr('maxlength') + '자까지만 가능합니다.');
	            $(this).val($(this).val().substr(0, $(this).attr('maxlength')));
	        }
		})
		
		$("#btnSubmit").on("click",function(event){
			event.preventDefault();
			
			var form = $("#registerForm");
			//파일 개수
			var files = ${files};
			console.log(files);
			var str = "";

			$(files).each(function(index){
				console.log(index + this.fileUrl);
				str += "<input type='hidden' name='files[" + index
				+ "]' value='" + this.fileUrl
				+ "'> ";
			}); 
							
			//첨부파일 추가
			form.append(str);
			if(typeof $(':radio[name="categorys"]:checked').val() == "undefined"){
				alert("카테고리를 선택하세요.");
				return false;
			}
			
			//카테고리 추가
			$("#cateid").val($(':radio[name="categorys"]:checked').val());
			//위치 추가
			$("#location").val($("#address").text());
			//캡션 '\n' <br>로 변환
			$("._bilrf").val($("._bilrf").val().replace(/\n/g, ' <br> '));
			form.attr("action", "/post/modify");
			form.submit(); 
		});
		
		//위치
		$("#addLocation").on("click", function() {
			
			var template = Handlebars.compile($("#modalMapTemplate").html());
			$("#react-root").after(template);
			$("body").attr("sytle","position: fixed; top: -"+$(window).scrollTop()+"px; width: 100%;");
			$("#react-root").attr("aria-hidden","true");
			
			$("._784q7").on("click",function(event){
				event.stopPropagation();
			});
			
			//맵초기화
			initMap();
		 	//맵초기화 끝나고 현재 접속한 위치 GPS로 읽기
			if($("#address").text() == null || $("#address").text() == ""){
				navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
			}
			else{
				geocoding($('#address').text());
			}
			
			// 모달 창 닫기 버튼
			$("#modalclose").click(function(event) {
				callRemoveDialog(event);
			});
	
			// 모달 창 안에 있는 확인 버튼에 이벤트 걸기
			$("#confirm_button").click(function(evnet) {
				$("#address").attr("title", $('#modalAddress').val());
				$('#address').text($('#modalAddress').val());
				callRemoveDialog(evnet);
			});
			
			$("#findLocation").click(function() {
				//지도에 현재 위치 표시, 위도경도 읽어옴
				geocoding($('#modalAddress').val());
			});
			
			$("#getLocation").click(function() {
				//지도에 현재 위치 표시, 위도경도 읽어옴
				navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
			});
		});
		
		//오른쪽으로 넘기기
		$("#moveRight").on("click",function(){
			var len = $("._2di5p ").length-1;
			var curIdx = parseInt($("._2di5p:visible").attr("id").substr(5));
			var nextIdx = curIdx + 1;
			var curObj = $("._2di5p:visible");
			var nextObj;
			if(curObj.next("script").length == 1){
				nextObj = curObj.next().next();
			}else{
				nextObj = curObj.next();
			}
			//다음객체 비율 조정
			nextObj.parent("div").css("padding-bottom", nextObj.height()/6+"%");
			console.log(filesArr);
			console.log(filesArr[curIdx+1]);
			//필터 적용
			$("._4rbun").attr("class", "_4rbun "+ filesArr[curIdx+1].filter);
			//이미지 전환
			curObj.css("display","none");
			nextObj.css("display","block");
			
			//비디오 재생
			if(curObj.next("video").length == 1){
				nextObj.get(0).play();
			}else if(curObj.is("video")){
				curObj.get(0).pause();
			}
			
			//버튼 보이기
			$("#moveLeft").css("display","block");
			if(len == curIdx+1){
				$("#moveRight").css("display","none");
			}
			//현재 표시 이미지 위치 변경
			$("._5zbvx:eq("+curIdx+")").removeClass(" _c0g09");
			$("._5zbvx:eq("+(curIdx+1)+")").addClass(" _c0g09");
		});
		
		//이미지 왼쪽으로 넘기기
		$("#moveLeft").on("click",function(){
			var len = $("._2di5p").length-1;
			var curIdx = parseInt($("._2di5p:visible").attr("id").substr(5));
			var curObj = $("._2di5p:visible");
			var prevObj ;
			if(curObj.prev("script").length == 1){
				prevObj = curObj.prev().prev();
			}else{
				prevObj = curObj.prev();
			}
			//이전객체 비율 조정
			prevObj.parent("div").css("padding-bottom", prevObj.height()/6+"%");
			
			//필터 적용
			$("._4rbun").attr("class", "_4rbun "+ filesArr[curIdx-1].filter);
			
			//이미지 전환
			curObj.css("display","none");
			prevObj.css("display","block");
			
			//비디오 재생
			if(curObj.prev("video").length == 1){
				prevObj.get(0).play();
			}else if(curObj.is("video")){
				curObj.get(0).pause();
			}
			
			//버튼 보이기
			$("#moveRight").css("display","block");
			if(curIdx - 1 == 0){
				$("#moveLeft").css("display","none");
			}

			//현재 표시 이미지 위치 변경
			$("._5zbvx:eq("+curIdx+")").removeClass(" _c0g09");
			$("._5zbvx:eq("+(curIdx-1)+")").addClass(" _c0g09");
		});
		
		//작성중 다른페이지 이동 시 확인처리
		$(".explore, .new-post, .follow-list, .account, #logo, ._2g7d5, a._pg23k").on("click", function(event){
			unloadCheck();
		});
	}); //ready 끝
	

	//파일 업로드 중 검색 할 경우
	// 검색 결과 없을 때 enter키 막기
	function unloadCheck(){
		var result = confirm("작성을 중지하고 나가시겠습니까?");
		   console.log(result);
		   if(!result){   
			   event.preventDefault();
		   } 
	}
	
	//팝업 닫기
	function callRemoveDialog(event){
		if(typeof event != "undefined"){
			event.stopPropagation();
		}

		$("body").attr("sytle","");
		$("#react-root").attr("aria-hidden","false");
		$("div[role='dialog']").remove();
	}
	
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
		/* infoWindow = new google.maps.InfoWindow({
			map : map
		}); */
		
		/* //맵 선택시 새로운 주소 읽어들이고 마킹 바꾸기
		map.addListener('click', function(event) {
			//이벤트에서 위치정보 읽어옴
			var latlng = event.latLng;
			//위치정보의 주소 읽어들임
			reverseGeocoding(latlng);
	  	});  */
	}
	
	function getLocation(){
		//지도에 현재 위치 표시, 위도경도 읽어옴
		navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
	}
	function findLocation(){
		//지도에 현재 위치 표시, 위도경도 읽어옴
		geocoding();
	}
	
	//getCurrentPosition메서드 성공하면 불러지는 함수
	//위도,경도 지정
	//지도의 가운데 마킹
	function successCallback(position) {
		let latlng = {
			lat : position.coords.latitude,
			lng : position.coords.longitude
		};
		//역지오코딩 호출
		reverseGeocoding(latlng);
		
		//infoWindow.setPosition(latlng);
		map.setCenter(latlng);
	}
	
	function errorCallback(error) {
		alert("Error: " + error.message);
	}

	//GPS정보로 주소 이름 가져오기
	function reverseGeocoding(latlng){
		geocoder.geocode({
			'location' : latlng
		}, function(results, status) {
			if (status === 'OK') {
				if (results[1]) {
					marker.setPosition(latlng);
					marker.setMap(map);
					$("#modalAddress").val(results[1].address_components[1].long_name 
							+ " " + results[1].address_components[0].long_name);
					//+ results[1].address_components[2]);
					//infoWindow.setContent(results[5].formatted_address);
					//infoWindow.open(map, marker);
    	  			//$('#hiddenAddress').val(results[5].formatted_address);
				} else {
					window.alert('No results found');
				}
			} else {
				window.alert('Geocoder failed due to: ' + status);
			}
		});
	}

	//지오코딩
	//이름으로 gps위치 얻기
	function geocoding(str) {
		if(str == null || str =="" || typeof str == "undefined") return;
		var modalAddress = str;
		geocoder.geocode({
			'address' : modalAddress
		}, function(results, status) {
			if (status == 'OK') {
				marker.setPosition(results[0].geometry.location);
				marker.setMap(map);
				//infoWindow.setContent(results[0].formatted_address);
				//infoWindow.open(map, marker);
				//$('#hiddenAddress').val(results[0].formatted_address);
				map.setCenter(results[0].geometry.location);
			} else {
				alert('검색결과가 없습니다.');
			}
		});
	}
	
	
	
	
</script>
</html>