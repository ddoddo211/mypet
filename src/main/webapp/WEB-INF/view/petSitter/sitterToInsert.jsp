<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sitterToInsert.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
#noticeInsertMain {
	width: 95%;
	margin: 0 auto;
	border-radius: 20px;
	border: 3px dashed #ffc0c0;
}

#noticeTitle {
	width: 90%;
	margin: 0 auto;
	margin-bottom: 20px;
	text-align: center;
	height: 70px;
}

#noticeTitle>span {
	font-size: 40px;
	font-weight: bold;
}

#noticeInsertMenu {
	width: 95%;
	margin: 0 auto;
	background-color: #e1fbff6e;
	border-radius: 10px;
}

.insertMenu {
	overflow: hidden;
	margin-bottom: 10px;
}

.menuTitle {
	width: 100px;
	height: 64px;
	background-color: #93bcff;
	text-align: center;
	line-height: 64px;
	color: #fff;
	float: left;
	font-size: 18px
}

.menuText {
	width: 400px;
	height: 64px;
	margin-left: 20px;
	line-height: 64px;
	float: left;
}

#explanation {
	width: 950px;
	margin-left: 20px;
	height: 64px;
	float: left;
	display: table;
}

#explanation_1 {
	width: 350px;
	display: table-cell;
	vertical-align: middle;
}

.explanation_menu {
	width: 100px;
	height: 40px;
	border-radius: 20px;
	text-align: center;
	line-height: 40px;
	color: #fff;
	background-color: #b1b1b1;
	float: left;
}

.explanation_menu_text {
	margin-left: 10px;
	float: left;
}

#explanation_2 {
	width: 550px;
	display: table-cell;
	vertical-align: middle;
}

#explanation_time {
	margin-left: 20px;
	float: left;
	width: 450px;
	height: 40px;
}

.time_select {
	float: left;
	margin-left: 5px;
	margin-top: 5px;
}

.time_select>select {
	width: 80px;
	height: 30px;
	font-size: 24px;
}

#priceMain {
	float: left;
	margin-left: 20px;
	width: 800px;
	height: 64px;
	display: table;
}

.priceMenu {
	display: table-cell;
	vertical-align: middle;
	width: 350px;
}

.priceKind {
	background-color: #b1b1b1;
	width: 100px;
	height: 40px;
	border-radius: 20px;
	color: #fff;
	text-align: center;
	line-height: 40px;
	float: left;
}

.price {
	margin-left: 10px;
	margin-top: 10px;
	float: left;
}

#noticeBtn {
	width: 90%;
	margin: 0 auto;
	overflow: hidden;
	margin-top: 30px;
	margin-bottom: 20px;
}

#noticeBtnMain {
	width: 500px;
	overflow: hidden;
	margin: 0 auto;
}

#btnKind1 {
	margin-left: 30px;
	width: 200px;
	height: 50px;
	float: left;
}

#btnKind2 {
	width: 200px;
	height: 50px;
	float: left;
	margin-left: 30px;
}

.notice_btn {
	width: 100%;
	height: 100%;
	border: none;
	background-color: #bebebe;
	border-radius: 30px;
	color: #fff;
	cursor: pointer;
	outline: none;
}

.notice_btn:active {
	width: 100%;
	height: 100%;
	border: none;
	background-color: #7b7b7b;
	border-radius: 30px;
	color: #fff;
	cursor: pointer;
	outline: none;
}

input#upload_text {/*읽기전용 인풋텍스트*/
	float:left;
	width:200px;/* 버튼 포함 전체 가로 길이*/
	height:30px;
	line-height:19px;
	padding:0 3px;
	border:1px solid #bbb;
	margin-top : 15px;
}

div#upload-btn_wrap input#notice_file {/*파일찾기 폼 투명하게*/
	position:absolute;
	top:20px;
	right:0;
	cursor:pointer;
	opacity:0;
	filter:alpha(opacity=0);
	-ms-filter:"alpha(opacity=0)";
	-moz-opacity:0;
}
div#upload-btn_wrap {/*버튼테두리 감싼 div*/
	position:relative;
	float:left;
	width:80px;/*width, height 값은 button(찾아보기)값과 같아야함 */
	height:30px;
	padding-left:3px;
}
div#upload-btn_wrap button {/*버튼 div*/
	width:80px;
	height:30px;
	font-weight:bold;
	background:#333;
	border:1px solid #333;
	color:#fff;
	margin-left: 5px;
}
</style>

<script type="text/javascript">
	
	$(document).ready(
			function() {

				$('#upload_text').val('');

				$('#notice_file').change(function() {
					var i = $(this).val();
					$('#upload_text').val(i);
				});

				$("#noticeAddBtn").click(
						function() {
							var title = $("#notice_title").val();
							var text = $("#explanation_text").val();
							var img = $("#notice_file").val();
							var price1 = $("#price_dc").val();
							var price2 = $("#price_1d").val();

							if (title == "" || title == null) {
								alert("제목을 입력하세요.");
								return;
							} else if (text == "" || text == null) {
								alert("특이사항을 입력하세요.");
								return;
							} else if (img == "" || img == null) {
								alert("이미지를 넣어주세요.");
								return;
							} else if (price1 == "" || price1 == null
									|| price2 == "" || price2 == null) {
								alert("가격을 입력해주세요.");
								return;
							}

							$("#frm").submit();

						});
			});
</script>
</head>
<body>
<%@include file="/WEB-INF/view/common/header.jsp"%>

