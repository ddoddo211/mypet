<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">
$(document).ready(function() {
	// 보험상품 관리 버튼을 클릭하였을때 보험상품 안내 화면으로 이동하도록 설정 
	$("#insMenu3").click(function(){
		goProdManager();
	});
	
	// 보험상품 관리 버튼을 클릭하였을때 보험상품 안내 화면으로 이동하도록 설정 
	function goProdManager(){
		location.href ='/isr/goProdManager';
	}
});
	
</script>

<!-- 입력하여 content 넣는 부분 -->
<div id="insTitle">펫 보험 관리자용</div>
	<div id="insMenu">
		<div>
			<input class="insMenu2" id="insMenu3" type="button" value="1.보험상품 관리">
		</div>
		<div>
			<input class="insMenu2" type="button" value="2.보험 신청 / 가입 관리">
		</div>
		<div>
			<input class="insMenu2" type="button" value="3.보험 청구 관리">
		</div>
		<div>
			<input class="insMenu2" type="button" value="4.보험 입금 관리">
		</div>
		<div>
			<input class="insMenu2" type="button" value="5.보험 공지사항 관리">
		</div>
	</div>
	</div>
<!-- 나머지 한개의 div는 해당 화면에 있음 -->
	
