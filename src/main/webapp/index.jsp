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
	<!--  <form class="ct-box" id="ct-box">
		 <div class="checkbox-container">
		 	<div class="title">지역</div>
			    <label for="seoul"><input type="radio" id="seoul" name="region" value="서울" /> 서울</label>
			    <label for="busan"><input type="radio" id="busan" name="region" value="부산" /> 부산</label>
			    <label for="daegu"><input type="radio" id="daegu" name="region" value="대구" /> 대구</label>
			    <label for="incheon"><input type="radio" id="incheon" name="region" value="인천" /> 인천</label>
			    <label for="gwangju"><input type="radio" id="gwangju" name="region" value="광주" /> 광주</label>
			    <label for="daejeon"><input type="radio" id="daejeon" name="region" value="대전" /> 대전</label>
			    <label for="ulsan"><input type="radio" id="ulsan" name="region" value="울산" /> 울산</label>
			    <label for="sejong"><input type="radio" id="sejong" name="region" value="세종특별자치시" /> 세종</label>
			    <label for="gyeonggi"><input type="radio" id="gyeonggi" name="region" value="경기" /> 경기도</label>
			    <label for="chungbuk"><input type="radio" id="chungbuk" name="region" value="충북" /> 충청북도</label>
			    <label for="chungnam"><input type="radio" id="chungnam" name="region" value="충남" /> 충청남도</label>
			    <label for="jeonbuk"><input type="radio" id="jeonbuk" name="region" value="전북" /> 전라북도</label>
			    <label for="jeonnam"><input type="radio" id="jeonnam" name="region" value="전남" /> 전라남도</label>
			    <label for="gyeongbuk"><input type="radio" id="gyeongbuk" name="region" value="경북" /> 경상북도</label>
			    <label for="gyeongnam"><input type="radio" id="gyeongnam" name="region" value="경남" /> 경상남도</label>
			    <label for="jeju"><input type="radio" id="jeju" name="region" value="제주특별자치도" /> 제주특별자치도</label>
			</div>
		 <div class="checkbox-container">
		 	<div class="title">카테고리</div>
			     <label for="book"><input type="radio" id="book" name="category" value="PCT-1" /> 책</label>
				 <label for="materials"><input type="radio" id="materials" name="category" value="PCT-2" /> 수업자료</label>
				 <label for="tools"><input type="radio" id="tools" name="category" value="PCT-3" /> 교구</label>
				 <label for="stationery"><input type="radio" id="stationery" name="category" value="PCT-4" /> 문구류</label>
				 <label for="sports"><input type="radio" id="sports" name="category" value="PCT-5" /> 운동</label>
				 <label for="electronics"><input type="radio" id="electronics" name="category" value="PCT-6" /> 전자기기</label>
				 <label for="household"><input type="radio" id="household" name="category" value="PCT-7" /> 생활용품</label>
				 <label for="others"><input type="radio" id="others" name="category" value="PCT-8" /> 기타</label>
			</div>
		 <div class="checkbox-container">
		 	<div class="title">거래방법</div>
			    <label for="direct"><input type="radio" id="direct" name="transaction" value="TMD-1" /> 직거래</label>
    			<label for="delivery"><input type="radio" id="delivery" name="transaction" value="TMD-2" /> 택배</label>
			</div>
		 <div class="checkbox-container">
		 	<div class="title">정렬기준</div>
			    <label for="sort-asc">
			        <input type="radio" id="sort-asc" name="sorting" value="asc" /> 오름차순
			    </label>
			    <label for="sort-desc">
			        <input type="radio" id="sort-desc" name="sorting" value="desc" /> 내림차순
			    </label>
			    <label for="sort-popularity">
			        <input type="radio" id="sort-popularity" name="sorting" value="popularity" /> 인기순
			    </label>
			    <label for="sort-recent">
			        <input type="radio" id="sort-recent" name="sorting" value="recent" /> 최신순
			    </label>
			</div>
		  <div class="checkbox-container">
		 	<div class="title">금액</div>
			    <label for="price-below-5000">
			        <input type="radio" id="price-below-5000" name="price" value="5000" /> 5000원 이하
			    </label>
			    <label for="price-below-10000">
			        <input type="radio" id="price-below-10000" name="price" value="10000" /> 10000원 이하
			    </label>
			    <label for="price-below-20000">
			        <input type="radio" id="price-below-20000" name="price" value="20000" /> 20000원 이하
			    </label>
			    <label for="price-below-30000">
			        <input type="radio" id="price-below-30000" name="price" value="30000" /> 30000원 이하
			    </label>
			    <label for="price-above-30000">
			        <input type="radio" id="price-above-30000" name="price" value="others" /> 그 외
			    </label>
			    <label for="price-free">
			        <input type="radio" id="price-free" name="price" value="free" /> 무료나눔
			    </label>
			</div>
		  <div class="checkbox-container">
		 	<div class="title">거래상태</div>
			    <label for="trade-available">
			        <input type="radio" id="trade-available" name="trade" value="TST-1" /> 거래가능
			    </label>
			    <label for="trade-in-progress">
			        <input type="radio" id="trade-in-progress" name="trade" value="TST-2" /> 거래중
			    </label>
			    <label for="trade-complete">
			        <input type="radio" id="trade-complete" name="trade" value="TST-3" /> 거래완료
			    </label>
			</div>
		   <div class="reset-btn-container">
		 	<button class="reset-btn" type="button"><p>RESET</p></button>	
		 	<button id="push-btn" class="push-btn" type="submit"><p>PUSH</p></button>				
	       </div>
	 </form> -->
	  
	 
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