<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/common/mypage.css">
<link rel="stylesheet" href="${path}/resources/css/member/mypagePurchaseHistory.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">
<div class="main-box d-flex flex-row">
	<!--  사이드바 -->
	<div class="mypage-side-bar">
		<c:if test="${sessionScope.loginMember != null}">
			<div class="member-info">
				<c:if test="${sessionScope.loginMember.profileImageName == null }">
					<div class="member-img d-flex justify-content-center align-items-center">
		        		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#ECEBDE" class="bi bi-person-fill" viewBox="0 0 16 16">
						  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
						</svg>
		        	</div>
	        	</c:if>
	        	<c:if test="${sessionScope.loginMember.profileImageName != null }">
	            	<img src="${path}/resources/upload/member/${sessionScope.loginMember.profileImageName}" class="member-img">
	            </c:if>
	        	<div class="member-name">${sessionScope.loginMember.nickname}</div>
			</div>
		 </c:if>
		<h3>마이페이지</h3>
		<ul>
			<li><a href="">나의 정보수정</a></li>
			<li class="active-sidebar"><a href="${path }/member/myproducts.do">내가 등록한 상품</a></li>
			<li><a href="${path }/member/myreviews.do">나의 후기</a></li>
			<li><a href="${path }/member/purchasehistory.do">나의 구매내역</a></li>
			<li><a href="">나의 신고내역</a></li>
		</ul>
	</div>
	
	<!-- 등록리스트 -->
	<div class="item-container">
		<h2>내가 등록한 상품</h2>
			<c:if test="${not empty products}">
		        <c:forEach var="p" items="${products}">
		            <div class="purchase-item">
		                <img src="${path}/resources/upload/product/${p.FILE_ORIGINAL_NAME}" class="d-block" alt="${p.PRODUCT_NAME}">
		                <div class="product-info">
		                    <div class="title"><a href="${path}/product/productdetail.do?productNo=${p.PRODUCT_NO}">${p.PRODUCT_NAME}</a></div>
		                    <div class="price"><fmt:formatNumber value="${p.PRICE}"/>원</div>
		                </div>
		                <div class="transaction-status">${p.TRANS_STATUS_NAME}</div>
		                <div class="transaction-date">
		                    <fmt:formatDate value="${p.CREATED_AT}" pattern="yyyy-MM-dd hh:mm:ss" />
		                </div>
		                <!-- 드롭다운 -->
				        <div class="dropdown d-flex align-items-center">
				            <!-- 아이콘 버튼 -->
				            <a href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
				                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#857672" class="bi bi-three-dots dropdown-icon" viewBox="0 0 16 16">
				                    <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
				                </svg>
				            </a>
				            <!-- 드롭다운 메뉴 -->
				            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				                <li><a class="dropdown-item" href="${path }/product/editproductpage.do?productNo=${p.PRODUCT_NO }">상품 수정</a></li>
				                <li><a class="dropdown-item" href="${path }/product/delete.do?productNo=${p.PRODUCT_NO }" onclick="return confirm('이 상품을 삭제하시겠습니까?');">상품 삭제</a></li>
				            </ul>
				        </div>
		            </div>
		        </c:forEach>
		    </c:if>
		    <c:if test="${empty products}">
		        <div class="no-data">
		            <p>등록한 상품이 없습니다.</p>
		        </div>
		    </c:if>
		
		<!-- 페이지 바 디자인. -->
	    <div class="pagination">
		   ${pageBar }
		</div>
	
	</div>

</div>
</section>


<script>
document.addEventListener('DOMContentLoaded', () => {
	 /* 헤더 없애기 */
	 document.querySelector(".ct-box").style.display = "none";
	 document.querySelector(".search-input").style.display = "none";
});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>