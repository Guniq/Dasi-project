<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 분리수거 방법 페이지 --> 
   
<header>
	<%@ include file="inc/top.jsp" %>
</header>

<main>
	<div class="trash container">
		<div class="text-center">
			<h2 class="mb-3">
	        	분리수거 방법
			</h2>
			<p style="font-size:15px;">분리수거 방법, 꼼꼼히 알려드려요!</p>
		</div>
		<form id="searchForm" method="post" action="trashList.do">
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
			<thead>
				<tr>
					<th class="col-md-3">분류</th>				
					<th class="col-md-4">이름</th>				
					<th class="col-md-2">조회수</th>				
					<th class="col-md-3">작성 일</th>				
				</tr>
			</thead>
			<tbody>
				<c:if test="${trashList != null || trashList.size() != 0 }">
				<c:forEach var="shopList" items="${trashList}">
					<input type="hidden" value="${shopList.trashNo}">				
				<tr>
					<td>${shopList.trashCategory}</td>
					<td><a href="trashView.do?trashNo=${shopList.trashNo}">${shopList.trashName}</a></td>
					<td>${shopList.trashHit}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${shopList.trashDate}"/></td>
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${trashList ==null || trashList.size() ==0 }">
					<td colspan="12">게시물이 없습니다!!</td>
				</c:if>
				
			</tbody>
		</table>
		<ul class="pagination justify-content-center my-5">
		  <li class="page-item ${pageDTO.prevPage <= 0 ? 'disabled' : ''}">
		  	<a class="page-link" href="trashList.do?viewPage=${pageDTO.prevPage}&cntPerPage=${pageDTO.cntPerPage}">이전</a>
		  </li>
		  <c:forEach var="i" begin="${pageDTO.blockStart}" end="${pageDTO.blockEnd}">
	  	  	<li class="page-item ${pageDTO.viewPage == i ? 'active' : ''}">
	  	  		<a class="page-link" href="trashList.do?viewPage=${i}&cntPerPage=${pageDTO.cntPerPage}&searchType=${pageDTO.searchType}&keyWord=${pageDTO.keyWord}">${i}</a>
	  	  	</li>
		  </c:forEach>
		  <li class="page-item ${pageDTO.blockEnd >= pageDTO.totalPage ? 'disabled' : ''}">
		  	<a class="page-link" href="trashList.do?viewPage=${pageDTO.nextPage}&cntPerPage=${pageDTO.cntPerPage}">다음</a>
		  </li>
		</ul>
	</div>
</main>

<footer>
	<%@ include file="inc/footer.jsp" %>
</footer>

<script>
	function writeForm(){
		window.location.href = "write.do"
	}
</script>