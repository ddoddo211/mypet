<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<head>
<style type="text/css">

	#queMain{
		width: 490px;
	    margin: 0 auto;
	    overflow: hidden;
	}
	#queTop{
		width: 480px;
	    margin: 0 auto;
	    height: 50px;
	}
	
	.queA{
	    width: 130px;
	    height: 30px;
	    margin-right: 10px;
	    background-color: #5a5757;
	    color: white;
	    border-radius: 5px;
	    float: left;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    font-size: 15px;
	}
	
	.queB{
	    width: 330px;
	    height: 30px;
	    float: left;
	    display: flex;
	}
	
	#queMid{
	  	width: 480px;
	    margin: 0 auto;
	    height: 50px;
	}
	
	#mem_rep{
		width: 284px;
	}
	
	.memHp{
		width: 60px;
	}
	
	#queBottom{
		width: 480px;
	    margin: 0 auto;
	    height: 50px;
	}
	
	#queBtn{
		width: 480px;
	    margin: 0 auto;
	    text-align:center;
	    height: 30px;
	}
	
	.btnA{
		float: left;
	    width: 100px;
	}
	
	.btnB{
		float: left;
	    width: 100px;
	}
	
	#idSearch{
		width: 70px;
	}
	
	#cancle{
		width: 70px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		// id찾기
		$("#idSearch").click(function() {
			if($(".question").val() == 1){
				alert("질문은 선택해주세요");
				return;
			}else if($("#mem_rep").val() == ''){
				alert("답변을 적어주세요.");
				return;
			}else if($("#mem_hp1").val() == '' || $("#mem_hp2").val() == '' || $("#mem_hp3").val() == ''){
				alert("핸드폰 번호를 적어주세요");
				return;
			}else{
				var hp = $("#mem_hp1").val() + $("#mem_hp2").val() + $("#mem_hp3").val();
				$("#mem_hp").val(hp);
				$("#idChk").submit();
			}
			
		})
		
		// 취소버튼
		$("#cancle").click(function() {
			window.close();
		})
	})
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id= "queMain">
		<form id="idChk" action="/mem/idSearch" method="post">
			<div id="queTop">
				<div class="queA">
					<span>ID찾기 확인 질문</span>
				</div>
				<div class="queB">
					<select class="question" name="mem_qet">
						<option value="1">질문을 선택해주세요</option>
						<option>기억에 남는 추억의 장소는?</option>
						<option>자신의 보물 제1호는?</option>
						<option>가장 기억에 남는 선생님 성함은?</option>
						<option>타인이 모르는 자신만의 신체비밀이 있다면?</option>
						<option>추억하고 싶은 날짜가 있다면?</option>
						<option>유년시절 가장 생각나는 친구 이름은?</option>
					</select>
				</div>
			</div>
			<div id="queMid">
				<div class="queA">
					<span>ID찾기 확인 답변</span>
				</div>
				<div class="queB">
					<input type="text" id="mem_rep" name="mem_rep">
				</div>
			</div>
			
			<div id="queBottom">
				<div class="queA">
					<span>휴대폰번호확인</span>
				</div>
				<div class="queB">
					<input type="text" id="mem_hp1" class="memHp">-
					<input type="text" id="mem_hp2" class="memHp">-
					<input type="text" id="mem_hp3" class="memHp">
					<input type="hidden" name="mem_hp" id="mem_hp"/>
				</div>
			</div>
		</form>
		<div id="queBtn">
			<div class="btnA">
				<input type="button" value="ID찾기" id="idSearch">
			</div>
			<div class="btnB">
				<input type="button" value="취소" id="cancle">
			</div>
			<c:choose>
				<c:when test="${chk == 0 }">
					<div>
						<span>ID : </span><span>${memberVo.mem_id }</span>
					</div>
				</c:when>
				<c:when test="${chk == 1 }">
					<div>
						<span>회원정보가 없습니다.</span>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
</body>
</html>