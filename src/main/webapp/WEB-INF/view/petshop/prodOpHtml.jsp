<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="opQtyChk">
	<div class="opName">
		<span>${prodoVo.prodo_name }</span>
		<c:if test="${prodoVo.prodo_price != 0 }">
			<span>추가금 : </span><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${prodoVo.prodo_price }" /></span>
		</c:if>
	</div>
	<div class=opQty2>
	    <input type="hidden" value="${prodoVo.prodo_qty}" class="prodo_qty" />
		<input type="hidden" value="${prodoVo.prodo_id }" name="prodo_id" class="prodo_id"/>
		<button class="minusBtn"><img src="/shopimg/minus.png" height=20" /></button>
		<input  type="text" name="Quantity" class="qty" name="qty" value="1" min="1" readonly />
		<button class="plusBtn"><img src="/shopimg/plus.png" height="20" /></button>
	</div>
</div>