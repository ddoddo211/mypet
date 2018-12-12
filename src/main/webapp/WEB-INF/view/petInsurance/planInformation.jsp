<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>planInformation.jsp(플랜정보)</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">

function prodAdd(){
	location.href ='/isr/productInfo';
}

</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>
<!-- header 시작 -->
<%@include file="../common/header.jsp"%>
<!-- header 끝-->

	<div id="headerMain">
		<!-- main content -->
			<div id="header">
				<%--main --%>
				<div id="logo">
					<a href="/common/main.jsp"><img alt="이미지가 없습니다" src="/img/petInsuranceLogo2.jpg" width="200px;"></a>
				</div>
				<div id="petSearch">
					<div id="word">
						<input type="text" id="search" value="검색어를 입력하세요" onfocus="this.value=''" style="color:#c1c1c1" />
					</div>
					<div id="searchButton">
						<a href="#" id="searchButton"></a>
					</div>
				</div>
				
				<!-- 우리 아이 등록하기 -->
				<div id="petInsert">
					<a href="#"><img alt="이미지가 없습니다" src="/img/petInsert.jpg" width="240px;" height="100px;"></a>
				</div>
			</div>
	</div>
	
<div id="main">	
	<!-- 여기부터 나의 body -->

		<!-- petInsuranceHeaderMain -->
		<%@include file="./petInsuranceHeaderMain.jsp"%>
		<!-- petInsuranceHeaderMain 끝 -->
		
		<div id="petInfoTable">
			<div id="petInfoTableTop">
				<div id="pettitle">
					가입가능한 나의 펫 
				</div>
				<div id="petBtn">
					<div id="petInsert2">
						<button id="petIsBtn">펫 추가하기</button>
					</div>
					<div id="petDelete">
						<button id="petdBtn">펫 삭제하기</button>
					</div>
				</div>
			</div>
				<div id="pettitle2">
					* 원하시는 나의 펫이 없을때에는 펫 추가하시기 바랍니다.
				</div>
			<div id="petTable">
				<table>
						<tr class="tr2">
							<th class="td6">선택</th>
							<th class="td3">가입대상</th>
							<th class="td2">이름</th>
							<th class="td2">성별</th>
							<th class="td2">생년월일</th>
							<th class="td2">질병</th>
							<th class="td2">종류</th>
							<th class="td4">가입되어 있는 보험상품</th>
						</tr>
						
						<c:forEach items="${mypetList}" var="pet">
							<tr class="tr2" id="td5">
								<td class="td6"><input type="checkbox" id="cb1"><label for="cb1"></label></td>
								<td class="td3">${pet.myp_img}</td>
								<td class="td2">${pet.myp_name}</td>
								<td class="td2">${pet.myp_gender}</td>
								<td class="td2">
									<fmt:formatDate value="${pet.myp_birth}" pattern="yy년-MM월-dd일"></fmt:formatDate>
								</td>
								<td class="td2">${pet.myp_sick}</td>
								<td class="td2">${pet.petk_name}(${pet.myp_size})</td>
								<td class="td4">가입되어 있는 보험상품</td>
							</tr>
						</c:forEach>	
				</table>
			</div>
		</div>
		
		<div id="insuranceProdTable">
			<div id="insuranceProdTableTop">
				<div id="isTitle">
					플랜정보에 추가한 보험상품 
				</div>
				<div id="prodBtn">
					<div id="insuranceProdInsert">
						<button id="insuranceProdIsBtn" onclick="prodAdd()">보험상품 추가</button>
					</div>
					<div id="insuranceProdDelete">
						<button id="insuranceProdDlBtn">보험상품 삭제</button>
					</div>
				</div>
			</div>
			
			<div id="insuranceProdTableTop2">
				* "플랜 정보에 추가한 보험상품"부분은 회원님이 상품안내에서 추가한 보험상품입니다.
			</div>
			
			<div id="petTable">
				<table>
						<tr class="tr7">
							<th class="td11">선택</th>
							<th class="td8">나의펫선택</th>
							<th class="td9">보험상품</th>
							<th class="td9">가입대상</th>
							<th class="td9">보험이름</th>
							<th class="td9">월보험료</th>
							<th class="td12">가입연령</th>
							<th class="td9">보장기간</th>
							<th class="td12">질병여부</th>
							<th class="td10">보험가입</th>
						</tr>
						<c:forEach items="${memIsrList}" var="prodVo">
							<tr class="tr7">
								<td class="td11"><input type="checkbox" id="cb2"><label for="cb2"></label></td>
								<td class="td8">
									<select name="petSelect">
									  <c:forEach items="${mypetList}" var="petSelect">
									  	<option value="${petSelect.myp_name}">${petSelect.myp_name}</option>
									  </c:forEach>
									</select>
								</td>
								<td class="td9">${prodVo.insp_name}</td>
								<c:choose>
									<c:when test = "${prodVo.insp_join == '강아지'}">
										<td class="td9"><img alt="이미지가 없습니다" src="/img/petInsurance/petKind.jpg" width="40px" height="40px">${prodVo.insp_join}</td>
									</c:when>
									<c:otherwise>
										<td class="td9"><img alt="이미지가 없습니다" src="/img/petInsurance/petKind2.jpg" width="40px" height="40px">${prodVo.insp_join}</td>
									</c:otherwise>
								</c:choose>
								<td class="td9">${prodVo.insp_kind}</td>
								<td class="td9"><%="월 "%>${prodVo.insp_fees}<%="원"%></td>
								<td class="td12">${prodVo.insp_minage}<%="~"%>${prodVo.insp_maxage}<%="세"%></td>
								<td class="td9"><%="가입부터 ~"%>${prodVo.insp_period}<%="세 까지"%></td>
								<td class="td12">${prodVo.insp_sick}</td>
								<td class="td10"><input type="submit" value="가입하기"></td>
							</tr>
						</c:forEach>
						
				</table>
			</div>
		
	</div>

</div>

</body>

	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</html>