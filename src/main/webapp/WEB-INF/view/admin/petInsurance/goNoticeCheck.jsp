<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goNoticeCheck(관리자용 공지사항관리 :글확인화면)</title>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	// 수정이 완료되었을떄 alert나오게 설정
	var update = '${update}';
	if(update== 'Y'){
		alert("수정이 완료되었습니다.");
	}
	
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
				
				<div id="accident5">
					<div id="accident1">
						<div class="accident2">
							<div class="accident2_1">
								게시글 제목
							</div>
							<div class="accident2_2_1">
								<label class="insurer2_4" >${insNotice.inot_title}</label>
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
								<input type="text" id="accidentInput4" class="insurer2_5" name="content" value="${insNotice.inot_text }" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
				
				
						<div id="prodSelectBtn">
							<div id="noticeBtn1">
								<div class="prodSelectBtn1_1" id="noticeBtn1_2">
									<input class="prodSelectBtn1_1" id="prodSelectBtn1_1_1" onclick="location.href = '/isr/goNoticeUpdate?noticeId=${insNotice.inot_id }'"type="button" value="글 수정하기">
								</div>
								<div class="prodSelectBtn1_1" id="noticeBtn1_2">
									<input class="prodSelectBtn1_1" id="prodSelectBtn1_1_1" onclick="location.href = '/isr/goNoticeDel?noticeId=${insNotice.inot_id }'" type="button" value="글 삭제하기">
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