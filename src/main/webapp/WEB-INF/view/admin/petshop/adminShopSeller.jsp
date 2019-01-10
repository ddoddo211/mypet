<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petshopAdmin.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
#sellerMain {
	width: 1200px;
	margin: 0 auto;
	min-height: 605px;
	margin-top: 10px;
}

#sellerTable {
	width: 100%;
}

.th {
	border: 1px solid #d1d1d1;
	font-size: 20px;
	background-color: #fff3f3;
}

.td {
	border: 1px solid #d1d1d1;
	text-align: center;
	vertical-align: middle;
	font-size: 16px;
	height: 30px;
}

.pagination {
	padding: 0;
	font-family: 'Work Sans', sans-serif;
	font-size: 20px;
	text-align: center;
}

.pagination>li {
	display: inline-block;
}

.pagination>li>a {
	float: left;
	margin: 0 auto;
}
.okBtn{
	padding : 5px 10px 5px 10px;
	color : #fff;
	background-color: #d88787;
	border-radius: 5px;
}
.hidden{
	display : none;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$(".okBtn").click(function(){
		
		var staId = $(this).parent().parent().children().children("#sId").val();
		var memName =$(this).parent().parent().children().children("#memName").val();
		var sKind = $(this).parent().parent().children().children("#sKind").val();
		var sCompName = $(this).parent().parent().children().children("#sCompName").val();
		var sNum = $(this).parent().parent().children().children("#sNum").val();
		var sMem = $(this).parent().parent().children().children("#sMem").val();
		
		$("#staId").val(staId);
		$("#mem_name").val(memName);
		$("#staKind").val(sKind);
		$("#staComp").val(sCompName);
		$("#staNum").val(sNum);
		$("#staMem").val(sMem);
		
		$("#frm").submit();
	});
});			

		
</script>
</head>
<body>
<form action="/shopAdmin/pdfEmail" method="post" id="frm">
	<input type="hidden" id="staId" name="staId" />
	<input type="hidden" id="mem_name" name="memName" />
	<input type="hidden" id="staKind" name="staKind" />
	<input type="hidden" id="staComp" name="staComp" />
	<input type="hidden" id="staNum" name="staNum" />
	<input type="hidden" id="staMem" name="staMem" />
	<input type="hidden" name="pageSize" value="${pageSize }" />
	<input type="hidden" name="page" value="${page }"/>
</form>
	<%@include file="/WEB-INF/view/admin/petshop/adminShopH.jsp"%>

	<div id="sellerMain">
		<div id="dataMain">
			<table border="1" id="sellerTable">
				<tr>
					<th class="th">번호</th>
					<th class="th hidden">아이디</th>
					<th class="th hidden">아이디</th>
					<th class="th">지원자 성명</th>
					<th class="th">지원자 연락처</th>
					<th class="th">지원자 구분</th>
					<th class="th">회사명</th>
					<th class="th">사업자 등록번호</th>
					<th class="th">합격여부</th>
					<th class="th">승인</th>
				</tr>
				<c:choose>
					<c:when test="${supportListAll.size() == 0 }">
						<td class="td" colspan="9">지원자가 없습니다.</td>
					</c:when>
					<c:otherwise>
						<c:forEach items="${supportListAll }" var="list">
							<tr>
								<td class="td">${list.rnum }</td>
								<td class="td hidden"><input type="hidden" id="sId" value="${list.sta_id }" /></td>
								<td class="td hidden"><input type="hidden" id="sMem" value="${list.sta_mem }" /></td>
								<td class="td">${list.mem_name }<input type="hidden" id="memName" value="${list.mem_name }" /></td>
								<td class="td">${list.mem_hp }</td>
								<td class="td">${list.sta_kind }<input type="hidden" id="sKind" value="${list.sta_kind }" /></td>
								<c:choose>
									<c:when test="${list.sta_kind == '회사' }">
										<td class="td">${fn:split(list.sta_text, '- ')[2] }<input type="hidden" id="sCompName" value="${fn:split(list.sta_text, '- ')[2] }" /></td>
										<td class="td">${list.sta_num }<input type="hidden" id="sNum" value="${list.sta_num }" /></td>
									</c:when>
									<c:otherwise>
										<td class="td" colspan="2">해당사항없음</td>
									</c:otherwise>
								</c:choose>
								<td class="td">${list.sta_suc }</td>
								<td class="td">
									<c:if test="${list.sta_suc == 'N' }">
										<input type="button" class="okBtn" value="승인"/>
									</c:if>
								</td>								
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<ul class="pagination">
				<c:choose>
					<c:when test="${page == 1 }">
						<li><a id="disabled" href="/shopAdmin/seller?page=1&pageSize=10">
								<span>&laquo;</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/shopAdmin/seller?page=1&pageSize=10"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${page > 1 }">
						<li><a href="/shopAdmin/seller?page=${page-1 }&pageSize=10"> <span
								aria-hidden="true">&lt;</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li><a id="disabled" href="/shopAdmin/seller?page=1&pageSize=10">
								<span aria-hidden="true">&lt;</span>
						</a></li>
					</c:otherwise>

				</c:choose>
				<c:forEach begin="1" end="${pageCnt }" var="i">

					<li><a href="/shopAdmin/seller?page=${i }&pageSize=10">${i }</a></li>
				</c:forEach>
				<c:choose>
					<c:when test="${page eq pageCnt}">
						<li><a id="disabled"
							href="/shopAdmin/seller?page=${pageCnt }&pageSize=10"> <span
								aria-hidden="true">&gt;</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/shopAdmin/seller?page=${page+1 }&pageSize=10"> <span
								aria-hidden="true">&gt;</span>
						</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${page eq pageCnt }">
						<li><a id="disabled"
							href="/shopAdmin/seller?page=${pageCnt }&pageSize=10"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/shopAdmin/seller?page=${pageCnt }&pageSize=10"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>


	<%@include file="../../common/footer.jsp"%>
</body>
</html>