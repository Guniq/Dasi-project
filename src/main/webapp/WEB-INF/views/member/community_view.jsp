<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 글 상세보기 페이지 --> 
   
<header>
	<%@ include file="inc/top.jsp" %>
</header>

<main>
	<div class="community_view container w-50">
		<div class="text-center">
			<h2 class="mb-3">
	        	${communityDTO.communityTitle}
			</h2>
			<p class="writer">${communityDTO.communityWriter}</p>
			<c:if test="${communityDTO.communityImage eq 'non'}">
				<div style="color:rgba(0, 0, 0, 0.4);">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-images mb-3" viewBox="0 0 16 16">
					  <path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
					  <path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 
					  2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 
					  0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 
					  1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z"/>
					</svg>
					<p style="font-size:15px;">이미지 없음</p>
				</div>
			</c:if>
			<c:if test="${communityDTO.communityImage ne 'non'}">
				<img class="w-50 h-50" src="uploadFile/${communityDTO.communityImage}"/>
			</c:if>
			<p class="mt-5 mb-5" style="font-size:18px;">${communityDTO.communityContents}</p>
		</div>
		<div class="reply p-4 border rounded shadow-sm">
				<p style="font-size:15px;">댓글 ${replyCnt}개</p>
				<div class="container">
					<c:forEach var="replyList" items="${replyList}">
						<input type="hidden" name="communityNo" value="${replyList.communityNo}"/>
						<span>${replyList.replyWriter}</span>
						<span style="margin-left: 20px;">${replyList.replyDate}</span>
						<p style="font-size:16px;" class="mt-3">${replyList.replyContents}</p>
						
						<div class="replyBtn d-flex">
							<a href="replyRemove.do?replyNo=${replyList.replyNo}&communityNo=${communityDTO.communityNo}" class="btn btn-sm btn-danger">
								삭제
							</a>
						</div>
						<hr/>
					</c:forEach>
			<form action="replyWrite.do" id="replyForm" method="post">
					<input type="hidden" name="communityNo" value="${communityDTO.communityNo}"/>
					<input type="text" class="form-control mb-2" style="width: 100px; height: 35px;" name="replyWriter" placeholder="닉네임"/>
					<textarea class="form-control" name="replyContents" placeholder="댓글을 입력하세요"></textarea>
				</div>
				<div class="button text-center">
					<input type="button" class="btn btn-dark mt-4" value="댓글 등록" onclick="replyWriteChk()"/>
				</div>
			</form>
		</div>
		<div class="buttons d-flex justify-content-between">
			<div class="mt-3">
				<a href="community.do" class="btn btn-outline-secondary">목록보기</a>
			</div>
			<c:if test="${communityDTO.communityCategory ne '공지사항'}">
				<div class="mt-3">
					<button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#modifyModal">글 수정</button>
					<button class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#removeModal">글 삭제</button>
				</div>
			</c:if>
		</div>
		
		<!-- 수정 Modal -->
		<div class="modal mt-5" id="modifyModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">수정하시려면 작성자명과 비밀번호를 입력하세요</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      	<form action="communityModify.do" method="get">
			        <input type="hidden" name="communityNo" value="${communityDTO.communityNo}"/>
			        <p class="mb-3" style="font-size:16px;">작성자명 입력</p>
			        <input type="text" class="form-control mb-2" name="communityWriter" id="communityWriter" placeholder="작성자명을 입력하세요"/>
			        <p class="mb-3" style="font-size:16px;">비밀번호 입력</p>
			        <input type="text" class="form-control mb-2" name="communityPw" id="communityPw" placeholder="비밀번호를 입력하세요"/>
					<p id="result_checkPw" class="" style="font-size:14px;"></p>
					<div class="d-flex justify-content-between" id="div-button">
						<input type="button" class="btn btn-sm btn-dark" id="modifyCheckPw" value="비밀번호 검사"/>
					</div>
				</form>
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
		      </div>
		
		    </div>
		  </div>
		</div>
		
		<!-- 삭제 Modal -->
		<div class="modal mt-5" id="removeModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">삭제하시려면 작성자명과 비밀번호를 입력하세요</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      	<form action="communityRemove.do" method="get">
			        <input type="hidden" name="communityNo" value="${communityDTO.communityNo}"/>
		      		<p class="mb-3" style="font-size:16px;">작성자명 입력</p>
			        <input type="text" class="form-control mb-2" name="communityWriter" id="communityWriter2" placeholder="작성자명을 입력하세요"/>
			        <p class="mb-3" style="font-size:16px;">비밀번호 입력</p>
			        <input type="text" class="form-control mb-2" name="communityPw" id="communityPw2" placeholder="비밀번호를 입력하세요"/>
					<p id="result_checkPw2" class="" style="font-size:14px;"></p>
					<div class="d-flex justify-content-between" id="div-button2">
						<input type="button" class="btn btn-sm btn-dark" id="removeCheckPw" value="비밀번호 검사"/>
					</div>
				</form>
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
		      </div>
		
		    </div>
		  </div>
		</div>
	</div>
</main>

<footer>
	<%@ include file="inc/footer.jsp" %>
</footer>

