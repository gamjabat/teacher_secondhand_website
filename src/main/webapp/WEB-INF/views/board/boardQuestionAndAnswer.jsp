<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/board/boardQuestionAndAnswer.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">

	 <!-- 메인박스  -->
	 <div class="main-box">
	 
	 	<div class="top-title-btn">
       		
       		<!-- 상단 타이틀 -->
	        <h3>문의 게시판</h3>
	        
	        <!-- 글쓰기 버튼 -->
	        <button class="write-btn">
	        	<h4>글쓰기</h4>
	        </button>
      	
      	</div>
      	
      	<div class="table-container">
		    <table class="custom-table">
		      <thead>
		        <tr>
		          <th>NO</th>
		          <th>제목</th>
		          <th>작성자</th>
		          <th>작성일</th>
		          <th>조회수</th>
		          <th>처리상태</th>
		        </tr>
		      </thead>
		      <tbody>
		        <!-- 빈 행 반복 -->
		        <tr>
		          <td>1</td>
		          <td>제목이다냥2asdasdasdasdasdasdasdasdasd</td>
		          <td>감자다냥</td>
		          <td>3024.10.23</td>
		          <td>100204292849</td>
		          <td>미응답 답변</td>
		        </tr>
		        <tr>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
		        <tr>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
		        <tr>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
		        <tr>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
		        <tr>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
		        <tr>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
		        <tr>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
		        <tr>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
		        <tr>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
		        <tr>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
		        <tr>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
		        <!-- 필요한 만큼 행 추가 -->
		      </tbody>
		    </table>
		  </div>
        
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
