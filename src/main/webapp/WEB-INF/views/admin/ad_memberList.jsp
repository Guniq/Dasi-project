<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 회원 리스트 페이지 -->
    
<header>
   	<%@ include file="inc/top.jsp" %>
</header>

<main>
	<div class="member container">
		<div class="text-center">
			<h2 class="mb-5">
	        	회원 리스트
			</h2>
		</div>
		<form id="searchForm" method="post" action="adminMember.do">
			<div class="m-search mt-5">
				<select class="form-select me-2" style="width:100px" name="searchType">
					<option value="IN"
						<c:out value="${pageDTO.searchType == 'IN' ? 'selected':''}"/>>선택</option>
					<option value="I"
						<c:out value="${pageDTO.searchType == 'I' ? 'selected':''}"/>>아이디</option>
					<option value="N"
						<c:out value="${pageDTO.searchType == 'N' ? 'selected':''}"/>>닉네임</option>
				</select>
				<input type="text" class="form-control ms-auto" id="keyWord" name="keyWord" value="${pageDTO.keyWord}" placeholder="게시글을 검색하세요">
				<button class="btn btn-sm btn-secondary" onclick="">검색</button>
			</div>
		</form>
		<table class="table table-bordered text-center mt-4">
			<thead style="background-color:#F2EEE5">
				<tr>
					<th class="col-md-2">번호</th>				
					<th class="col-md-3">아이디</th>				
					<th class="col-md-3">닉네임</th>				
					<th class="col-md-2">수정 / 삭제</th>		
				</tr>
			</thead>
			<tbody>
				<c:if test="${memberList != null || memberList.size() != 0 }">
				<c:forEach var="memberList" items="${memberList}">
				<tr>
					<td>${memberList.memberNo}</td>
					<td>${memberList.memberId}</td>
					<td>${memberList.memberName}</td>
					<td>
						<a href="memberRemove.do?memberNo=${memberList.memberNo}" class="btn btn-sm btn-danger">삭제</a>
					</td>
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${memberList == null || memberList.size() == 0}">
					<td colspan="12">게시물이 없습니다!!</td>
				</c:if>
			</tbody>
		</table>
		<ul class="pagination justify-content-center my-5">
		  <li class="page-item ${pageDTO.prevPage <= 0 ? 'disabled' : ''}">
		  	<a class="page-link" href="adminMember.do?viewPage=${pageDTO.prevPage}&cntPerPage=${pageDTO.cntPerPage}">이전</a>
		  </li>
		  <c:forEach var="i" begin="${pageDTO.blockStart}" end="${pageDTO.blockEnd}">
	  	  	<li class="page-item ${pageDTO.viewPage == i ? 'active' : ''}">
	  	  		<a class="page-link" href="adminMember.do?viewPage=${i}&cntPerPage=${pageDTO.cntPerPage}&searchType=${pageDTO.searchType}&keyWord=${pageDTO.keyWord}">${i}</a>
	  	  	</li>
		  </c:forEach>
		  <li class="page-item ${pageDTO.blockEnd >= pageDTO.totalPage ? 'disabled' : ''}">
		  	<a class="page-link" href="adminMember.do?viewPage=${pageDTO.nextPage}&cntPerPage=${pageDTO.cntPerPage}">다음</a>
		  </li>
		</ul>
	</div>
</main>
    
