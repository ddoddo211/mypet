<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
		margin-top: 25px;
		background-color: #f1f1f1;
		border-radius: 20px;
	}
	
	.prodUpdate{
		margin-left: 20px;
	}
	
	#mainmid .prodUpdate .proda{
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
	
	input.upload_text {/*읽기전용 인풋텍스트*/
		float:left;
		width:200px;/* 버튼 포함 전체 가로 길이*/
		height:24px;
		line-height:19px;
		border:1px solid #bbb;
	}

	div#upload-btn_wrap input.imgBtn {/*파일찾기 폼 투명하게*/
		position:absolute;
		top:1px;
		right:0;
		cursor:pointer;
		opacity:0;
	}
	div#upload-btn_wrap {/*버튼테두리 감싼 div*/
		position:relative;
		float:left;
		width:80px;/*width, height 값은 button(찾아보기)값과 같아야함 */
		height:30px;
		padding-left:3px;
	}
	div#upload-btn_wrap button {/*버튼 div*/
		width:80px;
		height:24px;
		font-weight:bold;
		background:#333;
		border:1px solid #333;
		color:#fff;
		margin-top: 1px;
	}
	
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		// 취소버튼 클릭시
		$("#prodCancel").click(function() {
			location.href = "/shop/prodDetail?dvs_id=${dvsVo.dvs_id}&dvs_parent=${dvsVo.dvs_parent}&prod_id=${prodVo.prod_id}";
		})
		
		
		//--------- 파일추가 css해서 value값 넘겨주기 --------------------
		$('#upload_text').val('');

		$('#pimg').change(function() {
			var i = $(this).val();
			$('#upload_text').val(i);
		});
		
		$('#img').change(function() {
			var i = $(this).val();
			$('#upload_text2').val(i);
		});
		//--------------------------------------------------------
		
		var chk=0;
		
		// 상품에 옵션이 있을 경우
		if('${chkNum}' != ''){
			chk=parseInt('${chkNum}');
		}
		
		//옵션 추가 
		$("#plus").click(function() {
			++chk;
			$(".radioChK").append(
					"<div class=\"proda\"> <div class=\"opDvs1\"><div class=\"prodName\"><label>옵션명</label></div>"
					+"<div class=\"prodText\"><input type=\"text\" name=\"opName"+chk+"\"><span class=\"explain\"></span></div></div>"
					+"<div class=\"opDvs2\"><div class=\"prodName\"><label>옵션수량</label></div>"
					+"<div class=\"prodText\"><input type=\"text\" class=\"qtyText\" name=\"opQty"+chk+"\"><span class=\"prodSpan\">개</span></div></div>"
					+"<div class=\"opDvs3\"><div class=\"prodName\"><label>추가금액</label></div><div class=\"prodText\">"
					+"<input type=\"text\" class=\"priceText\" name=\"opPrice"+chk+"\">"
					+"<span class=\"prodSpan\">원</span>	</div></div></div>"
				);
			$("#chkNum").val(chk);
		})
		
		$("#chkNum").val(chk);
		
		$(".minus").click(function() {
			$(this).parent().parent().parent().remove();
		})
		
	})
	
	function count() {
		var  count = 0;
		$(".prodoList").each(function() {
			count++;	
		});
		
		return count;
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>
	
	<div id="maintop">
		<p>상품 수정</p>
	</div>
	
	<div id="mainmid">
		<div class="prodUpdate">
			<form method="post" action="/shop/prodUpdate" enctype="multipart/form-data">
				<div class="prodInfo">
					<div class="proda">
						<div class="prodName">
							<label>상품명</label>
						</div>
						<div class="prodText">
							<input type="text" class="titleText" name="prod_name" id="prod_name" value="${prodVo.prod_name }">
							<span class="explain">(ex.로얄캐닌 미니 인도어 퍼피 1.5kg) </span>
						</div>
					</div>
					
					<div class="proda">
						<div class="prodName">
							<label>가격</label>
						</div>
						<div class="prodText">
							<input type="text" class="priceText" name="prod_price" id="prod_price" value="${prodVo.prod_price }">
							<span class="prodSpan">원</span>
							<span class="explain">(상품의 가격은 숫자로 입력하세요. ex.50000 o ,500,00 x)</span>
						</div>
					</div>
					
					<div class="proda">
						<div class="prodName">
							<label>할인가</label>
						</div>
						<div class="prodText">
							<input type="text" class="priceText" name="prod_sprice" value="${prodVo.prod_sprice }">
							<span class="prodSpan">원</span>
							<span class="explain">(상품의 가격은 숫자로 입력하세요.)</span>
						</div>
					</div>
					
					<div class="proda">
						<div class="prodName">
							<label>수량</label>
						</div>
						<div class="prodText">
							<input type="text" class="qtyText" name="prodqty" id="prod_qty" value="${prodVo.prod_qty }">
							<span class="prodSpan">개</span>
							<span class="explain">(0~999 사이의 수량을 넣어주세요)</span>
						</div>
					</div>
					
					<div class="proda">
						<div class="prodName">
							<label>상품프로필 이미지변경</label>
						</div>
						<div class="prodText">
							<input type="text" id="upload_text" class="upload_text" readonly="readonly">
							<!--button-->
							<div id="upload-btn_wrap">
								<button type="button" title="파일찾기">
							   	<span>파일찾기</span>  
								</button>
								<input type="file" id="pimg" class="imgBtn" title="파일찾기" name="pimg">
							</div>
							<span class="explain">(이미지를 첨부하지 않을 시 사용하고 있는 상품 이미지 사용)</span>
						</div>
					</div>
					
					<div class="proda">
						<div class="prodName">
							<label>상품정보 이미지변경</label>
						</div>
						<div class="prodText">
							<input type="text" id="upload_text2" class="upload_text" readonly="readonly">
							<!--button-->
							<div id="upload-btn_wrap">
								<button type="button" title="파일찾기">
								<span>파일찾기</span>  
								</button>
								<input type="file" id="img" class="imgBtn" title="파일찾기" name="img">
							</div>
							<span class="explain">(이미지를 첨부하지 않을 시 사용하고 있는 상품 이미지 사용)</span>
						</div>
					</div>
					
					<c:if test="${prodoList.size() != 0}">
						<!-- 상품 옵션 부분 -->
						<div class="proda">
							<div class="prodName">
								<label>상품 옵션</label>
							</div>
							<div class="opAdd">
								<input type="button" id="plus" value="옵션추가"/>
							</div>
						</div>
					</c:if>
					
					<c:if test="${prodoList.size() != 0}">
						<input type ="hidden" id="chkInfo" />
						<c:set var="chk" value="${chkNum }" />
						<c:forEach items="${prodoList }" var="list">
							
							<!-- 옵션을 받는 div -->
							<div class="prodoList">
								<div class="proda"> 
									
									<div class="opDvs1">
										<div class="prodName">
											<label>옵션명</label>
										</div>
										<div class="prodText">
											<input type="text" name="opName${chk }" value="${list.prodo_name }"><span class="explain"></span>
										</div>
									</div>
									
									<div class="opDvs2">
										<div class="prodName">
											<label>옵션수량</label>
										</div>
										<div class="prodText">
											<input type="text" class="qtyText" name="opQty${chk }" value="${list.prodo_qty }"><span class="prodSpan">개</span>
										</div>
									</div>
									
									<div class="opDvs3">
										<div class="prodName">
											<label>추가금액</label>
										</div>
										<div class="prodText">
											<input type="text" class="priceText" name="opPrice${chk }" value="${list.prodo_price }">
											<span class="prodSpan">원</span>	
										</div>
									</div>
									<div class="opAdd">
										<input type="button" class="minus" value="옵션 삭제"/>
									</div>
								</div>
							</div>
							<c:set var="chk" value="${chk-1}"/>
						</c:forEach>
						<div class="radioChK">
						</div>
					</c:if>
					
					<input type ="hidden" name="prod_pimg" value="${prodVo.prod_pimg }" />
					<input type="hidden" name ="prod_img" value="${prodVo.prod_img }" />
					<input type="hidden" name="prod_id" value="${prodVo.prod_id }" />
					<input type="hidden" id="chkNum" name="chkNum" />
					<input type="hidden" id="dvsid" name="dvs_id" value="${dvsVo.dvs_id }" />
					<input type="hidden" id="dvs_parent" name="dvs_parent" value="${dvsVo.dvs_parent }" />
					
					<div class="prodb">
						<div class="prodButton">
							<input type="submit" value="상품수정" id="prodSubmit" class="buttonP">
						</div>
						<div class="prodButton">
							<input type="button" value="취소" id="prodCancel" class="buttonP">
						</div>
					</div>
					</div>
				</form>
			</div>
	</div>
	
	<!-- footer 시작 -->
	<%@include file="/WEB-INF/view/common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>