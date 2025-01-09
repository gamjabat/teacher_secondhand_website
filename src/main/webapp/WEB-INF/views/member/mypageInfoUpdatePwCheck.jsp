<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/common/mypage.css">
<link rel="stylesheet" href="${path}/resources/css/member/mypageInfoUpdatePwCheck.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">
<div class="main-box d-flex flex-row">
	<!--  사이드바 -->
	<div class="mypage-side-bar">
		<c:if test="${sessionScope.loginMember != null}">
			<div class="member-info">
				<c:if test="${sessionScope.loginMember.profileImageName == null }">
					<div class="member-img d-flex justify-content-center align-items-center">
		        		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#ECEBDE" class="bi bi-person-fill" viewBox="0 0 16 16">
						  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
						</svg>
		        	</div>
	        	</c:if>
	        	<c:if test="${sessionScope.loginMember.profileImageName != null }">
	            	<img src="${path}/resources/upload/member/${sessionScope.loginMember.profileImageName}" class="member-img">
	            </c:if>
	        	<div class="member-name">${sessionScope.loginMember.nickname}</div>
			</div>
		 </c:if>
		<h3>마이페이지</h3>
		<ul>
			<li class="active-sidebar"><a href="${path}/member/mypageinfoupdate.do">나의 정보수정</a></li>
			<li><a href="${path }/member/myproducts.do">내가 등록한 상품</a></li>
			<li><a href="${path }/member/myreviews.do">나의 후기</a></li>
			<li ><a href="${path }/member/purchasehistory.do">나의 구매내역</a></li>
			<li><a href="${path }/member/mypagereporthistory.do">나의 신고내역</a></li>
		</ul>
	</div>
	<div class="mypage-content">
				<h2>나의 정보 수정</h2>
			<div class="mypage-form p-5 mb-5">
				<h3>비밀번호 재확인</h3>
				<p>회원 정보를 안전하게 보호하기 위해 회원 비밀번호를 다시 확인합니다.</p>
					<form action="${path}/member/mypageinfoupdate2.do" method="post" class="mt-5">
				         <div class="id_box mb-3">
				           <label class="idlabel">아이디
				           <input type="text" class="myId form-control" name="id" value="${loginMember.memberId }" readonly/>
				           </label>
				         </div>
				         <div class="pw_box">
				           <label class="pwlabel">비밀번호
				           <input type="password" class="myPw form-control" name="password" placeholder="비밀번호 입력" required />
				           </label>
				         </div>   
				         <div class="button-group">
				       	   <button type="submit" class="btn m-3">확인</button>
				        </div>
				   </form>
		    </div>
		 </div>
</div>
</section>

<script>
	// 헤더 없애기
	document.addEventListener('DOMContentLoaded', () => {
		
		 document.querySelector(".ct-box").style.display = "none";
		 document.querySelector(".search-input").style.display = "none";
	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>