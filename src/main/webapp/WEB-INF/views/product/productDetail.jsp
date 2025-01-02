<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/style.css">
<link rel="stylesheet" href="${path}/resources/css/product/productDetail.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">


	<!-- 카테고리 박스 -->
	 <div class="ct-box">
		 <div class="checkbox-container">
		 	<div class="title">지역</div>
			    <label><input type="checkbox" /> 서울</label>
			    <label><input type="checkbox" /> 부산</label>
			    <label><input type="checkbox" /> 인천</label>
			    <label><input type="checkbox" /> 군포</label>
			    <label><input type="checkbox" /> 가산</label>
			    <label><input type="checkbox" /> 대전</label>
			    <label><input type="checkbox" /> 대구</label>
			    <label><input type="checkbox" /> 울산</label>
			    <label><input type="checkbox" /> 광주</label>
			    <label><input type="checkbox" /> 강원</label>
			    <label><input type="checkbox" /> 제주</label>  
			</div>
		 <div class="checkbox-container">
		 	<div class="title">카테고리</div>
			    <label><input type="checkbox" /> 도서</label>
			    <label><input type="checkbox" /> 운동</label>
			    <label><input type="checkbox" /> 전자기기</label>
			    <label><input type="checkbox" /> 문구</label>
			    <label><input type="checkbox" /> 생활용품</label> 
			</div>
		 <div class="checkbox-container">
		 	<div class="title">거래방법</div>
			    <label><input type="checkbox" /> 직거래</label>
			    <label><input type="checkbox" /> 택배</label>
			</div>
		 <div class="checkbox-container">
		 	<div class="title">정렬기준</div>
			    <label><input type="checkbox" /> 오름차순</label>
			    <label><input type="checkbox" /> 내림차순</label>
			    <label><input type="checkbox" /> 인기순</label>
			    <label><input type="checkbox" /> 최신순</label>
			</div>
		  <div class="checkbox-container">
		 	<div class="title">금액</div>
			    <label><input type="checkbox" /> 5000원 이하</label>
			    <label><input type="checkbox" /> 10000원 이하</label>
			    <label><input type="checkbox" /> 20000원 이하</label>
			    <label><input type="checkbox" /> 30000원 이하</label>
			    <label><input type="checkbox" /> 그 외</label>
			    <label><input type="checkbox" /> 무료나눔</label>
			</div>
		  <div class="checkbox-container">
		 	<div class="title">거래상태</div>
			    <label><input type="checkbox" /> 거래가능</label>
			    <label><input type="checkbox" /> 거래중</label>
			    <label><input type="checkbox" /> 거래완료</label> 
			</div>
		  <div class="checkbox-container">
		 	<div class="title">상품상태</div>
			    <label><input type="checkbox" /> A급</label>
			    <label><input type="checkbox" /> B급</label>
			    <label><input type="checkbox" /> C급</label>
			    <label><input type="checkbox" /> D급</label>
			    <label><input type="checkbox" /> F급</label>  
			</div>	
		   <div class="reset-btn-container">
		 	<button class="reset-btn"><p>RE</p></button>
		 	<button class="push-btn"><p>PUSH</p></button>					
	       </div>
	       
	     
	 </div>
	  
	 
	<div class="main-box d-flex flex-row">
    <!-- 이미지 영역 -->
    <div class="left-box d-flex flex-column">
	    <div class="img-box">
	        <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
	        	<!-- 점 표시 (Indicators) -->
		        <div class="carousel-indicators">
		            <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		            <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
		            <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
		        </div>
        
	            <div class="carousel-inner">
	                <div class="carousel-item active">
	                    <img src="${path}/resources/images/product1.jpg" class="d-block w-100" alt="Product Image 1">
	                </div>
	                <div class="carousel-item">
	                    <img src="${path}/resources/images/product2.jpg" class="d-block w-100" alt="Product Image 2">
	                </div>
	                <div class="carousel-item">
	                    <img src="${path}/resources/images/product3.jpg" class="d-block w-100" alt="Product Image 3">
	                </div>
	            </div>
	            <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
	                <span class="custom-icon">
	                	<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0"/>
						</svg>
					</span>
	                <span class="visually-hidden">Previous</span>
	            </button>
	            <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
	                <span class="custom-icon">
	                	<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708"/>
						</svg>
	                </span>
	                <span class="visually-hidden">Next</span>
	            </button>
	        </div>
	    </div>
	    
	    <!-- 판매자 정보 -->
	    <div class="seller-info-box">
	        <div class="d-flex justify-content-between align-items-center mb-3">
	            <span class="seller">판매자</span>
	            <span class="more-info"><a href="${path }/member/membersellerinfopage.do" class="text-muted">더보기</a></span>
	        </div>
	        <div class="d-flex justify-content-between align-items-center">
	        	<div class="d-flex">
		        	<div class="seller-img d-flex justify-content-center align-items-center">
		        		<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#ECEBDE" class="bi bi-person-fill" viewBox="0 0 16 16">
						  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
						</svg>
		        	</div>
		        	<div class="d-flex flex-column justify-content-center">
		        		<span class="seller-name">나BS아님</span>
		        		<span class="seller-address">시흥</span>
		        	</div>
	        	</div>
		        <div class="rating d-flex flex-column">
		        	<div>
					    <i class="fas fa-star"></i>
					    <i class="fas fa-star"></i>
					    <i class="fas fa-star"></i>
					    <i class="far fa-star"></i>
					    <i class="far fa-star"></i>
		        	</div>
				    <span>후기 (230개)</span>
				</div>			        
	        </div>
		</div>
	</div>
	
	
    <div class="right-box d-flex flex-column">
		<!-- 상품 정보 -->
		    <div class="product-info-box d-flex flex-column justify-content-between">
		        	<div class="product-info">
			            <p class="title">BS언어 단어 100제 완전 강추! 쉬운 습득 가능!</p>
			            <p class="category">책/교육</p>
		        	</div>
		        	<div class="product-info">
			            <p class="price">35,000원</p>
			            <p class="description">
			                안녕하세요. 언어 공부에 탁월한 선택을 경험하실 수 있습니다. 노력을 배신하지 않는다. 인간 중심의 표준이 정해주는 코딩 책입니다.
			                자바 기초부터 클로저 방향성 길라잡이로 초심자 눈높이에 맞게 설계된 목록으로 부담없이 배우실 수 있을 겁니다. 잘 쓰세요. 원가보다 싸게 팝니다.
			            </p>
		        	</div>
		    </div>
	    	
    
	    <!-- 버튼 영역 -->
	    <div class="d-flex flex-row">
		    <div class="button-group">
		    	<div class="sub-button-group">
			        <button class="btn chatting-btn" onclick="startChatting();">대화신청</button>
			        <button class="btn cart-btn">장바구니</button>
		    	</div>
		        <button type="button" class="btn pay-btn" onclick="paymentPage();">결제하기</button>
		    </div>
		    <div class="like-btn d-flex justify-content-center align-items-center">
		    	<!-- 빈하트 -->
	   			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#BBA990" class="bi bi-heart mx-1" viewBox="0 0 16 16">
					<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
				</svg>
		    </div>
	    </div>
    </div>
	


</div>
</section>
	 
<script>
	const startChatting = () =>{
		location.assign("${path}/product/productchatting.do");
	}
	
	const paymentPage = () =>{
		location.assign("${path}/member/paymentpage.do");
	}
	
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>