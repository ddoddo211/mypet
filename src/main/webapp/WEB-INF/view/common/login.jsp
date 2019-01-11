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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="/css/commonCss.css" rel="stylesheet"/>
<style type="text/css">
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
	border: 2px dashed #999;
	margin: 30px auto;
	background-color: white;
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
	min-height: 658px;
	margin: 0 auto;
}

.clear {
	clear: both;
}

input[type="submit"] {
	float: left;
	/*  display:block; */
	height: 50px;
	background: #96c8ff;
	border-radius: 5px;
	border: none;
	font-family: "맑은 고딕";
	box-shadow: 3px 3px 10px #E6E2AF;
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
	width: 90px;
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

#loginForm{
	background-image: url("/img/loginBack.jpg");
	margin-bottom: 100px;
	width: 1200px;
}
</style>

<script type="text/javascript">
	<%if(request.getParameter("navermsg")==null){%>
		alert("ID 또는 PW가 일치하지않습니다 다시 시도해주세요");
	<%} else {%>
		alert("네이버 로그인 실패"); 
	<%	}%>
	
	$(document).ready(function() {
		$("#idSearch").click(function() {
			popUp();
		})
	})
	
	function popUp() {
		var popUrl = "/mem/idSearchView";
		var popOption = "width=500, height=200, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl, "주소변경", popOption);
	};
</script>

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

	<!-- login form -->
	<form action="/mem/loginNM" method="post">
		<div id="wrap">
			<h1 class="member">My Pet Login</h1>
			<div class="form">
				<div class="form2">
					<div id="form2-1">
						<div id="form2-1-1">
							<div class="form3" id="form3-1">
								<label for="user">아이디</label><input type="text" name="mem_id">
							</div>
							<div class="form3">
								<label for="user">비밀번호</label><input type="password" name="mem_pass">
							</div>
						</div>
						<div id="form2-1-1-1">
							<input id="loginButton" type="submit" value="로그인">
						</div>
					</div>
							 <%
							    clientId = "dQEq__PeBE4FPR0eimgb"; /*애플리케이션 클라이언트 아이디값";*/
							    clientId = "dQEq__PeBE4FPR0eimgb";//애플리케이션 클라이언트 아이디값";
							    redirectURI = URLEncoder.encode("http://localhost:8081/mem/login", "UTF-8");
							    random = new SecureRandom();
							    state = new BigInteger(130, random).toString();
							    apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
							    apiURL += "&client_id=" + clientId;
							    apiURL += "&redirect_uri=" + redirectURI;
							    apiURL += "&state=" + state;
							    session.setAttribute("state", state);
							 %>
							 <div id="naverLogin">
							  <a href="<%=apiURL%>"><img height="40" src="/img/naverBtn.PNG"/></a>
							 </div>
					<div class="form4">
						<br>
						<label><input type="checkbox">아이디저장</label> 
					    <label><input type="checkbox">보안접속</label> <br>
					    
					    <div id="loginMenu">
							<label class="loginMenuLabel"><input class="loginMenuInput"  id ="idSearch"type="button" value="아이디 찾기"></label>
							<label class="loginMenuLabel"><input class="loginMenuInput" type="button" value="비밀번호 찾기"></label>
							<label class="loginMenuLabel"><input class="loginMenuInput" type="button" value="회원가입"></label>
						</div>
						
						
						
						
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- login form 끝 -->


	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>