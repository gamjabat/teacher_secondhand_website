<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/board/boardQuestionAndAnswer.css">
<section class="main-container">

	 <!-- 메인박스  -->
	 <div class="main-box">
	 
	 	<div class="top-title-btn">
       		
       		<!-- 상단 타이틀 -->
	        <h3>문의 게시판</h3>
	        
	        <!-- 글쓰기 버튼 -->
	        <button class="write-btn" onclick="window.location.href='${path}/board/boardquestionandanswerwrite.do'">
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
		           	 <c:forEach var="qna" items="${qnaList}">
		                <tr>
		                    <td>${qna.qnaNo}</td>
		                    <td onclick="window.location.href='${path}/board/boardquestionandanswerdetail.do?qnaNo=${qna.qnaNo}'">
		                        ${qna.qnaTitle}
		                    </td>
		                    <td>${qna.qnaMemberNo}</td>
		                    <td>${qna.createdAt}</td>
		                    <td>미구현</td> <!-- 조회수가 있다면 -->
		                    <td>미구현</td> <!-- 처리 상태 -->
		                </tr>
		            </c:forEach>
	       		</tbody>
		    </table>
		  </div>
		<!-- 페이지 바 -->
        ${pageBar}
     </div>
    
    
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>