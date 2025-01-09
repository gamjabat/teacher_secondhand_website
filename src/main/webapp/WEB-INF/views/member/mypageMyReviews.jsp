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
			<li><a href="${path}/member/mypageinfoupdate.do">나의 정보수정</a></li>
			<li><a href="${path }/member/myproducts.do">내가 등록한 상품</a></li>
			<li  class="active-sidebar"><a href="${path }/member/myreviews.do">나의 후기</a></li>
			<li><a href="${path }/member/purchasehistory.do">나의 구매내역</a></li>
			<li><a href="${path }/member/mypagereporthistory.do">나의 신고내역</a></li>
		</ul>
	</div>
	
	<!-- 후기리스트 -->
	<div class="item-container">
		<h2>나의 후기</h2>
			<c:if test="${not empty reviews}">
		        <c:forEach var="r" items="${reviews}">
		            <div class="purchase-item">
		                <img src="${path}/resources/upload/product/${r.PRODUCTIMAGE}" class="d-block">
		                <div class="product-info">
		                    <div class="title"><a href="${path}/product/productdetail.do?productNo=${r.PRODUCTNO}">${r.PRODUCTNAME}</a></div>
		                    <div class="price"><fmt:formatNumber value="${r.PRICE}"/>원</div>
		                </div>
		                <div class="d-flex align-items-center" >판매자 : ${r.SELLERNICKNAMEORID}</div>
		                <div class="transaction-date">
		                    <fmt:formatDate value="${r.UPDATED_AT}" pattern="yyyy-MM-dd hh:mm:ss" />
		                </div>
		                <div class="button-group">
		                	<button class="btn btn-view-review" data-bs-toggle="modal" data-bs-target="#reviewModal" data-review-no="${r.REVIEW_NO }" data-review-content="${r.REVIEWCONTENT}" data-review-rating="${r.RATING}">후기 보기</button>
						</div>
		            </div>
		        </c:forEach>
		    </c:if>
		    <c:if test="${empty reviews}">
		        <div class="no-data">
		            <p>작성한 후기가 없습니다.</p>
		        </div>
		    </c:if>
		
		<!-- 페이지 바 디자인. -->
	    <div class="pagination">
		   ${pageBar }
		</div>
	
	</div>

</div>
	
	<!-- 후기 모달 -->
	<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="reviewModalLabel">작성한 후기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form id="reviewForm" class="w-100" action="${path }/review/updatereview.do" method="post">
	        <div class="modal-body">
	          <!-- 숨겨진 필드 -->
	          <input type="hidden" id="reviewNo" name="reviewNo" value="">
	
	          <!-- 별점 -->
	          <div class="review-rating mb-3 gap-3 d-flex">
	            <label for="reviewRating" class="form-label">별점</label>
	            <div class="star-rating" id="modalReviewRating">
	              <i class="far fa-star" data-value="1"></i>
	              <i class="far fa-star" data-value="2"></i>
	              <i class="far fa-star" data-value="3"></i>
	              <i class="far fa-star" data-value="4"></i>
	              <i class="far fa-star" data-value="5"></i>
	            </div>
	            <input type="hidden" id="reviewRating" name="rating" value="0">
	          </div>
	
	          <!-- 후기 내용 -->
	          <div class="review-content mb-3 d-flex flex-column">
	            <label for="modalReviewContent" class="form-label">후기 내용</label>
	            <textarea id="modalReviewContent" name="content" rows="3" style="resize: none;" placeholder="후기 내용을 입력하세요" readonly></textarea>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary btn-edit-review">수정</button>
	          <button type="button" class="btn btn-danger btn-delete-review" onclick="return deleteReview();">삭제</button>
	          <button type="submit" class="btn btn-primary btn-save-review d-none">저장</button>
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        </div>
	      </form>
	    </div>
	  </div>
	</div>

</section>


<script>
const deleteReview = () => {
	  const reviewNo = document.getElementById('reviewNo').value;
	  if (confirm('이 후기를 삭제하시겠습니까?')) {
	    window.location.href = `${path}/review/deletereview.do?reviewNo=` + reviewNo;
	  }
	};


document.addEventListener('DOMContentLoaded', () => {
	 /* 헤더 없애기 */
	 document.querySelector(".ct-box").style.display = "none";
	 document.querySelector(".search-input").style.display = "none";
	 
	 const reviewModal = document.getElementById('reviewModal');
	  const reviewContentElement = document.getElementById('modalReviewContent');
	  const reviewRatingElement = document.getElementById('modalReviewRating');
	  const reviewRatingInput = document.getElementById('reviewRating');
	  const reviewNoInput = document.getElementById('reviewNo');
	  const editButton = document.querySelector('.btn-edit-review');
	  const deleteButton = document.querySelector('.btn-delete-review');
	  const saveButton = document.querySelector('.btn-save-review');

	  // 리뷰 보기 버튼 클릭 시 초기화
	  document.querySelectorAll('.btn-view-review').forEach(button => {
	    button.addEventListener('click', () => {
	      const reviewContent = button.getAttribute('data-review-content');
	      const reviewRating = button.getAttribute('data-review-rating');
	      const reviewNo = button.getAttribute('data-review-no');

	      // 값 업데이트
	      reviewNoInput.value = reviewNo;
	      reviewContentElement.value = reviewContent;
	      reviewRatingInput.value = reviewRating;
	      

	      // 읽기 전용 설정
	      reviewContentElement.setAttribute('readonly', true);
	      reviewRatingElement.classList.add('disabled');
	      editButton.classList.remove('d-none');
	      deleteButton.classList.remove('d-none');
	      saveButton.classList.add('d-none');

	      // 별점 렌더링
	      const rating = parseInt(reviewRating, 10);
	      reviewRatingElement.querySelectorAll('.fa-star').forEach(star => {
	        const value = parseInt(star.getAttribute('data-value'), 10);
	        star.classList.remove('fas', 'far');
	        star.classList.add(value <= rating ? 'fas' : 'far');
	      });
	    });
	  });

	  // 수정 버튼 클릭 시 편집 가능 상태로 변경
	  editButton.addEventListener('click', () => {
	    reviewContentElement.removeAttribute('readonly');
	    reviewRatingElement.classList.remove('disabled');
	    editButton.classList.add('d-none');
	    deleteButton.classList.add('d-none');
	    saveButton.classList.remove('d-none');
	  });

	  // 별점 클릭 이벤트
	  reviewRatingElement.addEventListener('click', event => {
	    if (!reviewRatingElement.classList.contains('disabled') && event.target.classList.contains('fa-star')) {
	      const selectedRating = parseInt(event.target.getAttribute('data-value'), 10);
	      reviewRatingInput.value = selectedRating;

	      // 별점 업데이트
	      reviewRatingElement.querySelectorAll('.fa-star').forEach(star => {
	        const value = parseInt(star.getAttribute('data-value'), 10);
	        star.classList.remove('fas', 'far');
	        star.classList.add(value <= selectedRating ? 'fas' : 'far');
	      });
	    }
	  });
});
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>