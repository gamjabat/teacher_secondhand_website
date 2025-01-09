<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/style.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">
	 <!-- 메인박스  -->
	 <div class="main-box">
        <table class="product-list">
            <tbody>
            </tbody>
        </table>
        <!-- 페이지 바 -->
        <div class="pagination"></div>
    </div>	
    
</section>    

<script>
	//RESET 버튼을 누르면 라디오 체크가 다 해제 되는 스크립트
	document.querySelector('.reset-btn').addEventListener('click', function () {
	    const radioButtons = document.querySelectorAll('.ct-box input[type="radio"]');
	    radioButtons.forEach(radio => {
	        radio.checked = false;
	    }); 
	});

	const loadProductList = (cPage, numPerPage) => {
	    fetch(`${path}/products.do?cPage=\${cPage}&numPerPage=\${numPerPage}`)
	        .then(response => response.json())
	        .then(data => {
	            const tbody = document.querySelector('.product-list tbody');
	            const pagination = document.querySelector('.pagination');
	
	            // 기존 내용 초기화
	            tbody.innerHTML = '';
	            pagination.innerHTML = '';
	
	            // 상품 리스트를 5개씩 한 줄에 렌더링
	            let row;
	            data.products.forEach((product, index) => {
	                if (index % 5 === 0) {
	                    row = document.createElement('tr'); // 새 행 생성
	                    tbody.appendChild(row);
	                }
	
	                const cell = document.createElement('td'); // 열 생성
	                cell.innerHTML = `
	                    <div class="product-img-container"><img src="${path}/resources/upload/product/\${product.FILE_RENAME}" class="product-img" alt="${product.FILE_ORIGINAL_NAME}"></div>
	                    <h5><a href="${path}/product/productdetail.do?productNo=\${product.PRODUCT_NO}">\${product.PRODUCT_NAME}</a></h5>
	                    <h4>\${Number(product.PRICE).toLocaleString()}원</h4>
	                `;
	                row.appendChild(cell); // 행에 열 추가
	            });
	
	            // 빈 열 추가 (5개 미만일 경우)
	            const remainingCells = 5 - (data.products.length % 5);
	            if (remainingCells < 5) {
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
	    loadProductList();
	});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>