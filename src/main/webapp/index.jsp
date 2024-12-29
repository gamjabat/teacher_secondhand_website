<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/style.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">

	 <div class="ct-box">
	 	<div>지역</div>
	 	<div>카테고리</div>
	 	<div>거래방법</div>
	 	<div>정렬기준</div>
	 	<div>금액</div>
	 	<div>거래상태</div>
	 	<div>상품상태</div>
	 	<div>리셋</div>
	 </div>	
	 
	 <div class="main-box">
        <h2>"서울" 지역 "책" 카테고리 검색 결과입니다.</h2>
        <table class="product-list">
            <tbody>
                <tr>
                    <td>
                    <div>1</div>
                    <h5>교육용 사랑의매1</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>2</div>
                     <h5>교육용 사랑의매2</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>3</div>
                    <h5>교육용 사랑의매3</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>4</div>
                    <h5>교육용 사랑의매4</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>5</div>
                    <h5>교육용 사랑의매5</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                     <td>
                    <div>5</div>
                    <h5>교육용 사랑의매5</h5>
                    <h4>30,000원</h4>
                    </td>
                </tr>
                 <tr>
                    <td>
                    <div>8</div>
                    <h5>교육용 사랑의매8</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>9</div>
                     <h5>교육용 사랑의매9</h5>
                    <h4>30,000원</h4>
                    </td>

                    <td>
                    <div>10</div>
                    <h5>교육용 사랑의매10</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>11</div>
                    <h5>교육용 사랑의매11</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>12</div>
                    <h5>교육용 사랑의매12</h5>
                    <h4>30,000원</h4>
                    </td>
                </tr>
            </tbody>
        </table>
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