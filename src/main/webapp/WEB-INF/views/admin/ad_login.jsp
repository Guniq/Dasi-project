<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 관리자 로그인 페이지 -->

<header>
	<%@ include file="inc/top.jsp" %>
</header>

<c:if test="${adminLoginF != null}">
	<script>
		alert("${adminLoginF}");
	</script>
</c:if>

<main>
	<div class="login container w-50">
 		<div class="col-md-12 border shadow-sm rounded text-center">
			<h2 class="mt-5 mb-5">
	        	관리자 로그인
			</h2>
			<form action="adminLogin.do" method="post" id="loginForm">
			<div class="container p-5">
				<div class="loginForm">
					<div class="d-flex justify-content-center">
	               		<p class="col-md-3 mt-1">아이디</p>
						<input type="text" class="form-control col-md-9 mb-4" name="adminId" id="adminId" placeholder="아이디를 입력하세요">
	                </div>
	                <div class="d-flex justify-content-center">
	                	<p class="col-md-3 mt-1">비밀번호</p>
						<input type="password" class="form-control col-md-9" name="adminPw" id="adminPw" placeholder="비밀번호를 입력하세요">
	                </div>
                </div>
                <div class="mt-5 mb-3">
					<button type="button" class="btn btn-dark rounded w-25" onclick="adminLogin()">
						로그인
                    </button>
				</div>
			</div>
			</form>
		</div>
	</div>
</main>
