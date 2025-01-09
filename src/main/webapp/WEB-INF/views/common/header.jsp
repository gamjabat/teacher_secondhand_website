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
	<form action="${path }/product/search.do">
    	<div class="header-box">
    	<!-- 로고 -->
      	<div class="logo-container">
	 			<a href="${path }/">
	      		<img src="${path}/resources/images/SSEULMANHAE_LOGO.png" class="logo" alt="Logo">
      		</a> 
      	</div>
      	
      	<!-- 검색창 -->
      	<div class="search-container">
    		<div class="search-form" id="search-form">
        		<input type="text" class="search-input" name="keyword" placeholder=" 검색어를 입력하세요">
    		</div>
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
			 	        	<c:if test="${sessionScope.loginMember.profileImageName == null }">
			 	   				<div class="profile-img d-flex justify-content-center align-items-center">
				               	<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#ECEBDE" class="bi bi-person-fill" viewBox="0 0 16 16">
				                   <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
				               </svg>
				               </div>
				            </c:if>
				            <c:if test="${sessionScope.loginMember.profileImageName != null }">
				            	<img src="${path}/resources/upload/member/${sessionScope.loginMember.profileImageName}" class="profile-img">
				            </c:if>
						 		<div class="s-id-address mt-2">
							 		<!-- 이름 표시 -->
	           						 <h5><strong>${sessionScope.loginMember.nickname}</strong>님</h5>
	           						 <h5>환영합니다!</h5>
	            					<!-- 지역 표시 -->
	            					<h6>${sessionScope.loginMember.address}</h6>	
						 		</div>
						 </div>
					 </c:if>
					 <c:if test="${sessionScope.loginMember == null}">
					    <div class="s-profile-box mt-5">
					        <div class="s-id-address">
					            <h4>로그인 하세요.</h4>
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
					        <a href="${path}/member/wishlist2.do">관심상품 리스트</a>
					        <a href="${path}/member/cartlist2.do">장바구니 리스트</a>
					        <a href="${path}/login/logout.do">로그아웃</a>
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
 	    <div class="ct-box" id="ct-box">
			 <div class="checkbox-container">
			 	<div class="title">지역</div>
				    <label for="seoul"><input type="radio" id="seoul" name="region" value="서울" /> 서울</label>
				    <label for="busan"><input type="radio" id="busan" name="region" value="부산" /> 부산</label>
				    <label for="daegu"><input type="radio" id="daegu" name="region" value="대구" /> 대구</label>
				    <label for="incheon"><input type="radio" id="incheon" name="region" value="인천" /> 인천</label>
				    <label for="gwangju"><input type="radio" id="gwangju" name="region" value="광주" /> 광주</label>
				    <label for="daejeon"><input type="radio" id="daejeon" name="region" value="대전" /> 대전</label>
				    <label for="ulsan"><input type="radio" id="ulsan" name="region" value="울산" /> 울산</label>
				    <label for="sejong"><input type="radio" id="sejong" name="region" value="세종특별자치시" /> 세종</label>
				    <label for="gyeonggi"><input type="radio" id="gyeonggi" name="region" value="경기" /> 경기도</label>
				    <label for="gangone"><input type="radio" id="gangone" name="region" value="강원" /> 강원도</label>
				    <label for="chungbuk"><input type="radio" id="chungbuk" name="region" value="충청북도" /> 충청북도</label>
				    <label for="chungnam"><input type="radio" id="chungnam" name="region" value="충청남도" /> 충청남도</label>
				    <label for="jeonbuk"><input type="radio" id="jeonbuk" name="region" value="전라북도" /> 전라북도</label>
				    <label for="jeonnam"><input type="radio" id="jeonnam" name="region" value="전라남도" /> 전라남도</label>
				    <label for="gyeongbuk"><input type="radio" id="gyeongbuk" name="region" value="경상북도" /> 경상북도</label>
				    <label for="gyeongnam"><input type="radio" id="gyeongnam" name="region" value="경상남도" /> 경상남도</label>
				    <label for="jeju"><input type="radio" id="jeju" name="region" value="제주" /> 제주특별자치도</label>
				</div>
			 <div class="checkbox-container">
			 	<div class="title">카테고리</div>
				     <label for="book"><input type="radio" id="book" name="category" value="PCT-1" /> 책</label>
					 <label for="materials"><input type="radio" id="materials" name="category" value="PCT-2" /> 수업자료</label>
					 <label for="tools"><input type="radio" id="tools" name="category" value="PCT-3" /> 교구</label>
					 <label for="stationery"><input type="radio" id="stationery" name="category" value="PCT-4" /> 문구류</label>
					 <label for="sports"><input type="radio" id="sports" name="category" value="PCT-5" /> 운동</label>
					 <label for="electronics"><input type="radio" id="electronics" name="category" value="PCT-6" /> 전자기기</label>
					 <label for="household"><input type="radio" id="household" name="category" value="PCT-7" /> 생활용품</label>
					 <label for="others"><input type="radio" id="others" name="category" value="PCT-8" /> 기타</label>
				</div>
			 <div class="checkbox-container">
			 	<div class="title">거래방법</div>
				    <label for="direct"><input type="radio" id="direct" name="transaction" value="TMD-1" /> 직거래</label>
	    			<label for="delivery"><input type="radio" id="delivery" name="transaction" value="TMD-2" /> 택배</label>
				</div>
			 <div class="checkbox-container">
			 	<div class="title">정렬기준</div>
				    <label for="sort-asc">
				        <input type="radio" id="sort-asc" name="sorting" value="asc" /> 오름차순
				    </label>
				    <label for="sort-desc">
				        <input type="radio" id="sort-desc" name="sorting" value="desc" /> 내림차순
				    </label>
				    <label for="sort-popularity">
				        <input type="radio" id="sort-popularity" name="sorting" value="popularity" /> 인기순
				    </label>
				    <label for="sort-recent">
				        <input type="radio" id="sort-recent" name="sorting" value="recent" /> 최신순
				    </label>
				</div>
			  <div class="checkbox-container">
			 	<div class="title">금액</div>
				    <label for="price-below-5000">
				        <input type="radio" id="price-below-5000" name="price" value="5000" /> 5000원 이하
				    </label>
				    <label for="price-below-10000">
				        <input type="radio" id="price-below-10000" name="price" value="10000" /> 10000원 이하
				    </label>
				    <label for="price-below-20000">
				        <input type="radio" id="price-below-20000" name="price" value="20000" /> 20000원 이하
				    </label>
				    <label for="price-below-30000">
				        <input type="radio" id="price-below-30000" name="price" value="30000" /> 30000원 이하
				    </label>
				    <label for="price-above-30000">
				        <input type="radio" id="price-above-30000" name="price" value="others" /> 그 외
				    </label>
				    <label for="price-free">
				        <input type="radio" id="price-free" name="price" value="free" /> 무료나눔
				    </label>
				</div>
			  <div class="checkbox-container">
			 	<div class="title">거래상태</div>
				    <label for="trade-available">
				        <input type="radio" id="trade-available" name="trade" value="TST-1" /> 거래가능
				    </label>
				    <label for="trade-in-progress">
				        <input type="radio" id="trade-in-progress" name="trade" value="TST-2" /> 거래중
				    </label>
				    <label for="trade-complete">
				        <input type="radio" id="trade-complete" name="trade" value="TST-3" /> 거래완료
				    </label>
				</div>
			   <div class="reset-btn-container d-flex flex-column">
			 	<button id="push-btn" class="push-btn" type="submit"><p>검색</p></button>				
			 	<button class="reset-btn" type="button"><p>리셋</p></button>
		 </div>
	</form>
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
	
	//RESET 버튼을 누르면 라디오 체크가 다 해제 되는 스크립트
	document.querySelector('.reset-btn').addEventListener('click', function () {
	    const radioButtons = document.querySelectorAll('.ct-box input[type="radio"]');
	    const keywordInput = document.querySelector('.search-input');
	    keywordInput.value = '';
	    radioButtons.forEach(radio => {
	        radio.checked = false;
	    }); 
	});
</script>