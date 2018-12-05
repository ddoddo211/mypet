<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sitterTo.jsp</title>
<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
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
		<div id="searchMain">
			<%@include file="/WEB-INF/view/petSitter/searchHeader.jsp" %>
			
			<div id="searchList">
				<div id="list1">
					<div id="list2">
						<ul>
							<li>
								<span>서비스 구분</span> <br>
								<select class="service">
									<option value="0" selected>전체</option>
									<option value="12">데이케어</option>
									<option value="24">24시간 돌봄</option>
								</select>
							</li>
							<li>
								<span>반려견 나이</span> <br>
								<select class="service">
									<option value="0" selected>모든 연령</option>
									<option value="1">강아지(1살이하)</option>
									<option value="2">성견(2~6살)</option>
									<option value="3">노견(7살이상)</option>
								</select>
							</li>
							<li>
								<span>반려견 크기</span> <br>
								<select class="service">
									<option value="0" selected>모든 크기</option>
									<option value="1" >소형견(0~4.9kg)</option>
									<option value="2" >중형견(5~14.9kg)</option>
									<option value="3" >대형견(15kg이상)</option>
								</select>
							</li>
							<li id="lstBtn">
								<button id="listButton" type="submit">찾기</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div><!-- // searchMain -->
		
		<div id="petToList">
			<div id="listMenu">
				<div id="sort">
					<label class="btn">최신순</label> <input type="hidden" name="latest" value="" />
					<label class="btn">조회순</label> <input type="hidden" name="inquiry" value="" />
				</div>
			</div>
			<div id="list">
				<c:forEach items="${sitList }" var="list">
					<div class="notice">
						<div id="noticeImg"> 
							<img alt="이미지" src="${list.pst_img }" width="370px" height="270px"/>
						</div>
						<div id="noticeContent">
							<div id="content1"><span>설명글 : ${list.pst_text }</span></div>
							<div id="content2"><span>가격정보</span></div>
							<div id="content3">
								<div id="content4"><span>평정 : ${list.pst_score }</span></div>
								<div id="content5"><span>조회수 : ${list.pst_view }</span></div>
							</div>		
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>
