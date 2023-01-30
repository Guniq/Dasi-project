
/**
 * customer 유효성 검사
 */


/* 로그인 */
	function loginValid(){
		if(loginForm.memberId.value == ""){
			alert("아이디를 입력하세요!");
			memberId.focus();
		}else if(loginForm.memberPw.value == ""){
			alert("비밀번호를 입력하세요!");
			memberPw.focus();
		}
		else{
			loginForm.submit();
		}
	}

/* 중복확인 ajax */	
	/* 아이디 */
	$(function(){
		
		$("#checkId").click(function(){
			
			let memberId = $("#memberId").val();
			
			if(memberId != ''){
				$.ajax({
					type: 'post',
					url: "/dasi/memberIdChk.do",
					data: {"memberId":memberId},
					success: function(data){
						if(data == "N"){
							result = "사용가능한 아이디입니다!";
							$("#result_checkId").html(result).css("color", "green");
							$("#memberEmail").trigger("focus");
						}else{
							result = "이미 사용중인 아이디입니다!";
							$("#result_checkId").html(result).css("color", "red");
							$("#memberId").val("").trigger("focus");
						}
						
					},
					error : function(error){alert(error);}
				});
			}else{
				alert('아이디를 입력하세요!');
				$("#memberId").focus();
			}
		});
	});
	
	/* 닉네임 */
	$(function(){
		
		$("#checkName").click(function(){
			
			let memberName = $("#memberName").val();
			
			if(memberName != ''){
				$.ajax({
					type: 'post',
					url: "/dasi/memberNameChk.do",
					data: {"memberName":memberName},
					success: function(data){
						if(data == "N"){
							result = "사용가능한 닉네임입니다!";
							$("#result_checkName").html(result).css("color", "green");
							$("#memberPw").trigger("focus");
						}else{
							result = "이미 사용중인 닉네임입니다!";
							$("#result_checkName").html(result).css("color", "red");
							$("#memberName").val("").trigger("focus");
						}
						
					},
					error : function(error){alert(error);}
				});
			}else{
				alert('닉네임을 입력하세요!');
				$("#memberName").focus();
			}
		});
	});
	
	
/* 회원가입 */	
	function memberJoin(){
		if(joinForm.memberId.value == ""){
			alert("아이디를 입력하세요!");
			memberId.focus();
			
		}else if(joinForm.memberId.value.length < 3){
			alert("아이디는 세글자 이상만 가능합니다");
			memberId.focus();
			
		}else if(joinForm.memberEmail.value == ''){
			alert("이메일을 입력하세요!");
			memberEmail.focus();
			
		}else if(joinForm.emailKey.value == ""){
			alert("인증번호를 입력하세요!");
			emailKey.focus();
		
		}else if(joinForm.emailKey.value != emailData){
			alert("인증번호가 일치하지 않습니다.");
			emailKey.focus();
			return false;
		
		}else if(joinForm.memberName.value == ""){
			alert("닉네임을 입력하세요!");
			memberName.focus();
			
		}else if(joinForm.memberName.value.length < 3){
			alert("닉네임은 세글자 이상만 가능합니다!");
			memberName.focus();
			
		}else if(joinForm.memberPw.value == ""){
			alert("비밀번호를 입력하세요!");
			memberPw.focus();
			
		}else if(joinForm.memberPw.value.length < 4){
			alert("비밀번호는 네글자 이상만 가능합니다!");
			memberPw.focus();
			
		}else if(joinForm.memberPwChk.value == ""){
			alert("비밀번호 확인을 입력하세요!");
			memberPwChk.focus();
			
		}else if(joinForm.memberPw.value != joinForm.memberPwChk.value){
			alert("비밀번호 확인이 잘못됐습니다. 다시 입력하세요!");
			memberPwChk.focus();
			
		}else{
			alert("회원가입이 완료되었습니다. 환영합니다!");
			joinForm.submit();
		}
	}
	
/* 회원 수정 */
	function memberModify(){
		modifyForm.submit();
	}
	
/* 커뮤니티 글쓰기 */
	function communityWrite(){
		if(writeForm.communityTitle.value == ""){
			alert("글 제목을 입력하세요!");
			communityTitle.focus();
			
		}else if(writeForm.communityCategory.value == "분류 선택"){
			alert("분류를 선택하세요!");
			communityCategory.focus();
			
		}else if(writeForm.communityContents.value == ""){
			alert("내용을 입력하세요!");
			communityContents.focus();
			
		}else if(writeForm.communityWriter.value == ""){
			alert("작성자를 입력하세요!");
			communityWriter.focus();
			
		}else if(writeForm.communityPw.value == ""){
			alert("비밀번호를 입력하세요!");
			communityPw.focus();
		
		}else if(writeForm.communityPw.value.length < 4){
			alert("비밀번호는 네글자 이상만 가능합니다");
			communityPw.focus();
		
		}else{
			writeForm.submit();
		}
	}
	
