<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 인덱스 페이지 -->

<header>
	<%@ include file="inc/top.jsp" %>
</header>

<main>
    <!-- container section -->
    <div class="container mt-5">
    	<div class="col-md-12 text-center">
		   	<h1 class="mb-3">JOIN THE<br/>MOVE MENT</h1>
		   	<p>분리수거 어렵지 않아요<br/>함께 동참해 보세요!</p>
    	</div>
    	<div class="col-md-12">
    		<img src="images/메인 이미지.jpg"/>
    	</div>
    </div>
	<!-- end container section -->
	
	<!-- search section -->
	<form action="trashList.do" id="searchForm" method="get">
		<select class="form-select me-2" style="width:100px; display:none;" name="searchType">
			<option value="NC" selected
				<c:out value="${pageDTO.searchType == 'NC' ? 'selected':''}"/>>선택</option>
		</select>
		<div class="search mt-5 mb-3 p-5">
			<h2 class="text-center">분리수거 방법 검색</h2>
			<div class="search d-flex justify-content-center mt-2 mb-3">	
				<input type="text" class="form-control" id="keyWord" name="keyWord" value="${pageDTO.keyWord}" placeholder="분리수거 방법을 이름으로 검색해보세요"/>
				<button type="button" class="btn btn-sm btn-secondary" style="width:70px;" onclick="trashSearch()">검색</button>
			</div>
		</div>
	</form>
	<!-- end search section -->
	
	<!-- card section -->
	<section class="service_section layout_padding">
		<div class="container-fluid w-75">
				<h2 class="custom_heading">가장 많이 조회된 쓰레기</h2>
			<div class="">
				<div class="card-deck mt-5">
					<c:set var="cnt" value="0"/>
					<c:forEach var="trashDTO" items="${trashDTO}">
					<c:if test="${cnt < 4}">
					<c:set var="cnt" value="${cnt+1}"/>
						<div class="card">
							<a href="trashView.do?trashNo=${trashDTO.trashNo}">
								<img class="card-img-top" src="uploadFile/${trashDTO.trashImage}" alt="Card image cap" />
							</a>
							<div class="card-body">
								<h5 class="card-title">${trashDTO.trashName}</h5>
							</div>
						</div>
					</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
</main>

<footer>
	<section class="info_section layout_padding">
		<div class="container mt-5">
		    <div class="row">
		      <div class="col-md-3">
		      	<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-trash3" viewBox="0 0 8 25">
				  <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0
				   5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0
				   0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0
				    0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5
				    5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
				</svg>
				<h5>
					올바른 처리 방법
				</h5>
		      </div>
		      <div class="col-md-3">
		      	<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-recycle ms-5" viewBox="0 0 25 25">
				  <path d="M9.302 1.256a1.5 1.5 0 0 0-2.604 0l-1.704 2.98a.5.5 0 0 0 .869.497l1.703-2.981a.5.5 0 0 1 .868 
				  0l2.54 4.444-1.256-.337a.5.5 0 1 0-.26.966l2.415.647a.5.5 0 0 0 .613-.353l.647-2.415a.5.5 0 1 0-.966-.259l-.333 
				  1.242-2.532-4.431zM2.973 7.773l-1.255.337a.5.5 0 1 1-.26-.966l2.416-.647a.5.5 0 0 1 .612.353l.647 2.415a.5.5 0 0 
				  1-.966.259l-.333-1.242-2.545 4.454a.5.5 0 0 0 .434.748H5a.5.5 0 0 1 0 1H1.723A1.5 1.5 0 0 1 .421 12.24l2.552-4.467zm10.89 
				  1.463a.5.5 0 1 0-.868.496l1.716 3.004a.5.5 0 0 1-.434.748h-5.57l.647-.646a.5.5 0 1 0-.708-.707l-1.5 1.5a.498.498 0 0 0 
				  0 .707l1.5 1.5a.5.5 0 1 0 .708-.707l-.647-.647h5.57a1.5 1.5 0 0 0 1.302-2.244l-1.716-3.004z"/>
				</svg>
		        <h5>
		          정확한 분리 배출법
		        </h5>
		      </div>
		      <div class="col-md-3">
		      	<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-lightbulb ms-5" viewBox="0 0 25 25">
				  <path d="M2 6a6 6 0 1 1 10.174 4.31c-.203.196-.359.4-.453.619l-.762 1.769A.5.5 0 0 1 10.5 13a.5.5 0 0 1 0 
				  1 .5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 0 0 1 0-1 .5.5 0 0 
				  1 0-1 .5.5 0 0 1-.46-.302l-.761-1.77a1.964 1.964 0 0 0-.453-.618A5.984 5.984 0 0 1 2 6zm6-5a5 5 0 0 
				  0-3.479 8.592c.263.254.514.564.676.941L5.83 12h4.342l.632-1.467c.162-.377.413-.687.676-.941A5 5 0 0 0 8 1z"/>
				</svg>
		        <h5>
		          유용한 재활용 방법
		        </h5>
		      </div>
		      <div class="col-md-3">
				<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-globe-americas ms-5 " viewBox="0 0 10 25">
				  <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0ZM2.04 4.326c.325 1.329 2.532 2.54 3.717 
				  3.19.48.263.793.434.743.484-.08.08-.162.158-.242.234-.416.396-.787.749-.758 1.266.035.634.618.824 1.214 
				  1.017.577.188 1.168.38 1.286.983.082.417-.075.988-.22 1.52-.215.782-.406 1.48.22 1.48 1.5-.5 3.798-3.186 
				  4-5 .138-1.243-2-2-3.5-2.5-.478-.16-.755.081-.99.284-.172.15-.322.279-.51.216-.445-.148-2.5-2-1.5-2.5.78-.39.952-.171 
				  1.227.182.078.099.163.208.273.318.609.304.662-.132.723-.633.039-.322.081-.671.277-.867.434-.434 1.265-.791 2.028-1.12.712-.306 
				  1.365-.587 1.579-.88A7 7 0 1 1 2.04 4.327Z"/>
				</svg>	
				<h5>
				  친환경적으로 대체하는 방법
				</h5>
		      </div>
		    </div>
	  	</div>
	</section>
	<%@ include file="inc/footer.jsp" %>
</footer>
	
<script>
	function trashSearch(){
		if(searchForm.keyWord.value == "" || searchForm.keyWord.value.length <= 1){
			alert("검색어를 입력하세요!");
			searchForm.keyWord.focus();
		}else{
			searchForm.submit();
		}
	}
</script>

