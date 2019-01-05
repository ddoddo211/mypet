<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:forEach items="${prodList }" var = "list">
	<li>
		<a href="/shop/prodDetail?dvs_id=${dvsVo.dvs_id }&dvs_parent=${dvsVo.dvs_parent }&prod_id=${list.prod_id }">
			<img src="${list.prod_pimg }" width="250" height="250">
		<br>
		<span class="prodName">${list.prod_name }</span>
		<br>
		<c:choose>
			<c:when test="${list.prod_sprice != 0 }">
				
				<span class="price">
					<fmt:formatNumber type="number" value="${list.prod_price }" pattern="#,###" />원
				</span>
				<span class= "sprice">
					<fmt:formatNumber type="number" value="${list.prod_sprice }" pattern="#,###" />원
				</span>
			</c:when>
			<c:otherwise>
				<span class="sprice">
					<fmt:formatNumber type="number" value="${list.prod_price }" pattern="#,###" />원
				</span>
			</c:otherwise>
		</c:choose>
		
		</a>
	</li>
</c:forEach>