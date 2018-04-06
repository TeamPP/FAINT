<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로필 편집</title>
</head>
<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
<style>
h2{
	margin:0;
}
</style>
<script>
//프로필 수정 후 로딩 될때 메시지 띄우기
	if ('${result}' == "profileEdit") {
		//프로필 수정일 경우 프로필 편집 활성화
		alert("프로필이 저장되었습니다.");
	}
</script>
	<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"></jsp:include>
<body class style="">
<span id="react-root" aria-hidden="false">
	<section class="_sq4bv _29u45"> 
	<main class="_8fi2q _2v79o">
	<div class="_28rsa">
	<!-- 사이드바 -->
	<jsp:include page="editSide.jsp" flush="false"></jsp:include>
	<article class="_75z9k"> 
	<!-- 프로필 사진 -->
	<jsp:include page="modifyProfilePhoto.jsp" flush="false"></jsp:include>
	
	<input type="file" name="file" id="inputfile" accept="image/*"	style="display: none;">
		<!-- 프로필 변경 폼 -->
		<form class="_gzffa" id="profileForm" method="post" 
			<c:out value="${result == 'passwordChange'? 'style=display:none' : ''}" /> >
			<input type="hidden" name="id" value="${userVO.id }" /> <input
				type="hidden" id="userlevel" name="userlevel" />
			<!-- 이름 -->
			<!-- 이 값이 최대 30 개의 글자인지 확인하세요 -->
			<div class="_e1xik">
				<aside class="_kx10g"> <label>이름</label> </aside>
				<div class="_cd2n1">
					<input type="text" id="name" name="name" class="_4abhr _o716c"
						onkeyup="validCheck(this)" value="${userVO.name }">
						 
				</div>
			</div>
			<!-- 사용자 이름 -->
			<!-- 이 값이 최대 30 개의 글자인지 확인하세요 -->
			<!-- 사용자 이름에는 문자, 숫자, 밑줄 및 마침표만 사용할 수 있습니다 -->
			<!-- 닉네임 -->
			<div class="_e1xik">
				<aside class="_kx10g"> <label>사용자 이름</label> </aside>
				<div class="_cd2n1">
					<input type="text" id="nickname" class="_4abhr _o716c"
						name="nickname" value="${userVO.nickname }" onkeyup="validCheck(this)">
				</div>
			</div>
			<!-- 에러 메세지 표시 -->
			<div class="_e1xik">
				<aside class="_kx10g _ldhkl"> <label></label></aside>
				<div class="_cd2n1">
					<h2 class="_49rz2 err" id="chkResult">&nbsp</h2> 
				</div>
			</div>
			<!-- 웹사이트 -->
			<!-- url 양식에 맞게 -->
			<div class="_e1xik">
				<aside class="_kx10g"> <label>웹사이트</label> </aside>
				<div class="_cd2n1">
					<input type="text" id="website" name="website"
						class="_4abhr _o716c" onkeyup="validCheck(this)"
						value="${userVO.website }" > 
						<label class="err" id="errWeb" 
						style="padding: 5px; font-weight: 600; font-size:20px; cursor: pointer; display:none">X</label>
				</div>
			</div>
			<!-- 소개 -->
			<!-- 전부 -->
			<!-- 소개는 150자 이하여야 합니다. -->
			<div class="_e1xik">
				<aside class="_kx10g"> <label>소개</label> </aside>
				<div class="_cd2n1">
					<textarea id="intro" name="intro" onkeyup="validCheck(this)"
						class="_jlcqs"
						style="width: 500px; height: 150px; resize: none; overflow: hidden; overflow-y: scroll;">${userVO.intro }</textarea>
				</div>
			</div>
			<!-- 개인정보 -->
			<div class="_e1xik">
				<aside class="_kx10g _ldhkl"> <label></label></aside>
				<div class="_cd2n1">
					<div class="_9z7nz">
						<h2 class="_49rz2">개인 정보</h2>
					</div>
				</div>
			</div>

			<!-- email -->
			<!-- 수정불가 -->
			<div class="_e1xik">
				<aside class="_kx10g"> <label>이메일</label></aside>
				<div class="_cd2n1">
					<input type="text" name="email" class="_4abhr _o716c"
						value="${userVO.email }" readonly="readonly">
				</div>
			</div>
			<!-- 전화번호 -->
			<!-- 전화번호 양식에 맞게 -->
			<div class="_e1xik">
				<aside class="_kx10g"> <label>전화번호</label> </aside>
				<div class="_cd2n1">
					<input type="text" id="phoneNumber" class="_4abhr _o716c"
						name="phonenumber" onkeyup="validCheck(this)"
						value="${userVO.phonenumber }" > 
						<label class="err" id="errPN" 
						style=" padding: 5px; font-weight: 600; font-size:20px; cursor: pointer; display:none">X</label>
				</div>
			</div>
			<!-- 성별 -->
			<div class="_e1xik">
				<aside class="_kx10g"> <label>성별</label> </aside>
				<div class="_cd2n1">
					<div class="_sx05v">
						<span class="_4v6lq _8scx2 coreSpriteChevronDownGrey"></span> <select
							id="sex" name="sex" class="_nxkvc">
							<option value="0">선택 안함</option>
							<option value="1">남성</option>
							<option value="2">여성</option>
						</select>
					</div>
				</div>
				<script>
					$("#sex option:eq(${userVO.sex})").prop("selected", true);
				</script>

			</div>
			<!-- 비공개유무 -->
			<div class="_e1xik">
				<aside class="_kx10g"> <label>비공개</label> </aside>
				<div class="_cd2n1">
					<div class="_6dodw">
						<label class="_l67zd" for="chkPri"> <input id="chkPri"
							class="_snyzf" type="checkbox"> <c:if
								test="${userVO.userlevel eq '1' }">
								<script>
									$("#chkPri").attr("checked", true);
								</script>
							</c:if> <c:if test="${userVO.userlevel eq '0' }">
								<script>
									$("#chkPri").attr("checked", false);
								</script>
							</c:if>
							<div class="_1u1jc"></div>
						</label>
					</div>
				</div>
			</div>
			<!-- 제출 -->
			<div class="_e1xik">
				<aside class="_kx10g _ldhkl">
				<label></label></aside>
				<div class="_cd2n1">
					<div class="_eqmpg">
						<span class="_ov9ai">
							<button id="btnSubmit"
								class="_qv64e _gexxb _r9b8f _njrw0">제출</button>
						</span>
					</div>
				</div>
			</div>
		</form>
	</div>
	</article> 
	</main>
	<jsp:include page="../../common/footer.jsp" flush="false"></jsp:include>
	</section>
	</span>
	<input type="file" name="file" id="inputfile" accept="image/*"
		style="display: none;">
