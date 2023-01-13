<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 쓰레기 상세보기 페이지 --> 
   
<header>
	<%@ include file="inc/top.jsp" %>
</header>

<main>
	<div class="trash_view container w-50 border rounded shadow-sm">
		<input type="hidden" value="${trashDTO.trashNo}"/>
		<div class="d-flex p-5">
			<c:if test="${trashDTO.trashImage eq 'non'}">
				<div class="col-md-6 p-5" style="color:rgba(0, 0, 0, 0.4);">
					<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="currentColor" class="bi bi-images mb-5" viewBox="0 0 16 16">
					  <path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
					  <path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 
					  2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 
					  0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 
					  1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z"/>
					</svg>
					<p style="font-size:15px;" class="text-center">이미지 없음</p>
				</div>
			</c:if>
			<c:if test="${trashDTO.trashImage ne 'non'}">
				<img class="col-md-6" src="uploadFile/${trashDTO.trashImage}"/>
			</c:if>
			<div class="col-md-6">
				<h2 class="mb-3">
		        	${trashDTO.trashName}
				</h2>
				<p style="font-size:16px;">분류 : ${trashDTO.trashCategory}</p>
				<h5 class="mt-5">버리는 방법</h5>
				<p class="mt-3 mb-5" style="font-size:16px;"> - ${trashDTO.trashContents}</p>
			</div>
		</div>
		<div class="button p-5">
			<div class="mt-3">
				<a href="trashList.do" class="btn btn-outline-secondary">목록보기</a>
			</div>
		</div>
	</div>
</main>

<footer>
	<%@ include file="inc/footer.jsp" %>
</footer>
