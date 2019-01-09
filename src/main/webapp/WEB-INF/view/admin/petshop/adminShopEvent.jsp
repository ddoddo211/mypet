<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petshopAdmin.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<head>
<style type="text/css">
	#mainMid{
		margin: 0 auto;
		width: 1200px;
	}
	
	.eventCre{
		width: 1200px;
	    display: flex;
	    align-items: center;
	    margin-bottom: 10px;
	}
	
	#eventGo{
		width: 100%;
	    background-color: #adabab;
	    color: white;
	    cursor: pointer;
	}
	
	.listMenu{
		background-color: #de9c76;
   		color: #f3f3f3;
	}
	
	.eventList{
		text-align: center;
		height: 30px;
	}
	
	.eventDel{
		width: 50px;
	    background-color: #d8a071;
	    color: #fdfbfb;
	}
	
	
	.eventTr{
		background-color: #f5edeb;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#eventGo").click(function() {
			alert("이벤트 등록");
		})
		
		// 이벤트 삭제
		$(".eventDel").click(function() {
			if(confirm("삭제하시겠습니까?")){
				snot_id($(this).parent().parent().children()[0].innerHTML);
			}else{
				return;
			}
		})
	})
	
</script>
</head>
<body>
<form action="#" method="post" id = "eventDel">
	<input type="hidden" id = "snot_id" name="snot_id" />
</form>

<%@include file="/WEB-INF/view/admin/petshop/adminShopH.jsp"%>
	<div id="mainMid">
		<div class="eventCre">
			<input type="button" value="이벤트 등록하기" id="eventGo">
		</div>
		<div class="eventMenu">
			<table width="1200" class="eventTable">
				<thead class="listMenu">
					<tr>
						<th width="150" height="30">이벤트ID</th>
						<th width="500">이벤트이름</th>
						<th width="250">이벤트기간</th>
						<th width="150">이벤트종료</th>
						<th width="100">이벤트삭제</th>
					</tr>
				</thead>
				
				<tbody class="eventList">
					<c:forEach items="${snotList }" var="list">
						<tr class="eventTr">
							<td class="snot_id">${list.snot_id }</td>
							<td class="eventTd">${list.snot_title }</td>
							<td class="eventTd">${list.snot_date }</td>
							<c:set value="${list.snot_date }" var="lastDate"/>
							<td class="eventTd">${fn:substring(lastDate,11,21)}</td>
							<td class="eventTd"><input type="button" value="삭제" class="eventDel"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>