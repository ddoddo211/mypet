<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function() {
		
		
		var tel = '${basicAddress.daddr_tel }';
		var telsplit = tel.split("-");
		for (var i = 1; i < telsplit.length+1; i++) {
			$("#daddr_tel" + i).val(telsplit[i-1]);
		}
		$(".selectAddr").val('${basicAddress.daddr_id}');
		
		
	})
</script>
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
							<input type="radio" name="a" id="memAddress" onclick ="basicAddress()" value="1">기존배송지
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
					<input type="checkbox" id="otherAddress" class="chkboxa">
					<span>배송지저장</span>
				</div>