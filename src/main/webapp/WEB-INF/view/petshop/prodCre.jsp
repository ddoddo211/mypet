<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">

	#totalMain{
		min-height: 643px;
		width: 1200px;
		margin: 0 auto;
}
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
		width: 1200px;
		margin: 0 auto;
		margin-top: 25px;
		background-color: #f1f1f1;
		border-radius: 20px;
		overflow: hidden;
	}
	
	.menuSelect{
		width: 90px;
		height: 25px;
		border-radius: 5px;
	}
	
	.optionSearch{
		width:110px;
		height:25px;
		border-radius: 5px;
	}
	
	.totalSelect{
		width: 1000px;
   		margin-left: 20px;
	}
	
	.firstSelect{
		width: 500px;
	    height: 50px;
	    overflow: hidden;
	    display: flex;
	    align-items: center;
	}
	
	.firstOne{
		width: 60px;
	    height: 25px;
	    margin-right: 15px;
	    float: left;
	    background-color: #dcd6d6;
	    text-align: center;
	    padding-top: 5px;
	    border-radius: 5px;
	}
	.firstTwo,.secondTwo{
		float:left;
	}
	
	.totalSecond{
		width: 1200px;
		margin: 0 auto;
		overflow: hidden;
	}
	
	.totalSecond .pOne {
	    background-color: #daeaaa;
	    width: 244px;
	    padding: 3px;
	}
	
	.secondSelect{
		width: 205px;
	    height: 50px;
	    float: left;
	    overflow: hidden;
	    display: flex;
	    align-items: center;
	}
	
	.secondOne{
		float: left;
	    margin-right: 15px;
	    width: 60px;
    	height: 25px;
    	background-color: #dcd6d6;
	    text-align: center;
	    padding-top: 5px;
	    border-radius: 5px;
	}
	
	#mainbottom{
		width: 1200px;
		margin: 0 auto;
		margin-top: 25px;
		background-color: #f1f1f1;
		border-radius: 20px;
	}
	
	.prodAdd{
		width: 1000px;
		margin-left: 20px;
		overflow: hidden;
	}
	
	#mainbottom .prodAdd .proda{
		display: flex;
	    align-items: center;
	    height: 50px;
	}
	
	.prodName{
		width: 60px;
	    height: 35px;
	    text-align: center;
	    background-color: #dcd6d6;
	    border-radius: 5px;
	    margin-right: 15px;
	    align-items: center;
	    float: left;
	    display: flex;
	}
	
	.priceText{
		width: 100px;
		height: 20px;
	}
	
	.titleText{
		width: 300px;
		height: 20px;
	}
	
	.qtyText{
		width: 50px;
		height: 20px;	
	}
	
	.prodSpan{
		font-weight: bold;
	}
	
	.prodButton{
		width : 100px;
		float:left;
	}
	
	.buttonP{
		width: 80px;
		height: 40px;
	}

	.prodb{
		margin-top: 20px;
		overflow: hidden;
		height: 50px;
	}
	
	.explain{
		color: #ca1f66;
	}
	
	.opAdd{
		margin-left: 20px;
	}
	
	.opDvs1{
		float : left;
		width: 250px;
		display: flex;
		align-items: center;
	}
	
	.opDvs2{
		float:left;
		width: 150px;
		margin-left: 20px;
		display: flex;
		align-items: center;
	}
	
	.opDvs3{
		width: 200px;
		margin-left: 20px;
		display: flex;
		align-items: center;
	}
	
