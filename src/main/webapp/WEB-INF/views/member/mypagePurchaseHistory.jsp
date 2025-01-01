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
		<div class="member-info">
			<div class="member-img d-flex justify-content-center align-items-center">
        		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#ECEBDE" class="bi bi-person-fill" viewBox="0 0 16 16">
				  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
				</svg>
        	</div>
        	<div class="member-name">나BS아님</div>
		</div>
		<h3>마이페이지</h3>
		<ul>
			<li><a href="">나의 정보수정</a></li>
			<li><a href="">내가 판매한 상품</a></li>
			<li><a href="">나의 후기</a></li>
			<li class="active-sidebar"><a href="${path }/member/purchasehistory.do">나의 구매내역</a></li>
			<li><a href="">나의 신고내역</a></li>
		</ul>
	</div>
	
	<!-- 구매리스트 -->
	<div class="item-container">
		<h2>나의 구매내역</h2>
		<div class="purchase-item">
			<img src="${path}/resources/images/product1.jpg" class="d-block" alt="Product Image 1">
			<div class="product-info">
				<div class="title">상품명</div>
				<div class="price">35,000원</div>
			</div>
			<div class="transaction-status">거래중</div>
			<div class="transaction-date">2024-12-11 결제</div>
		</div>
		<div class="purchase-item">
			<img src="${path}/resources/images/product1.jpg" class="d-block" alt="Product Image 1">
			<div class="product-info">
				<div class="title">상품명</div>
				<div class="price">35,000원</div>
			</div>
			<div class="transaction-status">거래중</div>
			<div class="transaction-date">2024-12-11 결제</div>
		</div>
		<div class="purchase-item">
			<img src="${path}/resources/images/product1.jpg" class="d-block" alt="Product Image 1">
			<div class="product-info">
				<div class="title">상품명</div>
				<div class="price">35,000원</div>
			</div>
			<div class="transaction-status">거래중</div>
			<div class="transaction-date">2024-12-11 결제</div>
		</div>
		<div class="purchase-item">
			<img src="${path}/resources/images/product1.jpg" class="d-block" alt="Product Image 1">
			<div class="product-info">
				<div class="title">상품명</div>
				<div class="price">35,000원</div>
			</div>
			<div class="transaction-status">거래중</div>
			<div class="transaction-date">2024-12-11 결제</div>
		</div>
		<div class="purchase-item">
			<img src="${path}/resources/images/product1.jpg" class="d-block" alt="Product Image 1">
			<div class="product-info">
				<div class="title">상품명</div>
				<div class="price">35,000원</div>
			</div>
			<div class="transaction-status">거래중</div>
			<div class="transaction-date">2024-12-11 결제</div>
		</div>
		<div class="purchase-item">
			<img src="${path}/resources/images/product1.jpg" class="d-block" alt="Product Image 1">
			<div class="product-info">
				<div class="title">상품명</div>
				<div class="price">35,000원</div>
			</div>
			<div class="transaction-status">거래중</div>
			<div class="transaction-date">2024-12-11 결제</div>
		</div>
		<div class="purchase-item">
			<img src="${path}/resources/images/product1.jpg" class="d-block" alt="Product Image 1">
			<div class="product-info">
				<div class="title">상품명</div>
				<div class="price">35,000원</div>
			</div>
			<div class="transaction-status">거래중</div>
			<div class="transaction-date">2024-12-11 결제</div>
		</div>
		<div class="purchase-item">
			<img src="${path}/resources/images/product1.jpg" class="d-block" alt="Product Image 1">
			<div class="product-info">
				<div class="title">상품명</div>
				<div class="price">35,000원</div>
			</div>
			<div class="transaction-status">거래중</div>
			<div class="transaction-date">2024-12-11 결제</div>
		</div>
		<div class="purchase-item">
			<img src="${path}/resources/images/product1.jpg" class="d-block" alt="Product Image 1">
			<div class="product-info">
				<div class="title">상품명</div>
				<div class="price">35,000원</div>
			</div>
			<div class="transaction-status">거래중</div>
			<div class="transaction-date">2024-12-11 결제</div>
		</div>
		
	
	</div>
	
	
	
</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>