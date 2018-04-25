
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<!--제이쿼리 라이브러리  -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<%-- <jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/> --%>
<!--제이쿼리 라이브러리  -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- <style>

	td {
		padding:2px;

	}
	input{
		width:30em;
	}
</style> -->

<style>
/* body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box} */
/* Full-width input fields */
/* input[type=text], input[type=password] {
    /* width: 100%; */
  /*   padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
        width: 90%;
    max-width: 450px;
} */

/* Add a background color when the inputs get focus */
/* input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
} */

/* Set a style for all buttons */
/*  button {
    background-color: #5a6674;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    /* width: 100%; */
 /*   opacity: 0.9;
}  */

button:hover {
    opacity:1;
}


.submitBtn{
  background-color: #5a6674;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    /* width: 100%; */
    opacity: 0.9;
}

/* Extra styles for the cancel button */
.cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
 
    
}


/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    /* width: 50%; */ /* Could be more or less, depending on screen size */
    width: 657px;
}

/* Style the horizontal ruler */
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 50px;
}
 
.close:hover,
.close:focus {
    color: #f44336;
    cursor: pointer;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}


    input{
      margin:0;
    }
    
    input[type="text"]{
      
      width:76%;
      height:40px;
      
 background-color: #f1f1f1;
      border:none;
      font-size:1.2em;
      padding-left: 5px;
      font-style: oblique;
      display:inline;
      outline:none;
      box-sizing: border-box;
      color:black;

    }
    
    
    input[type="password"]{
       background-color: #f1f1f1;
      width:90%;
      height:40px;
      border:none;
      font-size:1.2em;
      padding-left: 5px;
      font-style: oblique;
      display:inline;
      outline:none;
      box-sizing: border-box;
      color:black;

    }
    input[type=button]{
     width: 15%;
      height:40px;
   /*   background-color: white;   */  
     background-color: #f1f1f1; 
      border:none;
      font-size:1em;
      color:#5a6674;
      outline:none;
      display:inline;
      margin-left: -10px;
      box-sizing: border-box;
    }
	
	
   input[type=button]:hover{
      background-color: lightgray;
    } 

.inputContainer{
margin-left:5%;
}


.clearfix{
text-align:center;
}

</style>



<script>

    var chkid=false;
    var chkName=false;
    var chkpass=false;
    //console.log(signup);
    function checkvalue() {
        // console.log('3번째: '+signup.userPassword.value);
        // console.log('4번째: '+signup.chkPassword.value);
        if(signup.password.value && signup.chkPassword.value) {
            if(signup.password.value.trim().length >40){
                alert("비밀번호는 40자 이내로 입력해 주세요.");
                return false;
            }
            if(signup.chkPassword.value.trim().length >40){
                alert("비밀번호 확인 40자 이내로 입력해 주세요.");
                return false;
            }
            if(signup.password.value!=signup.chkPassword.value){
                $('#pwsame').text('비밀번호가 일치하지 않습니다.');
                $('#pwsame').css("color","red");
                chkpass=false;
            }else if(signup.password.value===signup.chkPassword.value) {
                $('#pwsame').text('비밀번호가 일치합니다.');
                $('#pwsame').css("color","#2EFE2E");
                chkpass=true;
            }
        } else {
            $('#pwsame').text('비밀번호와 비밀번호확인을 입력해주세요.');
            $('#pwsame').css("color","red");
            chkpass=false;
        }
    }


    function signinchk(obj){
        if(!obj.email.value || obj.email.value.trim().length ==0){
            alert("이메일이 입력되지 않았습니다.");
            obj.email.value ="";
            obj.email.focus();
            return false;
        }
        if(!chkid){
            alert("이메일 중복체크를 실행해주세요.");
            obj.email.focus();
            return false;
        }
        if(!chkName){
            alert("이름 중복체크를 실행해주세요.");
            obj.nickname.focus();
            return false;
        }
        if(!obj.password.value || obj.password.value.trim().length ==0){
            alert("비밀번호를 입력해주세요.");
            obj.password.value ="";
            obj.password.focus();
            return false;
        }
        if(!obj.nickname.value || obj.nickname.value.trim().length ==0){
            alert("이름을 입력해주세요.");
            obj.nickname.value ="";
            obj.nickname.focus();
            return false;
        }
        if(!chkpass){
            alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요");
            return false;
        }
    }
