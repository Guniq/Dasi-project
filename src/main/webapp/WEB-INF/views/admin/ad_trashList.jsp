<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 쓰레기 리스트 페이지 -->

<header>
   	<%@ include file="inc/top.jsp" %>
</header>

<main>
	<div class="trash container">
		<div class="text-center">
			<h2 class="mb-5">
	        	쓰레기 리스트
			</h2>
		</div>
		<form id="searchForm" method="post" action="adminTrash.do">
			<div class="t-search mt-5">
				<select class="form-select me-2" style="width:100px" name="searchType">
					<option value="NC"
						<c:out value="${pageDTO.searchType == 'NC' ? 'selected':''}"/>>선택</option>
					<option value="N"
						<c:out value="${pageDTO.searchType == 'N' ? 'selected':''}"/>>이름</option>
					<option value="C"
						<c:out value="${pageDTO.searchType == 'C' ? 'selected':''}"/>>분류</option>
				</select>
				<input type="text" class="form-control ms-auto" id="keyWord" name="keyWord" value="${pageDTO.keyWord}" placeholder="분리수거 방법을 검색하세요">
				<button class="btn btn-sm btn-secondary" onclick="">검색</button>
			</div>
		</form>
		<table class="table table-bordered text-center mt-4">
			<thead style="background-color:#B1D3C5;">
				<tr>
					<th class="col-md-1">번호</th>				
					<th class="col-md-2">분류</th>				
					<th class="col-md-3">이름</th>				
					<th class="col-md-4">내용</th>				
					<th class="col-md-2">수정 / 삭제</th>				
				</tr>
			</thead>
			<tbody>
				<c:if test="${trashList != null || trashList.size() != 0 }">
				<c:forEach var="trashList" items="${trashList}">
				<tr>
					<td>${trashList.trashNo}</td>
					<td>${trashList.trashCategory}</td>
					<td>${trashList.trashName}</td>
					<td>${fn:substring(trashList.trashContents,0,20)}
						<c:if test="${fn:length(trashList.trashContents) > 20}">
							<c:forEach begin="1" end="1">..</c:forEach>
						</c:if>
					</td>
					<td>
						<a href="trashModify.do?trashNo=${trashList.trashNo}" class="btn btn-sm btn-primary">수정</a>
						<a href="trashRemove.do?trashNo=${trashList.trashNo}" class="btn btn-sm btn-danger">삭제</a>
					</td>
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${trashList == null || trashList.size() == 0}">
					<td colspan="12">게시물이 없습니다!!</td>
				</c:if>
			</tbody>
		</table>
		<ul class="pagination justify-content-center my-5">
		  <li class="page-item ${pageDTO.prevPage <= 0 ? 'disabled' : ''}">
		  	<a class="page-link" href="adminTrash.do?viewPage=${pageDTO.prevPage}&cntPerPage=${pageDTO.cntPerPage}">이전</a>
		  </li>
		  <c:forEach var="i" begin="${pageDTO.blockStart}" end="${pageDTO.blockEnd}">
	  	  	<li class="page-item ${pageDTO.viewPage == i ? 'active' : ''}">
	  	  		<a class="page-link" href="adminTrash.do?viewPage=${i}&cntPerPage=${pageDTO.cntPerPage}&searchType=${pageDTO.searchType}&keyWord=${pageDTO.keyWord}">${i}</a>
	  	  	</li>
		  </c:forEach>
		  <li class="page-item ${pageDTO.blockEnd >= pageDTO.totalPage ? 'disabled' : ''}">
		  	<a class="page-link" href="adminTrash.do?viewPage=${pageDTO.nextPage}&cntPerPage=${pageDTO.cntPerPage}">다음</a>
		  </li>
		</ul>
		<div class="register text-center">
			<button class="mt-3 btn btn-dark" style="width: 200px;" onclick="trashRegisterForm()">쓰레기 등록</button>
		</div>
	</div>
</main>
