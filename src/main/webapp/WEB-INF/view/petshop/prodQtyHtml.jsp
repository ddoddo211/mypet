<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<span class ="cartPirce"><fmt:formatNumber type="number" value="${price }" pattern="#,###"></fmt:formatNumber></span><span>원</span>
<input type="hidden" value ="${price }" id ="cartprice" />