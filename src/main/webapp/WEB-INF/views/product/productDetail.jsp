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
	<div class="main-box d-flex flex-row">
    <!-- 이미지 영역 -->
    <div class="left-box d-flex flex-column">
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
	    
	    <!-- 판매자 정보 -->
		<div class="seller-info-box">
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
	</div>
	
	
    <div class="right-box d-flex flex-column">
    	<!-- 드롭다운 -->
        <div class="dropdown d-flex justify-content-end">
            <!-- 아이콘 버튼 -->
            <a href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#857672" class="bi bi-three-dots dropdown-icon" viewBox="0 0 16 16">
                    <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
                </svg>
            </a>
            <!-- 드롭다운 메뉴 -->
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                <%-- <c:if test="${sessionScope.loginMember!=null }"> --%>
	                <li><a class="dropdown-item" href="${path }/product/editproductpage.do?productNo=${product.productNo }">상품 수정</a></li>
	                <li><a class="dropdown-item" href="${path }/product/delete.do?productNo=${product.productNo }" onclick="return confirm('이 상품을 삭제하시겠습니까?');">상품 삭제</a></li>
	                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#reportModal" data-board-no="">상품 신고</a></li>
 					 	<%-- </c:if> --%>
            </ul>
        </div>
		<!-- 상품 정보 -->
		    <div class="product-info-box d-flex flex-column justify-content-between">
		    	<input type="hidden" id="productNo" value=${product.productNo }>
	        	<div class="product-info">
		            <p class="title">${product.productName }</p>
		            <p class="category">${product.productCategoryName }</p>
	        	</div>
	        	<div class="product-info">
		            <p class="price"><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/>원</p>
		            <p class="description">
		                ${product.productDescription}
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
		const productNo = document.getElementById('productNo').value
		location.assign("${path}/member/paymentpage.do?productNo=" + productNo);
	}
	
	document.querySelectorAll(".like-btn").forEach(div => div.addEventListener("click", (e) => {
	    const memberNo = '${loginMember.memberNo}'; 
	    const productNo ='${product.productNo}'; 
	    console.log("member:" + memberNo);
	    console.log("productNo:" + productNo);
	    likeElement = e.currentTarget;
		
	    fetch("${path}/member/wishlist.do?memberNo=" + memberNo + "&productNo=" + productNo)
	        .then(response => response.text())
	        .then(data => {
	            if (data === "1") { 
	                likeElement.innerHTML = `
	                    <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="#dc3545" class="bi bi-heart-fill mx-1" viewBox="0 0 16 16">
	                        <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
	                    </svg>`;
	            } else if (data === "0") { 
	                likeElement.innerHTML = `
	                    <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-heart mx-1" viewBox="0 0 16 16">
	                        <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
	                    </svg>`;
	            } else {
	                alert("좋아요 처리 중 오류가 발생했습니다. 다시 시도해주세요.");
	            }
	        })
	        .catch(error => console.error("좋아요 처리 오류:", error));
	    
	    
	}));
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>