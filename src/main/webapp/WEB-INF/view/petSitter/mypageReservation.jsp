<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	$(function() {
		$("#resDelete").click(function() {
			var val = [];
			var k = "";
			$(':checkbox:checked').each(function(i) {
				val[i] = $(this).val();
				k += val[i] + " ";
			});
			$("#resId").val(k);
			$("#resDeleteFrm").submit();
		});
	});
	
	function payment(){
		var chk = "";
		var chk2 = [];
		var k = "";
		$(':checkbox:checked').each(function(i) {
			chk = $(this).parent().parent().children().children(".pay").val();
			if(chk == 'Y'){
				alert("결제완료된 예약은 결제할 수 없습니다. 다시 선택해주세요.");
				return;
			}
			chk2[i] = $(this).parent().parent().children().children(".resChk").val();
			k += chk2[i] + " ";
		});
		alert(k);
	}
</script>
<form action="/sit/reservationDelete" method="post" id="resDeleteFrm">
<input type="hidden" id="resId" name="resId" />
	<div id="mypageRightMain">
		<div style="background-color: #6eb9b5; color : #fff; border-color:#6eb9b5; height : 50px; text-align: center; line-height: 50px;">
			<span style="font-size : 16px;">예약 내역</span>
		</div>
		<div style="border : 1px solid #c1c1c1; margin-top : 30px;">
			<div style="width:100%;">
				<table id="reservationTable">
					<tr>
						<th class="th">구분</th>
						<th class="th">이름</th>
						<th class="th">반려동물</th>
						<th class="th">예약날짜</th>
						<th class="th">의뢰시간</th>
						<th class="th">추가시간</th>
						<th class="th">가격</th>
						<th class="th">결재상태</th>
					</tr>
					<c:choose>
						<c:when test="${reslist.size() == 0 }">
							<tr>
								<td class="td" colspan="8">예약 내역이 없습니다.</td>
							</tr>				
						</c:when>
						<c:otherwise>
							<c:forEach items="${resList }" var="list">
								<tr>
									<td class="td"><input type="checkbox" class="resChk" value="${list.str_id }"/></td>
									<td class="td">${list.mem_name }</td>
									<td class="td">${list.myp_name }</td>
									<td class="td"><fmt:formatDate pattern="yyyy-MM-dd" value="${list.str_date }"  /><input type="hidden" class="date" value="${list.str_date }" /></td>
									<td class="td">${list.str_time }시</td>
									<td class="td">${list.str_atime }시간</td>
									<td class="td"><fmt:formatNumber value="${list.str_price }" pattern="#,###,###" />원</td>
									<c:choose>
										<c:when test="${list.str_pay eq 'N'}">
											<td class="td">결재안됨<input type="hidden" class="pay" value="${list.str_pay }" /></td>
										</c:when>
										<c:otherwise>
											<td class="td">결재완료<input type="hidden" class="pay" value="${list.str_pay }" /></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
		
		<div style="width:100%; height:70px; overflow: hidden;">
			<div style="margin-top:20px;float:right;margin-left:20px;">
				<input type="button" id="resDelete" class="mypageBtn" value="예약취소"/> 
			</div>
			<div style="margin-top:20px;float:right;">
				<input type="button" onclick="payment()" class="mypageBtn" value="결제하기"/> 
			</div>
		</div>
	</div>
</form>