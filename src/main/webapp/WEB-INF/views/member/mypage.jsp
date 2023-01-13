<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 마이페이지 -->

<header>
	<%@ include file="inc/top.jsp" %>
</header>

<main>
	<div class="mypage container border shadow-sm rounded mb-5 text-center w-50">
		<h2 class="mt-5">마이페이지</h2>
		<div class="information">
			<input type="hidden" value="${memberDTO.memberNo}"/>
			<div class="p-5">
				<c:if test="${memberDTO.memberImage eq 'non'}">
					<div class="" style="color:rgba(0, 0, 0, 0.4);">
						<svg xmlns="http://www.w3.org/2000/svg" width="20%" height="20%" fill="currentColor" class="bi bi-images mb-3" viewBox="0 0 16 16">
						  <path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
						  <path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 
						  2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 
						  0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 
						  1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z"/>
						</svg>
						<p style="font-size:15px;">이미지 없음</p>
					</div>
				</c:if>
				<c:if test="${memberDTO.memberImage ne 'non'}">
					<img class="w-50 h-50 mb-2" src="uploadFile/${memberDTO.memberImage}"/>
				</c:if>
				<div class="d-flex justify-content-center mb-3">
					<p class="col-md-3 mt-1">아이디</p>
					<input type="text" class="form-control col-md-9" name="memberId" value="${memberDTO.memberId}" readonly/>
				</div>
				<div class="d-flex justify-content-center mb-3">
					<p class="col-md-3 mt-1">닉네임</p>
					<input type="text" class="form-control col-md-9" name="memberName" value="${memberDTO.memberName}" readonly/>
				</div>
			</div>
		</div>
		<div class="btn mb-5">
			<a href="memberModify.do?memberNo=${memberDTO.memberNo}" class="btn btn-dark">사진 수정</a>
			<a href="memberFindPw.do" class="btn btn-secondary">비밀번호 재설정</a>
			<a href="memberRemove.do?memberNo=${memberDTO.memberNo}" class="btn btn-outline-danger">계정 삭제</a>
		</div>
	</div>
</main>    

<footer>
	<%@ include file="inc/footer.jsp" %>
</footer>