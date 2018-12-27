<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:forEach items="${prodList }" var = "list">
	<li>
		<a href="/shop/prodDetail?prod_id=${list.prod_id }">
			<img src="${list.prod_pimg }" width="250" height="250">
		<br>
		<span class="prodName">${list.prod_name }</span>
		<br>
		<c:choose>
			<c:when test="${list.prod_sprice != 0 }">
				
				<span class="price">
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.prod_price }" />원
				</span>
				<span class= "sprice">
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.prod_sprice }" />원
				</span>
			</c:when>
			<c:otherwise>
				<span class="sprice">
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.prod_price }" />원
				</span>
			</c:otherwise>
		</c:choose>
		
		</a>
	</li>
</c:forEach>