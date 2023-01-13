<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 쓰레기 등록 페이지 -->    

<header>
	<%@ include file="inc/top.jsp" %>
</header>

<main>
	<div class="trash_register container w-50">
 		<div class="col-md-12 border shadow-sm rounded text-center">
			<h2 class="mt-5">
	        	쓰레기 등록
			</h2>
		<form action="trashRegister.do" method="post" enctype="multipart/form-data" id="registerForm">
			<div class="container p-5">
				<div class="registerForm">
					<div class="d-flex justify-content-center mt-3">
	               		<p class="col-md-3 mt-1">이름</p>
						<input type="text" class="form-control col-md-9" name="trashName" id="trashName" placeholder="이름을 입력하세요">
	                </div>
	                
	                <div class="d-flex justify-content-center mt-3">
	               		<p class="col-md-3 mt-1">분류</p>
						<select class="form-select h-25" name="trashCategory" id="trashCategory">
							<option selected>분류 선택</option>
						    <option value="일반쓰레기">일반쓰레기</option>
						    <option value="비닐류">비닐류</option>
						    <option value="플라스틱">플라스틱</option>
						</select>
	                </div>
	                
					<!-- 파일업로드 -->
					<div class="row">
	               		<p class="col-md-3">사진 첨부</p>
						<div class="col-md-3">
							<input type="button" class="form-control btn btn-secondary" value="업로드 파일 추가" 
							onclick="fileAppend()"/>
						</div>
						<!-- 미리보기 -->
						<div class="col-md-6" id="div-file">
							<input type="file" name="trashImage" style="display:none;"/>
						</div>
					</div>
					<!-- end 파일업로드 -->
					
	                <div class="d-flex justify-content-center mt-4">
	               		<p class="col-md-3 mt-1">버리는 방법</p>
						<textarea class="form-control col-md-9 mb-4" name="trashContents" id="trashContents"></textarea>
	                </div>
	                
				</div>
			</div>
			<div>
				<input type="button" class="btn btn-dark mb-5 w-25" style="height:50px;" onclick="trashRegister()" value="쓰레기 등록"/>
			</div>
		</form>
		</div>
	</div>
</main>

<script>
	var cnt = 1;		
	function fileAppend(){
		if(cnt < 2){
			var fileTag = "<input type='file' accept='image/*' class='form-control' name='trashImage' onchange='preViewImg(this)'/>"
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
</script>
