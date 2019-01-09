<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <script type="text/javascript">
	// 보험상품 관리 버튼을 클릭하였을때 보험상품 안내 화면으로 이동하도록 설정 
	function goProdManager(){
		location.href ='';
	}
	
	//보험신청/가입자 관리 버튼을 클릭하였을때  보험신청/가입자 관리 화면으로 이동
	function goApplyJoin(){
		location.href ='';
	}
	
	//보험 청구 버튼을 클릭하였을때  보험신청/가입자 관리 화면으로 이동
	function goClaim(){
		location.href ='/shopAdmin/seller?page=1&pageSize=10';
	}
	
	// 공지사항 관리 버튼을 클릭하였을때 공지사항 관리 화면으로 이동
	function goNoticeBoard(){
		location.href ='';
	}
</script>   
	<!-- header 시작 -->
	<%@include file="/WEB-INF/view/common/header.jsp"%>
	<!-- header 끝-->

    <div id="adminMenu">
		<%@include file="../adminHeader.jsp"%>
	</div>
	
	<div id="mainTop">
		<div id="shopTitle">펫 쇼핑몰 관리자용</div>
		<div id="shopMenu">
			<div class="shopMenu1">
				<input class="shopMenu2" type="button" onclick="goProdManager()"  value="1.상품 관리">
			</div>
			<div>
				<input class="shopMenu2" type="button" onclick="goApplyJoin()" value="2.이벤트 관리">
			</div>
			<div>
				<input class="shopMenu2" type="button" onclick="goClaim()" value="3.판매자 관리">
			</div>
		</div>
	</div>