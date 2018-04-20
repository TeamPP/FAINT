<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>


<script>
    function signinchk(obj){
        if(!obj.email.value || obj.email.value.trim().length ==0){
            alert("이메일이 입력되지 않았습니다.");
            obj.email.value ="";
            obj.email.focus();
            return false;
        }
    }
    $(document).on('click','#authenticate',function() {

        var email = $('#email').val();
        var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

        if (!email || email.trim().length == 0) {
            alert("이메일이 입력되지 않았습니다.");
            return false;
        }
        if (regex.test(email) === false) {
            alert("잘못된 이메일 형식입니다.");
            return false;
        }
    });
</script>
<link href="/resources/dist/css/login.css" rel="stylesheet">
<div  id="findPassword">

    <div class="wrapper fadeInDown text-center">

        <div class="card border-secondary mb-3" style="max-width: 20rem;" id="formContent">


            <div class="card-header" style="background-color: black">

                <h1 class="text-white hn">Find Password</h1>
            </div>
            <div class="fadeIn first">
                <img class="mt-3 mb-3"   style="width: 150px " src="/resources/images/password2.svg" id="icon" alt="User Icon" />
            </div>

            <form name="findPassword" action="/user/findPassword" method="post" onsubmit="return signinchk(this)">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />s
                <input type="text" class="form-control" name="email" id="email" placeholder="가입 시 사용한 이메일을 입력해 주세요"/>
                <input type="submit" class="form-control btn btn-primary" id="authenticate" value="비밀번호 찾기"/>

            </form>
        </div>
    </div>
</div>