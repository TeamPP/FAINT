<jsp:include page="header.jsp" flush="false"/>
<style>
    .tab-content{
        padding-top: 6px;
    }
    body{
        background-image: url("/resources/images/login5.jpg");
        background-size: contain;
    }
</style>

<div class="container " style="padding-top: 100px" >
    <ul id="myTab" class="nav nav-tabs" role="tablist" >
        <li role="presentation" class="Account_information nav-link" style="background-color: white;">
            <a href="/user/myinfo" id="Account_information" role="tab" class="bd" >Account_information</a></li>
        <li role="presentation" class="Board nav-link" style="background-color: white;">
            <a href="/user/myBoard" role="tab" id="Board" class="bd">Board</a></li>
        <li role="presentation" class="Source_code nav-link" style="background-color: white;">
            <a href="/user/mySourceCode" role="tab" id="Source_code" class="bd">Source_code</a></li>

    </ul>
    <div id="myTabContent" class="tab-content active">
<%--닫지 마세요--%>
