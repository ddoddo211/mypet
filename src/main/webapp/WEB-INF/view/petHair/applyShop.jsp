<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link  href="/css/petHair.css" rel="stylesheet"/>
<link  href="/css/petHairMyPage.css" rel="stylesheet"/>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <%--다음 주소 api --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<%-- 스크립트 위치 --%>

<script type="text/javascript">
		if('${memVo}'==''){
			alert("로그인이 필요합니다");
			location.href="/hair/hairMain";
		}
	$(document).ready(function(){
		
		$(".addrInput").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		        	 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    //document.getElementById("has_addr2").value = extraAddr;
	                
	                } else {
	                   // document.getElementById("has_addr2").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                //document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("has_addr").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("has_addr2").focus();	
	                
		        }
		    }).open();
			
		});
		
		
	});

</script>

</head>
<body>
	<!-- header 시작 -->
	<%@include file="../common/header.jsp"%>
	<!-- header 끝-->
	
	<!-- header 시작 -->
	<%@include file="petHairHeader.jsp"%>
	<!-- header 끝-->
	
	<%-- 전체 틀 div --%>
	<div id="mainmid">
		<%@include file="petMypageLeft.jsp"%>
		
		<div class="mpMainSi">
			
			<c:choose>
				<c:when test="${apply.equals('no') }">
					<p>미용실 지원하기</p>  
					<div class="shopInfo">
						<form action="/hairAdmin/insertApplyShop" method="post" enctype="multipart/form-data" id="upfrm">
							<%-- 프로필 사진 수정 / 등록 --%>
							<img src="/hairimg/testImg.jpg" />  - 미용실이미지를 추가해주세요 -
							<br>
						<div class="updateListCtn">
							<div class="updateList">
								<div class="upTitle">
									<span>프로필사진 : </span>
								</div>
								<div class="upInput">
									<input type="file" name="imgfile" id="file" />
								</div>
							</div>
							
							<div class="updateList">
								<div class="upTitle">
									<span>미용실명 : </span>
								</div>
								<div class="upInput">
									 <input type="text" name="hsa_name" class="hsa_name has_name" value=""/>	
								</div>
							</div>
							
							<div class="updateList">
								<div class="upTitle">
									<span>미용실 소개(프로필) : </span>
								</div>
								<div class="upInput">
									<textarea class="hsa_ptext has_ptext htext" name="hsa_ptext" ></textarea>
								</div>
							</div>
							
							<div class="updateList">
								<div class="upTitle">
									<span>미용실 소개(상세정보) :  </span> 
								</div>
								<div class="upInput">
									<textarea class="hsa_text htext" name="hsa_text" ></textarea>
								</div>
							</div>
							
							<div class="updateList">
								<div class="upTitle">
									<span>미용실 주소 / 상세주소</span><br>
								</div>
								<div class="upInput">
										<input type="text" id="has_addr" class="hsa_addr addrInput" name="hsa_addr" value=""/>
									 / <input type="text" id="has_addr2" class="hsa_addr2" name="hsa_addr2" value=""/>
								</div>
							</div>
						</div>
							
							 <input type="hidden" name="mem_id" value="${memVo.mem_id }"/>
						</form>
							 <input type="button" id="submitBtn" value="지원하기"/>
					</div>
				</c:when>
				<c:otherwise>
					${memVo.mem_id } 님 등록신청 대기상태입니다 <br>
					
					<table border="1">
						<thead>
							<tr>
								<th>미용실명</th>
								<th>프로필소개</th>
								<th>등록 상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${hsaVo.hsa_name }</td>
								<td>${hsaVo.hsa_ptext }</td>
								<td>${hsaVo.hsa_acp }</td>
							</tr>
						</tbody>
					
					
					</table>
					
				</c:otherwise>
			</c:choose>
			
			
			
		</div>
	</div>
			
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
	
	


</body>

<script type="text/javascript">

$("#submitBtn").click(function(){
	var miss = "";
	
	if($("#file").val()==''){
		miss += "미용실 이미지 / "
	}
	if($(".hsa_name").val()==''){
		miss += "/ 미용실 이름 / "
	}
	if($(".hsa_addr").val()==''){
		miss += "/ 미용실 주소 / "
	}
	if($(".hsa_addr2").val()==''){
		miss += "/ 상세 주소 / "
	}
	if($(".hsa_ptext").val()==''){
		miss += "/ 프로필소개 / "
	}
	if($(".hsa_text").val()==''){
		miss += "/ 상세소개 / "
	}
	
	if(miss!=""){
		
		alert(miss+" 항목을 입력해주세요");
		return;
	} else {
		$("#upfrm").submit();
		
	}
	
	
});
	
	
</script>

</html>
























