<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#maintop{
		width: 1200px;
		margin: 0 auto;
	}
	
	#maintop p {
		font-size: 20px;
		font-weight: bold;
		padding-bottom : 20px;
		border-bottom: 1px solid #000;
		color : #000;
	}
	
	#mainmid{
		width: 1200px;
		margin : 0 auto;
		min-height: 615px;
	}
	
	#eventList{
		width:1200px;
		margin: 0 auto;
		margin-top: 20px;
	}
	
	.eventInfo{
		width: 1000px;
	    overflow: hidden;
	    margin: 0 auto;
	    padding-top: 10px;
	    padding-bottom: 10px;
	    padding-left: 10px;
	    border-top: 1px solid #f1f1f1;
	    border-bottom: 1px solid #f1f1f1
	}
	
	.eventRight{
		width:400px;
		height:100px;
		float:left;
	}
	
	.eventLeft{
		margin-left:20px;
		width:250px;
		height:100px;
		padding-left: 10px;
    	border-left: 1px solid #f1f1f1;
		float:left;
	}
	
	.eventA{
	    height: 30px;
	    text-align: center;
	    display: flex;
	    align-items: center;
	}
	.eventMenu{
		float:left;
		width: 40px;
		height: 20px;
		background-color: #f1f1f1;
		margin-right: 10px;
		border-radius: 10px;
	}
	
	.eventGo{
		float: left;
	    width: 100px;
	    height: 94px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.eventGo1{
		padding: 15px;
	    background-color: #a7c3e0;
	    color: white;
	    border-radius: 10px;
	}
	
	.eventGo1:hover{
		padding: 15px;
	    background-color: white;
	    border: 1px solid #a7c3e0;
	    color: black;
	    border-radius: 10px;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>
	<div id="maintop">
		<p>Event</p>
	</div>
	
	<div id="mainmid">
	
		<div id="eventList">
			<c:forEach items="${snotList }" var="list">
				<div class="eventInfo">
					<div class="eventRight">
						<img alt="" src="${list.snot_pimg }" width="400" height="100">
					</div>
					<div class="eventLeft">
						<div class="eventA">
							<div class="eventMenu">
								<span>제목</span>
							</div>
							<div class="eventText">
								<span>${list.snot_title }</span>
							</div>
						</div>
						
						<div class="eventA">
							<div class="eventMenu">
								<span>기간</span>
							</div>
							<div class="eventText">
								<span>${list.snot_date }</span>
							</div>
						</div>
						
						<div class="eventA">
							<div class="eventMenu">
								<span>마감</span>
							</div>
							<c:set var="lastDate" value="${list.snot_date }"/>
							<div class="eventText">
								<span>${fn:substring(lastDate,11,21)}</span>
							</div>
						</div>
					</div>
					<div class="eventGo">
						<a class="eventGo1" href="/shop/shopNoticeDetail?snot_id=${list.snot_id }">이벤트Go</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
<!-- footer 시작 -->
<%@include file="/WEB-INF/view/common/footer.jsp"%>
<!-- footer 끝 -->
</body>
</html>