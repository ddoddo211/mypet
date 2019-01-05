<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		$(".closeBtn").click(function(){
			$(this).parent().parent().parent().attr("aria-hidden", "true");
			$(this).parent().parent().parent().attr("style", "display:none;");
			
 			$(this).parent().parent().parent().children().children("li").attr("class", "ui-tabs-tab ui-corner-top ui-state-default ui-tab");
 			$(this).parent().parent().parent().children().children("li").attr("aria-selected", "false");
 			$(this).parent().parent().parent().children().children("li").attr("aria-expanded", "false");
 			$(this).parent().parent().parent().children().children("li").attr("tabindex", "-1");
		});
		
		$(".tabOk").click(function(){
			$(this).parent().parent().submit();
		});
						
	});
	
</script>
<style>
	#tabs-2, #tabs-3, #tabs-4, #tabs-5, #tabs-6, #tabs-7, #tabs-8{
		width: 720px;
		z-index: 1;
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
		<form action="/sit/sitterTo" method="post">
			<ul class="tab_ul">
				<c:forEach items="${zipList }" var="zlist">
					<c:if test="${zlist.zip_high == '서울특별시' }">
						<li class="zipKind"><input type = "radio" name="zip" id="zipchk" value="${zlist.zip_low }"/><span class="tabFont">${zlist.zip_low }</span></li>
						<input type="hidden" name="zipHigh" value="${zlist.zip_high }" />
					</c:if>
				</c:forEach>
			</ul>
			<div id="tab_ok">
				<input type="button" class="tab_btn tabFont tabOk" value="확인" /> 
				<input type="button" class="tab_btn tabFont closeBtn" value="취소" />
			</div>
		</form>
	</div>
	<div id="tabs-3">
		<form action="/sit/sitterTo" method="post">
			<ul class="tab_ul">
				<c:forEach items="${zipList }" var="zlist">
					<c:if test="${zlist.zip_high == '대전광역시' }">
						<li class="zipKind"><input type = "radio" name="zip" id="zipchk" value="${zlist.zip_low }"/><span class="tabFont" >${zlist.zip_low }</span></li>
						<input type="hidden" name="zipHigh" value="${zlist.zip_high }" />
					</c:if>
				</c:forEach>
			</ul>
			<div id="tab_ok">
				<input type="button" class="tab_btn tabFont tabOk" value="확인" /> 
				<input type="button" class="tab_btn tabFont closeBtn" value="취소" />
			</div>
		</form>
	</div>
	<div id="tabs-4">
		<form action="/sit/sitterTo" method="post">
			<ul class="tab_ul">
				<c:forEach items="${zipList }" var="zlist">
					<c:if test="${zlist.zip_high == '경기도' }">
						<li class="zipKind"><input type = "radio" name="zip" id="zipchk" value="${zlist.zip_low }"/><span class="tabFont">${zlist.zip_low }</span></li>
						<input type="hidden" name="zipHigh" value="${zlist.zip_high }" />
					</c:if>
				</c:forEach>
			</ul>
			<div id="tab_ok">
				<input type="button" class="tab_btn tabFont tabOk" value="확인" /> 
				<input type="button" class="tab_btn tabFont closeBtn" value="취소" />
			</div>
		</form>
	</div>
	<div id="tabs-5">
		<form action="/sit/sitterTo" method="post">
			<ul class="tab_ul">
				<c:forEach items="${zipList }" var="zlist">
					<c:if test="${zlist.zip_high == '인천광역시' }">
						<li class="zipKind"><input type = "radio" name="zip" id="zipchk" value="${zlist.zip_low }"/><span class="tabFont">${zlist.zip_low }</span></li>
						<input type="hidden" name="zipHigh" value="${zlist.zip_high }" />
					</c:if>
				</c:forEach>
			</ul>
			<div id="tab_ok">
				<input type="button" class="tab_btn tabFont tabOk" value="확인" /> 
				<input type="button" class="tab_btn tabFont closeBtn" value="취소" />
			</div>
		</form>
	</div>
	
	<div id="tabs-6">
		<form action="/sit/sitterTo" method="post">
			<ul class="tab_ul">
				<c:forEach items="${zipList }" var="zlist">
					<c:if test="${zlist.zip_high == '광주광역시' }">
						<li class="zipKind"><input type = "radio" name="zip" id="zipchk" value="${zlist.zip_low }"/><span class="tabFont">${zlist.zip_low }</span></li>
						<input type="hidden" name="zipHigh" value="${zlist.zip_high }" />
					</c:if>
				</c:forEach>
			</ul>
			<div id="tab_ok">
				<input type="button" class="tab_btn tabFont tabOk" value="확인" /> 
				<input type="button" class="tab_btn tabFont closeBtn" value="취소" />
			</div>
		</form>
	</div>
	<div id="tabs-7">
		<form action="/sit/sitterTo" method="post">
			<ul class="tab_ul">
				<c:forEach items="${zipList }" var="zlist">
					<c:if test="${zlist.zip_high == '대구광역시' }">
						<li class="zipKind"><input type = "radio" name="zip" id="zipchk" value="${zlist.zip_low }"/><span class="tabFont">${zlist.zip_low }</span></li>
						<input type="hidden" name="zipHigh" value="${zlist.zip_high }" />
					</c:if>
				</c:forEach>
			</ul>
			<div id="tab_ok">
				<input type="button" class="tab_btn tabFont tabOk" value="확인" /> 
				<input type="button" class="tab_btn tabFont closeBtn" value="취소" />
			</div>
		</form>
	</div>
	<div id="tabs-8">
		<form action="/sit/sitterTo" method="post">
			<ul class="tab_ul">
				<c:forEach items="${zipList }" var="zlist">
					<c:if test="${zlist.zip_high == '부산광역시' }">
						<li class="zipKind"><input type = "radio" name="zip" id="zipchk" value="${zlist.zip_low }"/><span class="tabFont">${zlist.zip_low }</span></li>
						<input type="hidden" name="zipHigh" value="${zlist.zip_high }" />
					</c:if>
				</c:forEach>
			</ul>
			<div id="tab_ok">
				<input type="button" class="tab_btn tabFont tabOk" value="확인" /> 
				<input type="button" class="tab_btn tabFont closeBtn" value="취소" />
			</div>
		</form>
	</div>
</div>