</body>

<!-- 공통 처리 import -->
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript" src="../../resources/js/upload.js"></script>
<script>
	$(document).ready(function() {
		//제출 버튼
		$("#btnSubmit").on("click", function(event) {
			event.preventDefault();
			errFlg = false;
			//에러난 항목 있으면 다시 체크
			//에러 표시 항목 클래스드 색깔 빨강이면 에러
			$(".err").each(function(){
				console.log(this.id);
				console.log($(this).css("color"));
				if($(this).css("color") == "rgb(255, 0, 0)"){
					alert("올바른 정보를 입력하세요.");
					errFlg = true;
					return false;	
				}
			});
			if(errFlg) return;
			var form = $("#profileForm");

			//비공개 체크 데이터 입력
			if ($("#chkPri").is(":checked")) {
				//비공개 체크 되어있으면 1
				$("#userlevel").val(1);
			} else {
				//안되있으면 0
				$("#userlevel").val(0);
			}	
			form.submit();
		});

	}); //end ready
	
	
	//유효성 검사 에러 체크
	var errFlg = false;
	
	//유효성 검사
	function validCheck(obj) {
		var chkStr = "";
		var maxLen = 0;

		switch (obj.id) {
		//이름
		case "name":
			maxLen = 30;
			//길이체크
			if (!lengthCheck(obj, maxLen)) return;
			break;
		//사용자이름
		case "nickname":
			maxLen = 30;
			var orgNick = "${userVO.nickname}";
			var nick = obj.value;
			//입력 가능 형식 문자, 숫자, 밑줄, 마침표
			if (nick == null || nick.length == 0) {
				//길이가 0이면 에러표시 지우고 리턴
				$("#chkResult").css("color", "red");
				$("#chkResult").text("사용자 이름을 입력하시오.");
				return;
			}
			//길이체크
			if (!lengthCheck(obj, maxLen)) return;

			//원래 이름과 같으면
			if (orgNick == nick) {
				$("#chkResult").css("color", "#999");
				$("#chkResult").text("");
				return;
			}
			
			//체크 정규식 설정
			if (nick.length <= 2) {
				//길이가 2보다 작으면
				chkStr = /^[A-Za-z0-9_]*$/;
			} else {
				//길이가 2보다 크면
				chkStr = /^[A-Za-z0-9_]+[a-zA-Z0-9_\.]+[A-Za-z0-9_]$/;
			}
			//입력값 형식에 맞는지 비교
			if (!chkStr.test(nick)) {
				$("#chkResult").text("입력형식이 올바르지 않습니다.");
				$("#chkResult").css("color", "red");
				return;
			} else {
				//중복확인
				$.getJSON("/member/profile/edit/chkNick", {nick: nick}, function(data) {
					//data = 0 중복아님, != 0  중복
					if (data == 0) {
						//글자색 검정
						$("#chkResult").css("color", "black");
						$("#chkResult").text("사용가능한 닉네임입니다.");
					} else {
						//글자색 빨강
						$("#chkResult").css("color", "red");
						$("#chkResult").text("중복된 닉네임입니다.");
					}
				});
				return;
			}
			break;
		//웹사이트
		case "website":
			//입력 가능 형식 문자, 숫자, 밑줄, 마침표
			if (obj.value.length == 0) {
				//길이가 0이면 에러표시 지우고 리턴
				$("#" + obj.id).siblings("label").hide();
				$("#" + obj.id).siblings("label").css("color", "black");
				return;
			}

			chkStr = /^(((http(s?))\:\/\/)?)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/
			//입렵값 체크
			strCheck(obj, chkStr);

			break;
		//소개
		case "intro":
			maxLen = 150;
			//길이체크
			if (!lengthCheck(obj, maxLen)) return;
			break;
		//번호
		case "phoneNumber":
			maxLen = 13;
			//입력 가능 형식 문자, 숫자, 밑줄, 마침표
			if (obj.value.length== 0) {
				//길이가 13보다 작으면 에러표시 지우고 리턴
				//폰 번호 전부 입력해야 체크 시작
				$("#" + obj.id).siblings("label").hide();
				$("#" + obj.id).siblings("label").css("color", "black");
				return;
			}
			//길이체크
			if (!lengthCheck(obj, maxLen)) return;
			chkStr = /[01](0|1|6|7|8|9)[-](\d{4}|\d{3})[-]\d{4}$/g;
			//입력값 형식에 맞는지 비교
			strCheck(obj, chkStr);

			break;
		default:
			return;
		}
	}
	
	//입력한 문자열 체크
	function strCheck(obj, chkStr) {
		if (!chkStr.test(obj.value)) {
			$("#" + obj.id).siblings("label").show();
			$("#" + obj.id).siblings("label").css("color", "red");
			return true;
		} else {
			$("#" + obj.id).siblings("label").hide();
			$("#" + obj.id).siblings("label").css("color", "black");
			return false;
		}
	}
</script>
</html>