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
		
		//im'port 결제모듈
		var IMP = window.IMP; // 생략가능
		IMP.init('imp09203705'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		$("#supOk").click(function(){
			var k = 550;
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '펫시터 교육비', //물건이름
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
			        msg += '펫시터 교육비'+'  에 대한  ';
			        msg += rsp.paid_amount + '원 의 ';
			        msg += '결제가 완료되었습니다.  \n\n';
			        msg += '@ 결제완료   카드 승인번호 : ' + rsp.apply_num;
			    } else { // 결재 실패
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			    
			    if(rsp.success){ //결재 성공 시 페이지 이동
			    	
			    	$("#pay_chk").val("2");
			    	$("#pay_price").val(k);
			    	$("#successFrm").submit();
			    }
			    
			});
		});
		
	});
</script>
<form action="/sit/supportPDFfileViewer" method="post" id="frm">
	<input type="hidden" id="fileName" name="fileName" />
</form>
<form action="/sit/paymentSuccess" method="post" id="successFrm">
	<input type="hidden" id="pay_price" name="pay_price"   />
	<input type="hidden" id="pay_dateStart" name="pay_dateStart"   />
	<input type="hidden" id="pay_dateEnd" name="pay_dateEnd"   />
	<input type="hidden" id="pay_timeStart" name="pay_timeStart"   />
	<input type="hidden" id="pay_timeEnd" name="pay_timeEnd"   />
	<input type="hidden" id="pay_name" name="pay_name"   />
	<input type="hidden" id="pay_chk" name="pay_chk"   />
	<input type="hidden" name="pst_id" value=" "/>
	<input type="hidden" id="pay_date" name="pay_date" value="${date }"/>
	<input type="hidden" id="sta_id" name="sta_id" value="${staVo.sta_id }" />
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
							<c:choose>
								<c:when test="${staVo.sta_pay == 'Y' }">
									<td class="td">결재완료</td>
								</c:when>
								<c:otherwise>
									<td class="td"><fmt:formatNumber value="${staVo.sta_price }" pattern="###,###"/>원<input type="hidden" id="price" value="${staVo.sta_price }"/></td>
								</c:otherwise>
							</c:choose>
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
	<c:if test="${staVo.sta_pay == 'N' }">
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
	</c:if>
</div>