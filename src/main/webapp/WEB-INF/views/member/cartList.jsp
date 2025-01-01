<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/style.css">
<link rel="stylesheet" href="${path}/resources/css/member/cartList.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">
<!-- 메인박스  -->
	 <div class="main-box">
        <div class="list-title">
        	<div class="list-logo d-flex justify-content-center align-items-center">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#BBA990" class="bi bi-cart4" viewBox="0 0 16 16">
				  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5M3.14 5l.5 2H5V5zM6 5v2h2V5zm3 0v2h2V5zm3 0v2h1.36l.5-2zm1.11 3H12v2h.61zM11 8H9v2h2zM8 8H6v2h2zM5 8H3.89l.5 2H5zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0m9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0"/>
				</svg>
		    </div>
		    <div>장바구니 리스트</div>
        </div>
        <table class="product-list">
            <tbody>
                <tr>
                    <td>
	                    <div>
	                    	<input type="checkbox" id="productCheckbox" class="checkbox" checked>
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                    <td>
	                    <div>
	                    	<input type="checkbox" id="productCheckbox" class="checkbox">
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                    <td>
	                    <div>
	                    	<input type="checkbox" id="productCheckbox" class="checkbox">
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                    <td>
	                    <div>
	                    	<input type="checkbox" id="productCheckbox" class="checkbox">
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                    <td>
	                    <div>
	                    	<input type="checkbox" id="productCheckbox" class="checkbox">
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                    
                </tr>
                
                <tr>
                	<td>
	                    <div>
	                    	<input type="checkbox" id="productCheckbox" class="checkbox">
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                    <td>
	                    <div>
	                    	<input type="checkbox" id="productCheckbox" class="checkbox">
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                    <td>
	                    <div>
	                    	<input type="checkbox" id="productCheckbox" class="checkbox">
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                    <td>
	                    <div>
	                    	<input type="checkbox" id="productCheckbox" class="checkbox">
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                    <td>
	                    <div>
	                    	<input type="checkbox" id="productCheckbox" class="checkbox">
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