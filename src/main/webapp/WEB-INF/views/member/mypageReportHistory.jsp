<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/common/mypage.css">
<link rel="stylesheet" href="${path}/resources/css/member/mypageReportHistory.css">
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
			<li><a href="${path}/member/mypageinfoupdate.do">나의 정보수정</a></li>
			<li><a href="">내가 판매한 상품</a></li>
			<li><a href="">나의 후기</a></li>
			<li><a href="${path }/member/purchasehistory.do">나의 구매내역</a></li>
			<li class="active-sidebar"><a href="${path }/member/mypagereporthistory.do">나의 신고내역</a></li>
		</ul>
	</div>
	
	<!-- 신고리스트 -->
	<div class="item-container">
		<h2>나의 신고내역</h2>
			<c:if test="${not empty reportpurchaseHistory}">
		        <c:forEach var="report" items="${reportpurchaseHistory}">
		            <div class="purchase-item">
		                <div class="product-info">
		                	<input type="hidden" id="reportNo" value="${report['REPORTNO']}">
		                    <div class="title" onclick="window.location.href='${path}/adminreportdetail.do?reportNo=${report['REPORTNO']}'">
		                    ${report['REPORTREASONNAME']}</div>
		                    <div class="reportProductNo">상품번호 : ${report['REPORTPRODUCTNO']}</div>
		                </div>
		                <div class="report-status">${report['REPORTSTATUSNAME']}</div>
		                <div class="report-member-id">${report['REPORTMEMBERID']}</div>
		                <div class="date">
		                    <fmt:formatDate value="${report['CREATEDAT']}" pattern="yyyy-MM-dd hh:mm:ss" />
		                </div>
		            </div>
		        </c:forEach>
		    </c:if>
		    <c:if test="${empty reportpurchaseHistory}">
		        <div class="no-data">
		            <p>신고 내역이 없습니다.</p>
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