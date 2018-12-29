<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
	html,body{
		height: 100%;
	}
	
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
		width : 1200px;
		margin: 0 auto;
		overflow: hidden;
		min-height: 658px;
	}
	
	.mainleft {
		width: 21%;
		min-height: 1658px;
		float: left;
		background-color: #f1f1f1;
	}
	
	#mainmid .mainleft .listSearch{
		margin-bottom: 10px;
   		border-bottom: 1px solid darkgray;
	    height: 52px;
    	text-align: center;
    	padding-top: 15px;
	}
	
	
	#mainmid .mainleft .listSearch a{
		width: 34px;
   		height: 37px;
    	padding: 0px 18px 6px 5px;
    	background: url(http://openimage.interpark.com/.ui/pet/common/pet_searchIcon.png)no-repeat;
	}
	
	#shopSearch{
		width: 152px;
	    height: 33px;
	    padding: 0 36px 0 10px;
	    border: 1px solid #e3e6e5;
	    font-size: 12px;
	    line-height: 33px;
	    color: #555;
	    border-radius: 50px;
	}
	
	.listMenu{
		text-align: center;
	}
	
	.listMenu p {
		font-size : 25px;
		font-weight: bold;
		color : #000;
		margin-bottom: 10px;
	}
	
	.listMenu ul li{
		padding-top: 10px;
		padding-bottom: 15px;
	}
	.listMenu ul li a{
		color: #000;
	    font-size: 15px;
	    border: 1px solid;
	    border-radius: 5px;
	    padding: 5px;
	}
	
	.listMenu ul li a:active {
		color: red;
	}
	
	.creProd {
		margin-top : 50px;
		text-align:center;
	}
	
	.creProd #submit{
		width: 100px;
	    height: 50px;
	    background-color: #cec7c7;
   		border-radius: 10px;
	}
	
	.mainright{
		width: 79%;
		height:100%;
    	float: left;
    	background-color: #fff;
	}
	.petchk{
		float:left;
	    color: white;
	    font-size: 15px;
	}
	
	.pordCheck{
		width: 850px;
		margin: auto;
   		margin-top: 15px;
   		padding: 10px;
   		background-color: #f1f1f1;
   		border: 1px solid darkgray;
	}
	
	.chk{
		height: 30px;
	}
	
	.chkName{
		width: 65px;
	    height: 26px;
	    float: left;
	    background: darkgray;
	    border: 1px solid white;
	    border-radius: 5px;
	    display: flex;
    	justify-content: center;
    	align-items: center;
	}
	
	.ageChk {
		floot:left;
	}
	
	.ageChk ul li{
		padding: 6px 5px 0px 5px;
    	float: left;
    	font-size: 13px;
	}
	
	.prodMenu{
		width: 870px;
	    margin: auto;
	    text-align:center;
	    margin-top: 15px;
	    border-bottom: 1px solid #efefef;
    	overflow: hidden;
    	padding-bottom: 20px;
	}
	
	.prodMenu ul {
		display:block;
		width:813px;
		padding:10px;
		margin:auto;
	}
	
	.prodMenu ul li {
		float: left;
	    margin-bottom: 10px;
	    max-width: 266px;
	    min-width: 266px;
	    min-height: 320px;
	}
	
	.page{
		display:flex;
		justify-content:center;
		align-items:center;
		height: 45px;
	}
	
	.page ul li {
		float:left;
		padding: 10px;
		font-size: 15px;
	}
	
	.price{
		text-decoration:line-through;
		font-size: 13px;
	}
	
	.sprice{
		font-size: 16px;
		font-weight: bold;
	}
	
	.prodName{
		font-size: 17px;
	}
	
</style>

