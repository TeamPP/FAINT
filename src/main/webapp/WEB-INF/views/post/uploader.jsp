<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cssgram-cssgram.netdna-ssl.com/cssgram.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.preview-images-zone > .image-zone {
    width: 100%;
    height: 100%;
    text-align: center;
}
.preview-images-zone {
    width: 100%;
    border: 1px solid #ddd;
    min-height: 220px;
    /* display: flex; */
    padding: 5px 5px 0px 5px;
    position: relative;
    overflow:auto;
    white-space: nowrap;
}
.preview-images-zone > .preview-image {
	border: 1px solid;
	height: 200px;
    width: 200px;
    position: relative;
    margin-right: 5px;
   	/* float: left; */
    margin-bottom: 5px;
    display: inline-block;
    vertical-align: top;
}

.preview-images-zone > .preview-image > .image-zone {
    width: 100%;
    height: 100%;
    text-align: center;
}
.preview-images-zone > .preview-image > .image-zone > img {
    width: 100%;
    height: 100%;
    cursor: pointer;
}
.preview-images-zone > .preview-image > .image-zone > video {
    width: 100%;
    height: 100%;
    cursor: pointer;
}

.preview-images-zone > .preview-image > .image-cancel {
    font-size: 18px;
    position: absolute;
    top: 0;
    right: 0;
    font-weight: bold;
    margin-right: 10px;
    cursor: pointer;
    display: none;
    z-index: 100;
}
.preview-image:hover > .image-zone {
    cursor: move;
    opacity: .5;
}
.preview-image:hover > .image-cancel {
    display: block;
}
.ui-sortable-helper {
    width: 90px !important;
    height: 90px !important;
}

.container {
    padding-top: 50px;
}

.image-preview-input {
    position: relative;
    overflow: hidden;
    margin: 0px;    
    color: #333;
    background-color: #fff;
    border-color: #ccc;    
}
.hide-bullets {
    list-style:none;
    margin-left: -40px;
    margin-top:20px;
}

