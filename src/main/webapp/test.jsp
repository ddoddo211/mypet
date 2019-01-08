<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#Main{
		width : 100%;
		margin : 0 auto;
		background-color: #f9f9f9;
	}
	
	#MainTitle{
		width : 900px;
		margin : 0 auto;
		font-size : 32px;
		background-color: #331818;
		color : #fff;
	}
	
	#payMain{
		width : 900px;
		margin : 0 auto;
		font-size : 24px;
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
	
</style>
</head>
<body>
	<div id="Main">
		<div id="MainTitle">
			<span>결재 완료</span>
		</div>
		<div id="payMain">
			<span>결제가 완료되었습니다. 이용해주셔서 감사합니다.</span> <br>
		</div>
		<div class="infoDiv">
			<span>결제회원 정보</span>
			<table border="1" class="infoTable">
				<tr bgcolor="#e5e5e5">
					<th width="200px;">결제자 성명</th>
					<th width="350px;">연락처</th>
					<th width="350px;">이메일</th>
				</tr>
				<tr bgcolor="#f1f1f1">
					<td class="td">서준영</td>
					<td class="td">010-7363-4521</td>
					<td class="td">sjyounghos@naver.com</td>
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
					<td class="td">연습연습</td>
					<td class="td">2019.01.07 ~ 2019.01.11</td>
					<td class="td">115,000원</td>
				</tr>
			</table>
		</div>
		<div id ="pay">
			<span>결제 금액 : </span><span style="color:red;">115,000원</span>
		</div>
	</div>
</body>
</html>