<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$("#date1").datepicker({ // 달력에 옵션 설정하기
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ], // 요일에 표시되는 형식 설정
			dateFormat : "yy-mm-dd", //날짜 형식 설정
			monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
			"8월", "9월", "10월", "11월", "12월" ], //월표시 형식 설정
			showOn : "button", //버튼 보이기
			buttonText : "입력", //버튼에 보이는 텍스트설정
			showAnim : "fold" //애니메이션효과
		});
	});
</script>

<style type="text/css">

/*보험 메뉴 스타일*/
.mainmenu-li {
	background-color: #7c6ee9;
	width: 120px;
	float: left;
	padding: 0px;
	margin: 0px;
	margin-top: 5px;
	margin-left: 5px;
	color: white;
	text-align: center;
	border-radius: 50px;
	border: 1px solid #7c6ee9;
	font-family: inherit;
}

.mainmenu-li:hover {
	color: black;
	background-color: white;
	border: 1px solid #7c6ee9;
	width: 120px;
	font-family: inherit;
}

.mainmenu-li a {
	padding: 7px;
	color: white;
	font-family: inherit;
	display: block;
}

.mainmenu-li a:hover {
	padding: 7px;
	color: black;
	font-family: inherit;
	display: block;
}

#main {
	width: 1200px;
	height: 0 auto;
	margin: 0 auto;
	margin-bottom: 20px;
	border: 1px solid black;
}

#petInsuranceHeader {
	height: 60px;
	margin-left: 230px;
	margin-bottom: 10px;
}

/* 보험 내용 들어가는 부분*/
#introduction {
	border: 1px solid black;
	height: 0 auto;
	margin: 0 auto;
}

#productRecommendation {
	background-color: #fff7c9;
	border-radius: 50px;
	height: 150px;
	border: 3px dashed #7c6ee9;
	width: 900px;
	margin-left: 130px;
}

#write {
	margin-left: 120px;
}

#product {
	margin-top: 50px;
}

#inputBox {
	margin-left: 350px;
	margin-top: -70px;
	width: 400px;
}
#productBtn {
	background-color: #7c6ee9;
	color: white;
	width: 240px;
	height: 35px;
	margin-top: 10px;
	border-radius: 50px;
}

#productBtn:hover {
	background-color: white;
	color: #7c6ee9;
	width: 240px;
	height: 35px;
	margin-top: 10px;
	border-radius: 50px;
	border-color: #7c6ee9;
}
#checkbox{
	height: 30px;
}

#birth{
	height: 30px;
}


#petSelect{
	width: 100px;
	height : 25px;
	margin-left: 10px;
}

#disease{
	height: 24px;
}

#date1{
	width: 208px;
	margin-right: 10px;
}



/* 체크박스 스타일주기 */

/* Customize the label (the container) */
.container {
	display: block;
	position: relative;
	padding-left: 35px;
	cursor: pointer;
	font-size: 17px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	float: left;
	margin-right: 10px;

}

/* Hide the browser's default radio button */
.container input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
	height: 0;
	width: 0;
}

/* Create a custom radio button */
.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 18px;
	width: 18px;
	background-color: white;
	border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
	background-color: white;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
	background-color: #7c6ee9;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
	display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
	top: 5px;
	left: 5px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
</style>
</head>
<body>
<!-- header 시작 -->
<%@include file="../common/header.jsp"%>
<!-- header 끝-->

	<div id="headerMain">
		<!-- main content -->
			<div id="header">
				<%--main --%>
				<div id="logo">
					<a href="/common/main.jsp"><img alt="이미지가 없습니다" src="/img/petInsuranceLogo2.jpg" width="200px;"></a>
				</div>
				<div id="petSearch">
					<div id="word">
						<input type="text" id="search" value="검색어를 입력하세요" onfocus="this.value=''" style="color:#c1c1c1" />
					</div>
					<div id="searchButton">
						<a href="#" id="searchButton"></a>
					</div>
				</div>
				
				<!-- 우리 아이 등록하기 -->
				<div id="petInsert">
					<a href="#"><img alt="이미지가 없습니다" src="/img/petInsert.jpg" width="240px;" height="100px;"></a>
				</div>
			</div>
	</div>
	
<div id="main">	
	<!-- 여기부터 나의 body -->
		
		<%--보험메뉴 --%>
		<div id="petInsuranceHeader">
			<div id="mainbody">
				<div class="menu">
					<ul class="menu_ul">
						<li class="mainmenu-li"><a href="/isr/isrMain" >펫 보험소개</a></li>
						<li class="mainmenu-li"><a href="/isr/productInfo">상품안내</a></li>
						<li class="mainmenu-li"><a href="/petInsurance/view/planInformation.jsp" >플랜정보</a></li>
						<li class="mainmenu-li"><a href="/petInsurance/view/compensationGuide.jsp" >보상안내</a></li>
						<li class="mainmenu-li"><a href="/petInsurance/view/myPetInsurance.jsp" >나의 펫 보험</a></li>
					</ul>
				</div>
			</div>
		</div>
	
		<%--우리 아이 보험상품 추천 --%>
		<div id="introduction">
			<div id="productRecommendation">

				<div id="write">
						<div id="product">
							<h2>우리아이 보험상품 추천</h2>
						</div>
					<form action="#" name="pet_info" method="get">
						<div id="inputBox">
							<div id="checkbox">
								<label class="container">강아지
								  <input type="checkbox" checked="checked">
								  <span class="checkmark"></span>
								</label>
								
								<label class="container">고양이
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
		
								<select name="pet" id="petSelect">
									<option value="비숑">비숑</option>
									<option value="치와와">치와와</option>
									<option value="불독" selected="selected">불독</option>
								</select>
								
							</div>
							<div id="birth">
								생년월일 : &nbsp;<input type="text" id="date1" readonly="readonly"><br/>
							</div>
							
							<div id="disease">
								질병여부 : <label class="container" class="kind">Y
								  <input type="checkbox" checked="checked" name="disease" value='Y'>
								  <span class="checkmark"></span>
								</label>
								
								<label class="container" class="kind">N
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div>
								<button type="submit" id="productBtn">보험상품 추천</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			
			<div id="productList">
				<input type="text"/>
			</div>
			
		</div>

	</div>
	
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>