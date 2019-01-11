<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	$(document).ready(function(){
		var ev = "click";
		$("#faqList").on(ev,".click", function(){
			var faqId = $(this).children()[0].innerHTML;
			$("#faq_id").val(faqId);
			alert(faqId);
			$("#faqFrm").submit();
		});
		
		$("#faq_insert_btn").click(function(){
			location.href="/sit/faqInsertView?cnt=0";
		});
	});
</script>
<style type="text/css">
	#hidden{
		display : none;
	}
	
	#menu{
		height : 70px;
		margin : 0 auto;
	}
	
	#faqMain{
		min-height : 240px;
		margin : 0 auto;
	}
	
	.click {
	    cursor: pointer;
    	border-bottom: 1px solid #5f5f5f;
    	margin-bottom: 10px;
	}
	
	.click > td {
		padding : 15px;
	}
	
	#faq_insert{
		float:right;
		margin-top : 6px;
	}
	
	#faq_insert_btn{
		padding : 10px 30px 10px 30px;
		border : 1px dashed #c14e4e;
		color : #fff;
		background-color: #ec8e8e;
		border-radius: 10px;
	}
</style>
</head>
<body>
<form action="/sit/faqDetail" method="post" id="faqFrm">
	<input type="hidden" id="faq_id" name="faqId" />
</form>

<%@include file="/WEB-INF/view/common/header.jsp"%>

<!-- 각자 화면 -->
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
	<div id="menu">
		<div id="petSitterMenu">
			<%@include file="/WEB-INF/view/petSitter/petSitterMenu.jsp" %>
		</div>
	</div>
	<div id="faqSearch">
		<div id="faqMain">
			<div id="faqTable">
				<span>자주 묻는 질문</span><br>
				<table id="faq">
					<tbody id="faqList">
						<c:forEach items="${faqList }" var="faqlist">
							<tr class="click">
								<td id="hidden">${faqlist.psf_id }</td>
								<td>${faqlist.psf_name }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="faq_insert_main">
					<c:if test="${memVo.mem_id == 'admin' }">
						<div id="faq_insert">
							<input type="button" id="faq_insert_btn" value="FAQ등록" />
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div style="min-height : 140px;"></div>
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>