<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/style.css">
<link rel="stylesheet" href="${path}/resources/css/member/wishList.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">
<!-- 메인박스  -->
	 <div class="main-box">
        <div class="list-title">
        	<div class="list-logo d-flex justify-content-center align-items-center">
		    	<!-- 빈하트 -->
	   			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#BBA990" class="bi bi-heart mx-1" viewBox="0 0 16 16">
					<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
				</svg>
		    </div>
		    <div>관심 상품 리스트</div>
		  
        </div>
        <table class="product-list">
            <tbody>
            
            </tbody>
        </table>
        <!-- 페이지 바 디자인. -->
        <div class="pagination">
		   ${pageBar}
		</div>
    </div>	
</section>

<script>
	const memberNo = '${loginMember.memberNo}';
	const pagebar = {cPage : 1, numPerPage : 5};
	const loadLikedProductList = (memberNo,cPage=1,numPerPage=5) => {

	if (!memberNo) {
	    console.error("회원 정보가 없습니다.");
	    return; 
	}
		    
	fetch("${path}/member/wishproductlist.do?memberNo=" + memberNo+"&cPage="+cPage+"&numPerPage="+numPerPage)
	     .then(response => response.json())
	     .then(data => {
	         const tbody = document.querySelector('.product-list tbody');
	         const pagination = document.querySelector('.pagination');
	         // 기존 내용 초기화
	         tbody.innerHTML = '';
	         pagination.innerHTML = '';
    
	         // 상품 리스트를 5개씩 한 줄에 렌더링
	         let row;
	         data.likedProducts.forEach((product, index) => {
	             // 5개씩 한 줄에 렌더링하기 위해 row 생성
	             if (index % 5 === 0) {
	                 row = document.createElement('tr'); // 새 행 생성
	                 tbody.appendChild(row);
	             }

             const cell = document.createElement('td'); // 열 생성
             cell.innerHTML = `
                 <div class="product-img-container">
             		<button class="heart-btn">
                 		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#BBA990" class="bi bi-heart" viewBox="0 0 16 16">
                     		<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
                 		</svg>
             		</button>
            		 <img src="${path}/resources/upload/product/\${product.FILERENAME}" class="product-img" alt="${product.FILEORIGINALNAME}">
            		</div>
                 <h5><a href="${path}/product/productdetail.do?productNo=\${product.PRODUCTNO}">\${product.PRODUCTDESCRIPTION}</a></h5>
                 <h4>\${Number(product.PRICE).toLocaleString()}원</h4>
             `;
             row.appendChild(cell); // 행에 열 추가
         });

        // 빈 열 추가 (5개 미만일 경우)
        const remainingCells = 5 - (data.likedProducts.length % 5);
		if (remainingCells > 0 && remainingCells < 5) { // 나머지가 0이 아니면서 5 미만일 경우에만 실행
		    for (let i = 0; i < remainingCells; i++) {
		        const emptyCell = document.createElement('td');
		        row.appendChild(emptyCell);
		    }
		}
         // 페이지바 렌더링
         pagination.innerHTML = data.pageBar;
  
        })
        .catch(error => console.error('Error loading product list:', error));
};

	// 페이지 로드 시 기본 데이터 호출
	document.addEventListener('DOMContentLoaded', () => {
		loadLikedProductList(memberNo);  
	}); 
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>