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
       		<h2>신고상세정보</h2>
       	</div>
       	<div class="board-box">
	       		<div class="title">
	       			<span>신고번호 :${report.reportNo} </span>
	       			<span>신고유형 :${report.reportReasonCode} </span>
	       		    <span>신고자 :${report.reportMemberNo}</span>
					<span>작성일 :${report.createdAt}</span>
					<span>신고상태 :${report.reportStatusNo} </span> 
					<span>상품번호 :${report.reportProductNo} </span> 
	       		</div>
			<hr>
	       		<div class="content">
	       			<span>신고내용 : ${report.reportContent} </span>
	       		</div>
       		<hr>
       		<input type="hidden" name="reportNo" value="${reportBoard.reportNo}">
				<label for="reportReason" class="form-label">신고 처리유형</label><br> 
						<select class="form-select" id="reportReason" name="reason" required>
							<option value="" selected disabled>신고조치 상태를 선택하세요</option>
							<option value="RHS-3">신고반려</option>
							<option value="RHS-4">신고승인처리</option>
						</select>
						<br>
						<div class="mb-3">
						<label for="reportDetails" class="form-label">처리 내용</label><br>
							<textarea class="form-control" id="reportDetails"
							name="details" rows="3" placeholder="처리 내용을 입력하세요"></textarea>
							</div>
						</div>	
					</div>
				</section> 
				   
<script>
document.addEventListener('DOMContentLoaded', () => {
	 /* 헤더 없애기 */
	 document.querySelector(".ct-box").style.display = "none";
	 document.querySelector(".search-input").style.display = "none";
});
</script>
