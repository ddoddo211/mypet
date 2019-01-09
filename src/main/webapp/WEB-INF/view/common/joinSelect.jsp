<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
<%@include file ="/css/commonCss.css"%>
.member {
	font-size: 50px;
	text-shadow: 0 0 10px #666;
	color: #fff;
	margin: 0 auto;
	margin-top: 70px;
	text-align: center;
	text-transform: capitalize;
	font-family: "맑은 고딕";
	font-style: italic;
	text-align: center;
}

body {
	font-family: "맑은 고딕";
	font-size: 12px;
}

.form {
	width: 380px;
	height: 250px;
	border-radius: 25px;
	border: 5px double #999;
	margin: 30px auto;
}

.form2 {
	width: 380px;
	min-width: 320px;
	height: 200px;
	margin: 30px auto;
	margin-left: 20px;
	min-width: 320px;
}

.form3 {
	float: left;
	/*   background:#f00;  */
	padding-top: 5px;
}

.form3 label {
	width: 60px;
	height: 20px;
	/*  display: block; */
	float: left;
	margin-left: 10px;
}

.form4 {
	padding: 0px 0px 0px 70px;
}

#wrap {
	width: 400px;
	height: 400px;
	margin: 0 auto;
}

.clear {
	clear: both;
}

input[type="submit"] {
	float: left;
	/*  display:block; */
	height: 50px;
	background: #FFBB00;
	border-radius: 5px;
	border: none;
	font-family: "맑은 고딕";
}

input[type="button"] {
	height: 30px;
	background: white;
	border: none;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 10px;
	border-radius: 5px;
}

input[type="checkbox"] {
	margin-top: 20px;
}

#loginButton {
	margin-left: 10px;
	height: 50px;
	width: 60px;
}

#user {
	margin-left: 10px;
}

#form2-1 {
	width: 400px;
	height: 60px;
}

#form2-1-1{
	width: 250px;
	height: 60px;
	float: left;
}

#form2-1-1-1{
	width: 70px;
	height: 60px;
	float: left;
	padding-top:5px;

}

#loginMenu{
	width: 400px;
}

.loginMenuLabel{
	float: left;
}

.loginMenuInput{
	width: 90px;
	margin-right: 0px;
	outline: none;
	cursor: pointer;
}

#naverLogin{
	margin-left: 70px;
}

.joinSel{
	font-size: 28px;
	width : 200px;
}

.joinSelCon{
	text-align: center;
	width: 400px;
	height: 80px;
	border: 3px solid #f4f6f9;
	padding-top: 40px;
	vertical-align: middle;

}

</style>

</head>
<body>
	<!-- header 시작 -->
	<%@include file="../common/header.jsp"%>
	<!-- header 끝-->

	<!-- main header content -->
	<div id="header">
		<!-- main -->
		<div id="logo">
			<img alt="이미지가 없습니다" src="/img/mainLogo.jpg" width="200px;">
		</div>
		<div id="petSearch">
			<input type="text" id="search" value="검색어를 입력하세요"
				onfocus="this.value=''" style="color: #c1c1c1" /> <a href="#"
				id="searchButton"></a>
		</div>

		<!-- 우리 아이 등록하기 -->
		<div id="petInsert">
			<a href="#"><img alt="이미지가 없습니다" src="/img/petInsert.jpg"
				width="170px;"></a>
		</div>
	</div>
	<!-- main header content 끝  -->
	
	 <%
	    clientId = "dQEq__PeBE4FPR0eimgb";//애플리케이션 클라이언트 아이디값";
	    redirectURI = URLEncoder.encode("http://localhost:8081/mem/join", "UTF-8");
	    random = new SecureRandom();
	    state = new BigInteger(130, random).toString();
	    apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    session.setAttribute("state", state);
	 %>
	

		<div id="wrap">
				<h1 class="member">My Pet Join</h1>
				<br><br>
			 	<div class="joinSelCon">
					<a href="/mem/memJoin" class="joinSel">일반회원 가입하기</a>
				</div>
				<br><br>
			 	<div id="naverJoin" class="joinSelCon">
			  		<a href="<%=apiURL%>" class="joinSel"><img height="30" src="/img/naverBtnSmall.PNG"/>네이버아이디로 회원가입</a> 
			 	</div>
		</div>


	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>