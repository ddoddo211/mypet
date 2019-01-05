<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.hidden{
		display: none;
	}
	#pdfImg{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	
	function supCancle(){
		var sta_id = "${staVo.sta_id}";
		supportDelete(sta_id);
	}
	
	$(document).ready(function(){
		$("#pdfImg").click(function(){
			var filePath = $(this).parent().children("#pdfFile").val();
			$("#fileName").val(filePath);
			$("#frm").submit();
		});
		
	});
</script>
<form action="/sit/supportPDFfileViewer" method="post" id="frm">
	<input type="hidden" id="fileName" name="fileName" />
</form>
<div id="mypageRightMain">
	<div style="background-color: #6eb9b5; color : #fff; border-color:#6eb9b5; height : 50px; text-align: center; line-height: 50px;">
		<span style="font-size : 16px;">지원 내역</span>
	</div>

	<div style=" margin-top : 30px;">
		<div style="width:100%;">
			<table id="reservationTable">
				<tr>
					<th class="th hidden">구분</th>
					<th class="th">성명/성별</th>
					<th class="th">지원날짜</th>
					<th class="th">합격여부</th>
					<th class="th">결재금액</th>
					<c:if test="${staVo.sta_suc eq 'Y' }">
						<th class="th">첨부파일</th>
					</c:if>
				</tr>
				<c:choose>
					<c:when test="${staVo ne null}">
						<tr>
							<td class="td hidden">${staVo.sta_id}</td>
							<td class="td">${sta_text1 }</td>
							<td class="td"><fmt:formatDate value="${staVo.sta_date}" pattern="yyyy-MM-dd" /></td>
							<c:choose>
								<c:when test="${staVo.sta_suc == 'N' }">
									<td class="td">지원중</td>
								</c:when>
								<c:when test="${staVo.sta_suc == 'Y' }">
									<td class="td">합  격</td>
								</c:when>
							</c:choose>
							<td class="td">55,000원</td>
							<c:if test="${staVo.sta_suc eq 'Y' }">
								<td class="td">
									<img alt="PDF이미지" id="pdfImg" src="/img/petSitterImg/PDF.png" style="width:20px;height:20px;">
									<input type="hidden" id="pdfFile" value="${staVo.sta_file }"/>
								</td>
							</c:if>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="td" colspan="6">지원내역이 없습니다.</td>
						</tr>					
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
	<div style="width:100%; height:70px; overflow: hidden;">
		<c:if test="${staVo.sta_id != null || staVo.sta_id != '' }">
			<div style="margin-top:20px;float:right; margin-left : 20px;">
				<input type="button" onclick="supCancle()" class="mypageBtn" value="지원취소"/> 
			</div>
		</c:if>
		<c:if test="${staVo.sta_suc == 'Y' }">
			<div style="margin-top:20px;float:right;">
				<input type="button" id="supOk" class="mypageBtn" value="결제하기"/> 
			</div>
		</c:if>
	</div>
</div>