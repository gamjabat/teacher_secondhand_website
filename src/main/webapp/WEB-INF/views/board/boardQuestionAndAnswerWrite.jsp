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
       		<form action="${path}/board/boardquestionandanswerwriteend.do" method="POST">
       		 <!-- 로그인된 사용자 정보를 숨겨진 필드로 전송 -->
            <input type="hidden" name="memberNo" value="${loginMember != null ? loginMember.memberNo : ''}">
            
       		<div class="box1">
       			<label for="QnA-name"><span>제목</span></label>
                <input type="text" id="QnA-name" class="QnA-name" placeholder="제목을 입력해 주세요." name="title" value="" maxlength="150">
       		</div>

       		<div class="box2">
       			<label for="QnA-category"><span>카테고리</span></label>
       			<select class="product-category" name="type">
       				<option value="QCT-1"> 상품관련 </option>
       				<option value="QCT-2"> 계정관련 </option>
       				<option value="QCT-3"> 신고관련 </option>
       				<option value="QCT-4"> 기타 </option>
       			</select>
       		</div>
       		<div class="box5">
       			<label for="QnA-content"><span>문의내용</span></label>
       			<textarea name="content"></textarea>
       		</div>
       		<button class="QnA-save"><p>등록</p></button>
       		</form>
       	</div>

    </div>	
    
</section>    
<script>
//헤더 없애기
document.addEventListener('DOMContentLoaded', () => {
	
	 document.querySelector(".ct-box").style.display = "none";
	 document.querySelector(".search-input").style.display = "none";
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
