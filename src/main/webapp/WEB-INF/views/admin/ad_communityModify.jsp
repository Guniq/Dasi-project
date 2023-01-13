<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 공지사항 수정 페이지 -->    

<header>
	<%@ include file="inc/top.jsp" %>
</header>

<main>
	<div class="community_modify container w-50">
 		<div class="col-md-12 border shadow-sm rounded text-center">
			<h2 class="mt-5">
	        	공지사항 수정
			</h2>
		<form action="adminCommunityModify.do" method="post" enctype="multipart/form-data" id="modifyForm">
			<input type="hidden" name="communityNo" value="${communityDTO.communityNo}">
			<div class="container p-5">
				<div class="modifyForm">
			 	    
			 	    <!-- 파일업로드 -->
					<div class="row">
	               		<p class="col-md-3">사진 첨부</p>
						<div class="col-md-3">
							<input type="button" class="form-control btn btn-secondary" value="업로드 파일 수정" 
							onclick="fileAppend()"/>
						</div>
						<!-- 미리보기 -->
						<c:if test="${communityDTO.communityImage eq 'non'}">
							<div class="col-md-6" id="div-file">
								<p class="text-left" style="font-size:16px;">첨부된 사진이 없습니다!</p>
								<input type="file" name="communityImage" style="display:none;"/>
							</div>
						</c:if>
						<c:if test="${communityDTO.communityImage ne 'non'}">
							<div class="col-md-6" id="div-file">
								<img src="uploadFile/${communityDTO.communityImage}"/>
								<input type="hidden" name="communityImage" value="${communityDTO.communityImage}"/>
							</div>
						</c:if>
					</div>
					<!-- end 파일업로드 -->
					
					<div class="d-flex justify-content-center mt-3">
	               		<p class="col-md-3 mt-1">글 제목</p>
						<input type="text" class="form-control col-md-9" name="communityTitle" id="communityTitle" value="${communityDTO.communityTitle}">
	                </div>
					<div class="d-flex justify-content-center mt-3">
	               		<p class="col-md-3 mt-1">분류</p>
						<select class="form-select" style="height: 40px;" name="communityCategory" id="communityCategory">
							<option selected>${communityDTO.communityCategory}</option>
						    <option value="공지사항">공지사항</option>
						</select>
	                </div>
					<div class="d-flex justify-content-center mt-4">
	               		<p class="col-md-3 mt-1">작성자</p>
						<input type="text" class="form-control col-md-9 mb-4" name="communityWriter" id="communityWriter" value="${communityDTO.communityWriter}">
	                </div>
					<div class="d-flex justify-content-center mt-1">
	               		<p class="col-md-3 mt-1">비밀번호</p>
						<input type="password" class="form-control col-md-9 mb-4" name="communityPw" id="communityPw" value="${communityDTO.communityPw}">
	                </div>
					<div class="d-flex justify-content-center mt-1">
	               		<p class="col-md-3 mt-1">내용</p>
						<textarea class="form-control col-md-9 mb-4" name="communityContents" id="communityContents">${communityDTO.communityContents}</textarea>
	                </div>
				</div>
			</div>
			<div>
				<input type="button" class="btn btn-dark mb-5 w-25" style="height:50px;" onclick="communityModify()" value="수정하기"/>
			</div>
		</form>
		</div>
	</div>
</main>

<script>
	var cnt = 1;	
	
	function fileAppend(){
		if (confirm("사진을 수정하시겠습니까?")) {
			if(cnt < 2){
				var fileTag = "<input type='file' accept='image/*' class='form-control' name='communityImage' onchange='preViewImg(this)'/>"
								+"<img class='mb-1'/><button type='button' class='btn-close border bg-light'"
								+"style='display:none; position:relative; left:-30px; top:-32px;' onclick='resetInput(this)'></button>"; 
				
				$("#div-file").empty();
				$("#div-file").append(fileTag);
				cnt++;
			}
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
</script>