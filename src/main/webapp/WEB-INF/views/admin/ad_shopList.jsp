<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 샵 리스트 페이지 -->

<header>
   	<%@ include file="inc/top.jsp" %>
</header>

<main>
	<div class="shop container">
		<div class="text-center">
			<h2 class="mb-5">
	        	제로웨이스트 샵 리스트
			</h2>
		</div>
		<form id="searchForm" method="post" action="adminShop.do">
			<div class="s-search mt-5">
				<select class="form-select me-2" style="width:100px" name="searchType">
					<option value="N"
						<c:out value="${pageDTO.searchType == 'N' ? 'selected':''}"/>>이름</option>
				</select>
				<input type="text" class="form-control ms-auto" id="keyWord" name="keyWord" value="${pageDTO.keyWord}" placeholder="게시글을 검색하세요">
				<button class="btn btn-sm btn-secondary" onclick="">검색</button>
			</div>
		</form>
		<table class="table table-bordered text-center mt-4">
			<thead style="background-color:#C7D6DB;">
				<tr>
					<th class="col-md-3">등록 일</th>				
					<th class="col-md-3">이름</th>				
					<th class="col-md-4">링크</th>				
					<th class="col-md-2">수정 / 삭제</th>				
				</tr>
			</thead>
			<tbody>
				<c:if test="${shopList != null || shopList.size() != 0 }">
				<c:forEach var="shopList" items="${shopList}">
				<tr>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${shopList.shopDate}"/></td>
					<td>${shopList.shopName}</td>
					<td>${fn:substring(shopList.shopLink,0,30)}
						<c:if test="${fn:length(shopList.shopLink) > 30}">
							<c:forEach begin="1" end="1">..</c:forEach>
						</c:if>
					</td>
					<td>
						<a href="shopModify.do?shopNo=${shopList.shopNo}" class="btn btn-sm btn-primary">수정</a>
						<a href="shopRemove.do?shopNo=${shopList.shopNo}" class="btn btn-sm btn-danger">삭제</a>
					</td>
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${shopList ==null || shopList.size() ==0 }">
					<td colspan="12">게시물이 없습니다!!</td>
				</c:if>
			</tbody>
		</table>
		<ul class="pagination justify-content-center my-5">
		  <li class="page-item ${pageDTO.prevPage <= 0 ? 'disabled' : ''}">
		  	<a class="page-link" href="adminShop.do?viewPage=${pageDTO.prevPage}&cntPerPage=${pageDTO.cntPerPage}">이전</a>
		  </li>
		  <c:forEach var="i" begin="${pageDTO.blockStart}" end="${pageDTO.blockEnd}">
	  	  	<li class="page-item ${pageDTO.viewPage == i ? 'active' : ''}">
	  	  		<a class="page-link" href="adminShop.do?viewPage=${i}&cntPerPage=${pageDTO.cntPerPage}&searchType=${pageDTO.searchType}&keyWord=${pageDTO.keyWord}">${i}</a>
	  	  	</li>
		  </c:forEach>
		  <li class="page-item ${pageDTO.blockEnd >= pageDTO.totalPage ? 'disabled' : ''}">
		  	<a class="page-link" href="adminShop.do?viewPage=${pageDTO.nextPage}&cntPerPage=${pageDTO.cntPerPage}">다음</a>
		  </li>
		</ul>
		<div class="register text-center">
			<button class="mt-3 btn btn-dark" style="width: 200px;" onclick="shopRegisterForm()">샵 등록</button>
		</div>
	</div>
</main>
