<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goNoticeUpdate(관리자용 공지사항관리 :글수정화면)</title>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 글제목 , 글 내용을 수정하였는지 확인하는부분
	var title = '${insNotice.inot_title}';
	var content = '${insNotice.inot_text}';
	
	
	// 글 수정하기 버튼을 클릭할시 
	$("#prodSelectBtn1_1_1").click(function(){
		
		//input에 입력한 값
		var title2 = $("#title").val();
		var content2 = $("#accidentInput3").val();
		
		//값이 동일할 경우에는 변경한 내용이 없다는 메세지가 나와야 한다
		if(title == title2 && content == content2){
			alert("변경하신 내용이 없습니다.");
			return;
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
					<div id="productManagement1_1">보험 공지글 확인하기</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">수정하실 부분이 있으실 경우에는 해당 칸을 클릭한후 내용을 입력한후 "글 수정하기"버튼을 누르시기 바랍니다.</div>
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">글 등록자와 등록일시는 수정하실수 없습니다.</div>
					</div>
				</div>

<form action="/isr/goNoticeUpdateInsert" method="post" id="frm">
<input type="hidden" name="noticeId" value="${insNotice.inot_id}">

				<div id="accident4">
					<div id="accident1">
						<div class="accident2">
							<div class="accident2_1">
								게시글 제목
							</div>
							<div class="accident2_2_1">
								<input type="text" id="title" name="title" value="${insNotice.inot_title}">
							</div>
						</div>
						<div class="accident2">
							<div id="notice1">
								<div class="accident2_1">
									등록자
								</div>
								<div class="insurer2_1">
									<label class="insurer2_4" >${memVoName}</label>
								</div>
								<div class="insurer2_2">
									등록일자
								</div>
								<div class="insurer2_3">
									<label class="insurer2_4"><fmt:formatDate value="${insNotice.inot_date}" pattern="yyyy년 MM월 dd일"/></label>
								</div>
								
							</div>
						</div>
						<div class="accident2">
							<div class="accident2_1">
								게시글 내용
							</div>
							<div class="accident2_2_1_1">
								<input type="text" id="accidentInput3" name="content" value="${insNotice.inot_text}">
							</div>
						</div>
					</div>
				</div>
				
</form>
				
						<div id="prodSelectBtn">
							<div id="applySelectBtn1">
								<div class="prodSelectBtn1_1" id="prodSelectBtn1_2">
									<input class="prodSelectBtn1_1" id="prodSelectBtn1_1_1" type="button" value="수정 완료하기">
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