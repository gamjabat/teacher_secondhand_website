<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${path}/resources/css/common/header.css">
  <link rel="stylesheet" href="${path}/resources/css/common/footer.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
   <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.min.js"></script>
  <title>SSEULMANHAE</title>
</head>
<body>	
	<div class="header-container">
    	<div class="header-box">
    	<!-- 로고 -->
      	<div class="logo-container">
	 			<a href="${path }/">
	      		<%-- <img src="${path}/resources/images/SSEULMANHAE_LOGO.png" class="logo" alt="Logo" onclick="mainPage();"> --%>
	      		<img src="${path}/resources/images/SSEULMANHAE_LOGO.png" class="logo" alt="Logo">
      		</a> 
      	</div>
      	
      	<!-- 검색창 -->
      	<div class="search-container">
    		<form class="search-form" action="#" method="post">
        		<input type="text" class="search-input" placeholder=" 검색어를 입력하세요">
    		</form>
		</div>
      
      
      	<!-- 슬라이드 컨데이너 -->
      	<div class="interface-container">
      		<a class="info-btn">
      			<img src="${path}/resources/images/메뉴버튼.png">
	 	    </a>
	
	 	    <!-- 슬라이드 패널 -->
	 	    <div class="slide-bar">
	 	    	<div class="content"> 
		 	    	<!-- 프로필 영역 -->
		 	    	<c:if test="${sessionScope.loginMember != null}">
		 	        <div class="s-profile-box">
					 		<div class="s-circle"></div>
					 		<div class="s-id-address">
						 		<!-- 이름 표시 -->
           						 <h4>${sessionScope.loginMember.nickname} 님 환영합니다!</h4>
            					<!-- 지역 표시 -->
            					<h5>${sessionScope.loginMember.address}</h5>	
					 		</div>
					 </div>
					 </c:if>
						 <c:if test="${sessionScope.loginMember == null}">
							    <div class="s-profile-box">
							        <div class="s-circle"></div>
							        <div class="s-id-address">
							            <h4>로그인 하세요.</h4>
							            <h5>지역</h5>
							        </div>
							    </div>
							</c:if>
							
		 	    		<!-- 목록 리스트  -->
						<div class="m-list">
						    <!-- 로그인 상태가 아닐 때만 보이는 메뉴 -->
						    <c:if test="${sessionScope.loginMember == null}">
						        <a href="${path}/login/loginpage.do">로그인</a>
						        <a href="${path}/login/findid.do">아이디 찾기</a>
						        <a href="${path}/login/findpassword.do">비밀번호 찾기</a>
						        <a href="${path}/login/signupagreement.do">회원가입</a>
						        
						    </c:if>
		    
						    <!-- 로그인 상태일 때만 보이는 메뉴 -->
						    <c:if test="${sessionScope.loginMember != null}">
						        <a href="${path}/member/purchasehistory.do">마이페이지</a>
						        <a href="${path}/product/productinsert.do">상품등록</a>
						        <a href="${path}/board/boardquestionandanswer.do">문의 게시판</a>
						        <a href="${path}/member/wishlist.do">관심상품 리스트</a>
						        <a href="${path}/member/cartlist.do">장바구니 리스트</a>
						        <a href="${path}/login/logout.do">로그아웃</a>
						        <a href="${path}/product/productchatting.do">작업을 위해 임시로 만듬</a>
						        <!-- 관리자 로그인시에만 보임 관리자 아이디 추가 가능.-->
					 	    	<c:if test="${sessionScope.loginMember.memberId == 'admin1' || 
					 	    				  sessionScope.loginMember.memberId == 'admin2' || 
					 	    				  sessionScope.loginMember.memberId == 'admin3'}">
		        					<a href="${path}/admin/adminmain.do">관리자 페이지</a>
		    					</c:if>
						    </c:if>
						</div>
		 	        </div>
	 	        </div>
	 	    </div>
      	</div>
    </div>
  
  
<script>
//슬라이드 여는 스크립트
document.querySelector('.info-btn').addEventListener('click', (event) => {
    event.stopPropagation();
    const slidebar = document.querySelector('.slide-bar');
    slidebar.classList.add('open'); // 슬라이드 패널 열기
});

// 슬라이드 닫는 스크립트
document.addEventListener('click', (event) => {
    const slidebar = document.querySelector('.slide-bar');
    const isClickInsideSlidebar = slidebar.contains(event.target); // 슬라이드 내부 클릭 감지
    const isClickOnButton = event.target.closest('.info-btn'); // 버튼 클릭 감지

    if (!isClickInsideSlidebar && !isClickOnButton) {
        slidebar.classList.remove('open'); // 슬라이드 패널 닫기
    }
});

</script>