<!-- 각자 화면 -->
	<div id="">
		<!-- header -->
		<div id="header">
			<!-- main -->
			<div id="logo">
				<a href="/petSitter.jsp"><img alt="이미지가 없습니다" src="/img/petSitterLogo2.jpg" width="200px;" /></a>
			</div>
			<div id="petSearch">
				<div id="word">
					<input type="text" id="search" value="검색어를 입력하세요" onfocus="this.value=''" style="color: #c1c1c1" />
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
	<div id="body">
		<div id="petSitterMenu">
			<%@include file="/WEB-INF/view/petSitter/petSitterMenu.jsp" %>
		</div>
		<div id="noticeInsertMain">
			<div id="noticeTitle">
				<span>펫시터 집에 맡기기 게시글 등록</span>
			</div>
			<form action="/sit/sitterToInsert" method="post" id="frm" enctype="multipart/form-data">
				<div id="noticeInsertMenu">
					<div class="insertMenu">
						<div class="menuTitle">
							<span>제목</span>
						</div>
						<div class="menuText">
							<input type="text" name="notice_title" id="notice_title" style="width: 400px; height: 20px;" />
						</div>
					</div>
					<div class="insertMenu">
						<div class="menuTitle">
							<span>설명</span>
						</div>
						<div id="explanation">
							<div id="explanation_1">
								<div class="explanation_menu">
									<span>돌봄 시 특이사항 </span>
								</div>
								<div class="explanation_menu_text">
									<textarea id="explanation_text" name="pst_text"rows="2" cols="30"></textarea>
								</div>
							</div>
							<div id="explanation_2">
								<div class="explanation_menu">
									<span>체크인(아웃)시간 설정</span>
								</div>
								<div id="explanation_time">
									<div class="time_select">
										<span>체크인</span>
										<select name="chkIn">
											<option value="09:00">09:00</option>
											<option value="10:00">10:00</option>
											<option value="11:00">11:00</option>
											<option value="12:00">12:00</option>
											<option value="13:00">13:00</option>
											<option value="14:00">14:00</option>
											<option value="15:00">15:00</option>
											<option value="16:00">16:00</option>
											<option value="17:00">17:00</option>
											<option value="18:00">18:00</option>
											<option value="19:00">19:00</option>
											<option value="20:00">20:00</option>
											<option value="21:00">21:00</option>
										</select>
										<select name="chkIn2">
											<option value="09:00">09:00</option>
											<option value="10:00">10:00</option>
											<option value="11:00">11:00</option>
											<option value="12:00">12:00</option>
											<option value="13:00">13:00</option>
											<option value="14:00">14:00</option>
											<option value="15:00">15:00</option>
											<option value="16:00">16:00</option>
											<option value="17:00">17:00</option>
											<option value="18:00">18:00</option>
											<option value="19:00">19:00</option>
											<option value="20:00">20:00</option>
											<option value="21:00">21:00</option>
										</select>
									</div>
									<div class="time_select">
										<span>체크아웃</span>
										<select name="chkOut">
											<option value="09:00">09:00</option>
											<option value="10:00">10:00</option>
											<option value="11:00">11:00</option>
											<option value="12:00">12:00</option>
											<option value="13:00">13:00</option>
											<option value="14:00">14:00</option>
											<option value="15:00">15:00</option>
											<option value="16:00">16:00</option>
											<option value="17:00">17:00</option>
											<option value="18:00">18:00</option>
											<option value="19:00">19:00</option>
											<option value="20:00">20:00</option>
											<option value="21:00">21:00</option>
										</select>
										<select name="chkOut2">
											<option value="09:00">09:00</option>
											<option value="10:00">10:00</option>
											<option value="11:00">11:00</option>
											<option value="12:00">12:00</option>
											<option value="13:00">13:00</option>
											<option value="14:00">14:00</option>
											<option value="15:00">15:00</option>
											<option value="16:00">16:00</option>
											<option value="17:00">17:00</option>
											<option value="18:00">18:00</option>
											<option value="19:00">19:00</option>
											<option value="20:00">20:00</option>
											<option value="21:00">21:00</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="insertMenu">
						<div class="menuTitle">
							<span>이미지</span>
						</div>
						<div class="menuText">
							<input type="text" id="upload_text" readonly="readonly">
							<!--button-->
							<div id="upload-btn_wrap">
							  <button type="button" title="파일찾기">
						   	  <span>파일찾기</span>  
							  </button>
							  <input type="file" id="notice_file" title="파일찾기" name="notice_file">
							</div>
						</div>
					</div>
					<div class="insertMenu">
						<div class="menuTitle">
							<span>가격</span>
						</div>
						<div id="priceMain">
							<div class="priceMenu">
								<div class="priceKind">
									<span>DayCare</span>
								</div>
								<div class="price">
									<input type="text" name="price_dc" id="price_dc" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="IME-MODE:disabled;" />원
								</div>
							</div>
							<div class="priceMenu">
								<div class="priceKind">
									<span>1박</span>
								</div>
								<div class="price">
									<input type="text" name="price_1d" id="price_1d" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="IME-MODE:disabled;"/>원
								</div>
							</div>
							<script type="text/javascript">
							function onlyNumber(event){
							    event = event || window.event;
							    var keyID = (event.which) ? event.which : event.keyCode;
							    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ){
							        return;
							    } 
							    else{
							        return false;
							    }
							}
							 
							function removeChar(event) {
							    event = event || window.event;
							    var keyID = (event.which) ? event.which : event.keyCode;
							    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ){ 
							        return;
							    }
							    else{
							        event.target.value = event.target.value.replace(/[^0-9]/g, "");
							    }
							}
							</script>
						</div>
					</div>
				</div>
				<div id="noticeBtn">
					<div id="noticeBtnMain">
						<div id="btnKind1">
							<input type="button" id="noticeAddBtn" class="notice_btn" value="등록" />
						</div>
						<div id="btnKind2">
							<input type="button" id="noticeCancleBtn" class="notice_btn" value="취소" />
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>