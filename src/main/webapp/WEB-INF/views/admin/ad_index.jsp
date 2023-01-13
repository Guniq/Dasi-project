<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 관리자 메인페이지 -->

<header>
	<%@ include file="inc/top.jsp" %>
</header>

<c:if test="${sessionScope.adminId == null}">
	<script>
		window.location.href='adminLogin.do';
	</script>
</c:if>

<main>
	<div class="member container">
		<div class="text-center">
			<h2 class="mb-5">
	        	최근 가입 회원
			</h2>
		</div>
		<table class="table table-bordered text-center mt-4">
			<thead style="background-color:#EBEBE3">
				<tr>
					<th class="col-md-2">번호</th>				
					<th class="col-md-3">아이디</th>				
					<th class="col-md-3">닉네임</th>				
					<th class="col-md-4">가입 일</th>		
				</tr>
			</thead>
			<tbody>
				<c:if test="${memberList != null || memberList.size() != 0 }">
					<c:set var="cnt" value="0"/>
					<c:forEach var="memberList" items="${memberList}">
						<c:if test="${cnt < 5}">
						<c:set var="cnt" value="${cnt+1}"/>
							<tr>
								<td>${memberList.memberNo}</td>
								<td>${memberList.memberId}</td>
								<td>${memberList.memberName}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${memberList.memberDate}"/></td>
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${memberList == null || memberList.size() == 0}">
					<td colspan="12">게시물이 없습니다!!</td>
				</c:if>
			</tbody>
		</table>
	</div>
</main>