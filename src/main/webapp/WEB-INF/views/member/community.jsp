<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 커뮤니티 페이지 --> 
   
<header>
	<%@ include file="inc/top.jsp" %>
</header>

<main>
	<div class="community container">
		<div class="text-center">
			<h2 class="mb-3">
	        	커뮤니티
			</h2>
			<p style="font-size:15px;">쓰레기, 환경, 라이프 스타일에 대한 모두의 커뮤니티</p>
		</div>
		<form id="searchForm" method="post" action="community.do">
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
			<thead>
				<tr>
					<th class="col-md-2">분류</th>				
					<th class="col-md-5">제목</th>				
					<th class="col-md-2">작성자</th>				
					<th class="col-md-3">작성 일</th>				
				</tr>
			</thead>
			<tbody>
				<c:if test="${communityList != null || communityList.size() != 0 }">
				<c:forEach var="communityList" items="${communityList}">
					<input type="hidden" value="${communityList.communityNo}">				
					<tr>
						<td>${communityList.communityCategory}</td>
						<td><a href="communityView.do?communityNo=${communityList.communityNo}">${communityList.communityTitle}</a></td>
						<td>${communityList.communityWriter}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${communityList.communityDate}"/></td>
					</tr>
				</c:forEach>
				</c:if>
				<c:if test="${communityList ==null || communityList.size() ==0 }">
					<td colspan="12">게시물이 없습니다!!</td>
				</c:if>
				
			</tbody>
		</table>
		<ul class="pagination justify-content-center my-5">
		  <li class="page-item ${pageDTO.prevPage <= 0 ? 'disabled' : ''}">
		  	<a class="page-link" href="community.do?viewPage=${pageDTO.prevPage}&cntPerPage=${pageDTO.cntPerPage}">이전</a>
		  </li>
		  <c:forEach var="i" begin="${pageDTO.blockStart}" end="${pageDTO.blockEnd}">
	  	  	<li class="page-item ${pageDTO.viewPage == i ? 'active' : ''}">
	  	  		<a class="page-link" href="community.do?viewPage=${i}&cntPerPage=${pageDTO.cntPerPage}&searchType=${pageDTO.searchType}&keyWord=${pageDTO.keyWord}">${i}</a>
	  	  	</li>
		  </c:forEach>
		  <li class="page-item ${pageDTO.blockEnd >= pageDTO.totalPage ? 'disabled' : ''}">
		  	<a class="page-link" href="community.do?viewPage=${pageDTO.nextPage}&cntPerPage=${pageDTO.cntPerPage}">다음</a>
		  </li>
		</ul>
		<div class="write text-center">
			<button class="btn btn-dark" onclick="writeForm()">글쓰기</button>
		</div>
	</div>
</main>

<footer>
	<%@ include file="inc/footer.jsp" %>
</footer>

<script>
	function writeForm(){
		window.location.href = "communityWrite.do"
	}
</script>