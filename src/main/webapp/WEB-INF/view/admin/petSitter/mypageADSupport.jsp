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
	
	function suc(){
		var val = [];
		var valsuc = [];
		var valmem = [];
		var k = "";
		var l = "";
		$(':checkbox:checked').each(function(i) {
			valsuc[i] = $(this).parent().parent().children().children(".chk_suc").val();
			if(valsuc[i] == 'Y'){
				alert("합격 중인 것은 선택할 수없습니다.");
				k = "";
				return;
			} 
			val[i] = $(this).val();
			k += val[i] + " ";
			
			valmem[i] = $(this).parent().children(".chk_mem").val();
			l += valmem[i] + " ";
			
		});
		if(k != ""){
			$("#staId").val(k);
			$("#sta_mem").val(l);
			supportPDF(k, l, 1);
		}
	};
</script>
<form action="/sit/supportPDF" method="post" id="pdfFrm">
	<input type="hidden" id="staId" name="staId" />
	<input type="hidden" id="sta_mem" name="sta_mem" />
</form>

<div id="mypageRightMain">
	<div style="background-color: #6eb9b5; color : #fff; border-color:#6eb9b5; height : 50px; text-align: center; line-height: 50px;">
		<span style="font-size : 16px;">지원 내역</span>
	</div>

	<div style=" margin-top : 30px;">
		<div style="width:100%;">
			<table id="reservationTable">
				<tr>
					<th class="th">구분</th>
					<th class="th">성명</th>
					<th class="th">지원날짜</th>
					<th class="th">합격여부</th>
					<th class="th">결재금액</th>
				</tr>
				<c:choose>
					<c:when test="${staList.size() != 0}">
						<c:forEach items="${staList }" var="list">
							<tr>
								<td class="td"><input type="checkbox" name="chk_sup" value="${list.sta_id}" /><input type="hidden" class="chk_mem" value="${list.sta_mem }" /></td>
								<td class="td">${list.mem_name }</td>
								<td class="td"><fmt:formatDate value="${list.sta_date}" pattern="yyyy-MM-dd" /></td>
								<c:choose>
									<c:when test="${list.sta_suc == 'N' }">
										<td class="td">지원중<input type="hidden" class="chk_suc" value="${list.sta_suc }" /></td>
									</c:when>
									<c:when test="${list.sta_suc == 'Y' }">
										<td class="td">합  격<input type="hidden" class="chk_suc" value="${list.sta_suc }" /></td>
									</c:when>
								</c:choose>
								<td class="td">55,000원</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="td" colspan="5">지원내역이 없습니다.</td>
						</tr>					
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<ul class="pagination">
			
		</ul>
	</div>
	<div style="width:100%; height:70px; overflow: hidden;">
		<div style="margin-top:20px;float:right;">
			<input type="button" onclick="suc()" class="mypageBtn" value="합격승인"/> 
		</div>
	</div>
</div>