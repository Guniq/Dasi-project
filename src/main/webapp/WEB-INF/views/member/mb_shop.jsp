<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 제로웨이스트 샵 페이지 -->

<header>
   	<%@ include file="inc/top.jsp" %>
</header>

<main>
	<div class="shop mb-5">
		<h2 class="mb-3">제로웨이스트 샵 소개</h2>
		<p class="mb-5" style="font-size:16px;">적극적으로 쓰레기를 줄여나가는 우리 근처 <br/>친환경 점포들을 소개합니다</p>
		
		<!-- card section -->
		<c:if test="${shopList == null || shopList.size() == 0 }">
			<p colspan='6'>가게가 존재하지 않습니다!!</p>
		</c:if>
		<div class="d-flex justify-content-center mt-5">
			<c:set var="cnt" value="0"/>	
			<c:if test="${shopList != null || shopList.size() != 0 }">
				<c:forEach var="shopList" items="${shopList}">
					<c:set var="cnt" value="${cnt+1}"/>
					<div class="card mt-5 <c:if test="${cnt%4 != 0}">me-5</c:if>" style="width:40vh; height: 400px;">
					    <div class="" style="background-color: #f7f7f7;">
						    <h4 class="mt-4 mb-3" style="overflow:hidden; text-overflow:ellipsis; 
							      	white-space:nowrap; text-align:center;"><b>${shopList.shopName}</b></h4>
							<p class="mb-3" style="font-size:16px;">사진을 클릭해보세요!</p>
					    </div>
						<a href="${shopList.shopLink}" style="overflow:hidden;">
							<c:if test="${shopList.shopImage eq 'non'}">
								<div style="color:rgba(0, 0, 0, 0.4);">
									<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="currentColor" class="bi bi-images mb-3" viewBox="0 0 16 16">
									  <path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
									  <path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 
									  2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 
									  0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 
									  1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z"/>
									</svg>
									<p style="font-size:15px;">이미지 없음</p>
								</div>
						    </c:if>
							<c:if test="${shopList.shopImage ne 'non'}">
						    	<img class="card-img-top" src="uploadFile/${shopList.shopImage}" alt="Card image" 
						    	style="width:100%;">
						    </c:if>
					    </a>
					</div> <!-- card div -->	
					<c:if test="${cnt%4 ==0}">
						</div><div class="d-flex justify-content-center mt-5">
					</c:if>
    			</c:forEach>
   			</c:if>
		</div>
	</div>
</main>
    
<footer>
	<%@ include file="inc/footer.jsp" %>
</footer>

