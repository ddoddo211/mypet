<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goNoticeBoard(관리자용 공지사항관리화면)</title>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 게시글 삭제후에 메세지 나오게 설정하기
	var del = '${del}';
	if(del == 'Y'){
		alert("해당 게시글이 삭제되었습니다.");
		return;
	}
	
	
});

//공지사항 작성하기 버튼을 클릭하였을떄 이동하는 부분
function goNoticeWrite(){
	location.href = '/isr/goNoticeWrite';
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
					<div id="productManagement1_1">보험 공지사항 관리</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">제목을 클릭하시면 공지사항 내용을 확인하실수 있습니다.</div>
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">공지사항 번호중 1~5번은  회원의 자주하는FAQ에 나오게 됩니다.(글 등록 최신순)</div>
					</div>
				</div>
				
				<div id="productManagement">
						<div id="productList">
							<table id="example-table-1">
								<tr>
									<th class="tabel2">번호</th>
									<th class="tabel2">등록</th>
									<th class="tabel5">공지사항 제목</th>
									<th class="tabel6">등록자</th>
									<th class="tabel1">등록일자</th>
								</tr>
<c:choose>
	<c:when test="${noticListSize == 0}">
		<td class="tdh" colspan="4"> 등록되어 있는 공지사항 글이 없습니다.</td>	
	</c:when>
	<c:otherwise>
								

								<c:forEach items="${noticList }" var="list" varStatus="index">
									<tr>
										<td class="tabel2">${list.rnum }</td>	
										<c:choose>
											<c:when test="${index.count == 1 || index.count == 2 || index.count == 3 || index.count == 4 || index.count == 5}">
												<td class="tabel2"><img alt="별" src="/img/admin/star.jpg" width="20px;" height="20px;"></td>
											</c:when>
											<c:otherwise>
												<td class="tabel2"></td>									
											</c:otherwise>
										</c:choose>
										<td class="tdh3" onclick="location.href = '/isr/goNoticeCheck?noticeId=${list.inot_id }'">${list.inot_title }</td>									
										<td class="tdh">${memVoName}</td>									
										<td class="tdh"><fmt:formatDate value="${list.inot_date}" pattern="yyyy년 MM월 dd일"/></td>									
									</tr>
								</c:forEach>
	</c:otherwise>
</c:choose>
							</table>
						</div>
						
						<div id="prodSelectBtn">
							<div id="selectBtn1">
								<div class="selectBtn1_1" id="prodSelectBtn1_2">
									<input class="selectBtn1_1" id="prodSelectBtn1_1_1_1" onclick="goNoticeWrite()" type="button" value="공지사항 작성하기">
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