</style>
<script type="text/javascript">
	$(document).ready(function() {
		if($("#menuSelect").val() == 'menu'){
			$(".pOne").hide();
		}else{
			$(".pOne").show();
		}
		
		var values = [];
		$("#prodSubmit").click(function(event) {
			
			if($("#menuSelect").val() == 'menu'){
				alert("메뉴를 선택해주세요");
				event.preventDefault();
			}else if($("#prod_name").val() == ''){
				alert("상품명을 적어주세요.")
				event.preventDefault();
			}else if($("#prod_price").val() == ''){
				alert("상품가격을 적어주세요.")
				event.preventDefault();
			}else if($("#prod_pimg").val() == ''){
				alert("상품프로필 사진을 넣어주세요.")
				event.preventDefault();
			}else if($("#prod_img").val() == ''){
				alert("상품상세정보 사진을 넣어주세요.")
				event.preventDefault();
			}
			
			
			else{
				$(".optionSearch").each(function(){
					if($(this).val() != '없음'){
						values.push($(this).val());
					}
				})
				$("#dvs_parent").val($("#menuSelect").val());
				$("#menuOption").val(values);
			}
		})
				
		$("#prodRadio2").prop("checked",true);
		$(".radioChK").hide();
		$(".opAdd").hide();
		
		$(".prodRadio").change(function() {
			if($(".prodRadio").val("2")){
				$(".radioChK").hide();
			}else{
				$(".radioChK").show();
			}
		});
		
		$("#menuSelect").change(function() {
			var menu = $("#menuSelect").val();
			console.log(menuSelect);
			if(menu == 'menu'){
				alert("메뉴를 선택해 주세요");	
				$("#menu_id").val('menu');
				$(".secondSelect").hide();
				$("#menuid").submit();
			}else{
				$("#menu_id").val($("#menuSelect").val());
				$(".secondSelect").show();
				$("#menuid").submit();
			}
		})
		
		var chk=1;
		$("#plus").click(function() {
			$(".radioChK").append(
					"<div class=\"proda\"> <div class=\"opDvs1\"><div class=\"prodName\"><label>옵션명</label></div>"
					+"<div class=\"prodText\"><input type=\"text\" id=\"opName"+chk+"\"><span class=\"explain\"></span></div></div>"
					+"<div class=\"opDvs2\"><div class=\"prodName\"><label>옵션수량</label></div>"
					+"<div class=\"prodText\"><input type=\"text\" class=\"qtyText\" name=\"opQty"+chk+"\"><span class=\"prodSpan\">개</span></div></div>"
					+"<div class=\"opDvs3\"><div class=\"prodName\"><label>추가금액</label></div><div class=\"prodText\">"
					+"<input type=\"text\" class=\"priceText\" name=\"opPrice"+chk+"\">"
					+"<span class=\"prodSpan\">원</span>	</div></div></div>"
				);
			++chk;
			$("#chkNum").val(chk);
		})
	})
	
	function opShow() {
		$(".radioChK").show();
		$(".opAdd").show();
	}
	
	function opHide() {
		$(".radioChK").hide();
		$(".opAdd").hide();
		$(".radioChK").empty();
	}
	
	
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 메뉴 셀렉트박스 변환시 해당 사용하는 옵션분류를 가져온다 -->
	<form  id="menuid" action="/shop/menuSelect" method="post" >
		<input type="hidden" id="menu_id" name="menu_id">
		<input type="hidden" id="dvs_id" name="dvs_id" value=${dvs_id }>
	</form>
	
	<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>
	<div id = "totalMain">
		
		<div id="maintop">
			<p>상품 등록</p>
		</div>
	
		<div id="mainmid">
			<!-- select box 부분 전체 div -->
			<div class="totalSelect">
				<!-- 메뉴 선택 부분  -->
				<div class = "firstSelect">
					<div class= "firstOne">
						<span class="selectName">메뉴 선택</span>
					</div>
					<div class="firstTwo">
						<select class="menuSelect" id="menuSelect" name="menuSelect">
								<option value="menu">Menu</option>
							<c:forEach items="${menuList }" var="list">
								<option value = "${list.dvs_id }" ${menu_id==list.dvs_id ? 'selected' :''}>${list.dvs_name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				
					<!-- 메뉴 선택으로 나오는 옵션분류 div -->
				<div class="totalSecond">
					<p class="pOne">해당 상품과 관련 있는 옵션을 선택해 주세요</p>
					<c:forEach items="${opList }" var="list">
						<div class="secondSelect">
							<div class="secondOne">
								<span class="selectName">${list.dvs_name }</span>
							</div>
							<div class="secondTwo">
								<select class="optionSearch">
										<option>없음</option>
									<c:forEach items="${opMenuList }" var="list2">
										<c:if test="${list.dvs_id == list2.dvs_parent }">
											<option value="${list2.dvs_id }">${list2.dvs_name }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div id="mainbottom">
			<div class="prodAdd">
				<form method="post" action="/shop/prodCre" enctype="multipart/form-data">
					<div class="prodInfo">
						<div class="proda">
							<div class="prodName">
								<label>상품명</label>
							</div>
							<div class="prodText">
								<input type="text" class="titleText" name="prod_name" id="prod_name">
								<span class="explain">(ex.로얄캐닌 미니 인도어 퍼피 1.5kg) </span>
							</div>
						</div>
						<div class="proda">
							<div class="prodName">
								<label>가격</label>
							</div>
							<div class="prodText">
								<input type="text" class="priceText" name="prod_price" id="prod_price">
								<span class="prodSpan">원</span>
								<span class="explain">(상품의 가격은 숫자로 입력하세요. ex.50000 o ,500,00 x)</span>
							</div>
						</div>
						<div class="proda">
							<div class="prodName">
								<label>할인가</label>
							</div>
							<div class="prodText">
								<input type="text" class="priceText" name="prodsprice">
								<span class="prodSpan">원</span>
								<span class="explain">(상품의 가격은 숫자로 입력하세요.)</span>
							</div>
						</div>
						
						<div class="proda">
							<div class="prodName">
								<label>수량</label>
							</div>
							<div class="prodText">
								<input type="text" class="qtyText" name="prodqty" id="prod_qty">
								<span class="prodSpan">개</span>
								<span class="explain">(0~999 사이의 수량을 넣어주세요)</span>
							</div>
						</div>
						
						<div class="proda">
							<div class="prodName">
								<label>상품이미지</label>
							</div>
							<div class="prodText">
								<input type="file" id="prod_pimg" name="pimg">
								<span class="explain">(상품리스트에 나타나는 상품이미지 입니다.)</span>
							</div>
						</div>
						
						<div class="proda">
							<div class="prodName">
								<label>상품정보 이미지</label>
							</div>
							<div class="prodText">
								<input type="file" id="prod_img" name="img">
								<span class="explain">(상품상세화면에 상품정보이미지 입니다.)</span>
							</div>
						</div>
						
						<!-- 상품 옵션 부분 -->
						<div class="proda">
							<div class="prodName">
								<label>상품 옵션</label>
							</div>
							<div class="prodText">
								<input type="radio" id="prodRadio1"  onclick="opShow()"  name ="op" value="사용">사용
								<input type="radio" id="prodRadio2" onclick="opHide()" name ="op" value="미사용">미사용
							</div>
							<div class="opAdd">
								<input type="button" id="plus" value="옵션추가"/>
							</div>
						</div>
						
						<!-- 옵션을 받는 div -->
						<div class="radioChK">
						</div>
						
						<input type="hidden" id="chkNum" name="chkNum">
						<input type="hidden" id="menuOption" name="menuOption">
						<input type="hidden" id="dvsid" name="dvs_id" value="${dvs_id }">
						<input type="hidden" id="dvs_parent" name="dvs_parent" >
						
						<div class="prodb">
							<div class="prodButton">
								<input type="submit" value="상품등록" id="prodSubmit" class="buttonP">
							</div>
							<div class="prodButton">
								<input type="button" value="취소" id="prodCancel" class="buttonP">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	


	<!-- footer 시작 -->
	<%@include file="/WEB-INF/view/common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>