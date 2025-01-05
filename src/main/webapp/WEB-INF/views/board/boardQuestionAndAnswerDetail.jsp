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
	       			<%-- <span>작성자: ${qna.member.memberId}</span> --%>
					<span>작성일: ${qna.createdAt}</span>
					<span>카테고리 :${qna.qnaTypeNo} </span> 
					<%-- <span>카테고리 :${qna.code.typeName}</span> --%>
	       		</div>
			<hr>
	       		<div class="content">
	       			<span>내용 : ${qna.qnaContent} </span>
	       		</div>
       		<hr>
       	</div>
       	
       	
       	<!-- 댓글 등록 form  -->
       	<!-- 아래 admin 아이디만 보이게 함.-->
       	<c:if test="${sessionScope.loginMember.memberId == 'admin1' || 
					  sessionScope.loginMember.memberId == 'admin2' || 
					  sessionScope.loginMember.memberId == 'admin3'}">
					  
		<div class="comments-form-box">
			 <form action="${path}/board/insertqnacomment.do" method="post">
	               <input type="hidden" name="commentQnaNo" value="${qna.qnaNo}"/>
	               <%-- <input type="hidden" name="commentMemberNo" value="${qna.qnaMemberNo}"/>     --%>  	   
	               <input type="hidden" name="commentMemberNo" value="${sessionScope.loginMember.memberNo}"/>      	   
	               <textarea name="content" cols="50" rows="3"> 안녕하세요 ${qna.qnaMemberNo} 님 ! 쓸만해 운영진입니다. [답변내용] 추가로 궁금하신 부분이 있으시면 글쓰기를 통해서 재차 문의하시면 빠르게 답변 달아 드리겠습니다. 많은 이용 부탁드립니다. 감사합니다!</textarea>
		           <button type="submit" id="btn-insert" class="comment-btn" value="${comment.commentNo}">등록</button>
		     </form>
		</div>
		</c:if>
		
		       	
	</div>

    
</section>    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
