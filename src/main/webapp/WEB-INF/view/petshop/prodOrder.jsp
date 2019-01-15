<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- daum주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<%-- im'port 결제 스크립트 --%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">
	
	
	#maintop{
		width: 1200px;
		margin: 0 auto;
		
	}
	
	#maintop p {
		font-size: 20px;
		font-weight: bold;
		padding-bottom : 10px;
		color : #000;
		border-bottom: 1px solid #000;
	}
	
	#mainmid {
		width : 1200px;
		margin: 0 auto;
		margin-top : 20px;
	}
	
	.midcenter{
		border: 1px solid black;
		border-radius: 10px;
		padding-top: 10px;
		padding-left: 10px;
	}
	.orderTable{
		display: block;
	}
	
	#orderList{
		text-align: center;
		font-size: 17px;
	}
	
	#tableHead{
		background: #c1bbbd;
    	color: white;
	}
	
	.orderMenu{
		font-size: 15px;
	    font-weight: bold;
	    color: #f7f7f7;
	    background-color: #b76a6a;
	    width: 200px;
	    height: 25px;
	    text-align: center;
	    border-radius: 10px;
	    margin-bottom: 10px;
	}
	
	#mainbottom{
		width: 1200px;
		margin : 0 auto;
		margin-top : 20px;
		min-height: 446px;
	}
	
	.bottomLeft{
		border-right: 1px solid #0c0c0c;
	    width: 600px;
	    float: left;
	}
	
	.bottomRight{
	  	width: 511px;
	    margin-left: 30px;
	    float: right;
	}
	
	.buyHumanAll{
		border: 1px solid black;
	    width: 500px;
	    height: 115px;
	    padding-top: 10px;
	    padding-left: 10px;
	    border-radius: 10px;
	}
	.buyHumanInfo{
	    width: 420px;
	    height: 20px;
	    padding-bottom: 5px;
	    margin-bottom: 5px;
	    border-bottom: 1px solid;
	    font-size: 13px;
	}
	
	.orderBuy{
		width: 100px;
	    float: left;
	    border: 1px solid;
	    border-radius: 5px;
	    margin-right : 15px;
	    text-align: center;
	}
	
	.getHuman{
		margin-top: 20px;
	    border: 1px solid black;
	    width: 500px;
	    padding-top: 10px;
	    padding-left: 10px;
	    border-radius: 10px;
	}
	
	.orderRaido{
	    width: 350px;
	    padding-bottom: 5px;
	    margin-bottom: 5px;
	    font-size: 13px;
	}
	
	.getTel{
		float:left;
		margin-right: 5px;
	}
	
	.orderText{
		width: 50px;
		text-align: center;
	}
	
	.getAddress1{
		width: 150px;
	}
	
	.getAddress2{
		width:213px;
	}
	
	#getZip{
		width: 88px;
	}
	
	.pointBox{
		border: 1px solid black;
	    width: 500px;
	    padding-top: 10px;
	    padding-left: 10px;
	    border-radius: 10px;
	}
	
	.pointText{
		width:50px;
		text-align: center;
	}
	
	.payGo{
	    width: 500px;
	    margin-top: 20px;
	    padding-top: 10px;
	    padding-left: 10px;
	}
	
	.payInfo{
		width: 240px;
	    height: 20px;
	    padding-bottom: 5px;
	    margin-bottom: 5px;
	    font-size: 15px;
	    text-align: center;
    }
	
	.payMenu{
		float: left;
	    margin-right: 10px;
	    background: #eae3e3;
	    color: #bba3a3;
	    width: 90px;
	}
	
	.payLast{
		width: 125px;
	    float: left;
	    border-bottom: 1px solid;
	}
	
	#payBtn{
		background-color: #ffffff;
   		width: 100px;
	}
	
	.paymentP{
		border-bottom: 1px solid black;
	    font-size: 15px;
	    font-weight: bold;
	    padding-bottom: 5px;
	    margin-bottom: 10px;
	}
	
	tbody tr td{
		border-bottom: 1px solid #f1f1f1;
	}
	
	.prodIds{
		display:none;
	}
	.prodId{
		display: none;
	}
	
	.allAddress{
		overflow: hidden;
    	width: 300px;
	}
	
	.radioAddress{
		float: left;
    	margin-right: 10px;
	}
	
	.selectAddress{
		float:left;
		width: 100px;
	}
	
	.basicSelect{
		width: 420px;
	    height: 20px;
	    font-size: 13px;
	    margin-left: 3px;
	}
	
	.daddrTitle{
		font-size: 13px;
   		color: #e06464;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		//im'port 결제모듈
		var IMP = window.IMP; // 생략가능
		IMP.init('imp09203705'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		$("#memAddress").prop("checked",true);
		
		var tel = '${basicAddress.daddr_tel }';
		var telsplit = tel.split("-");
		for (var i = 1; i < telsplit.length+1; i++) {
			$("#daddr_tel" + i).val(telsplit[i-1]);
		}
		//주소 검색 버튼 클릭
		$("#addSearch").click(function () {
			 new daum.Postcode({
			        oncomplete: function(data) {
			           $("#daddr_addra").val(data.roadAddress);
			        }
			    }).open();
		});
		
		//포인트 사용
		$("#pointBtn").click(function() {
			var mem_point = '${memVo.mem_point}';
			var pointUses = $(".pointText").val();
			var totalPrice = '${totalPrice }';
			
			if(mem_point == 0){
				alert("사용하실 포인트가 없습니다.");
				$(".pointText").val("0");
			}else if(parseInt(mem_point) < parseInt(pointUses)){
				alert("현재 가진 포인트를 확인해주세요.");
				$(".pointText").val("0");
			}else if(parseInt(totalPrice) <  parseInt(pointUses)){
				alert("사용하시는 포인트가 결제금액보다 높습니다.");
				$(".pointText").val("0");
			}else{
				pointUse();
			}
			
		});
		
		
		//결제하기
		$("#payBtn").click(function() {
			var prod_ids = [];
			var prod_qty = [];
			var prod_prices = [];
			
			$(".prodId").each(function() {
				prod_ids.push($(this).text());
			})
			
			$(".prodQty").each(function() {
				prod_qty.push($(this).text());
			})
			
			$(".orderPrice").each(function() {
				prod_prices.push($(this).text());
			})
			
			//주문하는 상품id들
			$("#prod_id").val(prod_ids);
			//주만하는 상품 수량들
			$("#prod_qty").val(prod_qty);
			//주문하는 상품 가격들
			$("#prod_price").val(prod_prices);
			
			if('${memVo}' == ''){
				alert("로그인정보가 없습니다.");
				return;
			}
			
			
			if($("#daddr_titlea").val() == ""){
				alert("배송지이름을 넣어주세요.");
				return;
			}else{
				$("#daddr_title").val($("#daddr_titlea").val());
			}
			
			
			if($("#daddr_namea").val() == ""){
				alert("받는분의 이름을 적어주세요");
				return;
			}else{
				$("#daddr_name").val($("#daddr_namea").val());
			}
			
			if($("#daddr_addra").val() == ""){
				alert("받는분의 주소를 적어주세요.");
				return;
			}else{
				$("#daddr_addr").val($("#daddr_addra").val());
			}
			
			if($("#daddr_addr2a").val() == ""){
				alert("받는분의 상세주소를 적어주세요.");
				return;
			}else{
				$("#daddr_addr2").val($("#daddr_addr2a").val());
			}
			
			if($("#daddr_tel1").val() == "" || $("#daddr_tel2").val() == "" || $("#daddr_tel3").val() == ""){
				alert("받는분의 연락처를 적어주세요.");
				return;
			}else{
				var tel = $("#daddr_tel1").val() + "-" + $("#daddr_tel2").val() + "-" + $("#daddr_tel3").val();
				$("#daddr_tel").val(tel);
				
			}
			
			if($('input:checkbox[id="basicAddress"]').is(":checked")==true && $('input:checkbox[id="addressSave"]').is(":checked")==true){
				$(".chkboxa").prop("checked",false);
				alert("기존 배송지와 배송지저장 중 하나를 선택 해주세요.")
				return;
			}
			
			// 기존 배송지 변경
			if($('input:checkbox[id="basicAddress"]').is(":checked")==true){
				$("#daddr_chk").val('1');
			}
			// 저장된 배송지 사용
			else if($(".selectAddr").val() != '1'){
				$("#daddr_chk").val('2')
				$("#daddr_id").val($(".selectAddr").val())
			}
			
			// 배송지 저장
			else if($('input:checkbox[id="addressSave"]').is(":checked")==true){
				$("#daddr_chk").val('3');
			}else{
				$("#daddr_chk").val('4');
			}
			
			var totalPrice = ${totalPrice };
			var pointUse = $(".pointText").val();
			// 포인트 사용 후 가격
			var pointUsePrice = parseInt(totalPrice) - parseInt(pointUse);
			
			var prodNmae= '상품명'
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : prodNmae,     // 상품명
			    amount : parseInt(pointUsePrice),    // 가격
			    buyer_email : '${memVo.mem_id}',
			    buyer_name : '${memVo.mem_name}',
			    buyer_tel : '${memVo.mem_hp}',
			    buyer_addr : '${memVo.mem_addr}',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '';
			        msg +='${memVo.mem_name}'+'님 선택하신';
			        msg += prodNmae+'  에 대한  ';
			        msg += rsp.paid_amount + '원 의 ';
			        msg += '결제가 완료되었습니다.  \n\n';
			        msg += '@ 결제완료   카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			    
			    if(rsp.success){
// 			    	$("#hres_pts").val(
// 			    		strArray[2]
// 			    	);
			    	
					$("#paymentGo").submit();
			    }
			    
			});
			
		})
		
	});
	function memAddress() {
		$("#daddr_namea").val('${memVo.mem_name}');
		$("#daddr_addra").val('${memVo.mem_addr}');
		$("#daddr_addr2a").val('${memVo.mem_addr2}');
		var tel = '${memVo.mem_hp}';
		var telsplit = tel.split('-');
		for (var i = 1; i < telsplit.length+1; i++) {
			$("#daddr_tel" + i).val(telsplit[i-1]);
		}

	}
	
	// 다른배송지 기존 정보 비워주기
	function otherAddress() {
		$("#daddr_namea").val("");
		$("#daddr_titlea").val("");
		$("#daddr_addra").val("");
		$("#daddr_addr2a").val("");
		$("#daddr_tel1").val("");
		$("#daddr_tel2").val("");
		$("#daddr_tel3").val("");
		$(".selectAddr").val('1');
	}
	
	//기존 배송지 클릭
	function basicAddress() {
		var tel = '${basicAddress.daddr_tel }';
		var telsplit = tel.split("-");
		for (var i = 1; i < telsplit.length+1; i++) {
			$("#daddr_tel" + i).val(telsplit[i-1]);
		}
		$("#daddr_namea").val("${basicAddress.daddr_name }");
		$("#daddr_titlea").val("${basicAddress.daddr_title }");
		$("#daddr_addra").val("${basicAddress.daddr_addr }");
		$("#daddr_addr2a").val("${basicAddress.daddr_addr2 }");
		$("#daddr_tel1").val();
		$("#daddr_tel2").val();
		$("#daddr_tel3").val();
		$(".selectAddr").val('1');
	}
	
	
	// 포인트 사용 후 결제금액
	function pointUse(){
		var point = '${memVo.mem_point }';
		var totalPrice = ${totalPrice };
		var pointUse = $(".pointText").val();
		
		// 포인트 사용 후 가격
		var pointUsePrice = parseInt(totalPrice) - parseInt(pointUse);
		
		// 컴마를 넣어주는 함수 또 실행
		var momo = commify(pointUsePrice); 
		
		$(".lastPrice").text(momo);
		$(".pointUse").text(pointUse);
	}
	
	// 천단위마다 콤마
	function commify(n) {
		  var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
		  n += '';                          // 숫자를 문자열로 변환

		  while (reg.test(n))
		    n = n.replace(reg, '$1' + ',' + '$2');

		  return n;
	}
	
	//저장된 배송지 사용
	function saveAddr() {
		var daddr_id = $(".selectAddr").val();	
		$.ajax({
			url : "/shop/saveAddrHtml",
			type : "get",
			data : "daddr_id=" + daddr_id,
			success : function(dt) {
				$(".getHuman").html(dt);
			}
		});
	}
	
	function selectAddress() {
		//배송지 선택
		if($(".selectAddr").val() == 1){
			return;
		}else{
			saveAddr();
		}
	
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>

	<div id="maintop">
		<p>주문하기</p>
	</div>
			
		
	<div id="mainmid">
		<div class="midcenter">
			<div class="orderMenu">
				<p>1.주문하시는 상품</p>
			</div>
			<div class="opderInfo">
				<table class="orderTable">
					<thead id="tableHead">
						<tr>
							<th class="prodIds">상품id</th>
							<th width="50">상품사진</th>
							<th width="700" height="30">상품명</th>
							<th width="100">수량</th>
							<th width="150">금액</th>
						</tr>
					</thead>
			
					<tbody id="orderList">
						<c:choose>
							<c:when test="${cartList == null }">
								<tr class="orderTr">
									<td class="prodId">${prodVo.prod_id }</td>
									<td width="50" height="50">
										<img src="${prodVo.prod_pimg }" width="50" height="50">
									</td>
									<td>${prodVo.prod_name }</td>
									<td><span class="prodQty">${ordsVo.ords_qty }</span>개</td>
									<td><span class="orderPrice">${totalPrice}</span><span>원</span></td>
								<tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${cartList }" var="list">
									<tr class="orderTr">
										<td class="prodId">${list.cart_prod }</td>
										<td width="50" height="50">
											<img src="${list.prod_pimg }" width="50" height="50">
										</td>
										<td>${list.prod_name }</td>
										<td><span class="prodQty">${list.cart_qty }</span>개</td>
										<td><span class="orderPrice">${list.cart_price }</span><span>원</span></td>
									<tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
		
	
	<div id="mainbottom">
	
		<div class="bottomLeft">
			<div class="buyHumanAll">
				<div class="orderMenu">
					<p>2.주문하는 사람</p>
				</div>
				<div class="buyHumanInfo">
					<div class="orderBuy">
						<span>주문자</span>
					</div>
					<div class="buyHuman">
						<span>${memVo.mem_name }</span>
					</div>
				</div>
				<div class="buyHumanInfo">
					<div class="orderBuy">
						<span>연락처</span>
					</div>
					<div class="buyHuman">
						<span>${memVo.mem_hp }</span>
					</div>
				</div>
			</div>
			
			<div class="getHuman">
				
				<div class="orderMenu">
					<p>3.받는 사람</p>
				</div>
				
				<div class="buyHumanInfo">
					<div class="orderBuy">
						<span>저장된배송지</span>
					</div>
					
					<div class="selectAddress">
						<select class="selectAddr" onchange="selectAddress()">
							<option value="1">저장된배송지</option>
							<c:forEach items="${otherAddrList }" var = "list">
								<option value="${list.daddr_id }">${list.daddr_title }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="buyHumanInfo">
					<div class="orderBuy">
						<span>배송지선택</span>
					</div>
					
					<div class="allAddress">
						<div class="radioAddress">
							<input type="radio" name="a" id="memAddress"    onclick ="basicAddress()" value="1">기존배송지
							<input type="radio" name="a" id ="otherAddress" onclick="otherAddress()" value="2">다른배송지
						</div>
					</div>
				</div>
				
				<div class="buyHumanInfo">
					<div class="orderBuy">
						<span>배송지이름</span>
					</div>
					<div class="buyHuman">
						<input type="text" id="daddr_titlea" value ="${basicAddress.daddr_title }" class="getAddress1">
						<span class="daddrTitle">예)우리집</span>
					</div>
				</div>
				
				<div class="buyHumanInfo">
					<div class="orderBuy">
						<span>받는분</span>
					</div>
					<div class="buyHuman">
						<input type="text" id="daddr_namea" value ="${basicAddress.daddr_name }" class="orderText">
					</div>
				</div>
				
				<div class="buyHumanInfo">
					<div class="orderBuy">
						<span>주소</span>
					</div>
					<div class="buyHuman">
						<input type="text" id="daddr_addra" class="getAddress1"  value ="${basicAddress.daddr_addr }" readonly="readonly">
						<input type="button" value="주소검색" id="addSearch"/>
					</div>
				</div>
		
				<div class="buyHumanInfo">
					<div class="orderBuy">
						<span>상세주소</span>
					</div>
					<div class="buyHuman">
						<input type="text" id="daddr_addr2a" class="getAddress2" value ="${basicAddress.daddr_addr2 }" >
					</div>
				</div>
				<div class="buyHumanInfo">
					<div class="orderBuy">
						<span>연락처</span>
					</div>
					<div class="getTel">
						<input type="text" id="daddr_tel1" class="orderText" value ="">
					</div>
					<div class="getTel">
						<span>-</span> 
					</div>
					<div class="getTel">
						<input type="text" id="daddr_tel2" class="orderText" value ="">
					</div>
					<div class="getTel">
						<span>-</span> 
					</div>
					<div class="getTel">
						<input type="text" id="daddr_tel3" class="orderText" value ="">
					</div>
				</div>
				
				<div class="basicSelect">
					<input type="checkbox" id="basicAddress" class="chkboxa">
					<span>기존배송지로 설정</span>
					<input type="checkbox" id="addressSave" class="chkboxa">
					<span>배송지저장</span>
				</div>
				
			</div>
		</div>
		
		<div class="bottomRight">
			<div class="pointBox">
				<div class="orderMenu">
					<p>4.나의 포인트</p>
				</div>
				
				<div class="buyHumanInfo">
					<div class="orderBuy">
						<span>My Point</span>
					</div>
					<div class="buyHuman">
						<span class="pointChK">${memVo.mem_point }</span>
					</div>
				</div>
				
				<div class="buyHumanInfo">
					<div class="orderBuy">
						<span>Point사용</span>
					</div>
					<div class="buyHuman">
						<input type="text" class="pointText" value="0">
						<input type="button" value="사용" id="pointBtn">
					</div>
				</div>
			</div>
			
			<div class="payGo">
				<div class="paymentP">
					<p>결제</p>
				</div>
				
				<div class="totalPayInfo">
					<div class="payInfo">
						<div class="payMenu">
							<span>총 금액</span>
						</div>
						<div class="payLast">
							<span><fmt:formatNumber value="${totalPrice }"/></span><span>원</span>
						</div>
					</div>
					
					<div class="payInfo">
						<div class="payMenu">
							<span>포인트 사용</span>
						</div>
						<div class="payLast">
							<span class="pointUse">0</span>
						</div>
					</div>
					
					<div class="payInfo">
						<div class="payMenu">
							<span>총 결제금액</span>
						</div>
						<div class="payLast">
							<span class="lastPrice"><fmt:formatNumber value="${totalPrice }"/></span><span>원</span>
						</div>
					</div>	
					
					<div class="payInfo">
						<form method="post" action="/shop/payment" id="paymentGo">
							<div class="payment">
								<input type="hidden" name="daddr_id" id="daddr_id" />
								<input type="hidden" name="daddr_title" id="daddr_title">
								<input type="hidden" name="daddr_name" id="daddr_name">
								<input type="hidden" name="daddr_addr" id="daddr_addr">
								<input type="hidden" name="daddr_addr2" id="daddr_addr2">
								<input type="hidden" name="daddr_tel" id="daddr_tel">
								<input type="hidden" name="daddr_chk" id="daddr_chk">
								<input type="hidden" name="qtys" id="prod_qty"/>
								<input type="hidden" name="ids" id="prod_id" />
								<input type="hidden" name="prices" id="prod_price" />
								<input type="button" value="결제하기" id="payBtn" />
							</div>
						</form>
					</div>	
				
				</div>			
			</div>
		</div>
		
	</div>

<!-- footer 시작 -->
<%@include file="/WEB-INF/view/common/footer.jsp"%>
<!-- footer 끝 -->
</body>
</html>