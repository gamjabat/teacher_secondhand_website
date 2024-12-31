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
			 	
			 	<!-- 판매자 인포 평점 박스 -->
			 	<div class="seller-info">
			 		
			 		<!-- 구분 -->
				 	<p>판매자</p>
				 	
				 	<!-- 프로필사진 - 아이디 - 주소 -->
				 	<div class="profile-box">
				 		<div class="circle"></div>
				 		<div class="id-address">
					 		<h4>아이디</h4>
					 		<h5>지역</h5>
				 		</div>
				 	</div>
				 	
				 	<!-- 별 평점이 들어갈 자리. -->
				 	<div class="star-lv">⭐⭐⭐⭐⭐</div>
			 		
			 	</div>
			 	
			 	
			 	<!-- 판매자의 후기가 담기는 박스 -->
			 	<div class="comment-list">
			 	
			 	<!-- 구분 -->
			 	<p>후기</p>
			 	
			 	<!-- 사진에 해당하는 후기내용 을 슬라이드로 넘겨 랜덤 후기 -->
			 	<div class="comment-photo">
				 	<!-- 뒤로 가기 -->
				 	<button class="comment-prev">&lt;</button>
						<!-- 사진 박스 -->
						<div class="photo-box">사진</div> 
						<!-- 후기 박스 -->
						<div class="comment-box">후기</div>
					<!-- 앞으로 가기 -->
				 	<button class="comment-next">&gt;</button>
			 	</div>
			 </div>
		 	</div>
		 	
		 <!-- 중간 문구 -->
        <h2>판매중인 상품</h2>
        
        
        <!-- 판매중인 리스트 -->
        <table class="product-list">
            <tbody>
                <tr>
                    <td>
                    <div>1</div>
                    <h5>교육용 사랑의매1</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>1</div>
                    <h5>교육용 사랑의매1</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>1</div>
                    <h5>교육용 사랑의매1</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>1</div>
                    <h5>교육용 사랑의매1</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>1</div>
                    <h5>교육용 사랑의매1</h5>
                    <h4>30,000원</h4>
                    </td>
                </tr>
                
                 <tr>
                    <td>
                    <div>1</div>
                    <h5>교육용 사랑의매1</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>1</div>
                    <h5>교육용 사랑의매1</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>1</div>
                    <h5>교육용 사랑의매1</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>1</div>
                    <h5>교육용 사랑의매1</h5>
                    <h4>30,000원</h4>
                    </td>
                    
                    <td>
                    <div>1</div>
                    <h5>교육용 사랑의매1</h5>
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