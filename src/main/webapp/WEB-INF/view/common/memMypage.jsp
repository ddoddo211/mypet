<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memMypage.jsp(마이페이지)</title>

<style type="text/css">

#main{	
	width: 1200px;
	height: 0 auto;
	margin: 0 auto;
	margin-bottom: 20px;
}

#memMypage{
	width: 1200px;
	height: 596px;
}

#memMypage2{
	width: 1000px;
	height: 680px;
	margin-left: 100px;
	margin-top: 50px;
}

#memMypage3{
	width: 1000px;
	height: 50px;
}

#memMypage4{
	width: 1000px;
	height: 577px;
}

#memMypage3_1 {
    width: 450px;
    height: 40px;
    line-height: 40px;
	font-family: 'Nanum Pen Script', cursive;
	font-size: 50px;
    background-color: #fff6dd;
    text-align: center;
    float: left;
    border-radius: 3px;
    box-shadow: 3px 3px 3px 3px #999;
    border-right: none;
    margin-left: 275px;
    margin-bottom: 10px;
}


#accident{
	height: 205px;
	margin-top: 20px;
}


#accident1{
	height: 230px;
	width: 800px;
	margin-left: 10px;
}

.accident2{
	height: 50px;
	width: 800px;
}



.accident2_1{
	width: 150px;
    float: left;
    font-family: 'Jeju Gothic', sans-serif;
    font-size: 20px;
    margin-bottom: 10px;
    background-color: #ffcce7;
    color: white;
    width: 150px;
    border-radius: 50px;
    text-align: center;
    padding: 5px;
}

.accident2_2{
	width: 200px;
	height: 30px;
	margin-left: 170px;
}

.accident2_2_7_1{
	margin-left: 460px;
}

#pro{
	background-color: black;
	color: white;
	width: 100px;
	height: 30px;
	border-radius: 50px;
	font-family: 'Jeju Gothic', sans-serif;
    font-size: 15px;
    outline: none;
    border: 2px solid black;
}

#pro:hover{
	background-color: white;
	color: black;
	width: 100px;
	height: 30px;
	border-radius: 50px;
	font-family: 'Jeju Gothic', sans-serif;
    font-size: 15px;
    outline: none;
    border: 2px solid black;
}

.accident2_2_7_0{
	width: 200px;
	height: 30px;
	float: left;
	margin-left: 10px;
}

.accident2_2{
	width: 200px;
	height: 30px;
	margin-left: 170px;
}

.accident2_2_7{
	height: 30px;
	margin-left: 300px;
}

.accident2_2_1{
	width: 800px;
	height: 30px;
	margin-left: 180px;
}

.accident2_2_1_1{
	width: 800px;
	height: 40px;
	margin-left: 180px;
}

.ip1{
	margin-left: 20px;
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 18px;
	width: 250px;
	height: 30px;
	border-radius: 10px;
	text-align: center;
	outline: none;
}

.ip7{
	margin-left: 30px;
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 18px;
	width: 600px;
	height: 30px;
	border-radius: 10px;
	text-align: center;
	outline: none;
}

.insurer2_1{
	width: 320px; 
	height: 30px;
	margin-left: 35px;
	float: left;
}

.insurer2_4{
	font-family: 'Jeju Gothic', sans-serif;
    font-size: 20px;
    line-height: 30px;
}

.claimTitle4{
	width: 800px;
	height: 30px;
	margin-top: 20px;
}

.claimTitle4_1_2{
	width: 1000px;
	height: 25px;
	background-color: #dbf6ff;
	font-family: 'Jeju Gothic', sans-serif;
    font-size: 18px;
}

.claimTitle4_2{
	margin-left: 20px;
	line-height: 30px;
}

#nextBtn{
	margin-top:25px;
	margin-bottom:30px;
	width: 1200px;
	height: 50px;
	margin-left: 100px;
}

#nextBtn1{
	width: 200px;
	height: 50px;
	margin-left: 305px;
	float: left;
}

#nextBtn0{
	width: 200px;
	height: 50px;
	margin-left: 30px;
	float: left;
}

#nextBtn2{
	background-color: black;
    color: white;
    width: 200px;
    height: 50px;
    font-family: 'Jeju Gothic', sans-serif;
    font-size: 18px;
    border-radius: 50px;
    outline: none;
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
	
<div id="main">
		<div id="memMypage">
			<div id="memMypage2">
				<div id="memMypage3">
					<div id="memMypage3_1">
						마이 페이지
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">회원정보를 수정을 원하실때에는 해당 칸의 내용을 입력한후 수정하기 버튼을 클릭하시기 바랍니다.</div>
					</div>
				</div>
				
				<div id="memMypage4">
					<div id="accident">
						<div id="accident1">
						
							<div class="accident2">
								<div class="accident2_1">
									회원 사진
								</div>
								<div class="accident2_2_7_0">
									<input type="text"  class="ip1"/>
								</div>
								<div class="accident2_2_7_1">
									<input type="button" id="pro" value="사진변경"/>
								</div>
							</div>
						
							<div class="accident2">
								<div class="accident2_1">
									회원 아이디
								</div>
								<div class="insurer2_1">
									<label class="insurer2_4" >회원의 아이디 나오는 부분</label>
								</div>
							</div>
							<div class="accident2">
								<div class="accident2_1">
									회원 이름
								</div>
								<div class="insurer2_1">
									<label class="insurer2_4" >회원의 이름 나오는 부분</label>
								</div>
							</div>
							<div class="accident2">
								<div class="accident2_1">
									비밀번호
								</div>
								<div class="accident2_2_7_0">
									<input type="text"  class="ip1"/>
								</div>
								<div class="accident2_2_7_1">
									<input type="button" id="pro" value="중복확인"/>
								</div>
							</div>
							
							<div class="accident2">
								<div class="accident2_1">
									주소
								</div>
								<div class="accident2_2_7_0">
									<input type="text"  class="ip1"/>
								</div>
								<div class="accident2_2_7_1">
									<input type="button" id="pro" value="주소검색"/>
								</div>
							</div>
							
							<div class="accident2">
								<div class="accident2_1">
									상세 주소
								</div>
								<div class="accident2_7">
									<input type="text"  class="ip7"/>
								</div>
							</div>
							
							<div class="accident2">
								<div class="accident2_1">
									핸드폰번호
								</div>
								<div class="accident2_2">
									<input type="text"  class="ip1"/>
								</div>
							</div>
							
							<div class="accident2">
								<div class="accident2_1">
									포인트
								</div>
									<div class="insurer2_1">
									<label class="insurer2_4" >포인트나오는 부분</label>
								</div>
							</div>
							
							<div class="accident2">
								<div class="accident2_1">
									현재 있는 권한
								</div>
									<div class="insurer2_1">
									<label class="insurer2_4" >가지고 있는 권한 나오는 부분</label>
								</div>
							</div>

						</div>
					</div>
					
				</div>
				<div id="btn">
				
					</div>
				</div>
			</div>
					<div id="nextBtn">
						<div id="nextBtn1">
							<input type="button" id="nextBtn2" value="회원 내용수정하기">
						</div>
						<div id="nextBtn0">
							<input type="button" id="nextBtn2" value="홈으로 가기">
						</div>
					</div>

</div>
	

	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>