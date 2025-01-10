<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/member/memberSellerInfoPage.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">

	 <!-- 메인박스  -->
	 <div class="main-box">
	 
		<!-- 상단 셀러 인포 & 후기 -->
	 	<div class="seller-info-list">
		 	<!-- 판매자 정보 -->
			<div class="seller-info-box">
			   <div class="d-flex align-items-center mb-3">
			       <span class="seller">판매자</span>
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

		 	<div class="comment-list">
		 		<div class="d-flex align-items-center">
					<span class="review">후기</span>
				</div>
		 	<div id="reviewCarousel" class="carousel slide" data-bs-ride="carousel">
		
			   <!-- 슬라이드 아이템 -->
			   <div class="carousel-inner">
			   	<c:if test="${empty reviews }">
			   		<div class="none">후기가 존재하지 않습니다.</div>
			   	</c:if>
			   	<c:if test="${not empty reviews }">
			       <c:forEach var="review" items="${reviews}" varStatus="status">
			           <div class="carousel-item ${status.first ? 'active' : ''}">
			               <div class="comment-box d-flex flex-column">
			                   <!-- 닉네임과 별점 -->
			                   <div class="d-flex flex-row justify-content-between">
			                       <div class="reviewNickname">${review.REVIEWERNICKNAMEORID}</div>
			                       <div class="rating">
			                           <c:forEach begin="1" end="5" var="star">
			                               <i class="${star <= review.RATING ? 'fas fa-star' : 'far fa-star'}"></i>
			                           </c:forEach>
			                       </div>
			                   </div>
			                   <!-- 후기 내용 -->
			                   <div class="d-flex">
			                       ${review.REVIEWCONTENT }
			                   </div>
			               </div>
			           </div>
			       </c:forEach>
			    </c:if>
			   </div>
				<c:if test="${not empty reviews }">
			  	<!-- 슬라이드 컨트롤 -->
			    <button class="carousel-control-prev" type="button" data-bs-target="#reviewCarousel" data-bs-slide="prev">
			        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#A59D84" class="bi bi-chevron-left" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0"/>
					</svg>
			        <span class="visually-hidden">Previous</span>
			    </button>
			    <button class="carousel-control-next" type="button" data-bs-target="#reviewCarousel" data-bs-slide="next">
			        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#A59D84" class="bi bi-chevron-right" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708"/>
					</svg>
			        <span class="visually-hidden">Next</span>
			    </button>
			    </c:if>
			</div>
		 	
	 	</div>
	 	</div>
		 	
		 <!-- 중간 문구 -->
        <div class="sub-title">판매중인 상품</div>
        
        
        <!-- 판매중인 리스트 -->
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
		                    <img src="${path}/resources/upload/product/${product.FILE_RENAME}" class="product-img" alt="${product.PRODUCT_NAME}">
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

        <!-- 페이지 바 디자인. -->
	    ${pageBar }
    </div>	
    
 
	 
</section>
<script>
document.addEventListener('DOMContentLoaded', () => {
	 document.querySelector(".ct-box").style.display = "none";
	 document.querySelector(".search-input").style.display = "none";
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>