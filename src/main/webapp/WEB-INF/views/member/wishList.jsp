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
        <div class="list-title">
        	<div class="list-logo d-flex justify-content-center align-items-center">
		    	<!-- 빈하트 -->
	   			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#BBA990" class="bi bi-heart mx-1" viewBox="0 0 16 16">
					<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
				</svg>
		    </div>
		    <div>관심 상품 리스트</div>
        </div>
        <table class="product-list">
            <tbody>
                <tr>
                    <td>
	                    <div>
	                    	<button class="heart-btn">
					            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#BBA990" class="bi bi-heart" viewBox="0 0 16 16">
					                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
					            </svg>
					        </button>
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                    <td>
	                    <div>
	                    	<button class="heart-btn">
					            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#BBA990" class="bi bi-heart" viewBox="0 0 16 16">
					                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
					            </svg>
					        </button>
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                    <td>
	                    <div>
	                    	<button class="heart-btn">
					            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#BBA990" class="bi bi-heart" viewBox="0 0 16 16">
					                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
					            </svg>
					        </button>
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                    <td>
	                    <div>
	                    	<button class="heart-btn">
					            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#BBA990" class="bi bi-heart" viewBox="0 0 16 16">
					                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
					            </svg>
					        </button>
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                    <td>
	                    <div>
	                    	<button class="heart-btn">
					            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#BBA990" class="bi bi-heart" viewBox="0 0 16 16">
					                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
					            </svg>
					        </button>
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                    
                </tr>
                
                <tr>
                	<td>
	                    <div>
	                    	<button class="heart-btn">
					            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#BBA990" class="bi bi-heart" viewBox="0 0 16 16">
					                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
					            </svg>
					        </button>
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                	<td>
	                    <div>
	                    	<button class="heart-btn">
					            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#BBA990" class="bi bi-heart" viewBox="0 0 16 16">
					                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
					            </svg>
					        </button>
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                	<td>
	                    <div>
	                    	<button class="heart-btn">
					            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#BBA990" class="bi bi-heart" viewBox="0 0 16 16">
					                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
					            </svg>
					        </button>
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                	<td>
	                    <div>
	                    	<button class="heart-btn">
					            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#BBA990" class="bi bi-heart" viewBox="0 0 16 16">
					                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
					            </svg>
					        </button>
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                	<td>
	                    <div>
	                    	<button class="heart-btn">
					            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#BBA990" class="bi bi-heart" viewBox="0 0 16 16">
					                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
					            </svg>
					        </button>
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                </tr>
 
            </tbody>
        </table>
        
        
        <!-- 페이지 바 디자인. -->
        <div class="pagination">
		    <button class="prev">&lt;</button>
					    <span class="page active"></span>
					    <span class="page"></span>
					    <span class="page"></span>
					    <span class="page"></span>
					    <span class="page"></span>
		    <button class="next">&gt;</button>
		</div>
    </div>	
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>