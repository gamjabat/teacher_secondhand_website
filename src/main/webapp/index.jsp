<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/style.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">


	<!-- 카테고리 박스 -->
	 <div class="ct-box">
		 <div class="checkbox-container">
		 	<div class="title">지역</div>
			    <label><input type="radio" name="region"/> 서울</label>
			    <label><input type="radio" name="region"/> 부산</label>
			    <label><input type="radio" name="region"/> 대구</label>
			    <label><input type="radio" name="region"/> 인천</label>
			    <label><input type="radio" name="region"/> 광주</label>
			    <label><input type="radio" name="region"/> 대전</label>
			    <label><input type="radio" name="region"/> 울산</label>
			    <label><input type="radio" name="region"/> 세종</label>
			    <label><input type="radio" name="region"/> 경기도</label>
			    <label><input type="radio" name="region"/> 충청북도</label>
			    <label><input type="radio" name="region"/> 충청남도</label>  
			    <label><input type="radio" name="region"/> 전라북도</label>  
			    <label><input type="radio" name="region"/> 전라남도</label>  
			    <label><input type="radio" name="region"/> 경상북도</label>  
			    <label><input type="radio" name="region"/> 경상남도</label>  
			    <label><input type="radio" name="region"/> 제주</label>  
			</div>
		 <div class="checkbox-container">
		 	<div class="title">카테고리</div>
			    <label><input type="radio" name="category"/> 책</label>
			    <label><input type="radio" name="category"/> 수업자료</label>
			    <label><input type="radio" name="category"/> 교구</label>
			    <label><input type="radio" name="category"/> 문구류</label>
			    <label><input type="radio" name="category"/> 운동</label> 
			    <label><input type="radio" name="category"/> 전자기기</label> 
			    <label><input type="radio" name="category"/> 생활용품</label> 
			    <label><input type="radio" name="category"/> 기타</label> 
			</div>
		 <div class="checkbox-container">
		 	<div class="title">거래방법</div>
			    <label><input type="radio" name="transaction"/> 직거래</label>
			    <label><input type="radio" name="transaction"/> 택배</label>
			</div>
		 <div class="checkbox-container">
		 	<div class="title">정렬기준</div>
			    <label><input type="radio" name="sorting"/> 오름차순</label>
			    <label><input type="radio" name="sorting"/> 내림차순</label>
			    <label><input type="radio" name="sorting"/> 인기순</label>
			    <label><input type="radio" name="sorting"/> 최신순</label>
			</div>
		  <div class="checkbox-container">
		 	<div class="title">금액</div>
			    <label><input type="radio" name="price"/> 5000원 이하</label>
			    <label><input type="radio" name="price"/> 10000원 이하</label>
			    <label><input type="radio" name="price"/> 20000원 이하</label>
			    <label><input type="radio" name="price"/> 30000원 이하</label>
			    <label><input type="radio" name="price"/> 그 외</label>
			    <label><input type="radio" name="price"/> 무료나눔</label>
			</div>
		  <div class="checkbox-container">
		 	<div class="title">거래상태</div>
			    <label><input type="radio" name="transaction"/> 거래가능</label>
			    <label><input type="radio" name="transaction"/> 거래중</label>
			    <label><input type="radio" name="transaction"/> 거래완료</label> 
			</div>
		  <div class="checkbox-container">
		 	<div class="title">상품상태</div>
			    <label><input type="radio" name="status" /> A급</label>
			    <label><input type="radio" name="status"/> B급</label>
			    <label><input type="radio" name="status"/> C급</label>
			    <label><input type="radio" name="status"/> D급</label>
			    <label><input type="radio" name="status"/> F급</label>  
			</div>	
		   <div class="reset-btn-container">
		 	<button class="reset-btn"><p>RE</p></button>	
		 	<button class="push-btn"><p>PUSH</p></button>				
	       </div>
	 </div>
	  
	 
	 <!-- 메인박스  -->
	 <div class="main-box">
        <h2>"서울" 지역 "책" 카테고리 검색 결과입니다.</h2>
        <table class="product-list">
            <tbody>
                <tr>
                    <td>
                    <div>1</div>
                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
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





<script>

</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>