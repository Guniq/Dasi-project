/**
 * admin 유효성 검사
 */

/* 로그인 */
	function adminLogin(){
		if(loginForm.adminId.value == ""){
			alert("아이디를 입력하세요!");
			adminId.focus();
			
		}else if(loginForm.adminPw.value == ""){
			alert("비밀번호를 입력하세요!");
			adminPw.focus();
			
		}else{
			loginForm.submit();
		}
	}
	
/* 샵 등록 */
	function shopRegisterForm(){
		window.location.href = "shopRegister.do"
	}
	
	function shopRegister(){
		if(registerForm.shopName.value == ""){
			alert("이름을 입력하세요!");
			shopName.focus();
			
		}else if(registerForm.shopLink.value == ""){
			alert("홈페이지 링크를 입력하세요!");
			shopLink.focus();
			
		}else{
			registerForm.submit();
		}
	}

/* 샵 수정하기 */
	function shopModify(){
		
		if(modifyForm.shopName.value == ""){
			alert("이름을 입력하세요!");
			shopName.focus();
			
		}else if(modifyForm.shopLink.value == ""){
			alert("홈페이지 링크를 입력하세요!");
			shopLink.focus();
			
		}else{
			modifyForm.submit();
		}
	}
	
/* 공지사항 쓰기 */
	function communityWriteForm(){
		window.location.href = "adminCommunityWrite.do"
	}
	
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

/* 공지사항 수정 */
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
	
/* 쓰레기 등록 */
	function trashRegisterForm(){
		window.location.href = "trashRegister.do"
	}
	
	function trashRegister(){
		if(registerForm.trashName.value == ""){
			alert("이름을 입력하세요!");
			trashName.focus();
			
		}else if(registerForm.trashCategory.value == "분류 선택"){
			alert("분류를 선택하세요!");
			trashCategory.focus();
			
		}else if(registerForm.trashContents.value == ""){
			alert("버리는 방법을 입력하세요!");
			trashContents.focus();
			
		}else{
			registerForm.submit();
		}
	}
	
/* 쓰레기 수정 */
	function trashModify(){
		if(modifyForm.trashName.value == ""){
			alert("이름을 입력하세요!");
			trashName.focus();
			
		}else if(modifyForm.trashCategory.value == "분류 선택"){
			alert("분류를 선택하세요!");
			trashCategory.focus();
			
		}else if(modifyForm.trashContents.value == ""){
			alert("버리는 방법을 입력하세요!");
			trashContents.focus();
			
		}else{
			modifyForm.submit();
		}
	}