<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		min-height: 578px;
		
	}
	
	.eventCre{
		width: 1200px;
	    display: flex;
	    margin-bottom: 10px;
	    text-align: center;
	}
	
	#eventGo{
		width: 100%;
	    background-color: #807c7c;
	    color: white;
	    padding: 5px;
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
	
	.eventInfo1{
		float:left;
		width: 400px;
    	height: 45px;
	}
	
	.eventCre{
		width: 1200px;
	}
	
	.eventA{
		width: 100px;
	    height: 30px;
	    display: flext;
	    display: flex;
	    float: left;
	    align-items: center;
	    justify-content: center;
	    background: #f1f1f1;
	    border-radius: 5px;
	}
	
	.eventB{
		float: left;
	    width: 300px;
	    height: 30px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.event_title{
		width: 250px;
	    height: 20px;
	}
	
	.event_date{
		width: 118px;
    	height: 20px;
	}
	
	.event1{
		float: left;
	}
	
	.eventBtn1{
		width: 110px;
    	float: left;
	}
	
	.eventBtn{
		width: 100px;
		height: 30px;
		cursor: pointer;
	}
	
	.eventCre1{
		width: 1200px;
	    height: 145px;
	    margin: 0 auto;
	    text-align: center;
	    background-color: #a3aba5;
	    overflow: hidden;
	}
	
	.eventBtn2{
		width: 1200px;
	    height: 45px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    margin-top: 15px;
	}
	
	.aEvent{
		margin-top:10px;
		width: 1200px;
		display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.bEvent{
		width: 1200px;
		display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.eventMenu{
		margin-top: 15px;
	}   
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		
		// 이벤트 삭제
		$(".eventDel").click(function() {
			if(confirm("삭제하시겠습니까?")){
				$("#snot_id").val($(this).parent().parent().children()[0].innerHTML);
				$("#eventDel").submit();
			}else{
				return;
			}
		})
		
		$("#evenCreBtn").click(function() {
			if($("#snot_title").val() == ''){
				alert("이벤트 제목을 적어주세요");
				return;
			}else if($("#date1").val() == '' || $("#date2").val() == ''){
				alert("이벤트기간을 설정해주세요.")
				return;
			}else if($("#evPimg").val() == ''){
				alert("이벤트 프로필사진을 넣어주세요.");
				return;
			}else if($("#evImg").val() == ''){
				alert("이벤트 상세이미지를 넣어주세요.");
				return;
			}else{
				$("#snot_date").val($("#date1").val()+"~"+$("#date2").val());
				$("#eventInsert").submit();
			}
		})
	})
	
</script>
</head>
<body>
<form action="/shopAdmin/eventDel" method="post" id = "eventDel">
	<input type="hidden" id = "snot_id" name="snot_id" />
</form>

<%@include file="/WEB-INF/view/admin/petshop/adminShopH.jsp"%>
	<div id="mainMid">
		<div>
			<div class="eventCre">
				<span id="eventGo">이벤트 등록하기</span>
			</div>
			
			<div class="eventCre1">
				<form action="/shopAdmin/eventCre" method="post" id="eventInsert" enctype="multipart/form-data">
					<div class="aEvent">
						<div class="eventInfo1">
							<div class="eventA">
								<span>이벤트명</span>
							</div>
							<div class="eventB">
								<input type="text" class="event_title" id="snot_title" name="snot_title" value="">
							</div>
						</div>
						
						<div class="eventInfo1">
							<div class="eventA">
								<span>이벤트기간</span>
							</div>
							<div class="eventB">
								<div class="event1">
									<input type="date" class="event_date" id="date1">
								</div>
								<div class="event1">
									<span>~</span>
								</div>
								<div class="event1">
									<input type="date" class="event_date" id="date2">
								</div>
							</div>
						</div>
					</div>
					
					<div class="bEvent">
						<div class="eventInfo2">
							<div class="eventA">
								<span>이벤트_PIMG</span>
							</div>
							<div class="eventB">
								<input type="file" name="snotPimg" id="evPimg">
							</div>
						</div>
						
						<div class="eventInfo2">
							<div class="eventA">
								<span>이벤트상세_IMG</span>
							</div>
							<div class="eventB">
								<input type="file" name="snotImg" id="evImg">
							</div>
						</div>
					</div>
					
					<div class="eventBtn2">
						<div class="eventBtn1">
							<input type="hidden" id="snot_date" name="snot_date">
							<input type="button" value="이벤트 등록" class="eventBtn" id="evenCreBtn">
						</div>
						<div class="eventBtn1">
							<input type="reset" value="초기화" class="eventBtn">
						</div>
					</div>
				</form>
			</div>
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
	
<!-- footer 시작 -->
<%@include file="../../common/footer.jsp"%>
<!-- footer 끝 -->
</body>
</html>