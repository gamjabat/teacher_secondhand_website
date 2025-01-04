<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/board/boardQuestionAndAnswerDetail.css">
<section class="main-container">

	
	 <!-- 메인박스  -->
	 <div class="main-box">
       	<div class="page-title">
       		<h2>QnA</h2>
       	</div>
       
       	<div class="board-box">
       		
       		<div class="title">
       			<span>제목 :${qna.qnaTitle} </span>
       			<span>작성자: ${qna.qnaMemberNo}</span>
				<span>작성일: ${qna.createdAt}</span>
       		</div>
			
			<hr>
       		
       		<div class="content">
       			<span>내용 : ${qna.qnaContent} </span>
       		</div>
       		
       		<hr>
       		
       		<div class="cartegory">
       			<span>카테고리 :${qna.qnaTypeNo} </span>
       		</div>
       		
       	</div>
	</div>

    
</section>    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
