<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

						<div class="mypetPageBtn">
							<div id="mypetPageBtn">
								<div id="mypetPageBtn1">
									<input class="mypetPageBtn1_1" type="button" value="펫 삭제하기">
								</div>
								<div id="mypetPageBtn2">
									<input class="mypetPageBtn1_1" type="button" value="펫 정보 수정하기">
								</div>
							</div>
						</div>
						
						<div id="mypetPage4">
							<div id="mypetPage4_1">
								<div id="mypetPage4_2">
									<div id="mypetPage4_2_1">
										<사진>
									</div>
									<div class="mypetPage4_2_2">
										<img class="mypetPage4_2_2_1" alt="이미지가 없습니다" src="${mypetInfo.myp_img}">
									</div>
								</div>
								<div id="mypetPage4_3">
									<div class="mypetPage4_3_1">
										<div class="mypetPage4_3_2">
											이름
										</div>
										<div class="mypetPage4_3_2_1">
											${mypetInfo.myp_name }
										</div>
										<div class="mypetPage4_3_2_2">
											생년월일
										</div>
										<div class="mypetPage4_3_2_3">
											<fmt:formatDate value="${mypetInfo.myp_birth}" pattern="yyyy년 MM월 dd일"></fmt:formatDate>
										</div>
									</div>
									<div class="mypetPage4_3_1">
										<div class="mypetPage4_3_2">
											품종
										</div>
										<div class="mypetPage4_3_2_1">
											${mypetInfo.petk_name }(${mypetInfo.petk_size })
										</div>
										<div class="mypetPage4_3_2_2">
											성별
										</div>
										<div class="mypetPage4_3_2_3">
											${mypetInfo.myp_gender }
										</div>
									</div>
									<div class="mypetPage4_3_1">
										<div class="mypetPage4_3_2">
											질병여부
										</div>
										<div class="mypetPage4_3_2_1">
											${mypetInfo.myp_sick }
										</div>
										<div class="mypetPage4_3_2_2">
											중성화 여부
										</div>
										<div class="mypetPage4_3_2_3">
											${mypetInfo.myp_neu }
										</div>
									</div>
		
								</div>
							</div>
						</div>