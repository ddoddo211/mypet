<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">

<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">

<style type="text/css">
	body{
		font-family: 'Do Hyeon', sans-serif;
	}

	#Main{
		width : 100%;
		margin : 0 auto;
		background-color: #f9f9f9;
		margin-top : 30px;
		border-radius: 10px;
	}
	
	#MainTitle{
		width : 900px;
		margin : 0 auto;
		font-size : 42px;
		background-color: #331818;
		color : #fff;
	}
	
	#payMain{
		width : 900px;
		margin : 0 auto;
		font-size : 30px;
		font-weight: bold;
		text-align: center;
		height : 150px;
		line-height: 150px;
	}
	
	.infoDiv{
		width : 900px;
		margin : 0 auto;
		margin-top : 20px;
		font-weight: bold;
		font-size : 20px;
	}
	
	.infoTable{
		border-color : gray;
		border-collapse: collapse;
		border-spacing: 1px;
		width : 900px;
		font-size : 16px;
	}
	
	.td{
		font-weight: normal;
		text-align: center;
		vertical-align: middle;
	}
	
	#pay{
		width :900px; 
		margin:0 auto;  
		font-size : 30px; 
		font-weight: bold; 
		margin-top:30px;
		text-align: center;
	}
	
	#body{
		min-height: 762px;
	}
	
</style>
<script type="text/javascript">
function window_onload(){

    setTimeout('go_url()',5000)  // 5초후 go_url() 함수를 호출한다.

 }

 function go_url(){

    history.back();

 }
</script>
</head>
<body onload="javascript:window_onload()">
<%@include file="/WEB-INF/view/common/header.jsp"%>
	<div id="">
		<!-- header -->
		<div id="header">
			<!-- main -->
			<div id="logo">
				<a href="/sit/sitMain"><img alt="이미지가 없습니다"
					src="/img/petSitterLogo2.jpg" width="200px;" /></a>
			</div>
			<div id="petSearch">
				<div id="word">
					<input type="text" id="search" value="검색어를 입력하세요" onfocus="this.value=''" style="color: #c1c1c1" />
				</div>
				<div id="searchButton">
					<a href="#" id="searchButton"></a>
				</div>
			</div>

			<!-- 우리 아이 등록하기 -->
			<div id="petInsert">
				<a href="#"><img alt="이미지가 없습니다" src="/img/petInsert.jpg"
					width="240px;" height="100px;"></a>
			</div>
		</div>
	</div>
	<div id="body">
		<div id="petSitterMenu">
			<%@include file="/WEB-INF/view/petSitter/petSitterMenu.jsp" %>
		</div>
		<div id="Main">
			<div id="MainTitle">
				<span>결재 완료</span>
			</div>
			<div id="payMain">
				<span>결제가 완료되었습니다. 이용해주셔서 감사합니다.</span> <br>
			</div>
			<c:choose>
				<c:when test="${pay_chk == '1' }">
					<div class="infoDiv">
						<span>결제회원 정보</span>
						<table border="1" class="infoTable">
							<tr bgcolor="#e5e5e5">
								<th width="200px;">결제자 성명</th>
								<th width="350px;">연락처</th>
								<th width="350px;">이메일</th>
							</tr>
							<tr bgcolor="#f1f1f1">
								<td class="td">${memVo.mem_name }</td>
								<td class="td">${memVo.mem_hp }</td>
								<td class="td">${memVo.mem_id }</td>
							</tr>
						</table>
					</div>
					<div class="infoDiv">
						<span>결제 정보</span>
						<table border="1" class="infoTable">
							<tr bgcolor="e5e5e5">
								<th>상품명</th>
								<th>이용일자</th>
								<th>결제금액</th>
							</tr>
							<tr bgcolor="#f1f1f1">
								<td class="td">${pay_name }</td>
								<td class="td">${pay_dateStart } / ${pay_timeStart } ~ ${pay_dateEnd } / ${pay_timeEnd }</td>
								<td class="td">${pay_price }</td>
							</tr>
						</table>
					</div>
					<div id ="pay">
						<span>결제 금액 : </span><span style="color:red;">${pay_price }</span>
					</div>
				</c:when>
				<c:when test="${pay_chk == '0' }">
					<div class="infoDiv">
						<span>결제회원 정보</span>
						<table border="1" class="infoTable">
							<tr bgcolor="#e5e5e5">
								<th width="200px;">결제자 성명</th>
								<th width="350px;">연락처</th>
								<th width="350px;">이메일</th>
							</tr>
							<tr bgcolor="#f1f1f1">
								<td class="td">${memVo.mem_name }</td>
								<td class="td">${memVo.mem_hp }</td>
								<td class="td">${memVo.mem_id }</td>
							</tr>
						</table>
					</div>
					<div class="infoDiv">
						<span>결제 정보</span>
						<table border="1" class="infoTable">
							<tr bgcolor="e5e5e5">
								<th>상품명</th>
								<th>이용일자</th>
								<th>결제금액</th>
							</tr>
							<tr bgcolor="#f1f1f1">
								<td class="td">펫시터 집으로 부르기</td>
								<td class="td">${pay_date }</td>
								<td class="td">${pay_price }</td>
							</tr>
						</table>
					</div>
					<div id ="pay">
						<span>결제 금액 : </span><span style="color:red;">%{pay_price}</span>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>