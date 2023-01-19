<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 회원가입 페이지 --> 

<header>
	<%@ include file="inc/top.jsp" %>
</header>



<main>
	<div class="join container w-50">
 		<div class="col-md-12 border shadow-sm rounded text-center">
			<h2 class="mt-5">
	        	회원가입
			</h2>
		<form action="memberJoin.do" id="joinForm" method="post" enctype="multipart/form-data">
			<div class="container p-5">
				<div class="joinForm">
					<div class="d-flex justify-content-center">
						<p class="col-md-3 mt-1">아이디</p>
						<div class="col-md-7">
							<input type="text" class="form-control mb-2" name="memberId" id="memberId" placeholder="아이디를 입력하세요"/>
							<p id="result_checkId" class="mb-3" style="font-size:14px;"></p>
						</div>
						<input type="button" class="btn btn-outline-dark col-md-2 h-25 me-4" id="checkId" value="중복검사"/>
	                </div>
	                
	                <!-- 이메일 인증 -->
	                <div class="d-flex justify-content-center">
						<p class="col-md-3 mt-1">이메일</p>
		                <div class="emailAuth col-md-7">
							<input type="text" placeholder="이메일을 입력하세요" name="memberEmail" id="memberEmail" class="email form-control"/>
						</div>
						<button type="button" id="emailButton" class="btn btn-outline-success col-md-2 h-25 me-4">인증번호 받기</button>
					</div>
					<div class="d-flex justify-content-center">
						<input type="text" placeholder="인증번호를 입력하세요" id="emailKey" class="form-control col-md-6 mb-3" style="display:none;"/>
					</div>
					<!-- end 이메일 인증 -->
	                
					<!-- 파일업로드 -->
					<div class="row">
	               		<p class="col-md-3">프로필 사진</p>
						<div class="col-md-3">
							<input type="button" class="form-control btn btn-secondary" value="업로드 파일 추가" 
							onclick="fileAppend()"/>
						</div>
						<!-- 미리보기 -->
						<div class="col-md-6" id="div-file">
							<input type="file" name="memberImage" style="display:none"/>
						</div>
					</div>
					<!-- end 파일업로드 -->
					
	                <div class="d-flex justify-content-center">
						<p class="col-md-3 mt-1">닉네임</p>
						<div class="col-md-7">
							<input type="text" class="form-control mb-2" name="memberName" id="memberName" placeholder="닉네임를 입력하세요"/>
							<p id="result_checkName" class="mb-3" style="font-size:14px;"></p>
						</div>
						<input type="button" class="btn btn-outline-primary col-md-2 h-25 me-4" id="checkName" value="중복검사"/>
	                </div>
	                
					<div class="d-flex justify-content-center">
	               		<p class="col-md-3 mt-1">비밀번호</p>
						<input type="password" class="form-control col-md-9 mb-4" name="memberPw" id="memberPw" placeholder="비밀번호를 입력하세요">
	                </div>
					<div class="d-flex justify-content-center">
	               		<p class="col-md-3 mt-1">비밀번호 확인</p>
						<input type="password" class="form-control col-md-9" name="memberPwChk" id="memberPwChk" placeholder="비밀번호를 다시 입력하세요">
	                </div>
				</div>
			</div>
			<div>
				<input type="button" class="btn btn-dark mb-5 w-25" style="height:50px;" onclick="memberJoin()" value="회원가입"/>
			</div>
		</form>
		</div>
	</div>
</main>

<footer>
	<%@ include file="inc/footer.jsp" %>
</footer>

<script>
	var cnt = 1;		
	function fileAppend(){
		if(cnt < 2){
			var fileTag = "<input type='file' accept='image/*' class='form-control' name='memberImage' onchange='preViewImg(this)'/>"
							+"<img class='mb-1'/><button type='button' class='btn-close border bg-light'"
							+"style='display:none; position:relative; left:-30px; top:-32px;' onclick='resetInput(this)'></button>"; 
			$("#div-file").empty();
			$("#div-file").append(fileTag);
			cnt++;
		}
	}
	
	function resetInput(obj){
		var imgTag = obj.previousSibling; // 이전 형제요소
		var inputTag = obj.previousSibling.previousSibling;
		
		inputTag.value="";
		imgTag.src="";
		imgTag.width=0;
		imgTag.height=0;
		obj.style.display="none";
	}
	
	// 파일 선택시 동작
	function preViewImg(obj){
		var imgTag = obj.nextSibling; 
		var btnTag = obj.nextSibling.nextSibling; 
		
		console.log(obj.files);
		if(obj.files && obj.files[0]){ 
			var fileReader = new FileReader(); 
			
			fileReader.onload = function(e){
				imgTag.width = 100;
				imgTag.height = 400;
				imgTag.src = e.target.result; 
				btnTag.style.display="";
			}
			
			fileReader.readAsDataURL(obj.files[0]);
		}else{
			imgTag.src="";
		}
	}
	
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
