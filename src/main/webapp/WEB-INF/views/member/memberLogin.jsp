<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 로그인 페이지 -->


<header>
	<%@ include file="inc/top.jsp" %>
</header>

<c:if test="${memberLoginF != null}">
	<script>
		alert("${memberLoginF}");
	</script>
</c:if>

<main>
	<!-- login section -->
	<div class="login container w-50">
 		<div class="col-md-12 border shadow-sm rounded text-center">
			<h2 class="mt-5 mb-5">
	        	로그인
			</h2>
			<form action="memberLogin.do" method="post" id="loginForm">
			<div class="container p-5">
				<div class="loginForm">
					<div class="d-flex justify-content-center">
	               		<p class="col-md-3 mt-1">아이디</p>
						<input type="text" class="form-control col-md-9 mb-4" id="memberId" name="memberId" placeholder="아이디를 입력하세요">
	                </div>
	                <div class="d-flex justify-content-center">
	                	<p class="col-md-3 mt-1">비밀번호</p>
						<input type="password" class="form-control col-md-9" id="memberPw" name="memberPw" placeholder="비밀번호를 입력하세요">
	                </div>
                </div>
                <div class="d-flex justify-content-between p-5">
					<p><a href="memberFindId.do">아이디 찾기</a> / <a href="memberFindPw.do">비밀번호 재설정</a></p>
					<p><a href="memberJoin.do">회원가입</a></p>
				</div>
                <div class="mb-5">
					<button type="button" class="btn btn-dark rounded w-25" onclick="loginValid()">
						로그인
                    </button>
				</div>
			</div>
			</form>
		</div>
	</div>
   	<!-- end login section -->
</main>

<footer>
	<%@ include file="inc/footer.jsp" %>
</footer>

