<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

품종은
<select id="wr1_2_3" class="ip1"> 
	<c:forEach items="${petKindList}" var="petKind">
		<option>${petKind.petk_name}</option>
	</c:forEach>
</select>
입니다
