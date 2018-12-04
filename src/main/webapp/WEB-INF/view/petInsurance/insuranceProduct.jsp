<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		// 달력 옵션 설정
		$("#date1").datepicker({ // 달력에 옵션 설정하기
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ], // 요일에 표시되는 형식 설정
			dateFormat : "yy-mm-dd", //날짜 형식 설정
			monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
			"8월", "9월", "10월", "11월", "12월" ], //월표시 형식 설정
			showOn : "button", //버튼 보이기
			buttonText : "날짜입력", //버튼에 보이는 텍스트설정
			showAnim : "fold" //애니메이션효과
		});
		
		
		// 체크박스 한개만 설정하는 방법 
		$("input:checkbox").on('click', function() {
			var $box = $(this);
				if ($box.is(":checked")) {
					var group = "input:checkbox[name='" + $box.attr("name") + "']";
						$(group).prop("checked", false);
						$box.prop("checked", true);
				} else {
					$box.prop("checked", false);
				}
			});
	});
</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

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
			<ul class="menu_ul">
				<li class="mainmenu-li"><a href="/isr/isrMain">펫 보험소개</a></li>
				<li class="mainmenu-li"><a href="/isr/productInfo">상품안내</a></li>
				<li class="mainmenu-li"><a
					href="/petInsurance/view/planInformation.jsp">플랜정보</a></li>
				<li class="mainmenu-li"><a
					href="/petInsurance/view/compensationGuide.jsp">보상안내</a></li>
				<li class="mainmenu-li"><a
					href="/petInsurance/view/myPetInsurance.jsp">나의 펫 보험</a></li>
			</ul>
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
								  <input type="checkbox" checked="checked" name="gener">
								  <span class="checkmark"></span>
								</label>
								
								<label class="container">고양이
								  <input type="checkbox" name="gener">
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
								  <input type="checkbox" checked="checked" name="disease" value='Y' name="gener">
								  <span class="checkmark"></span>
								</label>
								
								<label class="container" class="kind">N
								  <input type="checkbox" name="disease" value='N' name="gener">
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
				<label>조회조건</label>
			</div>
			
		</div>

	</div>
	
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>