</script>
<script>
    $(document).on('click','#authenticate',function(){
    	console.log("asdfasdf");
        var email = $('#email').val();

        var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

        if(!email || email.trim().length ==0){
            alert("이메일이 입력되지 않았습니다.");
            return false;
        }
        if(email.trim().length >40){
            alert("E-mail은 40자 이내로 입력해 주세요.");
            return false;
        }
        if(regex.test(email) === false) {
            alert("잘못된 이메일 형식입니다.");
            return false;
        } else {

            $.ajax({
                url:'/user/authenticate',
                type:'POST',
                data: {'email' : email},
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                dataType : "json",
				
            	beforeSend : function(xhr)
  	          {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
  	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
  	          },
                success:function(data){
                    console.log("success")
                    alert(decodeURIComponent(data.msg))
                    if(data.chk == "T"){
                        chkid=true;
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown){

                    alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
                }
            }); }
    });

    $(document).on('click','#authenticateName',function(){
        var nickname = $('#nickname').val();
        console.log(nickname);

        if(nickname.trim().length >20){
            alert("이름을 20자 이내로 입력해 주세요.");
            return false;
        }

        if(!nickname || nickname.trim().length ==0){
            alert("유저 네임이 입력되지 않았습니다.");
            return false;
        } else {
            $.ajax({
                url:'/user/authenticateName',
                type:'POST',
                data: {'nickname' : nickname},
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                dataType : "json",
				
            	beforeSend : function(xhr)
  	          {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
  	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
  	          },
                success:function(data){
                    console.log("success")
                    alert(decodeURIComponent(data.msg))
                    if(data.chk == "T"){
                        //alert('사용 가능한 이름입니다.' );
                        chkName=true;
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown){

                    alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
                }
            }); }
    });
</script>
<!-- <link href="/resources/dist/css/login.css" rel="stylesheet"> -->

<div  id="regiser">
				<form class="modal-content" role="form" name="signup"  method="post" onsubmit="return signinchk(this)">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				
				  <div class="container">
							
				<h1 style="text-align:center;">Sign Up</h1>
      			<p style="text-align:center;">Please fill in this form to create an account.</p>
						<hr>
						
							<div class="inputContainer">
					      <label for="email"><b style="font-size:1.2em;">Email</b></label><br/>
					      <input type="text"  placeholder="Enter Email" name="email" id="email" required>
					      <input type="button"  class="btn btn-warning"  id="authenticate" value="중복체크"><br/><br/><br/>
				
							
						 <label for="nickname"><b  style="font-size:1.2em;">Nickname</b></label><br/>
					      <input type="text"  placeholder="Nickname"  name="nickname" id="nickname"  required>
					      <input type="button"  id="authenticateName" class="btn btn-warning" value="중복체크"><br/><br/><br/>
					 	
							
					      <label for="psw"><b  style="font-size:1.2em;">Password</b></label><br/>
					      <input type="password"  placeholder="Enter Password" name="password" id="password"  onkeyup="checkvalue()" required><br/><br/><br/>
					
					      <label for="psw-repeat"><b  style="font-size:1.2em;">Repeat Password</b></label><br/>
					      <input type="password" placeholder="Repeat Password" name="chkPassword" id="chkPassword" onkeyup="checkvalue()"  required><br/><br/><br/>
					      
					      <p id="pwsame" name="pwsame"  ></p>
					    </div>	 
				     
					     <div class="clearfix"> 
					     <button class="submitBtn" type="submit" class="signupbtn">Sign Up</button>
						</div>
						
						
						
						
  					  </div>			
					
				</form>
			</div>




