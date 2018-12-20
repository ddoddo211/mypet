<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:forEach items="${prodList }" var = "list">
	<li>
		<a href="/shop/prodDetail?prod_id=${list.prod_id }">
			<img src="${list.prod_pimg }" width="250" height="250">
		<br>
		<span>${list.prod_name }</span>
		<br>
		<span>${list.prod_price }원</span>
		<span>${list.prod_sprice }원</span>
		</a>
	</li>
</c:forEach>