<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- kakao -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style type="text/css">
	#maintop{
		width: 1200px;
		margin: 0 auto;
	}
	
	#maintop p {
		font-size: 20px;
		font-weight: bold;
		padding-bottom : 20px;
		color : #000;
		border-bottom: 1px solid #000;
	}
	
	#mainmid {
		width: 1200px;
		margin: 0 auto;
		overflow: hidden;
	}
	
	#mainmid .prodTop{
		margin-top: 20px;
	}
	
	#mainmid .prodTop .prodIMG{
		width: 500px;
		height : 400px;
		display:flex;
		justify-content:center;
		float:left;
	}
	
	#mainmid .prodTop .prodRight{
		margin-left:30px;
		float: left;
	}
	
	.prodName h1{
		font-size: 24px;
	}
	
	.prodPrice {
		margin-top: 13px;
		font-size: 20px;
		margin-bottom: 20px;
	}
	
	.price{
		width: 80px;
	    height: 30px;
	    text-align: center;
	    float: left;
	    background-color: #f1f1f1;
	    border-radius: 10px;
	    margin-right: 10px;
	}
	
	.price span {
		font-size: 15px;
	}
	
	.priceb{
		text-decoration:line-through;
		font-size: 13px;
	}
	
	.share{
		display: flex;
	    justify-content: flex-end;
	    align-items: center;
	    margin-bottom: 10px;
	  	width: 500px;
	}
	
	.fb-share-button{
		float: left;
	}
	
	.kakaoShare{
		float : left;
		margin-left: 20px;
	}
	
	#mainmid p {
		font-weight: bold;
		margin-bottom: 10px;
	}
	
	.prodQty{
		margin-top:10px;
		border: 1px solid #eee;
    	width: 500px;
    	height: 50px;
    	display: flex;
	    align-items: center;
	}
	
	.qtyChk{
		display: flex;
	    justify-content: flex-start;
	    align-items: center;
	    width: 150px;
	    float: left;
	}
	
	.qty{
		text-align: center;
		-webkit-appearance: none;
		margin: 0px 5px 0px 5px;
		width:30px;
	}
	
	.minusBtn{
		margin-left: 10px;
	}
	
	.minusBtn img{
		border: 0;
	}
	
	.qtyPrice{
		float:left;
		text-align: right;
		width: 323px;
	}
	
	.qtyPrice span{
		font-size: 15px;
		font-weight: bold;
	}
	
	.opSelect{
		width:500px;
		height:25px;
		border: 1px solid #eee;
	}
	
	.totalbtn{
		margin-top: 20px;
		width: 500px;
		overflow: hidden;
		display: flex;
	    justify-content: flex-start;
	    align-items: center;
	}
	
	.bsBtn{
		width: 250px;
		display: flex;
		justify-content: flex-end;
	}
	
	.bsBtn .btnBS{
		width: 100px;
		height: 60px;
		background-color: #fff;
   		border: 1px solid #000;
    	border-radius: 5px;
    	margin-left: 10px;
	}
	
	.bsBtn .btnBS:hover{
		background-color: #000;
		color:#fff;
	}
	
	.buyBtn{
		float:left;
	}
	
	.saveBtn{
		float:left;
	}
	
	#mainbottom{
		width:1200px;
		margin: 0 auto;
	}
	
	.prodInfo{
		width: 1200px;
		border-top: 1px solid;
		border-bottom:1px solid;
		padding:10px 0px 10px 0px;
		overflow: hidden;
	}
	
	.prodInfo ul li{
		padding-left: 10px;
		float : left;
		font-size: 20px;
	}
	
	.prodInfo ul li a{
		font-size: 20px;
		font-weight: bold;
	}
	
	.prodDetailIMG{
		display: flex;
	    justify-content: center;
	    align-items: center;
	    margin-top: 20px;
	}
	
	.review{
		font-size: 15px;
		font-weight: bold;
		padding-bottom : 20px;
		color : #000;
		border-bottom: 1px solid #000;
	}
	.review span{
		font-size: 20px;
		font-weight: bold;
	}
	
	.prodReview {
		width: 1200px;
		margin:0 auto;
		margin-top: 10px;
		overflow: hidden;
	}
	
	#reviewList{
		border-top : 1px solid #000;
		border-bottom : 1px solid #000;
		margin: 0 auto;
	    width: 778px;
	    margin-top: 20px;
	    overflow: hidden;
	}
	
	#reviewList .revRow{
	    font-weight: bold;
	    text-align:center;
	    margin: 10px 0px 10px 0px;
	    border-bottom : 1px solid #f1f1f1;
	    cursor : pointer;
	    padding-bottom: 10px;
	    float: left;
	}
	
	.revUpdate{
		font-weight: bold;
	    text-align:center;
	    margin: 10px 0px 10px 0px;
	    border-bottom : 1px solid #f1f1f1;
	    cursor : pointer;
	    padding-bottom: 10px;
	    float: left;
	}
	
	.revTitle{
		float: left;
		width: 450px;
	}
	
	.revNum{
		float: left;
		width: 50px;
	}
	.revMem{
		float: left;
		width: 100px;
	}
	
	.revDate{
		float: left;
		width: 90px;
	}
	
	.revId{
		display: none;
	}
	
	.revContent{
		margin-top: 5px;
	    margin-bottom: 5px;
	    text-align: center;
	    overflow: hidden;
	    width: 750px;
	}
	
	.revBtn{
	    display: flex;
	    align-items: center;
	    height: 40px;
	    margin-left: 20px;
	    float:left;
	}
	
	.revDel{
		margin-right: 5px;
	}
	
	.revName2{
		width: 445px;
    	margin-bottom: 10px;
	}
	
	.upButton{
		display: flex;
	    justify-content: center;
	}
	
	.btnUp{
		float: left;
	    margin-left: 10px;
	    margin-top: 10px;
	}
	
	.btnCancle{
		float: left;
	    margin-left: 10px;
	    margin-top: 10px;
	}
	
	.creN{
		overflow: hidden;
	}
	
	.creName{
		float:left;
	}
	
	.creNum{
		margin-left : 5px;
		float: left;
	}
	
	#reviewCre{
		width: 510px;
    	margin: 0 auto;
	}
	
	#reviewWord{
		float:left;
	}
	
	#reviewAdd{
		height: 47px;
   		width: 60px;;
	}
	
	.revCreName{
		width: 444px;
		margin-bottom: 10px;
	}
	
	.opQtyChk{
		display: flex;
	    justify-content: flex-start;
	    align-items: center;
	    width: 500px;
	    height: 30px;
	    margin-top: 5px;
	    border: 1px solid #eee;
	}
	
	.opName{
	    font-size: 17px;
	    padding-left: 15px;
	    width: 355px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".revContent").hide();
		$(".revUpdate").hide();
		
		$(".revRow").click(function() {
			var revId = $(this).children()[0].innerHTML;
			$(this).parent().children(".revContent").toggle();
		})
		
		
		// 상품 수정화면 
		$(".revUpBtn").click(function() {
			$(this).parent().parent().parent().children(".revRow").hide();
			$(this).parent().parent(".revBtn").hide();
			$(this).parent().parent().parent().children(".revUpdate").show();
			$(this).parent().parent().parent().children(".revContent").hide();
		});
		
		
		$(".revDel1").click(function() {
			$(".prev_id").val($(this).parent().children(".previd").val());
			$(".deleteRev").submit();
		})
		
		// 상품 수정화면에서 취소
		$(".btnCancle").click(function() {
			$(this).parent().parent().parent(".revUpdate").hide();
 			$(this).parent().parent().parent().parent().children(".revRow").show();
 			$(this).parent().parent().parent().parent().children(".revBtn").show();
 			
		});
		
		$(".opSelect").change(function() {
			if($(this).val() != 'op'){
				var prodo_ids = prodoIdChk();
				var qty = prodoQtyChk();
				var prodo_id = "";
				if(prodo_ids.length != 0){
					var chk = 0;
					for (var i = 0; i < prodo_ids.length; i++) {
						if(prodo_ids[i] == $(this).val()){
							chk = 1;
						}
					}
					if(chk != 1){
						prodOpAdd('${dvsVo.dvs_id}','${dvsVo.dvs_parent}','${prodVo.prod_id}',$(this).val());
						prodo_ids.push($(this).val());
						qty.push(1);
						qtyPrice('${dvsVo.dvs_id}','${dvsVo.dvs_parent}','${prodVo.prod_id}',qty,prodo_ids);
					}else{
						alert("이미 추가한 상품입니다.")
					}
				}else{
					prodo_ids.push($(this).val());
					qtyPrice('${dvsVo.dvs_id}','${dvsVo.dvs_parent}','${prodVo.prod_id}',1,$(this).val());
					prodOpAdd('${dvsVo.dvs_id}','${dvsVo.dvs_parent}','${prodVo.prod_id}',$(this).val());
				}
			}
		})
		
		
		$("#reviewAdd").click(function() {
// 			$("#prev_num").val($("#prevNum").val());
			$("#prevCre").submit();
		})
		
	})

	function button_event(){
		if (confirm("정말 삭제하시겠습니까??")){    //확인
		    var ff = document.frm;
		    ff.submit();
		}else{   //취소
			alert("삭제취소"); //취소시 이벤트 처리
			return;
		}
	}
	
	function prodOpAdd(dvs_id,dvs_parent,prod_id,prodo_id,qty,prod_ids){
		
	  	$.ajax({
			url : "/shop/prodOpHtml",
			type : "get",
			data : "dvs_id="+dvs_id+"&dvs_parent="+dvs_parent+"&prod_id="+prod_id+"&prodo_id="+prodo_id,
			success : function(dt) {
				$("#opQty").append(dt);
			}
		});
	}
	
	function prodoIdChk() {
		var prodo_ids = [];
		$(".qty").each(function() {
			prodo_id = $(this).parent().children(".prodo_id").val();
			var chk=0;
			for (var i = 0; i < prodo_ids.length; i++) {
				if(prodo_ids[i] == prodo_id){
					chk= 1;
				}
			}
			if(chk == 0){
				prodo_ids.push(prodo_id);
			}
		})
		
		return prodo_ids;
	}
	
	function prodoQtyChk(){
		var qty = [];
		$(".qty").each(function() {
			qty.push($(this).parent().children(".qty").val());
		})
		return qty;
	}
	
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- You can use Open Graph tags to customize link previews.
    Learn more: https://developers.facebook.com/docs/sharing/webmasters -->
