<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memMypage.jsp(마이페이지)</title>

  <%--다음 주소 api --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style type="text/css">

#main{	
	width: 1200px;
	height: 0 auto;
	margin: 0 auto;
	margin-bottom: 20px;
}

#memMypage{
	width: 1200px;
	height: 596px;
}

#memMypage2{
	width: 1000px;
	height: 680px;
	margin-left: 100px;
	margin-top: 50px;
}

#memMypage3{
	width: 1000px;
	height: 50px;
}

#memMypage4{
	width: 1000px;
	height: 577px;
}

#memMypage3_1 {
    width: 450px;
    height: 40px;
    line-height: 40px;
	font-family: 'Nanum Pen Script', cursive;
	font-size: 50px;
    background-color: #fff6dd;
    text-align: center;
    float: left;
    border-radius: 3px;
    box-shadow: 3px 3px 3px 3px #999;
    border-right: none;
    margin-left: 275px;
    margin-bottom: 10px;
}


#accident{
	height: 205px;
	margin-top: 20px;
}


#accident1{
	height: 230px;
	width: 800px;
	margin-left: 10px;
}

.accident2{
	height: 50px;
	width: 800px;
}



.accident2_1{
	width: 150px;
    float: left;
    font-family: 'Jeju Gothic', sans-serif;
    font-size: 20px;
    margin-bottom: 10px;
    background-color: #ffcce7;
    color: white;
    width: 150px;
    border-radius: 50px;
    text-align: center;
    padding: 5px;
}

.accident2_2{
	width: 200px;
	height: 30px;
	margin-left: 170px;
}

.accident2_2_7_1{
	margin-left: 460px;
}

#pro{
	background-color: black;
	color: white;
	width: 100px;
	height: 30px;
	border-radius: 50px;
	font-family: 'Jeju Gothic', sans-serif;
    font-size: 15px;
    outline: none;
    border: 2px solid black;
}

#pro:hover{
	background-color: white;
	color: black;
	width: 100px;
	height: 30px;
	border-radius: 50px;
	font-family: 'Jeju Gothic', sans-serif;
    font-size: 15px;
    outline: none;
    border: 2px solid black;
}

.accident2_2_7_0{
	width: 200px;
	height: 30px;
	float: left;
	margin-left: 10px;
}

.accident2_2{
	width: 200px;
	height: 30px;
	margin-left: 170px;
}

.accident2_2_7{
	height: 30px;
	margin-left: 300px;
}

.accident2_2_1{
	width: 800px;
	height: 30px;
	margin-left: 180px;
}

.accident2_2_1_1{
	width: 800px;
	height: 40px;
	margin-left: 180px;
}

.ip1{
	margin-left: 20px;
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 18px;
	width: 250px;
	height: 30px;
	border-radius: 10px;
	text-align: center;
	outline: none;
}

.ip7{
	margin-left: 30px;
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 18px;
	width: 600px;
	height: 30px;
	border-radius: 10px;
	text-align: center;
	outline: none;
}

.insurer2_1{
	width: 320px; 
	height: 30px;
	margin-left: 35px;
	float: left;
}

.insurer2_4{
	font-family: 'Jeju Gothic', sans-serif;
    font-size: 20px;
    line-height: 30px;
}

.claimTitle4{
	width: 800px;
	height: 30px;
	margin-top: 20px;
}

.claimTitle4_1_2{
	width: 1000px;
	height: 25px;
	background-color: #dbf6ff;
	font-family: 'Jeju Gothic', sans-serif;
    font-size: 18px;
}

.claimTitle4_2{
	margin-left: 20px;
	line-height: 30px;
}

#nextBtn{
	margin-top:25px;
	margin-bottom:30px;
	width: 1200px;
	height: 50px;
	margin-left: 100px;
}

#nextBtn1{
	width: 200px;
	height: 50px;
	margin-left: 305px;
	float: left;
}

#nextBtn0{
	width: 200px;
	height: 50px;
	margin-left: 30px;
	float: left;
}

#nextBtn2{
	background-color: black;
    color: white;
    width: 200px;
    height: 50px;
    font-family: 'Jeju Gothic', sans-serif;
    font-size: 18px;
    border-radius: 50px;
    outline: none;
}

.ip2 {
    margin-left: 20px;
    font-size: 18px;
    width: 250px;
    height: 30px;
    border-radius: 10px;
    outline: none;
}

#msggg{
	display: none;
	margin-left: 100px;
}

</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- header 시작 -->
	<%@include file="../common/header.jsp"%>
	<!-- header 끝-->

	<!-- main header content -->
	<div id="header">
		<!-- main -->
		<div id="logo">
			<img alt="이미지가 없습니다" src="/img/mainLogo.jpg" width="200px;">
		</div>
		<div id="petSearch">
			<input type="text" id="search" value="검색어를 입력하세요"
				onfocus="this.value=''" style="color: #c1c1c1" /> <a href="#"
				id="searchButton"></a>
		</div>

		<!-- 우리 아이 등록하기 -->
		<div id="petInsert">
			<a href="#"><img alt="이미지가 없습니다" src="/img/petInsert.jpg"
				width="170px;"></a>
		</div>
	</div>
	
<div id="main">
		<div id="memMypage">
			<div id="memMypage2">
				<div id="memMypage3">
					<div id="memMypage3_1">
						마이 페이지
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">회원정보를 수정을 원하실때에는 해당 칸의 내용을 입력한후 수정하기 버튼을 클릭하시기 바랍니다.</div>
					</div>
				</div>
				
				<div id="memMypage4">
					<div id="accident">
						<div id="accident1">
						
							<div class="accident2">
