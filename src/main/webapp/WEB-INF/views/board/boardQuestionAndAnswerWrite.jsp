<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/board/boardQuestionAndAnswerWrite.css">
<section class="main-container">

	
	 <!-- 메인박스  -->
	 <div class="main-box">
       	
       		<!--상품등록 타이틀 -->
       	<div class="QnA-title">
       		<h2>문의글 쓰기</h2>
       	</div>
       	
       	
       	<!-- 상세 정보 입력 컨테이너-->
       	
       	<div class="QnA-input-box">
       		
       		<form action="">
       		
       		<div class="box1">
       			<label for="QnA-name"><span>제목</span></label>
                <input type="text" id="QnA-name" class="QnA-name" placeholder="제목을 입력해 주세요." name="" value="">
       		</div>
       		
       		<div class="box2">
       			<label for="QnA-category"><span>카테고리</span></label>
       			<select class="product-category">
       				<option value="cat-1"> 상품관련 </option>
       				<option value="cat-2"> 계정관련 </option>
       				<option value="cat-3"> 신고관련 </option>
       				<option value="cat-4"> 기타 </option>
       			</select>
       		</div>
       	
			  
       		<div class="box5">
       			<label for="QnA-content"><span>문의내용</span></label>
       			<textarea></textarea>
       		</div>
       		</form>
       		
       		<button class="QnA-save"><p>등록</p></button>
       	</div>

    </div>	
    
</section>    

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
