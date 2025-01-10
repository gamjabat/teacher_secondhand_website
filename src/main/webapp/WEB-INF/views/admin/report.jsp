<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/style.css">
<link rel="stylesheet" href="${path}/resources/css/admin/report.css">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">
<div class="main-box">
<div id="report" >
  <div class="content">
    <h2>신고하기</h2>
    <form id="reportForm" action="${path}/reportinsert.do" method="post">
        <!-- 필수 데이터 -->
        <input type="hidden" name="productNo" value="${productNo}">
        <input type="hidden" name="memberNo" value="${loginMember.memberNo}"> <!-- 로그인 사용자 ID -->
		
        <!-- 신고 사유 -->
        <div class="form-group">
            <label for="reportReason">신고 사유</label><br>
            <select id="reportReasonCode" name="reportReasonCode" required>
                <option value="" disabled selected>신고 사유를 선택하세요</option>
                <option value="RRN-2">스팸</option>
                <option value="RRN-1">폭언/비방</option>
                <option value="RRN-3">사기/부적절한 내용</option>
                <option value="RRN-4">기타</option>
            </select>
        </div>

        <!-- 상세 설명 -->
        <div class="form-group">
        	
            <label for="reportDetails">상세 설명</label><br>
            <textarea id="reportContent" name="reportContent" rows="5" placeholder="상세 내용을 입력하세요..." required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">신고 제출</button>
    </form>
</div>
</div>
</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
