<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		$(".closeBtn").click(function(){
			$("#tabs-2").hide();
			$("#tabs-3").hide();
			$("#tabs-4").hide();
			$("#tabs-5").hide();
			$("#tabs-6").hide();
			$("#tabs-7").hide();
			$("#tabs-8").hide();
		});
	});
</script>
<style>
	#tabs-2, #tabs-3, #tabs-4, #tabs-5, #tabs-6, #tabs-7, #tabs-8{
		width: 720px;
	}
	.zipKind {
		float : left;
		font-family: font-family: 'Nanum Brush Script', cursive;
		font-size : 20px;
	    display: list-item;
    	text-align: -webkit-match-parent;
    	list-style: none;
    	margin-right : 20px;
    	width:100px;
	}
	.tab_ul{
		border: 0;
	    outline: 0;
	    font-size: 100%;
	    margin: 0;
	    padding: 0;
	    width : 100%;
	}
	.tabFont{
		font-family : 'Nanum Brush Script', cursive;
		font-size : 28px;
	}
	#zipchk{
		margin-right : 15px;
	}
	
	#tab_ok{
	    width: 100%;
	    height: 60px;
	    float: right;
	    margin-top: 10px;
	    padding: 10px 0px 0px 0px
	}
	
	.tab_btn{
		padding : 7px;
		border-radius : 7px;
		background-color : #17aaff;
		color : #fff;
		cursor : pointer;
	}
</style>
<div id="tabs">
	<ul>
		<li><a href="#tabs-1">전체</a></li>
		<li><a href="#tabs-2">서울</a></li>
		<li><a href="#tabs-3">대전</a></li>
		<li><a href="#tabs-4">경기</a></li>
		<li><a href="#tabs-5">인천</a></li>
		<li><a href="#tabs-6">광주</a></li>
		<li><a href="#tabs-7">대구</a></li>
		<li><a href="#tabs-8">부산</a></li>
	</ul>
	<div id="tabs-2">
		<ul class="tab_ul">
			<c:forEach items="${zipList }" var="zlist">
				<c:if test="${zlist.zip_high == '서울' }">
					<li class="zipKind"><input type = "radio" name="zip" id="zipchk"/><span class="tabFont">${zlist.zip_low }</span></li>
				</c:if>
			</c:forEach>
		</ul>
		<div id="tab_ok">
			<button class="tab_btn"><span class="tabFont">확인</span></button> 
			<button class="tab_btn closeBtn"><span class="tabFont">취소</span></button>
		</div>
	</div>
	<div id="tabs-3">
		<div >
		<ul class="tab_ul">
			<c:forEach items="${zipList }" var="zlist">
				<c:if test="${zlist.zip_high == '대전' }">
					<li class="zipKind"><input type = "radio" name="zip" id="zipchk"/><span class="tabFont">${zlist.zip_low }</span></li>
				</c:if>
			</c:forEach>
		</ul>
		</div>
		<div id="tab_ok">
			<button class="tab_btn"><span class="tabFont">확인</span></button> <button class="tab_btn closeBtn"><span class="tabFont">취소</span></button>
		</div>
	</div>
	<div id="tabs-4">
		<ul class="tab_ul">
			<c:forEach items="${zipList }" var="zlist">
				<c:if test="${zlist.zip_high == '경기' }">
					<li class="zipKind"><input type = "radio" name="zip" id="zipchk"/><span class="tabFont">${zlist.zip_low }</span></li>
				</c:if>
			</c:forEach>
		</ul>
		<div id="tab_ok">
			<button class="tab_btn"><span class="tabFont">확인</span></button> <button class="tab_btn closeBtn"><span class="tabFont">취소</span></button>
		</div>
	</div>
	<div id="tabs-5">
		<ul class="tab_ul">
			<c:forEach items="${zipList }" var="zlist">
				<c:if test="${zlist.zip_high == '인천' }">
					<li class="zipKind"><input type = "radio" name="zip" id="zipchk"/><span class="tabFont">${zlist.zip_low }</span></li>
				</c:if>
			</c:forEach>
		</ul>
		<div id="tab_ok">
			<button class="tab_btn"><span class="tabFont">확인</span></button> <button class="tab_btn closeBtn"><span class="tabFont">취소</span></button>
		</div>
	</div>
	
	<div id="tabs-6">
		<ul class="tab_ul">
			<c:forEach items="${zipList }" var="zlist">
				<c:if test="${zlist.zip_high == '광주' }">
					<li class="zipKind"><input type = "radio" name="zip" id="zipchk"/><span class="tabFont">${zlist.zip_low }</span></li>
				</c:if>
			</c:forEach>
		</ul>
		<div id="tab_ok">
			<button class="tab_btn"><span class="tabFont">확인</span></button> <button class="tab_btn closeBtn"><span class="tabFont">취소</span></button>
		</div>
	</div>
	<div id="tabs-7">
		<ul class="tab_ul">
			<c:forEach items="${zipList }" var="zlist">
				<c:if test="${zlist.zip_high == '대구' }">
					<li class="zipKind"><input type = "radio" name="zip" id="zipchk"/><span class="tabFont">${zlist.zip_low }</span></li>
				</c:if>
			</c:forEach>
		</ul>
		<div id="tab_ok">
			<button class="tab_btn"><span class="tabFont">확인</span></button> <button class="tab_btn closeBtn"><span class="tabFont">취소</span></button>
		</div>
	</div>
	<div id="tabs-8">
		<ul class="tab_ul">
			<c:forEach items="${zipList }" var="zlist">
				<c:if test="${zlist.zip_high == '부산' }">
					<li class="zipKind"><input type = "radio" name="zip" id="zipchk"/><span class="tabFont">${zlist.zip_low }</span></li>
				</c:if>
			</c:forEach>
		</ul>
		<div id="tab_ok">
			<button class="tab_btn"><span class="tabFont">확인</span></button> <button class="tab_btn closeBtn"><span class="tabFont">취소</span></button>
		</div>
	</div>
</div>
