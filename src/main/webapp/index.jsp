<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/style.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">


	<!-- 카테고리 박스 -->
	 <div class="ct-box">
		 <div class="checkbox-container">
		 	<div class="title">지역</div>
			    <label><input type="radio" name="region"/> 서울</label>
			    <label><input type="radio" name="region"/> 부산</label>
			    <label><input type="radio" name="region"/> 대구</label>
			    <label><input type="radio" name="region"/> 인천</label>
			    <label><input type="radio" name="region"/> 광주</label>
			    <label><input type="radio" name="region"/> 대전</label>
			    <label><input type="radio" name="region"/> 울산</label>
			    <label><input type="radio" name="region"/> 세종</label>
			    <label><input type="radio" name="region"/> 경기도</label>
			    <label><input type="radio" name="region"/> 충청북도</label>
			    <label><input type="radio" name="region"/> 충청남도</label>  
			    <label><input type="radio" name="region"/> 전라북도</label>  
			    <label><input type="radio" name="region"/> 전라남도</label>  
			    <label><input type="radio" name="region"/> 경상북도</label>  
			    <label><input type="radio" name="region"/> 경상남도</label>  
			    <label><input type="radio" name="region"/> 제주</label>  
			</div>
		 <div class="checkbox-container">
		 	<div class="title">카테고리</div>
			    <label><input type="radio" name="category"/> 책</label>
			    <label><input type="radio" name="category"/> 수업자료</label>
			    <label><input type="radio" name="category"/> 교구</label>
			    <label><input type="radio" name="category"/> 문구류</label>
			    <label><input type="radio" name="category"/> 운동</label> 
			    <label><input type="radio" name="category"/> 전자기기</label> 
			    <label><input type="radio" name="category"/> 생활용품</label> 
			    <label><input type="radio" name="category"/> 기타</label> 
			</div>
		 <div class="checkbox-container">
		 	<div class="title">거래방법</div>
			    <label><input type="radio" name="transaction"/> 직거래</label>
			    <label><input type="radio" name="transaction"/> 택배</label>
			</div>
		 <div class="checkbox-container">
		 	<div class="title">정렬기준</div>
			    <label><input type="radio" name="sorting"/> 오름차순</label>
			    <label><input type="radio" name="sorting"/> 내림차순</label>
			    <label><input type="radio" name="sorting"/> 인기순</label>
			    <label><input type="radio" name="sorting"/> 최신순</label>
			</div>
		  <div class="checkbox-container">
		 	<div class="title">금액</div>
			    <label><input type="radio" name="price"/> 5000원 이하</label>
			    <label><input type="radio" name="price"/> 10000원 이하</label>
			    <label><input type="radio" name="price"/> 20000원 이하</label>
			    <label><input type="radio" name="price"/> 30000원 이하</label>
			    <label><input type="radio" name="price"/> 그 외</label>
			    <label><input type="radio" name="price"/> 무료나눔</label>
			</div>
		  <div class="checkbox-container">
		 	<div class="title">거래상태</div>
			    <label><input type="radio" name="trade"/> 거래가능</label>
			    <label><input type="radio" name="trade"/> 거래중</label>
			    <label><input type="radio" name="trade"/> 거래완료</label> 
			</div>
		  <div class="checkbox-container">
		 	<div class="title">상품상태</div>
			    <label><input type="radio" name="status" /> A급</label>
			    <label><input type="radio" name="status"/> B급</label>
			    <label><input type="radio" name="status"/> C급</label>
			    <label><input type="radio" name="status"/> D급</label>
			    <label><input type="radio" name="status"/> F급</label>  
			</div>	
		   <div class="reset-btn-container">
		 	<button class="reset-btn"><p>RESET</p></button>	
		 	<button class="push-btn"><p>PUSH</p></button>				
	       </div>
	 </div>
	  
	 
	 <!-- 메인박스  -->
	 <div class="main-box">
        <!-- <h2>"서울" 지역 "책" 카테고리 검색 결과입니다.</h2> -->
        <table class="product-list">
            <tbody>
            <%-- ${products }
                <c:forEach var="product" items="${products}">
			      <tr>
			          <!-- 5개의 열 생성 -->
			          <c:forEach begin="1" end="5">
			              <td>
			                  <div>${product.id}</div>
			                  <h5><a href="${path}/product/productdetail.do?productNo=${product.productNo}">${product.productName}</a></h5>
			                  <h4>${product.price}원</h4>
			              </td>
			          </c:forEach>
			      </tr>
			  </c:forEach> --%>
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
    loadProductList(); // 기본 페이지는 1
});


</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>