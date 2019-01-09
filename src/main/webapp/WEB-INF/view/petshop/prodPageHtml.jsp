<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<li class="page">
	<a href="javascript:prodListHtml(1,'${dvsVo.dvs_id }','${dvsVo.dvs_parent }');"> 
		<span>&laquo;</span>
	</a>
</li>

<c:choose>
	<c:when test="${page == 1 }">
		<li class="page">
			<a href="javascript:prodListHtml(1,'${dvsVo.dvs_id }','${dvsVo.dvs_parent }');"> 
				<span>&lt;</span>
			</a>
		</li>
	</c:when>
	<c:otherwise>
		<li class="page">
			<a href="javascript:prodListHtml(${page-1},'${dvsVo.dvs_id }','${dvsVo.dvs_parent }');"> 
				<span>&lt;</span>
			</a>
		</li>
	</c:otherwise>
</c:choose>

<c:forEach begin="1" end="${prodSize}" var="i">
	<li class="page">
		<a href="javascript:prodListHtml(${i },'${dvsVo.dvs_id }','${dvsVo.dvs_parent }')">
			<span>${i}</span>
		</a>
	</li>
</c:forEach>
<c:choose>
	<c:when test="${page == prodSize }">
		<li class="page">
			<a href="javascript:prodListHtml(${prodSize },'${dvsVo.dvs_id }','${dvsVo.dvs_parent }');"> 
				<span>&gt;</span>
			</a>
		</li>
	</c:when>
	<c:otherwise>
		<li class= "page">
			<a href="javascript:prodListHtml(${page+1 },'${dvsVo.dvs_id }','${dvsVo.dvs_parent }');"> 
				<span>&gt;</span>
			</a>
		</li>
	</c:otherwise>
</c:choose>
<li class="page">
	<a href="javascript:prodListHtml(${prodSize },'${dvsVo.dvs_id }','${dvsVo.dvs_parent }');">
		 <span>&raquo;</span>
	</a>
</li>