<link rel="image_src" href="http://192.168.203.20:8081/${prodVo.prod_pimg }"/>
<meta property="fb:app_id" content="386372922137185" />
<meta property="og:url" content="http://192.168.203.20:8081/shop/prodDetail?dvs_id="+"${dvs_id }"+"&dvs_parent="+"${dvs_parent }"+"&prod_id="+"${prodVo.prod_id}" />
<meta property="og:type" content="website" />
<meta property="og:title" content="MyPet 쇼핑몰"/>    
<meta property="og:description" content="${prodVo.prod_name }" />
<meta property="og:image" content="http://192.168.203.20:8081/${prodVo.prod_pimg }" />
</head>
<body>
	
	<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>
	
	<div id="maintop">
		<p>상품 상세보기</p>
	</div>
	
	<div id="mainmid">
		<div class="prodTop">
			<div class="prodIMG">
				<a href="${prodVo.prod_pimg }"><img alt="" src="${prodVo.prod_pimg }" width="400" height="350"></a>
			</div>
			<div class="prodRight">
				<div class="share">
<!-- 					<div class="fb-share-button" data-href="http://www.naver.com" data-layout="button" -->
<!-- 						data-size="small"> -->
<!-- 						<a target="_blank"	class="fb-xfbml-parse-ignore" id="facebook"> -->
<!-- 							<img src="/shopimg/facebook.png" width="30" height="30"> -->
<!-- 						</a> -->
<!-- 						<a id="facebook" class="fb-xfbml-parse-ignore" > -->
<%-- <%--  						onclick="window.open('https://www.facebook.com/sharer/sharer.php','window_name', --%> 
<!-- <!-- 							'width=430,height=500,location=no,status=no,scrollbars=no');">   --> 
<!-- 							<img src="/shopimg/facebook.png" width="30" height="30"> -->
<!-- 						</a> -->
<!-- 					</div> -->