<script type="text/javascript">
	$(document).ready(function() {
		var prod_name = '${prod_name}';
		
		prodListHtml(1,'${dvs_id}','${dvs_parent}',prod_name);
		
		$(".chkbox").click(function() {
			prodListHtml(1,'${dvs_id}','${dvs_parent}',prod_name);
		}); 
		
		
		// 판매자인지 확인
		var mem_shop = parseInt("${memVo.mem_shop}");
		if(mem_shop == 2){
			$(".creProd").show();
		}else{
			$(".creProd").hide();
		}
		
		$(".ageChk").on("click",".label",function(){
			
			if($(this).siblings("input:checkbox[name='chkbox']").is(":checked") == false){
				$(this).siblings("input:checkbox[name='chkbox']").prop("checked", true);  /* .is(":checked") == true; */
				prodListHtml(1,'${dvs_id}','${dvs_parent}');
			}else{
				$(this).siblings("input:checkbox[name='chkbox']").prop("checked", false);
				prodListHtml(1,'${dvs_id}','${dvs_parent}');
			}
		})
		
		$("#prodSearch").click(function() {
			$("#prod_name").val($("#shopSearch").val());
			$("#fm").submit();
		});
	})
	
	function prodListHtml(page,dvs_id,dvs_parent,prod_name) {
		var pageSize = 12;
		var values = [];
		var opValues = [];
		$("input[name=chkbox]:checked").each(function(i){
			values.push($(this).val());
		});
		$("input[name=op_id]").each(function(i){
			opValues.push($(this).val());
		});
		
		$.ajax({
			url : "/shop/prodListHtml",
			type : "get",
			data : "page=" + page + "&pageSize=" + pageSize + "&dvs_id="+dvs_id+"&dvs_parent="+dvs_parent+"&values="+values+"&opValues="+opValues+"&prod_name="
			+prod_name,
			success : function(dt) {
				$("#prodList").html(dt);
				prodPageHtml(page,dvs_id,dvs_parent,prod_name);
			}
		});
	}
	
	function prodPageHtml(page,dvs_id,dvs_parent,prod_name) {
		var pageSize = 12;
		var values = [];
		var opValues = [];
		$("input[name=chkbox]:checked").each(function(i){
			values.push($(this).val());
		});
		$("input[name=op_id]").each(function(i){
			opValues.push($(this).val());
		});
		$.ajax({
			url : "/shop/prodPageHtml",
			type : "get",
			data : "page=" + page + "&pageSize=" + pageSize + "&dvs_id="+dvs_id+"&dvs_parent="+dvs_parent+"&values="+values+"&opValues="+opValues+"&prod_name="
			+prod_name,
			success : function(dt) {
				$(".pagination").html(dt);
				scrollgo();
			}
		});
	}
	
	function scrollgo() {
		var offset = $("#mainmid").offset();
	    $('html, body').animate({scrollTop : offset.top}, 400);
	}
	
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id ="fm" action="/shop/petShopList" method="post">
	<input type="hidden" name="dvs_id" value="${dvs_id }">
	<input type="hidden" name="dvs_parent" value="${dvs_parent }">
	<input type="hidden" name="prod_name" id="prod_name">
</form>
	<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>
	<div id="maintop">
		<p>강아지</p>
	</div>
	
	<div id="mainmid">
		<div class ="mainleft">
			<div class="listSearch">
				<input type="text" id="shopSearch" name ="shopSearch" placeholder="메뉴 내 상품명 검색" onfocus="this.value=''" style="color:#c1c1c1" />
				<a id="prodSearch"></a>
			</div>
			<div class="listMenu">
				<p>Menu</p>
				<ul>
					<c:forEach items="${menuList }" var="list">
						<li><a href="/shop/petShopList?dvs_id=${dvs_id }&dvs_parent=${list.dvs_id}">${list.dvs_name }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="creProd">
				<form method="get" action="/shop/prodCre">
					<input type="hidden" value=${dvs_parent } name="dvs_parent">
					<input type="hidden" value="${dvs_id }" name="dvs_id">
					<input type="submit" value = "상품등록" id ="submit">
				</form>
			</div>
		</div>
		
		<div class="mainright">
			<div class="pordCheck">
				<c:forEach items="${opList }" var="list">
					<div class="chk">
						<div class="chkName">
							<span class="petchk">${list.dvs_name }</span>
							<input type="hidden" value="${list.dvs_id }" name ="op_id">
						</div>
						<c:forEach items="${opMenuList}" var="list2">
							<c:if test="${list.dvs_id == list2.dvs_parent }">
								<div class="ageChk">
									<ul>
										<li>
 											<input type="checkbox" id="chkbox" class="chkbox" name="chkbox" value="${list2.dvs_id }" ${value ==list2.dvs_id ? 'checked' : '' }> 
 											<label class="label" style="cursor:pointer">${list2.dvs_name }</label> 
										</li>
									</ul>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			
			<div class="prodMenu">
				<ul id="prodList">
				</ul>
			</div>
			<div class="page">
				<ul class="pagination">
				</ul>
			</div>
		</div>
	</div>
	
	<!-- footer 시작 -->
	<%@include file="/WEB-INF/view/common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>