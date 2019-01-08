<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(document).ready(function(){
		//im'port 결제모듈
		var IMP = window.IMP; // 생략가능
		IMP.init('imp09203705'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	});

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
		var k = 0;
		$(':checkbox:checked').each(function(i) {
			chk = $(this).parent().parent().children().children(".pay").val();
			if(chk == 'Y'){
				alert("결제완료된 예약은 결제할 수 없습니다. 다시 선택해주세요.");
				return;
			}
			chk2[i] = $(this).parent().parent().children().children(".price").val();
			k += Number(chk2[i]);
		});
		alert(k);
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '펫시터 집으로 부르기', //물건이름
		    amount : k, // 물건가격
		    buyer_email : '${memVo.mem_id}',
		    buyer_name : '${memVo.mem_name}',
		    buyer_tel : '${memVo.mem_hp}',
		    buyer_addr : '${memVo.mem_addr}',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) { //결재 성공 후
		        var msg = '';
		        msg +='${memVo.mem_name}'+'님 선택하신';
		        msg += '펫시터 집으로 부르기'+'  에 대한  ';
		        msg += rsp.paid_amount + '원 의 ';
		        msg += '결제가 완료되었습니다.  \n\n';
		        msg += '@ 결제완료   카드 승인번호 : ' + rsp.apply_num;
		    } else { // 결재 실패
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    
		    if(rsp.success){ //결재 성공 시 페이지 이동
		    	
		    	$("#pay_chk").val("0");
		    	$("#pay_price").val(totalPrice);
		    	$("#successFrm").submit();
		    }
		    
		});
	}
</script>
<form action="/sit/paymentSuccess" method="post" id="successFrm">
	<input type="hidden" id="pay_chk" name="pay_chk" />
	<input type="hidden" id="pay_price" name="pay_price" />
</form>
<form action="/sit/reservationDelete" method="post" id="resDeleteFrm">
<input type="hidden" id="resId" name="resId" />
	<div id="mypageRightMain">
		<div style="background-color: #6eb9b5; color : #fff; border-color:#6eb9b5; height : 50px; text-align: center; line-height: 50px;">
			<span style="font-size : 16px;">예약 내역</span>
		</div>
		<div style=" margin-top : 30px;">
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
						<c:when test="${reslist.size() == 0}">
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
									<td class="td"><fmt:formatNumber value="${list.str_price }" pattern="#,###,###" />원<input type="hidden" class="price" value="${list.str_price }"/></td>
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