<!-- 						Your share button code -->
						 <div class="fb-share-button"  data-layout="button" data-size="small" data-mobile-iframe="true" data-img ="${prodVo.prod_pimg }"
						 data-href="http://192.168.203.20:8081/shop/prodDetail?dvs_id=${dvs_id }&dvs_parent=${dvs_parent }&prod_id=${prodVo.prod_id}" >
					 	   	<a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" 
					 	   		class="fb-xfbml-parse-ignore">공유하기
					 	    </a>
						</div>

							
 					<script> 
  						(function(d, s, id) {
						  var js, fjs = d.getElementsByTagName(s)[0];
						  if (d.getElementById(id)) return;
						  js = d.createElement(s); js.id = id;
						  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.2&appId=386372922137185&autoLogAppEvents=1';
						  fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));
					
// 					$(document).ready(function() {
						
// 						$("#facebook").click(function() {
// 				 			var url = "https://www.facebook.com/sharer/sharer.php?";
// 				 			var url2 = "http://192.168.203.20:8081/shop/prodDetail?dvs_id="+'${dvsVo.dvs_id }'+"&dvs_parent="+'${dvsVo.dvs_parent }'+"&prod_id="+'${prodVo.prod_id}';
// 							var image = 'http://192.168.203.20:8081/${prodVo.prod_pimg}';
// 							var params = 'u='+encodeURIComponent(url2+'?imgname='+image+'&msg=${prodVo.prod_name}'+'&t=MyPet 쇼핑몰'+"&passerby=1");
// 				 			window.open(url + params,'sharer', 'height=300, width=300');
// 				 		})
// 					})
						
			 		
					</script> 
					<div class="kakaoShare" id="kakao-link-btn">
						<a id="kakao-link-btn" href="javascript:;"> 
							<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" width="30" height="30"/>
						</a>
					</div>
					<!-- kakao -->
					<script type="text/javascript">
						//<![CDATA[
						// // 사용할 앱의 JavaScript 키를 설정해 주세요.
						Kakao.init("8cf57df45561e81799f022a19acc46c2");
						// // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
						Kakao.Link
								.createDefaultButton({
									container : '#kakao-link-btn',
									objectType : 'commerce',
									content : {
										title : '${prodVo.prod_name}',
										imageUrl : 'http://localhost:8081/shopimg/saryo2.jpg',
										link : {
											mobileWebUrl : 'http://localhost:8081/shop/prodDetail?prod_id=${prodVo.prod_id}',
											webUrl : 'http://localhost:8081/shop/prodDetail?prod_id=${prodVo.prod_id}'
										}
									},
									commerce : {
										regularPrice : ${prodVo.prod_price},
										discountPrice : ${prodVo.prod_sprice},
										discountRate : 10
									},
									buttons : [ {
										title : '구매하기',
										link : {
											mobileWebUrl : 'http://localhost:8081/shop/prodDetail?prod_id=${prodVo.prod_id}',
											webUrl : 'http://localhost:8081/shop/prodDetail?prod_id=${prodVo.prod_id}'
										}
									} ]
								});
					</script>	
				</div>
				<div class="prodName">
					<h1>
						<span>${prodVo.prod_name }</span>
					</h1>
				</div>
				<c:choose>
					<c:when test="${prodVo.prod_sprice != 0 }">
						<div class="prodPrice">
							<div>
								<span class="priceb">${prodVo.prod_price }원</span>&nbsp<span>${prodVo.prod_sprice }원</span>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="prodPrice">
							<div>
								<span>${prodVo.prod_price }원</span>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			
				<c:if test="${prodoList.size() != 0 }">
					<div class="option">
						<div class="prodOption">
							<select class="opSelect">
								<option value="op">옵션 선택</option>
								<c:forEach items="${prodoList }" var="list">
									<option value="${list.prodo_id }">${list.prodo_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</c:if>
				
				<c:choose>
					<c:when test="${prodoList.size()==0 }">
						<div class="prodQty">
							<div class="qtyChk">
								<button class="minusBtn"><img src="/shopimg/minus.png" height="20" /></button>
							   	<input  type="text" name="Quantity" class="qty" name="qty" value="1" max = "${prod_qty }" min="1" readonly />
								<button class="plusBtn"><img src="/shopimg/plus.png" height="20" /></button>
							</div>
						    <div class="qtyPrice">
						    </div>
						</div>
					</c:when>
					<c:otherwise>
							<div id="opQty">
							</div>
					</c:otherwise>
				</c:choose>
				
				<script type="text/javascript">
					   $(document).ready(function(){
						
						if($("#opQty").text() == ""){
						   	qtyPrice('${dvsVo.dvs_id}','${dvsVo.dvs_parent}','${prodVo.prod_id}',1,'')
						}
					   	
					   	
					   	$(this).on("click",".minusBtn",function() {
					   		var qtyValue =parseInt($(this).parent().children(".qty").val());
					   		
					   		var qty = [];
					   		var prodo_ids = [];
					   		
					   		if(qtyValue == 1){
					   			alert("1개 이하는 불가능 합니다.")
					   		}else{
					   			qtyValue = parseInt($(this).parent().children(".qty").val())-1;
					   		}
					   		
							$("#cartQty").val($(this).parent().children(".qty").val());
							
							var prodo_id = '';
							
							$(this).parent().children(".qty").val(qtyValue);
							
							$(".qty").each(function() {
								qty.push($(this).parent().children(".qty").val());
								prodo_id = $(this).parent().children(".prodo_id").val();
								prodo_ids.push(prodo_id);
							})
							qtyPrice('${dvsVo.dvs_id}','${dvsVo.dvs_parent}','${prodVo.prod_id}',qty,prodo_ids);
						})
						
						
						$(this).on("click",".plusBtn",function() {
							var qty = [];
							var prodo_ids = [];
							//장바구니에 보내주기 위해서 현재 수량
							$("#cartQty").val($(this).parent().children(".qty").val());
							
							
							var prodo_id = '';
							var qtyValue =parseInt($(this).parent().children(".qty").val())+1;
							
							$(this).parent().children(".qty").val(qtyValue);
							
							$(".qty").each(function() {
								qty.push($(this).parent().children(".qty").val());
								prodo_id = $(this).parent().children(".prodo_id").val();
								prodo_ids.push(prodo_id);
							})
							
							qtyPrice('${dvsVo.dvs_id}','${dvsVo.dvs_parent}','${prodVo.prod_id}',qty,prodo_ids);
						});
					   	
					   });
					   
					   
					   function qtyPrice(dvs_id,dvs_parent,prod_id,qty,prodo_ids) {
						
					   	$.ajax({
							url : "/shop/prodQtyHtml",
							type : "post",
							data : "dvs_id="+dvs_id+"&dvs_parent="+dvs_parent+"&prod_id="+prod_id+"&qty="+qty+"&prodo_ids="+prodo_ids,
							success : function(dt) {
								$(".qtyPrice").html(dt);
							}
						});
					}
				</script>
				<div class="totalbtn">
					<span style="font-size: 20px;font-weight: bold;">총 상품금액 </span>
					<div class="qtyPrice" style="font-size: 20px;font-weight: bold;width:140px; text-align: center">
						<span class="cartPirce">0</span><span>원</span>
						<input type ="hidden" id ="cartprice" value = "0"/>
					</div>
					<c:choose>
						<c:when test="${memVo.mem_id == prodVo.prod_mem }">
							<div class="bsBtn">
								<div class="buyBtn">
									<form action="/shop/prodUpdateView" method="get">
										<input type="hidden" name="prod_id" value="${prodVo.prod_id }" />
										<input type="hidden" name="dvs_id" value="${dvsVo.dvs_id }" />
										<input type="hidden" name="dvs_parent" value="${dvsVo.dvs_parent }" />
										<input type="submit" value="상품 수정" class="btnBS">
									</form>
								</div>
								<div class="saveBtn">
									<form action="/shop/prodDelete" method="POST" id="frm" name="frm">
										<input type="hidden" name="prod_id" value="${prodVo.prod_id }" />
										<input type="hidden" name="dvs_id" value="${dvsVo.dvs_id }" />
										<input type="hidden" name="dvs_parent" value="${dvsVo.dvs_parent }" />
										<input type="button" onclick="button_event()" value="상품 삭제" class="btnBS">
									</form>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="bsBtn">
								<div class="buyBtn">
									<form action="/shop/cartAdd" method="post" id="cartgo">
										<input type="hidden" name="cart_prod" value="${prodVo.prod_id }" />
										<input type="hidden" name="cart_qty" id="cartQty" />
										<input type="hidden" name="cart_price" id="cart_price" />
										<input type="hidden" name="prodo_ids" id="oIds" />
										<input type="hidden" name="prodo_qtys" id="oQtys" />
										<input type="button" value="장바구니" class="btnBS" id="cartAdd">
									</form>
								</div>
								<script type="text/javascript">
									$(document).ready(function() {
										
										// 장바구니 등록
										$("#cartAdd").click(function() {
											var qtyChk = prodoQtyChk();
											var prodo_ids =prodoIdChk();
											var qty = 0;
											
											if(qtyChk.length == 0){
												qty = $(".qty").val();
											}else{
												for (var i = 0; i < qtyChk.length; i++) {
													qty += parseInt(qtyChk[i]);
												}
												$("#oIds").val(prodo_ids);
												$("#oQtys").val(qtyChk);
											}
											//장바구니 상품수량 등록
											$("#cartQty").val(qty);
											$("#cart_price").val($("#cartprice").val());
											
											if('${memVo.mem_id}' == ''){
												alert("로그인을 해주세요");
											}else{
												if($("#cartprice").val() != 0){
													if('${cartChk}'== 0){
														$("#cartgo").submit();
														alert("장바구니에 등록되었습니다.")
													}else{
														alert("이미 장바구니에 상품이 등록되어있습니다.")
													}
												}else{
													alert("상품의 옵션을 선택해주세요");
												}
											}
										})
									
									
									})
								</script>
				
								<div class="saveBtn">
									<form action="/shop/prodOrder" method="get" id="orderGo">
										<input type="hidden" name="prod_id" value="${prodVo.prod_id }" />
										<input type="hidden" name="ords_qty" id= "order_qty"/>
										<input type="hidden" name ="totalPrice" id="order_price" />
										<input type="button" value="주문하기" class="btnBS" id="orderBtn">
									</form>
									<script type="text/javascript">
										$(document).ready(function() {
											$("#orderBtn").click(function() {
												if('${memVo}' == ''){
													alert("로그인 정보가 없습니다.")
												}else{
													var qty = prodoQtyChk();
													$("#order_qty").val(qty);
													$("#order_price").val($("#cartprice").val());
													console.log($("#order_qty").val() + " : 수량");
													console.log($("#order_price").val() + " : 가격");
													$("#orderGo").submit();
												}
											});
										})
									</script>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<div id="mainbottom">
		<div class="prodInfo">
			<ul>
				<li><a href="#name01">상품정보</a></li>
				<li><a href="#name02">상품후기</a></li>
			</ul>
		</div>
		<div class="prodDetailIMG">
			<a name="name01" /><img alt="" src="${prodVo.prod_img }">
		</div>
		<div class="review">
			<a name="name02" /><span>상품 후기</span>
		</div>
		<div class="prodReview">
			
			<c:if test="${memVo != null }">
				<div id="reviewCre">
					<form method="post" action="/shop/revCre" id="prevCre">
						<input type="hidden" name ="prev_prod" value="${prodVo.prod_id }" />
						<input type="hidden" name="dvs_id" value="${dvsVo.dvs_id }" />
						<input type="hidden" name="dvs_parent" value="${dvsVo.dvs_parent }" />
<!-- 						<input type="hidden" name="prev_num" id="prev_num"/> -->
						<div class="creN">
							<div class="creName">
								<input type="text" class="revCreName" name="prev_title" value="${list.prev_title }"/>
							</div>
							
							<div class="creNum">
								<select name="prev_num" id="prevNum">
									<option value="5점">5점</option>
									<option value="4점">4점</option>
									<option value="3점">3점</option>
									<option value="2점">2점</option>
									<option value="1점">1점</option>
								</select>
							</div>
						</div>
						
						<div>
							<div id="reviewWord">
								<textarea rows="3" cols="61" id="review" name="prev_text"></textarea>
							</div>
							<div id="reviewBtn">
								<input type="button" id="reviewAdd" value="등록"/>
							</div>
						</div>
					</form>
				</div>
			</c:if>
			
			
			<div id="reviewList">
			
				<c:forEach items="${revList }" var="list">
					<div>
						<div class="revRow">
							<span class="revId">${list.prev_id }</span>
							<div class= "revTitle">
								<span class="revName1">${list.prev_title }</span>
							</div>
								
							<div class= "revNum">
								<span>${list.prev_num }</span>
							</div>
								
							<div class= "revMem">
								<span>${list.prev_mem }</span>
							</div>
								
							<div class= "revDate">
								<span><fmt:formatDate value="${list.prev_date }" pattern="yyyy-MM-dd"/></span>
								<span>▼</span>
							</div>
						</div>
							
						<!-- 상품후기 수정/삭제 버튼 -->
						<c:if test="${memVo.mem_id == list.prev_mem }">
							<div class="revBtn">
								<div class="revDel">
									<form class="deleteRev" action="/shop/revDelete" method="post">
										<input type="hidden" value="${prodVo.prod_id }" name="prod_id" />
										<input type="hidden" class="previd" value="${list.prev_id }"/>
										<input type="hidden" class="prev_id" name="prev_id" />
										<input type="hidden" name="dvs_id" value="${dvsVo.dvs_id }" />
										<input type="hidden" name="dvs_parent" value="${dvsVo.dvs_parent }" />
										<input type="button" value = "삭제" class="revDel1">
									</form>
								</div>
									
								<div>
									
									<input type="button" value = "수정" class="revUpBtn">
								</div>
							</div>
						</c:if>
					
						<!-- 해당 상품리뷰의 컨텐츠 -->
						<div class="revContent" id="revCon">
							<pre>${list.prev_text }</pre>
						</div>
						
						<!-- 상품후기 수정 -->
						<div class="revUpdate">
							<form action="/shop/revUpdate" method="post">
								<input type="hidden" value="${list.prev_id }" name="prev_id" />
								<input type="hidden" value="${prodVo.prod_id }" name="prev_prod"/>	
								<input type="hidden" name="dvs_id" value="${dvsVo.dvs_id }" />
								<input type="hidden" name="dvs_parent" value="${dvsVo.dvs_parent }" />
													
								<div class= "revTitle">
									<input type="text" class="revName2" name="prev_title" value="${list.prev_title }"/>
								</div>
								
								<div class= "revNum">
									<span>${list.prev_num }</span>
								</div>
									
								<div class= "revMem">
									<span>${list.prev_mem }</span>
								</div>
									
								<div class= "revDate">
									<span><fmt:formatDate value="${list.prev_date }" pattern="yyyy-MM-dd"/></span>
								</div>
									
								<div class="revUpContent">
									<textarea rows="3" cols="100" name="prev_text">${list.prev_text }</textarea>
								</div>
								
								<div class="upButton">
									<div class="btnUp">
										<input type="submit" value="수정" />
									</div>
									
									<div class="btnCancle">
										<input type="button" value="취소">
									</div>
								</div>					
							</form>
						</div>
					</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
	
	<!-- footer 시작 -->
	<%@include file="/WEB-INF/view/common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>