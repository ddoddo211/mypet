<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sitterFrom.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Work+Sans" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	function popUp() {
		var popUrl = "/sit/sitFromAddrPopUp";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl, "주소변경", popOption);
	};

	$(document).ready(function() {
		// 나의 펫 선택할떄 값 담아주기
		$(".cb1_label").click(function() {
			//값을 초기화
			$("#mypet_id").val("");

			//기존 체크되어 있는 체크박스 전체 해제
			$(".cb1_label").removeClass("activeCb");

			// 원래 체크 되어 있다면 또 다시 클릭한다면 해제하는 부분
			if ($(this).hasClass("activeCb")) {
				$("#mypet_id").val("");
				$(".cb1_label").removeClass("activeCb");
			} else {
				$(this).addClass("activeCb")
			}
			//hasClass -> 클래스가 있는지 확인하는것
			//toggleClass -> 해당 요소가 있으면 이를 제거합니다. 반대로 해당 요소가 없다면 이를 부여하는 매우 유용한 메소드입니다
			var mypet_id = $(this).data("myp_id");

			$("#mypet_id").val(mypet_id);

		});

	});

	$(function() {
		// 달력 옵션 설정
		$("#dateChooice").datepicker(
				{
					// 달력에 옵션 설정하기
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ], // 요일에 표시되는 형식 설정
					dateFormat : "yy-mm-dd", //날짜 형식 설정
					monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ], //월표시 형식 설정
					showAnim : "fold", //애니메이션효과
					minDate : 0,
					maxDate : "+3M"
				});
	});
	
	$(function() {
		$('#sitFromBtn').click(function() {
			var val = [];
			var k = "";
			$(':checkbox:checked').each(function(i) {
				val[i] = $(this).val();
				k += val[i] + " ";
			});
			$("#mypet").val(k);
		});
	});

	function mypetDelete() {
		var val = [];
		var k = "";
		$(':checkbox:checked').each(function(i) {
			val[i] = $(this).val();
			k += val[i] + " ";
		});
		
		$("mypet_id").val(k);
		
		if ($("#mypet_id").val(k) == "" || $("#mypet_id").val(k) == null) {
			alert("삭제할 반려동물의 정보를 선택하세요");
			return;
		} 
		$("#frm").submit();                                                                                                
	};
</script>
<style type="text/css">
	#mypetDel{
		cursor : pointer;
	}
</style>
</head>
<body>
<form id="frm" action="/sit/mypetDel" method="post">
	<input type="hidden" name="mypet_id" id="mypet_id" />
</form>
<%@include file="/WEB-INF/view/common/header.jsp"%>

<!-- 각자 화면 -->
	<div id="">
		<!-- header -->
		<div id="header">
			<!-- main -->
			<div id="logo">
				<a href="/petSitter.jsp"><img alt="이미지가 없습니다"
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
		<div id="sitToMain">
			<form action="/sit/reservation" method="post" autocomplete="off" >
			<input type="hidden" name="mypet" id="mypet" />
			<input type="hidden" name="arr" value="1" />
				<div id="addressDiv">
					<div id="addressDiv1">
						<div id="addressDiv2">
							<span>● 방문을 원하시는 주소를 확인해 주세요.</span>
						</div>
						<div id="addressDiv3">
							<a href="javascript:popUp();"><span>주소변경</span></a>
						</div>
					</div>
					<br>
					<div id="address">
						<span>${memVo.mem_addr }</span>
						<span>${memVo.mem_addr2 }</span>
					</div>
				</div>
				<div id="mypetDiv">
					<div id="mypetDiv1">
						<div id="mypetDiv2">
							<span>● 돌봄을 신청하는 반려동물을 선택해 주세요.</span>
						</div>
						<div id="mypetDiv3">
							<a href="/sit/mypetInsertView"><span>추가</span></a>
							<a id="mypetDel" onclick="mypetDelete()"><span>삭제</span></a>
						</div>
					</div>
					<c:forEach items="${mypetList }" var="list">
						<c:choose>
							<c:when test="${list != null }">
								<div id="mypet">
									<input type="checkbox" class="mypetchk" value="${list.myp_id }"/> <label class="cb1_label" data-myp_id="${list.myp_id}"></label>
									<span>${list.myp_name }</span>
									<span>(<fmt:formatDate pattern = "yy.MM.dd" value = "${list.myp_birth }" /></span>
									<span>/ ${list.petk_name } /</span>
									<span>${list.petk_size } /</span>
									<span>${list.myp_gender } /</span>
									<span style="font-weight: bold">${list.am_name }</span>)
								</div>
							</c:when>
							
							<c:otherwise>
								<div id="mypet">
									<span>반려동물 정보가 없습니다. 추가해 주세요.</span>
								</div>
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
				</div>
				<div id="scheduleDiv">
					<div id="scheduleDiv1">
						<span>● 돌봄 신청 일정을 선택해 주세요. </span>
					</div>
					<div id="schedule">
						<input type="text" id="dateChooice" name="dateChooice"/>
						<select class="timeSelect" name="time">
							<option value="9">09시</option>
							<option value="10">10시</option>
							<option value="11">11시</option>
							<option value="12">12시</option>
							<option value="13">13시</option>
							<option value="14">14시</option>
							<option value="15">15시</option>
							<option value="16">16시</option>
							<option value="17">17시</option>
							<option value="18">18시</option>
						</select>
						<select class="timeSelect" name="timeSelect">
							<option value="0" selected>추가시간 없음</option>
							<option value="1">1시간 추가</option>
							<option value="2">2시간 추가</option>
							<option value="3">3시간 추가</option>
							<option value="4">4시간 추가</option>
						</select>
						<br> <br>
						<span>※ 돌봄 신청 시간은 기본적으로 1시간입니다. 추가시 별도 금액이 부과됩니다.</span>
					</div>
					<div id="difficulty">
						<div id="dWord">
							<span>★ 특이사항</span>
						</div>
						<div id="dTextArea">
							<textarea rows="3" cols="50" name="spec"></textarea>
						</div>
					</div>
					<div id="mypetOk">
						<button id="sitFromBtn" type="submit">예약하기</button>
					</div>
				</div>
			</form>
		</div>
<!-- 		<div id="move"> -->
<!-- 			<div id="pre"> -->
				
<!-- 			</div> -->
<!-- 			<div id="next"> -->
			
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>