<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

품종은
<select class="ip1 wr1_2_3" name="petKindSelect" > 
	<option selected value="0">반려동물의 품종을 선택해주세요.</option>
	<c:forEach items="${petKindList}" var="petKind">
		<option value="${petKind.petk_id}" id="selectpet">${petKind.petk_name}</option>
	</c:forEach>
</select>
입니다
