<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sitterFrom.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Work+Sans" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">

	function popUp(){
		var popUrl = "/sit/sitFromPopUp";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl, "주소변경", popOption);
	};
</script>
</head>
<body>
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
					<c:forEach items="${mypetList }" var="list">
						<div id="mypet">
							<input type="checkbox" id="mypetchk" name="mypetchk" />
							<span>${list.myp_name }</span>
							<span>(<fmt:formatDate pattern = "yyyy-MM-dd" value = "${list.myp_birth }" /></span>
							<span>${list.petk_name }</span>
							<span>${list.petk_size }</span>
							<span>${list.myp_gender })</span>
							<span>${list.am_name }</span>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="scheduleDiv">
				<div>
					<span>돌봄 신청 일정을 선택해 주세요. </span>
				</div>
				<div id="schedule">
					
				</div>
			</div>
		</div>
		<div id="move">
			<div id="pre">
				
			</div>
			<div id="next">
			
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>