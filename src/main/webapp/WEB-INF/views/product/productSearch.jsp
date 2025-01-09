<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/style.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">

	 <!-- 메인박스  -->
	 <div class="main-box">
        <!-- <h2>"서울" 지역 "책" 카테고리 검색 결과입니다.</h2> -->
        <table class="product-list">
		    <tbody>
		        <c:forEach var="product" items="${products}" varStatus="status">
		            <!-- 행의 시작 -->
		            <c:if test="${status.index % 5 == 0}">
		                <tr>
		            </c:if>
		
		            <!-- 상품 열 -->
		            <td>
		                <div class="product-img-container">
		                    <img src="${path}/resources/upload/product/${product.FIRST_IMAGE}" class="product-img" alt="${product.PRODUCT_NAME}">
		                </div>
		                <h5>
		                    <a href="${path}/product/productdetail.do?productNo=${product.PRODUCT_NO}">
		                        ${product.PRODUCT_NAME}
		                    </a>
		                </h5>
		                <h4>${product.PRICE}원</h4>
		            </td>
		
		            <!-- 행의 종료 -->
		            <c:if test="${status.index % 5 == 4 || status.last}">
		                <!-- 빈칸 채우기: 마지막 행에서 열이 부족할 경우 -->
		                <c:if test="${status.last && (status.index % 5 != 4)}">
		                    <c:forEach var="emptyTd" begin="1" end="${5 - (status.index % 5) - 1}">
		                        <td></td>
		                    </c:forEach>
		                </c:if>
		                </tr>
		            </c:if>
		        </c:forEach>
		        <c:if test="${empty products }">
		        	<div class="none">검색한 상품이 존재하지 않습니다.</div>
		        </c:if>
		    </tbody>
		</table>

        
        
        <!-- 페이지 바 -->
        <c:if test="${not empty products }">
        	<div class="pagination">${pageBar }</div>
        </c:if>
    </div>	
    
</section>    





<script>

</script>





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>