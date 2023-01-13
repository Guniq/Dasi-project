<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  
   
  <title>Dasi</title>

  <link rel="stylesheet" type="text/css"
    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

  <!-- 유효성 검사 -->
  <script type="text/javascript" src="js/adminValid.js"></script>
  
  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

  <!-- fonts style -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
  
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.js"></script>
</head>

<body>
	<div class="container d-flex justify-content-between align-items-center" style="background-color:white; height:80px;">
		<c:if test="${sessionScope.adminId != null}">
			<a class="navbar-brand" href="admin.do">
				<img src="images/메인로고.png" alt="" /><span>
					Dasi 관리자 페이지
				</span>
			</a>
		</c:if>
		<c:if test="${sessionScope.adminId == null}">
			<a class="navbar-brand" href="adminLogin.do">
				<img src="images/메인로고.png" alt="" /><span>
					Dasi 관리자 페이지
				</span>
			</a>
		</c:if>
		<c:if test="${sessionScope.adminId == null}">
			<a class="btn btn-sm btn-outline-secondary" style="height:30px;" href="adminLogin.do">관리자 로그인</a>
        </c:if>
        <c:if test="${sessionScope.adminId != null}">
			<a class="btn btn-sm btn-outline-secondary" href="adminLogout.do"><span>로그아웃</span></a>
        </c:if>
	</div>
    <header class="shadow" style="background-color:#2D424C;">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container" style="height:50px;">
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link text-white" href="${ctx}">HOME</a>
                </li>
              	<c:if test="${sessionScope.adminId != null}">
	                <li class="nav-item">
	                  <a class="nav-link text-white" href="admin.do">관리자 페이지</a>
	                </li>
                </c:if>
              	<c:if test="${sessionScope.adminId != null}">
	                <li class="nav-item">
	                  <a class="nav-link text-white" href="adminShop.do">제로웨이스트 샵 관리</a>
	                </li>
                </c:if>
                <c:if test="${sessionScope.adminId != null}">
	                <li class="nav-item">
	                  <a class="nav-link text-white" href="adminCommunity.do">커뮤니티 관리</a>
	                </li>
	            </c:if>
	            <c:if test="${sessionScope.adminId != null}">
	                <li class="nav-item">
	                  <a class="nav-link text-white" href="adminMember.do">회원 관리</a>
	                </li>
                </c:if>
	            <c:if test="${sessionScope.adminId != null}">
	                <li class="nav-item">
	                  <a class="nav-link text-white" href="adminTrash.do">재활용 법 관리</a>
	                </li>
                </c:if>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </header>
</body>
