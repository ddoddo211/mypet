<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goNoticeWrite(관리자용 공지사항관리 :글쓰기화면)</title>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 글등록하기 버튼을 클릭하였을떄 
	$("#prodSelectBtn1_1_1").click(function(){
		var title = $("#accidentInput").val();
		var content = $("#accidentInput3").val();
		
		if(title == ""){
			alert("게시글의 제목을 입력하시기 바랍니다.");
			return ;
		}else if(content == ""){
			alert("게시글의 내용을 입력하시기 바랍니다.");
			return ;
		}else{
			$("#frm").submit();
		}
	});
	
	
});

// 목록으로 가기 버튼을 클릭하였을때 반응하는 부분
function goBack(){
	location.href ='/isr/goNoticeBoard';
}

</script>
<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>

<!-- header 시작 -->
<%@include file="../../common/header.jsp"%>
<!-- header 끝-->

<div id="main">	

	<div id="adminMain">
		<!-- 관리자 메뉴 -->
		<%@include file="../adminHeader.jsp"%>
					
			<!-- 관리자용 펫 보험 메뉴  -->
			<%@include file="insMenuSelect.jsp"%>
		
			<div id="adminInsMenu">
			
				<div id="productManagement1">
					<div id="productManagement1_1">보험 공지글 작성하기</div>
				</div>

<form action="/isr/goNoticeInsert" method="post" id="frm">
				
				<div id="accident4">
					<div id="accident1">
						<div class="accident2">
							<div class="accident2_1">
								게시글 제목
							</div>
							<div class="accident2_2_1">
								<input type="text" id="title" name="title" value="">
							</div>
						</div>
						<div class="accident2">
							<div class="accident2_1">
								등록자
							</div>
							<div class="accident2_2">
								<label id="claimDay">${memVoName}</label>
							</div>
						</div>
						<div class="accident2">
							<div class="accident2_1">
								게시글 내용
							</div>
							<div class="accident2_2_1_1">
								<input type="text" id="accidentInput3" name="content" value="">
							</div>
						</div>
					</div>
				</div>
				
</form>
				
						<div id="prodSelectBtn">
							<div id="applySelectBtn1">
								<div class="prodSelectBtn1_1" id="prodSelectBtn1_2">
									<input class="prodSelectBtn1_1" id="prodSelectBtn1_1_1" type="button" value="글 등록하기">
								</div>
								<div class="prodSelectBtn1_1">
									<input class="prodSelectBtn1_1" id="prodSelectBtn1_1_2" type="button" onclick="goBack()" value="목록으로 가기">
								</div>
							</div>
						</div>
				
			</div>

	

	</div>
</div>
	
	
	<!-- footer 시작 -->
	<%@include file="../../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>