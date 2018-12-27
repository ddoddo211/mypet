<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link  href="/css/petHair.css" rel="stylesheet"/>
<link  href="/css/petHairMyPage.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>




<%-- 스크립트 위치 --%>

<script type="text/javascript">
	$(document).ready(function(){
		$(".askBottom").hide();	
		
		
	});

</script>

</head>
<body>
	<!-- header 시작 -->
	<%@include file="../common/header.jsp"%>
	<!-- header 끝-->
	
	<!-- header 시작 -->
	<%@include file="petHairHeader.jsp"%>
	<!-- header 끝-->
	
	<%-- 전체 틀 div --%>
	<div id="mainmid">
		<%@include file="petMypageLeft.jsp"%>
		
		<div class="mpMain">
			<p>현재 이용중인 의뢰</p>  
				<table class="statTable">
					<tr>
						<th>미용실 명</th>
						<th>스타일 명</th>
						<th>이용시간</th>
						<th>가격</th>
						<th>특이사항</th>
						<th>진행상태</th>
					</tr>
					<tr>
						<td>ㅇㅇ미용실	</td>
						<td>무슴수컷	</td>
						<td>10~11시	</td>
						<td>35000원		</td>
						<td>특이사항없음	</td>
						<td>진행중	</td>
					</tr>
				</table>
			
			<p>문의내역</p>
			
			<div class="askBlock">
				<div class="askTop">
				<span>>>> 미미미용실</span><span style="color: gray; font-size:10px;"> 내용보기</span><img class="plusToggle" src="/hairimg/plus.png"/>
				</div>
				<div class="askBottom">
				<div class="askText">
					몇시까지하나여?
				</div>
				
				<img class="arrowimg" src="/hairimg/RightArrow.png"/>
				<div class="askAnw">
					밤 8시까지해요
				</div>
				</div>
			</div>
			<br><br>
			
			<div class="askBlock">
				<div class="askTop">
				<span>>>> 미미미용실</span><span style="color: gray; font-size:10px;"> 내용확인</span><img class="plusToggle" src="/hairimg/plus.png"/>
				</div>
				<div class="askBottom">
				<div class="askText">
					몇시까지하나여?
				</div>
				
				<img class="arrowimg" src="/hairimg/RightArrow.png"/>
				<div class="askAnw">
					밤 8시까지해요
				</div>
				</div>
			</div>
			<br><br>
			
			
		</div>
	</div>
			
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
	
	


</body>

<script type="text/javascript">
	$(".plusToggle").click(function(){
		$(this).parents(".askBlock").children(".askBottom").slideToggle("fast");
	});
</script>

</html>
























