<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">
	// 보험상품 관리 버튼을 클릭하였을때 보험상품 안내 화면으로 이동하도록 설정 
	function goProdManager(){
		location.href ='/isr/goProdManager';
	}
	
	//보험신청/가입자 관리 버튼을 클릭하였을때  보험신청/가입자 관리 화면으로 이동
	function goApplyJoin(){
		location.href ='/isr/goApplyJoinManager';
	}
	
	//보험 청구 버튼을 클릭하였을때  보험신청/가입자 관리 화면으로 이동
	function goClaim(){
		location.href ='/isr/goClaim';
	}
	
	// 공지사항 관리 버튼을 클릭하였을때 공지사항 관리 화면으로 이동
	function goNoticeBoard(){
		location.href ='/isr/goNoticeBoard';
	}
</script>

<!-- 입력하여 content 넣는 부분 -->
<div id="insTitle">펫 보험 관리자용</div>
	<div id="insMenu">
		<div>
			<input class="insMenu2" id="insMenu3" onclick="goProdManager()" type="button" value="1.보험상품 관리">
		</div>
		<div>
			<input class="insMenu2" type="button" onclick="goApplyJoin()" value="2.보험 신청 / 가입 관리">
		</div>
		<div>
			<input class="insMenu2" type="button" onclick="goClaim()" value="3.보험금 청구 /입금관리">
		</div>
		<div>
			<input class="insMenu2" type="button" onclick="goNoticeBoard()" value="4.보험 공지사항 관리">
		</div>
	</div>
</div>
<!-- 나머지 한개의 div는 해당 화면에 있음 -->
	
