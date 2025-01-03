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
			    <label><input type="radio" /> 서울</label>
			    <label><input type="radio" /> 부산</label>
			    <label><input type="radio" /> 인천</label>
			    <label><input type="radio" /> 군포</label>
			    <label><input type="radio" /> 가산</label>
			    <label><input type="radio" /> 대전</label>
			    <label><input type="radio" /> 대구</label>
			    <label><input type="radio" /> 울산</label>
			    <label><input type="radio" /> 광주</label>
			    <label><input type="radio" /> 강원</label>
			    <label><input type="radio" /> 제주</label>  
			</div>
		 <div class="checkbox-container">
		 	<div class="title">카테고리</div>
			    <label><input type="radio" /> 도서</label>
			    <label><input type="radio" /> 운동</label>
			    <label><input type="radio" /> 전자기기</label>
			    <label><input type="radio" /> 문구</label>
			    <label><input type="radio" /> 생활용품</label> 
			</div>
		 <div class="checkbox-container">
		 	<div class="title">거래방법</div>
			    <label><input type="radio" /> 직거래</label>
			    <label><input type="radio" /> 택배</label>
			</div>
		 <div class="checkbox-container">
		 	<div class="title">정렬기준</div>
			    <label><input type="radio" /> 오름차순</label>
			    <label><input type="radio" /> 내림차순</label>
			    <label><input type="radio" /> 인기순</label>
			    <label><input type="radio" /> 최신순</label>
			</div>
		  <div class="checkbox-container">
		 	<div class="title">금액</div>
			    <label><input type="radio" /> 5000원 이하</label>
			    <label><input type="radio" /> 10000원 이하</label>
			    <label><input type="radio" /> 20000원 이하</label>
			    <label><input type="radio" /> 30000원 이하</label>
			    <label><input type="radio" /> 그 외</label>
			    <label><input type="radio" /> 무료나눔</label>
			</div>
		  <div class="checkbox-container">
		 	<div class="title">거래상태</div>
			    <label><input type="radio" /> 거래가능</label>
			    <label><input type="radio" /> 거래중</label>
			    <label><input type="radio" /> 거래완료</label> 
			</div>
		  <div class="checkbox-container">
		 	<div class="title">상품상태</div>
			    <label><input type="radio" /> A급</label>
			    <label><input type="radio" /> B급</label>
			    <label><input type="radio" /> C급</label>
			    <label><input type="radio" /> D급</label>
			    <label><input type="radio" /> F급</label>  
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