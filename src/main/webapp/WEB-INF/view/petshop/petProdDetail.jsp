<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
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
		border-bottom: 1px solid #000;
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
	
	#qty{
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
	
	.totalPrice{
		font-size: 20px;
		font-weight: bold;
		width: 250px;
	}
	
	#mainbottom{
		width:1200px;
		margin: 0 auto;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header 시작 -->
	<%@include file="/WEB-INF/view/common/header.jsp"%>
	<!-- header 끝-->
	<div id="headerMain">
	<!-- 여기서 부터 각자 -->
		<!-- header -->
		<div id="header">
			<div id="logo">
				<a href="/shop/shopMain">
					<img alt="" src="/img/petShopLogo.jpg" width="200">
				</a>
			</div>
			<div id="petSearch">
				<div id="word">
					<input type="text" id="search" value="검색어를 입력하세요" onfocus="this.value=''" style="color:#c1c1c1" />
				</div>
				<div id="searchButton">
					<a href="#" id="searchButton"></a>
				</div>
			</div>
			<!-- 우리 아이 등록하기 -->
			<div id="petInsert">
				<a href="#"><img alt="이미지가 없습니다" src="/img/petInsert.jpg" width="240px;" height="100px;"></a>
			</div>
		</div>
	</div>
	
	<div id="maintop">
		<p>상품 상세보기</p>
	</div>
	
	<div id="mainmid">
		<div class="prodTop">
			<div class="prodIMG">
				<img alt="" src="/shopimg/prod1.jpg" width="400" height="350">
			</div>
			<div class="prodRight">
				<div class="share">
<!-- 					<div class="fb-share-button" data-href="http://www.naver.com" data-layout="button" -->
<!-- 						data-size="small"> -->
<!-- 						<a target="_blank" -->
<!-- 							class="fb-xfbml-parse-ignore"> -->
<!-- 						</a> -->
						<a id="facebook" class="fb-xfbml-parse-ignore" 
						onclick="window.open('https://www.facebook.com/sharer/sharer.php','window_name',
								'width=430,height=500,location=no,status=no,scrollbars=no');"> 
							<img src="/shopimg/facebook.png" width="30" height="30">
						</a>
<!-- 					</div> -->
 					<script> 
//   				 		(function(d, s, id) { 
//  				 			var js, fjs = d.getElementsByTagName(s)[0];
//  				 			if (d.getElementById(id)) 
//  				 				return;
//   				 			js = d.createElement(s); 
//   				 			js.id = id; -->
//  				 			js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.2';
//   				 			fjs.parentNode.insertBefore(js, fjs);
//  				 		}(document, 'script', 'facebook-jssdk'));
<%--
					$("#facebook").click(function() {
			 			var url = "https://www.facebook.com/sharer/sharer.php";
			 			var url2 = "http://www.naver.com";
			 			window.open(url + "?u=" + url2, height=100, width=100);
			 		})
			 	--%>
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
										title : 'Ivory long dress (4 Color)',
										imageUrl : 'http://mud-kage.kakao.co.kr/dn/RY8ZN/btqgOGzITp3/uCM1x2xu7GNfr7NS9QvEs0/kakaolink40_original.png',
										link : {
											mobileWebUrl : 'http://localhost:8081/shop/prodDetail',
											webUrl : 'http://localhost:8081/shop/prodDetail'
										}
									},
									commerce : {
										regularPrice : 208800,
										discountPrice : 146160,
										discountRate : 30
									},
									buttons : [ {
										title : '구매하기',
										link : {
											mobileWebUrl : 'http://localhost:8081/shop/prodDetail',
											webUrl : 'http://localhost:8081/shop/prodDetail'
										}
									} ]
								});
					</script>	
				</div>
				<div class="prodName">
					<h1>
						<span>[브랜드]</span>
						<span>상품명</span>
					</h1>
				</div>
				<div class="prodPrice">
					<span>가격</span>
					<span>할인가</span>
				</div>
				<p>옵션선택</p>
				<div class="prodOption">
					<select style="width:500px;height:25px;border: 1px solid #eee;">
						<option>1kg</option>
						<option>3kg</option>
						<option>5kg</option>
						<option>10kg</option>
					</select>
				</div>
				<div class="prodQty">
					<div class="qtyChk">
						<button class="minusBtn"><img src="/shopimg/minus.png" height="20" /></button>
					    <input  type="text" name="Quantity" id="qty" name="qty" value="1" max = "10" min="1" readonly />
					    <button class="plusBtn"><img src="/shopimg/plus.png" height="20" /></button>
				    </div>
				    <script type="text/javascript">
				    	$(document).ready(function(){
				    		var value = $("#qty").val();
				    		$(".minusBtn").click(function() {
				    			if(value == 1){
				    				alert("1개 이하는 불가능 합니다.")
				    			}else{
									value =parseInt(value)-1;
				    			}
								$("#qty").val(value);
							})
							$(".plusBtn").click(function() {
								value =parseInt(value)+1;
								$("#qty").val(value);
							})
				    		
				    	});
				    		
				    </script>
				    <div class="qtyPrice">
				    	<span>가격</span><span>원</span>
				    </div>
				</div>
				<div class="totalbtn">
					<div class="totalPrice">
						<span>총 상품금액 </span>
						<span>150,000</span><span>원</span>
					</div>
					<div class="bsBtn">
						<div class="buyBtn">
							<form>
								<input type="hidden">
								<input type="hidden">
								<input type="submit" value="장바구니" class="btnBS">
							</form>
						</div>
						<div class="saveBtn">
							<form>
								<input type="submit" value="주문하기" class="btnBS">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="mainbottom">
		<div>
			<ul>
				<li>상품정보</li>
				<li>상품후기</li>
			</ul>
		</div>
		<div class="prodDetailIMG">
			<img alt="" src="/shopimg/prod1detail.jpg">
		</div>
	</div>
</body>
</html>