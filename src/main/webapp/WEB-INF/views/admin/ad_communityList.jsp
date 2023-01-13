<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 커뮤니티 리스트 페이지 -->
    
<header>
   	<%@ include file="inc/top.jsp" %>
</header>

<main>
	<div class="community container">
		<div class="text-center">
			<h2 class="mb-5">
	        	커뮤니티 신고 리스트
			</h2>
		</div>
		<form id="searchForm" method="post" action="adminCommunity.do">
			<div class="c-search mt-5">
				<select class="form-select me-2" style="width:100px" name="searchType">
					<option value="TC"
						<c:out value="${pageDTO.searchType == 'TC' ? 'selected':''}"/>>선택</option>
					<option value="T"
						<c:out value="${pageDTO.searchType == 'T' ? 'selected':''}"/>>제목</option>
					<option value="C"
						<c:out value="${pageDTO.searchType == 'C' ? 'selected':''}"/>>분류</option>
				</select>
				<input type="text" class="form-control ms-auto" id="keyWord" name="keyWord" value="${pageDTO.keyWord}" placeholder="게시글을 검색하세요">
				<button class="btn btn-sm btn-secondary" onclick="">검색</button>
			</div>
		</form>
		<table class="table table-bordered text-center mt-4">
			<thead style="background-color:#C6D2BE;">
				<tr>
					<th class="col-md-2">분류</th>				
					<th class="col-md-2">글 제목</th>				
					<th class="col-md-3">글 내용</th>		
					<th class="col-md-2">작성자</th>		
					<th class="col-md-1">비밀번호</th>		
					<th class="col-md-2">비고</th>		
				</tr>
			</thead>
			<tbody>
				<c:if test="${communityList != null || communityList.size() != 0 }">
					<c:forEach var="communityList" items="${communityList}">
						<tr>
							<td>${communityList.communityCategory}</td>
							<td>${communityList.communityTitle}</td>
							<td>${fn:substring(communityList.communityContents,0,15)}
								<c:if test="${fn:length(communityList.communityContents) > 15}">
									<c:forEach begin="1" end="1">..</c:forEach>
								</c:if>
							</td>
							<td>${communityList.communityWriter}</td>
							<td>${communityList.communityPw}</td>
							<c:if test="${communityList.communityCategory eq '공지사항'}">
								<td>
									<a href="adminCommunityModify.do?communityNo=${communityList.communityNo}" class="btn btn-sm btn-primary">수정</a>
									<a href="adminCommunityRemove.do?communityNo=${communityList.communityNo}" class="btn btn-sm btn-danger">삭제</a>
								</td>
							</c:if>
							<c:if test="${communityList.communityCategory eq '신고' || communityList.communityCategory eq '수정 요청'}">
								<td>처리 요망</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${communityList == null || communityList.size() == 0 }">
					<td colspan="12">게시물이 없습니다!!</td>
				</c:if>
			</tbody>
		</table>
		<ul class="pagination justify-content-center my-5">
		  <li class="page-item ${pageDTO.prevPage <= 0 ? 'disabled' : ''}">
		  	<a class="page-link" href="adminCommunity.do?viewPage=${pageDTO.prevPage}&cntPerPage=${pageDTO.cntPerPage}">이전</a>
		  </li>
		  <c:forEach var="i" begin="${pageDTO.blockStart}" end="${pageDTO.blockEnd}">
	  	  	<li class="page-item ${pageDTO.viewPage == i ? 'active' : ''}">
	  	  		<a class="page-link" href="adminCommunity.do?viewPage=${i}&cntPerPage=${pageDTO.cntPerPage}&searchType=${pageDTO.searchType}&keyWord=${pageDTO.keyWord}">${i}</a>
	  	  	</li>
		  </c:forEach>
		  <li class="page-item ${pageDTO.blockEnd >= pageDTO.totalPage ? 'disabled' : ''}">
		  	<a class="page-link" href="adminCommunity.do?viewPage=${pageDTO.nextPage}&cntPerPage=${pageDTO.cntPerPage}">다음</a>
		  </li>
		</ul>
		<div class="register text-center">
			<button class="mt-3 btn btn-dark" style="width: 200px;" onclick="communityWriteForm()">공지사항 쓰기</button>
		</div>
	</div>
</main>
