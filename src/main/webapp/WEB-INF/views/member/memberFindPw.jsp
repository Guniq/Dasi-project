<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 비밀번호 찾기 페이지 -->

<header>
	<%@ include file="inc/top.jsp" %>
</header>

<main>
	<div class="memberFind container w-25 border rounded shadow-sm text-center">
		<h2 class="mt-5 mb-4">
        	비밀번호 재설정
		</h2>
       	<c:if test="${memberDTO != null}">
        	<p class="mb-4"><small>${findPw}</small></p>
       	</c:if>
        <!-- 최초에 접근시 -->
        <c:if test="${memberDTO == null}">
	    	<p class="mb-4"><small>회원 가입시 아이디와 비밀번호를 입력하세요.</small></p>
        </c:if>
		<form action="memberFindPw.do" id="findPwForm" method="post">
			<input type="text" class="form-control" name="memberId" id="memberId" placeholder="아이디를 입력하세요"/>
			
			<!-- 이메일 인증 -->
           	<div class="d-flex justify-content-center mt-2">
                <div class="emailAuth col-md-8 me-1">
					<input type="text" placeholder="이메일을 입력하세요" name="memberEmail" id="memberEmail" class="email form-control"/>
				</div>
				<button type="button" id="emailButton" class="btn btn-outline-success col-md-4 me-4">인증번호 받기</button>
			</div>
			<div class="d-flex justify-content-center">
				<input type="text" placeholder="인증번호를 입력하세요" id="emailKey" class="form-control col-md-12 mt-2" style="display:none;"/>
			</div>
			<!-- end 이메일 인증 -->
			
			<input type="password" class="form-control mt-2" name="memberPw" id="memberPw" placeholder="새 비밀번호를 입력하세요"/>
			<input type="password" class="form-control mt-2" name="memberPwChk" id="memberPwChk" placeholder="비밀번호를 확인하세요"/>
			
			<div class="mt-3 mb-3">
				<input type="button" class="btn btn-dark" onclick="findPw()" value="비밀번호 재설정"/>
				<a href="memberJoin.do" class="btn btn-outline-dark">회원가입</a>
				<a href="memberLogin.do" class="btn btn-primary">로그인</a>
			</div>
		</form>
	</div>
</main>

<script>
	/* 이메일 전송 */
	var emailData = '';
	
	$("#emailButton").click(function(){	     	 
    	 var memberEmail = $('#memberEmail').val();
    	 
    	 if(memberEmail == ''){
    	 	alert("이메일을 입력해주세요.");
    	 	$('#memberEmail').focus();
    	 	return false;
    	 }
    	 
    	 $.ajax({
			type : "POST",
			url : "memberEmail.do",
			data : {memberEmail : memberEmail},
			success: function(data){
				alert("인증번호가 발송되었습니다.");
				emailData = data;
				$('#emailKey').css('display', '');		
			},
			error: function(data){
				alert("메일 발송에 실패했습니다.");
			}
		}); 
	});
</script>