<!-- 								<div class="accident2_1"> -->
<!-- 									회원 사진 -->
<!-- 								</div> -->
<!-- 								<div class="accident2_2_7_0"> -->
<!-- 									<input type="text"  class="ip1"/> -->
<!-- 								</div> -->
<!-- 								<div class="accident2_2_7_1"> -->
<!-- 									<input type="button" id="pro" value="사진변경"/> -->
<!-- 								</div> -->
							</div>
						
							<div class="accident2">
								<div class="accident2_1">
									회원 아이디
								</div>
								<div class="insurer2_1">
									<label class="insurer2_4" >${memVo.mem_id }</label>
								</div>
							</div>
							<div class="accident2">
								<div class="accident2_1">
									회원 이름
								</div>
								<div class="insurer2_1">
									<label class="insurer2_4" >${memVo.mem_name }</label>
								</div>
							</div>
							<div class="accident2">
								<div class="accident2_1">
									PW / PW확인
								</div>
								<div class="accident2_2_7_0">
									<input type="password" id="pwInput"  class="ip2" value="${memVo.mem_pass }"/>
								</div>
								<div class="accident2_2_7_1">
									 / <input type="password" id="pwInput2"  class="ip2" value="${memVo.mem_pass }"/>
								</div>
								<span id="msggg">비밀번호가 일치하지않습니다</span>
							</div>
							
							<div class="accident2">
								<div class="accident2_1">
									주소
								</div>
								<div class="accident2_2_7_0">
									<input type="text" id="addrInput" class="ip1" value="${memVo.mem_addr }"/>
								</div>
								<div class="accident2_2_7_1">
									<input type="button" id="pro" value="주소검색"/>
								</div>
							</div>
							
							<div class="accident2">
								<div class="accident2_1">
									상세 주소
								</div>
								<div class="accident2_7">
									<input type="text" id="addrInput2"  class="ip7" value="${memVo.mem_addr2 }"/>
								</div>
							</div>
							
							<div class="accident2">
								<div class="accident2_1">
									핸드폰번호
								</div>
								<div class="accident2_2">
									<input type="text"  class="ip1" id="hpInput" value="${memVo.mem_hp }"/>
								</div>
							</div>
							
							<div class="accident2">
								<div class="accident2_1">
									포인트
								</div>
									<div class="insurer2_1">
									<label class="insurer2_4" >${memVo.mem_point }</label>
								</div>
							</div>
							
							<div class="accident2">
								<div class="accident2_1">
									현재 있는 권한
								</div>
									<div class="insurer2_1">
									<label class="insurer2_4" >
										<c:if test="${memVo.mem_sit==2 }"> 펫시터 / </c:if>
										<c:if test="${memVo.mem_shop==2 }"> 쇼핑몰 판매자 / </c:if>
										<c:if test="${memVo.mem_hair==2 }"> 펫미용사  </c:if>
									</label>
								</div>
							</div>

						</div>
					</div>
					
				</div>
				<div id="btn">
				
					</div>
				</div>
			</div>
					<div id="nextBtn">
						<div id="nextBtn1">
							<input type="button" id="nextBtn2" value="회원 내용수정하기">
						</div>
						<div id="nextBtn0">
<!-- 							<input type="button" id="nextBtn2" value="홈으로 가기"> -->
						</div>
					</div>

</div>
	
	<%-- 전송용 form --%>
	<form action="/mem/updateMemInfo" method="post" id="infofrm">
		<input type="hidden" name="mem_id" id="hdmemid" value="${memVo.mem_id }"/>
		<input type="hidden" name="mem_name" id="hdmemname" value="${memVo.mem_name }"/>
		<input type="hidden" name="mem_pass" id="hdmempass" value="${memVo.mem_pass }"/>
		<input type="hidden" name="mem_addr" id="hdmemaddr" value="${memVo.mem_addr }"/>
		<input type="hidden" name="mem_addr2" id="hdmemaddr2" value="${memVo.mem_addr2 }"/>
		<input type="hidden" name="mem_hp" id="hdmemhp" value="${memVo.mem_hp }"/>
	</form>

	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
	
	<script>
	//비밀번호 일치 불일치 확인
		$(".ip2").change(function(){
			var pass = $("#pwInput").val();
			var passChk = $("#pwInput2").val();
			
			if(pass!=passChk){
				$("#msggg").show();
				$("#nextBtn2").prop("disabled", true);
			} else {
				$("#msggg").hide();
				$("#nextBtn2").prop("disabled", false);
			}
			
			
		});
		
	//회원수정 버튼 클릭이벤트
		$("#nextBtn2").click(function(){
			var missing ="";
			
			if($("#pwInput").val()==''){
				missing += "비밀번호 / "
			}
			if($("#addrInput").val()==''){
				missing += "주소 / "
			}
			if($("#addrInput2").val()==''){
				missing += "상세주소 / "
			}
			if($("#hpInput").val()==''){
				missing += "전화번호 "
			}
			
			if(missing!=""){
				alert(missing + " 항목을 입력해주세요");
				return;
			}
			
			
			
			
			$("#hdmempass").val(
				$("#pwInput").val()		
			);
			$("#hdmemaddr").val(
				$("#addrInput").val()		
			);
			$("#hdmemaddr2").val(
				$("#addrInput2").val()		
			);
			$("#hdmemhp").val(
				$("#hpInput").val()		
			);
			
			$("#infofrm").submit();
			
			
		});
	
		//주소 입력관련
		$("#pro").click(function(){
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
	                document.getElementById("addrInput").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addrInput2").focus();	
	                
		        }
		    }).open();
			
		});
	
	</script>
	
	
</body>
</html>