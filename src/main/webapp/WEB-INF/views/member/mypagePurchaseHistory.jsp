<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/common/mypage.css">
<link rel="stylesheet" href="${path}/resources/css/member/mypagePurchaseHistory.css">
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
			<li><a href="${path}/member/mypageinfoupdate.do">나의 정보수정</a></li>
			<li><a href="${path }/member/myproducts.do">내가 등록한 상품</a></li>
			<li><a href="${path }/member/myreviews.do">나의 후기</a></li>
			<li class="active-sidebar"><a href="${path }/member/purchasehistory.do">나의 구매내역</a></li>
			<li><a href="${path }/member/mypagereporthistory.do">나의 신고내역</a></li>
		</ul>
	</div>
	
	<!-- 구매리스트 -->
	<div class="item-container">
		<h2>나의 구매내역</h2>
			<c:if test="${not empty purchaseHistory}">
		        <c:forEach var="history" items="${purchaseHistory}">
		            <div class="purchase-item">
		                <img src="${path}/resources/upload/product/${history['IMAGE_FILE']}" class="d-block" alt="${history.PRODUCT_NAME}">
		                <div class="product-info">
		                	<input type="hidden" id="transNo" value="${history.TRANS_NO }">
		                	<input type="hidden" id="paymentNo" value="${history.PAYMENT_NO }">
		                    <div class="title"><a href="${path}/product/productdetail.do?productNo=${history.PRODUCT_NO}">${history.PRODUCT_NAME}</a></div>
		                    <div class="price"><fmt:formatNumber value="${history.PRICE}"/>원</div>
		                </div>
		                <div class="transaction-status">${history.TRANSACTION_STATUS}</div>
		                <div class="transaction-date">
		                    <fmt:formatDate value="${history.TRANSACTION_DATE}" pattern="yyyy-MM-dd hh:mm:ss" />
		                </div>
		                <div class="button-group">
		                	<button class="btn me-2" data-bs-toggle="modal" data-bs-target="#reviewModal" data-trans-no="${history.TRANS_NO}">후기 작성</button>
		                	<button class="btn" onclick="paymentDetail();">상세 보기</button>
		                </div>
		            </div>
		        </c:forEach>
		    </c:if>
		    <c:if test="${empty purchaseHistory}">
		        <div class="no-data">
		            <p>구매 내역이 없습니다.</p>
		        </div>
		    </c:if>
		
		<!-- 페이지 바 디자인. -->
	    <div class="pagination">
		   ${pageBar }
		</div>
	</div>

</div>
</section>


		<!-- 후기 모달 -->
		<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="reviewModalLabel">판매자 후기 작성하기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body d-flex justify-content-center">
		        <form id="reviewForm" action="${path }/review/insertreview.do" method="post" onsubmit="return fn_invalidate();">
		        	<input type="hidden" name="memberNo" value="${loginMember.memberNo}" />
		        	<input type="hidden" id="transNo" name="transNo" value="">
		          <div class="mb-3">
		            <label for="reviewRating" class="form-label">별점</label>
		            <div class="star-rating">
				        <i class="far fa-star" data-value="1"></i>
				        <i class="far fa-star" data-value="2"></i>
				        <i class="far fa-star" data-value="3"></i>
				        <i class="far fa-star" data-value="4"></i>
				        <i class="far fa-star" data-value="5"></i>
				    </div>
				    <input type="hidden" id="reviewRating" name="rating" value="0">
		          </div>
		          <div class="mb-3">
		            <label for="reportDetails" class="form-label">후기 내용</label>
		            <textarea class="form-control" id="reviewContent" name="content" rows="3" placeholder="후기 내용을 입력하세요"></textarea>
		          </div>
		          <div class="text-center">
		            <button type="submit" class="btn btn-danger">후기 등록</button>
		            <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal">취소</button>
		          </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>

<script>
const paymentDetail=()=>{
	const paymentNo = $("#paymentNo").val();
	location.assign('${path}/payment/paymentdetail.do?paymentNo='+paymentNo);
}
document.addEventListener('DOMContentLoaded', () => {
	 /* 헤더 없애기 */
	 document.querySelector(".ct-box").style.display = "none";
	 document.querySelector(".search-input").style.display = "none";
	 
	 /* 별점 처리 */
	 const stars = document.querySelectorAll('.star-rating .fa-star');
    const ratingInput = document.getElementById('reviewRating');

    stars.forEach(star => {
        star.addEventListener('click', () => {
            const value = parseInt(star.getAttribute('data-value'), 10); // 클릭한 별의 점수

            // 별점 설정
            ratingInput.value = value;
            stars.forEach(s => {
                const starValue = parseInt(s.getAttribute('data-value'), 10);
                if (starValue <= value) {
                    s.classList.remove('far'); // 비워진 별 제거
                    s.classList.add('fas');   // 채워진 별 추가
                } else {
                    s.classList.remove('fas'); // 채워진 별 제거
                    s.classList.add('far');    // 비워진 별 추가
                }
            });
        });
    });
	    
	    
	    
	 // 모든 후기 작성 버튼에 이벤트 추가
	    const reviewButtons = document.querySelectorAll('button[data-trans-no]');
	    const transNoInput = document.querySelector('#reviewForm input[name="transNo"]'); // 숨겨진 필드

	    reviewButtons.forEach(button => {
	        button.addEventListener('click', () => {
	            const transNo = button.getAttribute('data-trans-no'); // 버튼의 transNo 값 가져오기
	            transNoInput.value = transNo; // 숨겨진 필드에 값 설정
	        });
	    });
	    
	    /* 모달 초기화 */
	    const reviewModalElement = document.getElementById('reviewModal');
	    reviewModalElement.addEventListener('hidden.bs.modal', () => {
	        // 숨겨진 input 초기화
	        transNoInput.value = '';
	        ratingInput.value = '0';

	        // 별점 초기화
	        stars.forEach(star => {
	            star.classList.remove('fas'); // 채워진 별 제거
	            star.classList.add('far');    // 비워진 별 추가
	        });

	        // 텍스트 영역 초기화
	        document.getElementById('reviewContent').value = '';
	    });
});

document.getElementById('reviewForm').addEventListener('submit', function(event) {
    event.preventDefault(); // 기본 제출 방지

    // 로그인 여부 확인
    const loginMember = ${loginMember != null ? 'true' : 'false'};
    if (!loginMember) {
        alert("로그인 후 후기 작성이 가능합니다.");
        location.assign("${path}/login/loginpage.do");
        return;
    }

    // 별점 및 후기 내용 검증
    const ratingInput = document.getElementById('reviewRating');
    const contentInput = document.getElementById('reviewContent');

    if (!ratingInput.value || parseInt(ratingInput.value, 10) === 0) {
        alert("별점을 선택해주세요.");
        return;
    }

    if (!contentInput.value.trim()) {
        alert("후기 내용을 입력해주세요.");
        contentInput.focus();
        return;
    }

    // 조건 충족 시 폼 제출
    this.submit();

    // 모달 닫기
    const reviewModal = bootstrap.Modal.getInstance(document.getElementById('reviewModal'));
    reviewModal.hide();
});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>