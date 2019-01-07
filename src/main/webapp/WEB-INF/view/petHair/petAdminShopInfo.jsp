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
		
		//수정버튼 클릭이벤트
		$("#submitBtn").click(function(){
			
			if($("#file").val()==''){
				$("#file_change").val("no");
			} else {
				$("#file_change").val("yes");
			}
			
			
			
			alert("정보가 수정되었습니다");
			$("#upfrm").submit();
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
			<p>미용실 정보 관리</p>  
			<div class="shopInfo">
				<form action="/hairAdmin/updateShopInfo" method="post" enctype="multipart/form-data" id="upfrm">
					<%-- 프로필 사진 수정 / 등록 --%>
					<img src="/hairimg/${hsVo.has_img }" />
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
							 <input type="text" name="has_name" value="${hsVo.has_name }"/>	
						</div>
					</div>
					
					<div class="updateList">
						<div class="upTitle">
							<span>미용실 소개(프로필) : </span>
						</div>
						<div class="upInput">
							<textarea class="htext" name="has_ptext" >${hsVo.has_ptext }</textarea>
						</div>
					</div>
					
					<div class="updateList">
						<div class="upTitle">
							<span>미용실 소개(상세정보) :  </span> 
						</div>
						<div class="upInput">
							<textarea class="htext" name="has_text" >${hsVo.has_text }</textarea>
						</div>
					</div>
					
					<div class="updateList">
						<div class="upTitle">
							<span>미용실 주소 / 상세주소</span><br>
						</div>
						<div class="upInput">
								<input type="text" class="addrInput" id="has_addr" name="has_addr" value="${hsVo.has_addr }"/>
							 / <input type="text" id="has_addr2" name="has_addr2" value="${hsVo.has_addr2 }"/>
						</div>
					</div>
				</div>
					
					 <input type="hidden" name="mem_id" value="${memVo.mem_id }"/>
					 <input type="hidden" name="has_id" value="${hsVo.has_id}"/>
					 <input type="hidden" name="has_img" value="${hsVo.has_img}"/>
					 <input type="hidden" id="file_change" name="file_change" value="no"/>
				</form>
					 <input type="button" id="submitBtn" value="정보수정"/>
			</div>
			
			<div></div>
			<form action="/hairAdmin/updateStyle" method="post" id="stylefrm" enctype="multipart/form-data">
			<p>스타일 관리</p>
			<div class="shopStyleInfo">
				<div class="updateListCtnS">
				<c:choose>
					<c:when test="${styleList.size()!=0 }">
						<c:forEach items="${styleList }" var="sl" varStatus="index">
						<div class="updateListS">
							<div class="upTitleS">
								<img src="/hairimg/${sl.pts_img }"/> 
							</div>
							<div class="upInputS">
								<input type="file" name="imgfile${index.count }" class="file" />
								<br>
								스타일 명 : <input type="text" name="pts_name${index.count }" class="pts_name" value="${sl.pts_name }"/>
								<br>
								가격 : <input type="number" step="5000" min="0" max="5000000" name="pts_price${index.count }" class="pts_price" value="${sl.pts_price }"/>
								<br>
								사용여부 : 
								
								<c:choose>
									<c:when test="${sl.pts_del=='1' }">
										<select name="pts_del${index.count }">
											<option value="1" selected>사용</option>
											<option value="2">미사용</option>
										</select>
									
									</c:when>
									<c:otherwise>
										<select name="pts_del${index.count }">
											<option value="1">사용</option>
											<option value="2" selected>미사용</option>
										</select>
									
									</c:otherwise>
								</c:choose>
								 <input type="hidden" name="pts_img${index.count }" class="pts_img" value="${sl.pts_img }"/>
								 <input type="hidden" name="pts_id${index.count }" class="pts_id" value="${sl.pts_id }"/>
								 <input type="hidden" name="${sl.pts_id }${index.count }" class="imgchange" value="no"/>
							</div>
						</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="updateListS">
					 - 등록된 스타일이 없습니다
					 	</div>
					</c:otherwise>
				</c:choose>
				</div>
				<input type="hidden" name="mem_id" value="${memVo.mem_id}"/>
				<input type="hidden" name="listSize" value="${styleList.size() }"/>
				 <input type="submit" id="submitBtnS" value="정보수정"/>
			</div>
			</form>
			
			<p>스타일 추가하기</p>
			<form action="/hairAdmin/insertStyle" method="post" id="styleaddfrm" enctype="multipart/form-data">
			<div class="shopStyleInfo">
				<div class="updateListCtnS">
						<div class="updateListS">
							<div class="upTitleS">
								이미지를 추가해 주세요 
							</div>
							<div class="upInputS">
								<input type="file" name="imgfile" class="fileA" />
								<br>
								스타일 명 : <input type="text" name="pts_name" class="pts_nameA" value=""/>
								<br>
								가격 : <input type="number" step="5000" min="0" max="5000000" name="pts_price" class="pts_priceA" value=""/>
								<br>
								사용여부 : 
								
										<select name="pts_del" class="pts_delA">
											<option value="1" selected>사용</option>
											<option value="2">미사용</option>
										</select>
									
							</div>
						</div>
				</div>
					<input type="hidden" name="mem_id" value="${memVo.mem_id}"/>
			</div>
			</form>
				 <input type="button" id="submitBtnA" value="추가하기"/>
		</div>
	</div>
			
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
	
	<%-- style 수정용 form --%>
<!-- 	<form action="/hairAdmin/updateStyle" method="post" id="stylefrm" > -->
<!-- 		<input type="hidden" name="pts_name" id="hd_pts_name"/> -->
<!-- 		<input type="hidden" name="pts_price" id="hd_pts_price"/> -->
<!-- 		<input type="hidden" name="pts_del" id="hd_pts_del"/> -->
<!-- 		<input type="hidden" name="pts_id" id="hd_pts_id"/> -->
<!-- 	</form> -->
	


</body>

<script type="text/javascript">
	$(".file").change(function(){
		if($(this).val()!=''){
			
			$(this).parent(".upInputS").children(".imgchange").val("yes");
			
		} else {
			
			$(this).parent(".upInputS").children(".imgchange").val("no");
		}
		
		
	});
	
	$("#submitBtnA").click(function(){
		var miss = "";
		
		if($(".fileA").val()==''){
			miss += "스타일 이미지 / "
		}
		if($(".pts_nameA").val()==''){
			miss += "/ 스타일 이름 / "
		}
		if($(".pts_priceA").val()==''){
			miss += "/ 스타일 가격  "
		}
		
		if(miss!=""){
			
			alert(miss+" 항목을 입력해주세요");
			return;
		} else {
			$("#styleaddfrm").submit();
			
		}
		
		
	});
	
</script>

</html>
