/* 커뮤니티 수정 비밀번호 검사 ajax */	
	$(function(){
		let cnt = 1;
		$("#modifyCheckPw").click(function(){
			
			let communityWriter = $("#communityWriter").val();
			let communityPw = $("#communityPw").val();
			
			if(communityPw != ''){
				$.ajax({
					type: 'post',
					url: "/dasi/communityPwChk.do",
					data: {"communityWriter":communityWriter, "communityPw":communityPw},
					success: function(data){
						
						if(data == "Y"){
							result = "작성자명과 비밀번호가 일치합니다. 수정하시려면 글 수정 버튼을 누르세요!";
							$("#result_checkPw").html(result).css("color", "green");
							if(cnt < 2){
								var buttonTag = "<input type='submit' class='btn btn-sm btn-primary' value='글 수정'/>"
								$("#div-button").append(buttonTag);
								cnt++;
							}
						}else{
							result = "작성자명과 비밀번호가 틀렸습니다. 다시 확인하세요!";
							$("#result_checkPw").html(result).css("color", "red");
							$("#communityPw").val("").trigger("focus");
						}
					},
					error : function(error){alert(error);}
				});
			}else{
				alert('비밀번호를 입력하세요!');
				$("#communityPw").focus();
			}
		});
	});	
	
/* 커뮤니티 삭제 비밀번호 검사 ajax */	
	$(function(){
		let cnt = 1;
		$("#removeCheckPw").click(function(){
			
			let communityWriter2 = $("#communityWriter2").val();
			let communityPw2 = $("#communityPw2").val();
			
			if(communityPw2 != ''){
				$.ajax({
					type: 'post',
					url: "/dasi/communityPwChk.do",
					data: {"communityWriter":communityWriter2, "communityPw":communityPw2},
					success: function(data){
						if(data == "Y"){
							result = "작성자명과 비밀번호가 일치합니다. 수정하시려면 글 수정 버튼을 누르세요!";
							$("#result_checkPw2").html(result).css("color", "green");
							if(cnt < 2){
								var buttonTag = "<input type='submit' class='btn btn-sm btn-danger' value='글 삭제'/>"
								$("#div-button2").append(buttonTag);
								$("#div-button2").click(function(){
									alert("게시글이 삭제됐습니다!");
								});
								cnt++;
							}
						}else{
							result = "작성자명과 비밀번호가 틀렸습니다. 다시 확인하세요!";
							$("#result_checkPw2").html(result).css("color", "red");
							$("#communityPw2").val("").trigger("focus");
						}
						
					},
					error : function(error){alert(error);}
				});
			}else{
				alert('비밀번호를 입력하세요!');
				$("#communityPw2").focus();
			}
			
		});
		
	});	


/* 커뮤니티 수정 */
	function communityModify(){
		if(modifyForm.communityTitle.value == ""){
			alert("글 제목을 입력하세요!");
			communityTitle.focus();
			
		}else if(modifyForm.communityWriter.value == ""){
			alert("작성자를 입력하세요!");
			communityWriter.focus();
			
		}else if(modifyForm.communityPw.value == ""){
			alert("비밀번호를 입력하세요!");
			communityPw.focus();
		
		}else if(modifyForm.communityPw.value.length < 4){
			alert("비밀번호는 네글자 이상만 가능합니다");
			communityPw.focus();
		
		}else if(modifyForm.communityContents.value == ""){
			alert("내용을 입력하세요!");
			communityContents.focus();
			
		}else{
			modifyForm.submit();
		}
	}


/* 댓글 쓰기 */
	function replyWriteChk(){
		if(replyForm.replyWriter.value == "" || replyForm.replyWriter.value.length <= 1){
			alert("닉네임은 최소 두글자 이상이어야 합니다.");
		}else if(replyForm.replyContents.value == "" || replyForm.replyContents.value.length <= 1){
			alert("댓글은 최소 두글자 이상이어야 합니다.");	
		}else{
			replyForm.submit();
		}
	}

/* 아이디 찾기 */
	function findId(){
		if(findIdForm.memberName.value == ''){
			alert("닉네임을 입력하세요!");
			memberName.focus();
			
		}else if(findIdForm.memberEmail.value == ''){
			alert("이메일을 입력하세요!");
			memberEmail.focus();
			
		}else if(findIdForm.emailKey.value == ""){
			alert("인증번호를 입력하세요!");
			emailKey.focus();
		
		}else if(findIdForm.emailKey.value != emailData){
			alert("인증번호가 일치하지 않습니다.");
			emailKey.focus();
			return false;
		
		}else{
			findIdForm.submit();
		}
	}
	
/* 비밀번호 찾기 */
	function findPw(){
		if(findPwForm.memberId.value == ''){
			alert("아이디를 입력하세요!");
			memberId.focus();
		
		}else if(findPwForm.memberEmail.value == ''){
			alert("이메일을 입력하세요!");
			memberEmail.focus();
			
		}else if(findPwForm.emailKey.value == ''){
			alert("인증번호를 입력하세요!");
			emailKey.focus();
		
		}else if(findPwForm.emailKey.value != emailData){
			alert("인증번호가 일치하지 않습니다.");
			emailKey.focus();
			return false;
		
		}else if(findPwForm.memberPw.value == ''){
			console.log(findPwForm.memberPw.value);
			alert("비밀번호를 입력하세요!");
			memberPw.focus();
			
		}else if(findPwForm.memberPw.value.length < 4){
			alert("비밀번호는 네글자 이상만 가능합니다!");
			memberPw.focus();
			
		}else if(findPwForm.memberPwChk.value == ''){
			alert("비밀번호 확인을 입력하세요!");
			memberPwChk.focus();
			
		}else if(findPwForm.memberPw.value != findPwForm.memberPwChk.value){
			alert("비밀번호 확인이 잘못됐습니다. 다시 입력하세요!");
			memberPwChk.focus();
			
		}else{
			findPwForm.submit();
		}
	}