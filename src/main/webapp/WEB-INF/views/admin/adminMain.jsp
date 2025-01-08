<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/admin/adminMain.css">
<section class="main-container">

	 <!-- 메인박스  -->
	 <div class="main-box">
	 	
	 	<div class="top-title-list-box">
		 	<div class="top-title-list">
	       		<!-- 상단 타이틀 -->
	
		        <a href="">신고</a>
	      	</div>
      	</div>	
      	
      	<div class="table-container">
		    <table class="custom-table">
		      <thead>
		        <tr>
		          <th>NO</th>
		          <th>사유</th>
		          <th>신고자</th>
		          <th>작성일</th>
		          <th>신고상태</th>
		          <th>상품번호</th>
		        </tr>
		      </thead>
		      <tbody>
		     		<c:if test="${empty reportList}">
				    <tr>
				        <td colspan="6">신고 데이터가 없습니다.</td>
				    </tr>
				    </c:if>
			      <c:forEach var="report" items="${reportList}">
			        <tr>
			          <td>${report.reportNo}</td>	          
			          <td onclick="window.location.href='${path}/adminreportdetail.do?reportNo=${report.reportNo}'">
			          ${report.reportReasonName}
			          </td>
			          <td>${report.reportMemberNo}</td>
			          <td>${report.createdAt}</td>
			          <td>${report.reportStatusName}</td>
			          <td>${report.reportProductNo}</td>
			        </tr>
			       </c:forEach>
		      </tbody>
		    </table>
		  </div>
        
        <!-- 페이지 바 디자인. -->
	     <div class="pagination">
			    ${pageBar}
     </div>	
    
    
</section>   

<script>
document.addEventListener('DOMContentLoaded', () => {
	 /* 헤더 없애기 */
	 document.querySelector(".ct-box").style.display = "none";
	 document.querySelector(".search-input").style.display = "none";
});
</script>
