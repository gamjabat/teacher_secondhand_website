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
	       			<%-- <span>작성자: ${qna.qnaMemberNo}</span> --%>
	       		    <span>작성자: ${qna.qnaMemberNo}</span>
					<span>작성일: ${qna.createdAt}</span>
					<span>카테고리 :${qna.typeName} </span> 
					<%-- <span>카테고리 :${qna.code.typeName}</span> --%>
	       		</div>
			<hr>
	       		<div class="content">
	       			<span>내용 : ${qna.qnaContent} </span>
	       		</div>
       		<hr>
       		
       		<!-- 관리자 답글 출력. -->
       		<div class="comments">
		     <c:if test="${not empty comments}">
		         <c:forEach var="comment" items="${comments}">
		             <div class="comment">
		               <!-- 작성자 아이디 -->
		               <div>관리자</div>  
		                 <!-- 댓글 내용 -->
		                 <div class="comment-content">
		                 <input type="hidden" name="commentNo" value="${comment.commentNo }">	
		                 ${comment.commentContent}
		                 </div>
		             </div>   
		                 <!-- 댓글 날짜 -->
		                 <div>${comment.createdAt}</div>  
		         </c:forEach>
		     </c:if>  
    	   </div>
       	</div>
       	
       	
       	<!-- 댓글 등록 form  -->
       	<!-- 아래 admin1,2,3 아이디만 보이게 함.-->
       	<c:if test="${sessionScope.loginMember.memberId == 'admin1' || 
					  sessionScope.loginMember.memberId == 'admin2' || 
					  sessionScope.loginMember.memberId == 'admin3'}">
					  
		<div class="comments-form-box">
			 <form action="${path}/board/insertqnacomment.do" method="post">
	               <input type="hidden" name="commentQnaNo" value="${qna.qnaNo}"/>	   
	               <input type="hidden" name="commentMemberNo" value="${sessionScope.loginMember.memberNo}"/>      	   
	               <textarea name="content" cols="50" rows="3"> 안녕하세요 ${qna.qnaMemberNo} 님 ! 쓸만해입니다. [답변내용] 추가로 궁금하신 부분이 있으시면 글쓰기를 통해서 재차 문의하시면 빠르게 답변 달아 드리겠습니다. 많은 이용 부탁드립니다. 감사합니다!</textarea>
		           <button type="submit" id="btn-insert" class="comment-btn" value="${comment.commentNo}">등록</button>
		     </form>
		</div>
		</c:if>
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
