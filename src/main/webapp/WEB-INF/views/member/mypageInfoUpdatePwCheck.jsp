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
		<div class="member-info">
			<div class="member-img d-flex justify-content-center align-items-center">
        		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#ECEBDE" class="bi bi-person-fill" viewBox="0 0 16 16">
				  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
				</svg>
        	</div>
        	<div class="member-name">나BS아님</div>
		</div>
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
			<div class="mypage-form">
				<h3>비밀번호 재확인</h3>
				<p>회원 정보를 안전하게 보호하기 위해 회원 비밀번호를 다시 확인합니다.</p>
					<form action="${path}/member/mypageinfoupdate2.do" method="post">
				         <div class="id_box">
				           <label class="idlabel">아이디
				           <input type="text" class="myId" name="id" value="${loginMember.memberId }" readonly/>
				           </label>
				         </div>
				         <div class="pw_box">
				           <label class="pwlabel">비밀번호
				           <input type="password" class="myPw" name="password" placeholder="비밀번호 입력" required />
				           </label>
				         </div>   
				         <div class="bt">
				       	   <button type="submit" class="btn">확인</button>
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