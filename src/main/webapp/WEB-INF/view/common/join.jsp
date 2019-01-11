<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
<%@include file ="/css/commonCss.css"%>

.member {
	font-size: 50px;
	text-shadow: 0 0 10px #666;
	color: #fff;
	margin: 0 auto;
	margin-top: 70px;
	text-align: center;
	text-transform: capitalize;
	font-family: "맑은 고딕";
	font-style: italic;
	text-align: center;
}

body {
	font-family: "맑은 고딕";
	font-size: 12px;
}



#wrap {
	width: 400px;
	height: 400px;
	margin: 0 auto;
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	var chk = "${chk}";
	
	if(chk == "true"){
		alert("사용 가능한 아이디 입니다. 메일의 인증번호를 확인하세요.");
		var memID = "${memId}";
		$("#mem_id").val(memID);
	} else if(chk == "false"){
		alert("사용 불가능한 아이디 입니다. 다시입력해주세요.");
	} 
	
	$("#mem_pass").focus(function(){
		if(chk == false){
			alert("ID 중복체크를 해주세요.");
			$("#mem_id").focus();
			return;
		}
	});
	
	$("#chk_btn").click(function(){
		var ran = $("#random").val()+"";
		if(ran == ''){
			ran = 1;
		}
		var ran2 = "${random}";
		
		if(ran == ran2){
			alert("인증되셨습니다.");
			return;
		} else{
			alert("다시한번 확인해주세요.");
			return;
		}
	});
	
	$("#addrBtn").click(function(){
		new daum.Postcode({
			oncomplete : function(data) {
				// 주소 input value 설정 : data.roadAddress
				$("#mem_addr").val(data.roadAddress);
				// 우편 input value 설정 : data.zonecode
				$("#zipcd").val(data.zonecode);
			}
		}).open();
	});
	
    // 회원가입처리
    $('#join-submit').click(function(e){
        e.preventDefault();
        var mem_name = $("input[name='mem_name']");
        console.log(mem_name);
        if( mem_name.val() =='') {
            alert("성명을 입력하세요");
            mem_name.focus();
            return false;
        }
        var mem_id = $("input[name='mem_id']");
		console.log(mem_id);
        if($("#mem_id").val() == ''){
            alert('이메일을 입력하세요');
            mem_id.focus();
            return false;
        } else {
            var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!emailRegex.test($("#mem_id").val())) {
                alert('이메일 주소가 유효하지 않습니다. ex)abc@gmail.com');
                mem_id.focus();
                return false;
            }
        }

        var mem_hp = $("input[name='mem_hp']");
        if(mem_hp.val() ==''){
            alert('휴대폰 번호를 입력하세요');
            mem_hp.focus();
            return false;
        } else if(!/^[0-9]{10,11}$/.test(mem_hp.val())){
            alert("휴대폰 번호는 숫자만 10~11자리 입력하세요.");
            return false;
        } else if(!/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/.test(mem_hp.val())){
            alert("유효하지 않은 전화번호 입니다.");
            return false;
        }

        var mem_pass = $("input[name='mem_pass']");
        var re_mem_pass = $("input[name='re_mem_pass']");
        if($("#mem_pass").val() =='') {
            alert("비밀번호를 입력하세요!");
            mem_pass.focus();
            return false;
        }
        if($("#mem_pass").val().search(/\s/) != -1){
            alert("비밀번호는 공백없이 입력해주세요.");
            return false;
        }
        if(!/^[a-zA-Z0-9!@#$%^&*()?_~]{8,20}$/.test($("#mem_pass").val())){
            alert("비밀번호는 숫자, 영문, 특수문자(!@$%^&*?_~ 만 허용) 조합으로 8~20자리를 사용해야 합니다.");
            return false;
        }
        // 영문, 숫자, 특수문자 2종 이상 혼용
        var chk=0;
        if($("#mem_pass").val().search(/[0-9]/g) != -1 ) chk ++;
        if($("#mem_pass").val().search(/[a-z]/ig)  != -1 ) chk ++;
        if($("#mem_pass").val().search(/[!@#$%^&*()?_~]/g) != -1) chk ++;
        if(chk < 2){
            alert("비밀번호는 숫자, 영문, 특수문자를 두가지이상 혼용하여야 합니다.");
            return false;
        }
        // email이 아닌 mem_id 인 경우에는 체크하면 유용. email은 특수 허용문자에서 걸러진다.
        /*
        if(mem_pass.val().search(mem_id.val())>-1){
            alert("mem_id가 포함된 비밀번호는 사용할 수 없습니다.");
            return false;
        }
        */
        if($("#re_mem_pass").val() =='') {
            alert("비밀번호를 다시 한번 더 입력하세요!");
            re_mem_pass.focus();
            return false;
        }
        if($("#mem_pass").val()!= $("#re_mem_pass").val()){
            alert('입력한 두 개의 비밀번호가 일치하지 않습니다');
            return false;
        }

//         //var loginpath =$("#ajaxPath").attr('data-path');
//         $.ajax({
//             url: '/mem/join',
//             type: 'POST',
//             data: {
//                 mem_name:mem_name.val(),
//                 mem_id:mem_id.val(),
//                 mem_pass:mem_pass.val(),
//                 mem_hp:mem_hp.val()
//             },
//             dataType: "json", // json, text
//             success: function (response) {
//                 //alert(response); //text 로 하고 a.register.php 에서 print_r을 사용하면 넘어간 데이터를 확인 가능
//                 if(response.result == 1){
//                     alert('가입 완료');
//                     location.replace('/mem/main'); // 화면 갱신
//                 } else if(response.result == 0){
//                     alert('이미 가입된 아이디입니다');
//                 } else if(response.result == -2){
//                     alert('입력 데이터를 확인하세요');
//                 } else {
//                     //alert('등록중에 에러가 발생했습니다' + response);
//                     alert('등록중에 에러가 발생했습니다');
//                 }
//             },
//             error: function(jqXHR, textStatus, errorThrown){
//                 alert("arjax error : " + textStatus + "\n" + errorThrown);
//             }
//         });
	document.getElementById("frm").submit();

    });

//     // mem_id(e-mail) 가입여부 검사
//     $("#checkid").click(function(e){
//         e.preventDefault();
//         var mem_id = $("input[name='mem_id']");
//         if(mem_id.val() == ''){
//             alert('이메일을 입력하세요');
//             mem_id.focus();
//             return false;
//         } else {
//             var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
//             if (!emailRegex.test(mem_id.val())) {
//                 alert('이메일 주소가 유효하지 않습니다. ex)abc@gmail.com');
//                 mem_id.focus();
//                 return false;
//             }
//         }

//         $.ajax({
//             url: 'a.joinChk.php',
//             type: 'POST',
//             data: {mem_id:mem_id.val()},
//             dataType: "json",
//             success: function (msg) {
//                 //alert(msg); // 확인하고 싶으면 dataType: "text" 로 변경한 후 확인 가능
//                 if(msg.result == 1){
//                     alert('사용 가능합니다');
//                 } else if(msg.result == 0){
//                      alert('이미 가입된 아이디입니다');
//                     mem_id.val('');
//                 }
//             },
//             error: function(jqXHR, textStatus, errorThrown){
//                 alert("arjax error : " + textStatus + "\n" + errorThrown);
//             }
//         });
//    });



	$("#checkid").click(function(){
		
		 var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
         if (!emailRegex.test($("#mem_id").val())) {
             alert('이메일 주소가 유효하지 않습니다. ex)abc@gmail.com');
             mem_id.focus();
             return false;
         }
		
		var mem_id = $("#mem_id").val();
		$("#memId").val(mem_id);
		$("#chkMemFrm").submit();
	});
});
</script>

</head>
<body>
<form action="/mem/chkMember" method="post" id="chkMemFrm" name="">
	<input type="hidden" id="memId" name="memId" />
</form>
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
		<!-- main header content 끝  -->
		<div id="wrap">
		<h1 class="member">My Pet Join</h1>

		<%-- 네이버 인지 아닌지 확인해서 mem_id 채울지 말지 결정 --%>
		<c:set var="id">
			<c:choose>
				<c:when test="${mem_id!=null }">${mem_id }</c:when>
				<c:otherwise> </c:otherwise>
			</c:choose>
		</c:set>


		<!-- login form -->
		<div class="container">
			<form method="post" action="/mem/joinMethod" id="frm">
			
				<table>
					<tr>
						<td>ID(E-Mail)</td>
						<td><input type="text" size=20 name="mem_id" value="${id}" id="mem_id">
							<input type="button" id="checkid" value="중복체크/인증"></td>
					</tr>
					<tr>
						<td>인증번호</td>
						<td><input type="password" size=20 name="random" id="random"><input type="button" id="chk_btn" value="확인" style="margin-left:4px;"/></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" size=37 name="mem_pass" id="mem_pass"></td>
					</tr>
					<tr>
						<td>비밀번호(확인)</td>
						<td><input type="password" size=37 name="re_mem_pass" id="re_mem_pass"></td>
					</tr>
					<tr>
						<td style='width: 100px'>이름</td>
						<td><input type="text" size=37 name="mem_name" value="" id="mem_name"></td>
					</tr>
					<tr>
						<td>휴대폰번호</td>
						<td><input type="text" size=37 name="mem_hp" value="" id="mem_hp"></td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td><input type="text" size=15 name="zipcd" value="" id="zipcd"><input type="button" id="addrBtn" value="주소검색" style="margin-left:4px;" /></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" size=37 name="mem_addr" value="" id="mem_addr"></td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td><input type="text" size=37 name="mem_addr2" value="" id="mem_addr2"></td>
					</tr>
					<tr>
						<td colspan='2' align='center'><input type="button"
							id="join-submit" value="회원가입"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>


	<!-- login form 끝 -->


	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>