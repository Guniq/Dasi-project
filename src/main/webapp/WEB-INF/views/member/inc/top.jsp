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
    
  <!-- ajax -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js"></script>
	
  <!-- 유효성 검사 -->
  <script type="text/javascript" src="js/memberValid.js"></script>
  
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
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container pt-3">
          <a class="navbar-brand" href="${ctx}">
            <img src="images/메인로고.png" alt="" /><span>
              DASI
            </span>
          </a>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="shopList.do">제로웨이스트 샵</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="community.do">커뮤니티</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="trashList.do">분리수거 방법</a>
                </li>
                <c:if test="${sessionScope.memberId != null}">
	                <li class="nav-item active">
	                  <a class="nav-link" href="mypage.do?memberNo=${memberNo}">마이페이지</a>
	                </li>
                </c:if>
                <c:if test="${sessionScope.memberId == null}">
	                <li class="nav-item active">
	                  <a class="nav-link" href="memberJoin.do">회원가입</a>
	                </li>
	            </c:if>
                <c:if test="${sessionScope.memberId == null}">
	                <li class="nav-item">
	                  <a class="nav-link" href="memberLogin.do">로그인</a>
	                </li>
	            </c:if>
                <c:if test="${sessionScope.memberId != null}">
	                <li class="nav-item">
	                  <a class="nav-link" href="memberLogout.do">로그아웃</a>
	                </li>
	            </c:if>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </header>
</body>
