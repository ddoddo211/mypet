<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<style type="text/css">
<%@include file ="/common/commonCss.jsp"%>
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
    // 회원가입처리
    $('#join-submit').click(function(e){
        e.preventDefault();
        var userNM = $("input[name='userNM']");
        if( userNM.val() =='') {
            alert("성명을 입력하세요");
            userNM.focus();
            return false;
        }

        var email = $("input[name='email']");
        if(email.val() == ''){
            alert('이메일을 입력하세요');
            email.focus();
            return false;
        } else {
            var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!emailRegex.test(email.val())) {
                alert('이메일 주소가 유효하지 않습니다. ex)abc@gmail.com');
                email.focus();
                return false;
            }
        }

        var mobileNO = $("input[name='mobileNO']");
        if(mobileNO.val() ==''){
            alert('휴대폰 번호를 입력하세요');
            mobileNO.focus();
            return false;
        } else if(!/^[0-9]{10,11}$/.test(mobileNO.val())){
            alert("휴대폰 번호는 숫자만 10~11자리 입력하세요.");
            return false;
        } else if(!/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/.test(mobileNO.val())){
            alert("유효하지 않은 전화번호 입니다.");
            return false;
        }

        var password = $("input[name='Password']");
        var repassword = $("input[name='rePassword']");
        if(password.val() =='') {
            alert("비밀번호를 입력하세요!");
            password.focus();
            return false;
        }
        if(password.val().search(/\s/) != -1){
            alert("비밀번호는 공백없이 입력해주세요.");
            return false;
        }
        if(!/^[a-zA-Z0-9!@#$%^&*()?_~]{8,20}$/.test(password.val())){
            alert("비밀번호는 숫자, 영문, 특수문자(!@$%^&*?_~ 만 허용) 조합으로 8~20자리를 사용해야 합니다.");
            return false;
        }
        // 영문, 숫자, 특수문자 2종 이상 혼용
        var chk=0;
        if(password.val().search(/[0-9]/g) != -1 ) chk ++;
        if(password.val().search(/[a-z]/ig)  != -1 ) chk ++;
        if(password.val().search(/[!@#$%^&*()?_~]/g) != -1) chk ++;
        if(chk < 2){
            alert("비밀번호는 숫자, 영문, 특수문자를 두가지이상 혼용하여야 합니다.");
            return false;
        }
        // email이 아닌 userID 인 경우에는 체크하면 유용. email은 특수 허용문자에서 걸러진다.
        /*
        if(password.val().search(userID.val())>-1){
            alert("userID가 포함된 비밀번호는 사용할 수 없습니다.");
            return false;
        }
        */
        if(repassword.val() =='') {
            alert("비밀번호를 다시 한번 더 입력하세요!");
            repassword.focus();
            return false;
        }
        if(password.val()!== repassword.val()){
            alert('입력한 두 개의 비밀번호가 일치하지 않습니다');
            return false;
        }

        //var loginpath =$("#ajaxPath").attr('data-path');
        $.ajax({
            url: 'a.register.php',
            type: 'POST',
            data: {
                userNM:userNM.val(),
                userID:email.val(),
                password:password.val(),
                mobileNO:mobileNO.val()
            },
            dataType: "json", // json, text
            success: function (response) {
                //alert(response); //text 로 하고 a.register.php 에서 print_r을 사용하면 넘어간 데이터를 확인 가능
                if(response.result == 1){
                    alert('가입 완료');
                    location.replace('index.php'); // 화면 갱신
                } else if(response.result == 0){
                    alert('이미 가입된 아이디입니다');
                } else if(response.result == -2){
                    alert('입력 데이터를 확인하세요');
                } else {
                    //alert('등록중에 에러가 발생했습니다' + response);
                    alert('등록중에 에러가 발생했습니다');
                }
            },
            error: function(jqXHR, textStatus, errorThrown){
                alert("arjax error : " + textStatus + "\n" + errorThrown);
            }
        });

    });

    // userID(e-mail) 가입여부 검사
    $("#checkid").click(function(e){
        e.preventDefault();
        var email = $("input[name='email']");
        if(email.val() == ''){
            alert('이메일을 입력하세요');
            email.focus();
            return false;
        } else {
            var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!emailRegex.test(email.val())) {
                alert('이메일 주소가 유효하지 않습니다. ex)abc@gmail.com');
                email.focus();
                return false;
            }
        }

        $.ajax({
            url: 'a.joinChk.php',
            type: 'POST',
            data: {userID:email.val()},
            dataType: "json",
            success: function (msg) {
                //alert(msg); // 확인하고 싶으면 dataType: "text" 로 변경한 후 확인 가능
                if(msg.result == 1){
                    alert('사용 가능합니다');
                } else if(msg.result == 0){
                     alert('이미 가입된 아이디입니다');
                    email.val('');
                }
            },
            error: function(jqXHR, textStatus, errorThrown){
                alert("arjax error : " + textStatus + "\n" + errorThrown);
            }
        });
    });


});
</script>

</head>
<body>
	<!-- header 시작 -->
	<%@include file="/common/header.jsp"%>
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
		<h1 class="member">My Pet Login</h1>

		<!-- login form -->
		<div class="container">
			<h2>회원가입 Form 예제</h2>
			<form method="post" action="a.register.php">
				<table>
					<tr>
						<td style='width: 100px'>이름</td>
						<td><input type="text" size=37 name="userNM" value=""></td>
					</tr>
					<tr>
						<td>E-Mail</td>
						<td><input type="text" size=25 name="email" value="">
							<input type="button" id="checkid" value="중복체크"></td>
					</tr>
					<tr>
						<td>휴대폰번호</td>
						<td><input type="text" size=37 name="mobileNO" value=""></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" size=37 name="Password"></td>
					</tr>
					<tr>
						<td>비밀번호(확인)</td>
						<td><input type="password" size=37 name="rePassword"></td>
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
	<%@include file="/common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>