.thumbnail {
    padding: 0;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img, .carousel-inner>.item>video, .carousel-inner>.item>a>video {
    width: 100%;
}

.thumbnail>img, .thumbnail a>img, .thumbnail>video, .thumbnail a>video {
    margin-right: auto;
    margin-left: auto;
        width: 100%;
}

.img-responsive, .thumbnail>img, .thumbnail a>img, .carousel-inner>.item>img, .carousel-inner>.item>a>img, .thumbnail>video, .thumbnail a>video, .carousel-inner>.item>video, .carousel-inner>.item>a>video {
    display: block;
    width: 100% \9;
    max-width: 100%;
    height: auto;
}
figcaption {
    position: absolute;
    bottom: 1em;
    right: 0;
    padding: .25em 1em .25em .25em;
    background: #000;
    color: #fff;
    font-weight: 200;
}
.hide-bullets > li > a, a:visited {
cursor: pointer;
color:#003569;
text-decoration:none;
}

.preview-image.selected {
    box-shadow: 0 0 0 4px #00c09e;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"></jsp:include>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<div class="container">
    <fieldset class="form-group" style="text-align: right;">
    	<div class="btn btn-default image-preview-input" onclick="$('#pro-image').click()"> 
    	<span class="glyphicon glyphicon-folder-open"></span> 
    	<span class="image-preview-input-title">Browse</span>
		</div>
	        <input type="file" id="pro-image" name="pro-image" accept="image/*,video/*"style="display: none;" class="form-control" multiple>
		<button type="button" id="upload" class="btn btn-labeled btn-default"> <span class="btn-label"><i class="glyphicon glyphicon-upload"></i> </span>Upload</button>
    </fieldset>
    <div class="preview-images-zone"> </div>
    <form id="uploadForm" method="post" />
</div>

<div class="container">
    <div id="main_area">
        <!-- Slider -->
        <div class="row">
            <div class="col-sm-22" id="slider-thumbs" >
                <!-- Bottom switcher of slider -->
                <ul class="hide-bullets">
                    <li class="col-sm-2">
                        <a class="thumbnail " id="nofilter" title="" style="position: relative;"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>#nofilter</figcaption>
                        </a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail _1977" id="1977" title="_1977"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>1977</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail aden" id="Aden" title="aden"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Aden</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail brannan" id="Brannan" title="brannan"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Brannan</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail brooklyn" id="Brooklyn" title="brooklyn"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Brooklyn</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail clarendon" id="Clarendon" title="clarendon"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Clarendon</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail earlybird" id="Earlybird" title="earlybird"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Earlybird</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail gingham" id="Gingham" title="gingham"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Gingham</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail hudson" id="Hudson" title="hudson"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Hudson</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail inkwell" id="Inkwell" title="inkwell"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Inkwell</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail kelvin" id="Kelvin" title="kelvin"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Kelvin</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail lark" id="Lark" title="lark"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Lark</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail lofi" id="Lo-Fi" title="lofi"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Lo-Fi</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail maven" id="Maven" title="maven"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Maven</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail mayfair" id="Mayfair" title="mayfair"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Mayfair</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail moon" id="Moon" title="moon"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Moon</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail nashville" id="Nashville" title="nashville"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Nashville</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail perpetua" id="Perpetua" title="perpetua"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Perpetua</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail reyes" id="Reyes" title="reye"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Reyes</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail rise" id="Rise" title="rise"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Rise</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail slumber" id="Slumber" title="slumber"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Slumber</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail stinson" id="Stinson" title="stinson"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Stinson</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail toaster" id="Toaster" title="toaster"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Toaster</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail valencia" id="Valencia" title="valencia"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Valencia</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail walden" id="Walden" title="walden"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Walden</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail willow" id="Willow" title="willow"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>Willow</figcaption></a>
                    </li>
                     <li class="col-sm-2">
                        <a class="thumbnail xpro2" id="X-pro II" title="xpro2"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <video style="display:none"></video>
                        <figcaption>X-pro II</figcaption></a>
                    </li>
                </ul>
            </div>
            
        </div>

    </div>
</div>
    
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script>
var path = "http://faint1122.s3.ap-northeast-2.amazonaws.com/faint1122";
$(document).ready(function() {

    $("#pro-image").on("change",function(){
    	readImage(this.files);
    })

    $(".preview-images-zone").sortable();
    
    $(document).on('click', '.image-cancel', function() {
        let no = $(this).data('no');
    
        $.ajax({
			url : "/deleteFile",
			type : "post",
			data : {
				fileName : $(this).attr("data-src")
			},
			dataType : "text",
			success : function(result) {
				if (result == 'deleted') {
				    $(".preview-image.preview-show-"+no).remove();
				}
			}
		}); 
    });
  	//드래그 영력에서 드래그에 대한 이벤트 막음
	$(".preview-images-zone").on("dragenter dragover", function(event) {
		event.preventDefault();
		console.log("dragover");
	});

	//파일 드롭 시 업로드 처리
	$(".preview-images-zone").on("drop", function(event) {
		event.preventDefault();
		console.log("drop");
		var droplist = event.originalEvent.dataTransfer.files;
		readImage(droplist);

	});
    $("#upload").on("click", function(event){
    	event.preventDefault();

		var form = $("#uploadForm");
		//파일 개수
		var cnt = 0;
		
		var str = "";
    	$(".image-cancel").each(function(index){
			var data = new Object();
			var obj = $(this).siblings("div",".image-zone");
			//파일 url 추가
    		data.fileUrl =$(this).attr("data-src");
			//파일 type 추가
    		data.fileType = obj.attr("data-type");

			console.log(obj[0]);
    		data.filter = obj.attr("class").split(" ")[1];
    		console.log(JSON.stringify(data));
			str += "<input type='hidden' name='files' value='" + JSON.stringify(data) + "'> ";
			
			cnt++;
    	});
    	//사진 없으면 업로드 실패
		if(cnt==0){
			alert("이미지나 동영상을 추가하세요.");
			return false;
		}
		
		//첨부파일 추가
		form.append(str);
		form.attr("action", "/post/register");
		
		form.submit();
    });
    
    //필터 적용
   $(".hide-bullets > li > a").on("click", function(){
	   //선택된 이미지가 없을때
	   //전체 필터 적용
	   if($(".selected").length == 0){
		   $(".image-zone").attr("class", "image-zone " + this.title);
	   }else{
		   //선택된 이미지만 필터 적용
		   $(".selected > .image-zone").attr("class" , "image-zone " + this.title);
		   
	   }
   });
    
	$(".explore, .new-post, .follow-list, .account, .logo").on("click", function(event){
		unloadCheck();
	});
});

//파일 업로드 중 검색 할 경우
// 검색 결과 없을 때 enter키 막기
function unloadCheck(){
	var result = confirm("작성을 중지하고 나가시겠습니까?");
	   console.log(result);
	   if(result){
		   //event.preventDefault();
		   $(".image-cancel").click();
		   //return true;
	   }else{
		   event.preventDefault();
	   } 
}

var num = 0;
function readImage(files) {
    if (window.File && window.FileList && window.FileReader) {
    
    	console.log(files);
        var output = $(".preview-images-zone");
        $(files).each(function() {
        	console.log(this);
        	console.log(this.type);
        	if(this.type.indexOf('image') ==-1 && this.type.indexOf('video') ==-1) {
        		console.log("이상한 파일");
        		return true;
        	}
			var file = this;
			var formData = new FormData();
			formData.append("file", this);
			$.ajax({
				url : '/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					var fileInfo = getFileInfo(data);
					
	                var html =  '<div class="preview-image preview-show-' + num + '" onclick="selectUploadImaage(this)">' +
	                            '<div class="image-cancel" data-no="' + num + '" data-src="'+ fileInfo.fullName+'">x</div>' +
	                            '<div class="image-zone" id="image-zone-' + num + '" data-type="'+fileInfo.fileType+'">' ;
	                if(fileInfo.fileType == "image"){
	                	html =  html + '<img id="pro-img-' + num + '" src="' + path + data + '"></div>' +
                           '</div>';
	                }else{
	                	html =  html + '<video id="pro-img-' + num + '" src="' + path + data + '" loop="true" autoplay></div>' +
                           '</div>';
	                }
	              
	                output.append(html);
	                
	                //처음 업로드 되는 이미지로 필터 이미지 변경
	                if(num == 0){
	                	if(fileInfo.fileType != 'video'){
	                		$(".thumbnail > img").css("display","block");
	                		$(".thumbnail > video").css("display","none");
	                		$(".thumbnail > img").attr("src", path + data);
	                	}
	                	else{
	                		$(".thumbnail > img").css("display","none");
	                		$(".thumbnail > video").css("display","block");
	                		$(".thumbnail > video").attr("src", path + data);
	                	}
	                }
	                num = num + 1;
	                
	               
				}
			}); //ajax end
		}); 
        
        $("#pro-image").val('');
    } else {
        console.log('Browser not support');
    }
}  
 
function selectUploadImaage(obj){
	//소스 읽기
	var src = $("#"+obj.children[1].children[0].id).attr("src");
	//타입 읽기
	var type = $("#"+obj.children[1].id).attr("data-type");

	//클래스 추가
	$(obj).toggleClass("selected");
	if(type == 'image'){
		$(".thumbnail > video").css("display","none");
		$(".thumbnail > img").css("display","block");
		$(".thumbnail > img").attr("src", src);
	}else if(type == 'video'){
		$(".thumbnail > img").css("display","none");
		$(".thumbnail > video").css("display","block");
		$(".thumbnail > video").attr("src", src);
		
	}
}
</script>
</html>