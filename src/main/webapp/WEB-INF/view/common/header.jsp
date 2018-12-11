<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- jstl --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
	
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


</style>
<!-- header 시작 -->
<div id="gateway_warp">

	<div id="gateway_con">

		<div class="gnbArea_top">

			<div class="gnbArea_left">

				<ul>

					<li><a href="/mem/main"
						onMouseover="this.style.background='#41c16e', this.style.color='white';"
						onMouseout="this.style.background='#f4f6f9', this.style.color='black';">홈</a>
					</li>

					<li class="petSitter"><a href="/sit/sitMain"
						onMouseover="this.style.background='#17aaff', this.style.color='white';"
						onMouseout="this.style.background='#f4f6f9', this.style.color='black';">펫시터</a></li>

					<li class="petHair"><a href="/hair/hairMain"
						onMouseover="this.style.background='#ffba00', this.style.color='white';"
						onMouseout="this.style.background='#f4f6f9', this.style.color='black';">펫미용실</a></li>

					<li class="petShop"><a href="/shop/shopMain"
						onMouseover="this.style.background='#ff4f03', this.style.color='white';"
						onMouseout="this.style.background='#f4f6f9', this.style.color='black';">펫쇼핑몰</a></li>

					<li class="petInsurance"><a href="/petInsurance.jsp"
						onMouseover="this.style.background='#7c6ee9', this.style.color='white';"
						onMouseout="this.style.background='#f4f6f9', this.style.color='black';">펫보험</a></li>

				</ul>

			</div>
			
				<%-- div : 로그인 popup 창 --%>
				<div id="loginPopup">
					<div id="exitBtn"><a>X</a></div>
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
												    String clientId = "dQEq__PeBE4FPR0eimgb";//애플리케이션 클라이언트 아이디값";
												    String redirectURI = URLEncoder.encode("http://localhost:8081/mem/login", "UTF-8");
												    SecureRandom random = new SecureRandom();
												    String state = new BigInteger(130, random).toString();
												    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
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
												<label class="loginMenuLabel"><input class="loginMenuInput" type="button" value="아이디 찾기"></label>
												<label class="loginMenuLabel"><input class="loginMenuInput" type="button" value="비밀번호 찾기"></label>
												<label class="loginMenuLabel"><input class="loginMenuInput" type="button" value="회원가입"></label>
											</div>
											
											
											
											
										</div>
									</div>
								</div>
							</div>
						</form>
						<!-- login form 끝 -->
				</div>

			<div class="gnbArea_right">

				<div id="gnbArea_link">

					<ul>
						
						<c:choose>
							<c:when test="${memVo!=null }">
								<li>${memVo.mem_id } 님 안녕하세요!</li>
								<li><a href="/mem/logout">로그아웃</a></li>
							</c:when>
							<c:otherwise>
								<li>로그인 정보가 없습니다</li>
<!-- 								<li><a href="/mem/loginPage">로그인</a></li> -->
								<li><a id="loginClick">로그인</a></li>
							
							</c:otherwise>
						</c:choose>
						

						<li><a href="/mem/memJoinSel">회원가입</a></li>

						<li><a href="#">마이페이지</a></li>

					</ul>

				</div>
				
				
			</div>


		</div>

	</div>

</div>
<!-- header 끝-->

<script>
	$(document).ready(function(){
		
		$("#loginPopup").hide();
		
		$("#loginClick").click(function(){
			$("#loginPopup").slideDown("fast");
		});
		
		$("#exitBtn").click(function(){
			$("#loginPopup").slideUp("fast");
		});
		
	});

</script>