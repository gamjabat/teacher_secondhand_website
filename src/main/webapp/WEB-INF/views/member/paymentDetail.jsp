<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/style.css">
<link rel="stylesheet" href="${path}/resources/css/member/paymentPage.css">
<link rel="stylesheet" href="${path}/resources/css/product/productDetail.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">
	<div class="main-box d-flex flex-row">
    <!-- 이미지 영역 -->
    <div class="left-box d-flex flex-column">
		<div class="list-title">
        	<div class="list-logo d-flex justify-content-center align-items-center">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#BBA990" class="bi bi-credit-card" viewBox="0 0 16 16">
				  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1z"/>
				  <path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"/>
				</svg>
		    </div>
		    <div>결제 내역</div>
        </div>
        <div class="img-box">
		    <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
		        <!-- 점 표시 (Indicators) -->
		        <div class="carousel-indicators">
		            <c:forEach var="attachment" items="${attachments}" varStatus="status">
		                <button 
		                    type="button" 
		                    data-bs-target="#productCarousel" 
		                    data-bs-slide-to="${status.index}" 
		                    class="${status.first ? 'active' : ''}" 
		                    aria-current="${status.first ? 'true' : 'false'}" 
		                    aria-label="Slide ${status.index + 1}">
		                </button>
		            </c:forEach>
		        </div>
		
		        <!-- 이미지 슬라이드 -->
		        <div class="carousel-inner">
		            <c:forEach var="attachment" items="${attachments}" varStatus="status">
		                <div class="carousel-item ${status.first ? 'active' : ''}">
		                    <img src="${path}/resources/upload/product/${attachment.fileRename}" class="product-img d-block" alt="${attachment.fileOriginalName}">
		                </div>
		            </c:forEach>
		        </div>
		
		        <!-- 이전 버튼 -->
		        <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
		            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		            <span class="visually-hidden">Previous</span>
		        </button>
		        <!-- 다음 버튼 -->
		        <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
		            <span class="carousel-control-next-icon" aria-hidden="true"></span>
		            <span class="visually-hidden">Next</span>
		        </button>
		    </div>
		</div>
		
	    <!-- 상품 정보 -->
	    <div class="d-flex flex-column justify-content-between">
	    	<input type="hidden" id="productNo" value=${product.productNo }>
        	<div class="product-info">
	            <p class="title">${product.productName }</p>
	            <p class="category">${product.productCategoryName }</p>
        	</div>
	    </div>
	</div>
	
	
    <div class="right-box d-flex flex-column mt-5">
    	<!-- 판매자 정보 -->
		<div class="seller-info-box mt-5">
		   <div class="d-flex justify-content-between align-items-center mb-3">
		       <span class="seller">판매자</span>
		       <span class="more-info">
		           <a href="${path}/member/membersellerinfopage.do?sellerId=${sellerInfo.MEMBERNO}" class="text-muted">더보기</a>
		       </span>
		   </div>
		   <div class="d-flex justify-content-between align-items-center">
		       <div class="d-flex">
		           <div class="seller-img d-flex justify-content-center align-items-center">
		           		<c:if test="${sellerInfo.FILERENAME == null }">
			               	<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#ECEBDE" class="bi bi-person-fill" viewBox="0 0 16 16">
			                   <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
			               </svg>
			            </c:if>
			            <c:if test="${sellerInfo.FILERENAME != null }">
			            	<img src="${path}/resources/upload/member/${sellerInfo.FILERENAME}" class="seller-img" alt="${sellerInfo.FILEORIGINALNAME}">
			            </c:if>
		           </div>
		           <div class="d-flex flex-column justify-content-center">
		               <span class="seller-name">${sellerInfo.NICKNAMEORID}</span>
		               <span class="seller-address">${sellerInfo.ADDRESS}</span>
		           </div>
		       </div>
		       <div class="rating d-flex flex-column">
		           <div>
		               <c:forEach var="star" begin="1" end="5">
		                   <i class="${star <= sellerInfo.AVERAGERATING ? 'fas fa-star' : 'far fa-star'}"></i>
		               </c:forEach>
		           </div>
		           <span>후기 (${sellerInfo.REVIEWCOUNT}개)</span>
		        </div>			        
		    </div>
		</div>
	    <div class="payment-info">
			<div class="sub-title text-nowrap">
				<div>결제 정보</div>
			</div>
			<div class="d-flex align-items-center gap-5">
				<div class="text-nowrap">총 결제 금액</div>
				<div class="product-price"><fmt:formatNumber value="${payment.PAYMENTAMOUNT}" type="number" groupingUsed="true"/>원</div>
			</div>
			<div class="d-flex align-items-center gap-5">
				<div class="text-nowrap">결제 방법 </div>
				<div class="delivery-Fee">${payment.PAYMENTMETHOD }</div>
			</div>
			<div class="d-flex align-items-center gap-5">
				<div class="text-nowrap">결제 시간</div>
				<div class="total-price">${fn:replace(payment.PAYMENTTIME, '.0', '')}</div>
			</div>
			<div class="d-flex align-items-center gap-5">
				<div class="text-nowrap">결제 상태</div>
				<div class="total-price">${payment.PAYMENTSTATUS }</div>
			</div>
		</div>
	    	
    	<div class="button-group w-100 mt-5">
	        <button type="button" class="btn pay-btn" onclick="mainPage();">메인 페이지로 이동</button>
	    </div>
    </div>

</div>
</section>
	 
<script>
	const mainPage = () =>{
		location.assign("${path}");
	}
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>