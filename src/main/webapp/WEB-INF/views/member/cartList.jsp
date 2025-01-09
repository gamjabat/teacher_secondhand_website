<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/style.css">
<%-- <link rel="stylesheet" href="${path}/resources/css/common/checkbox.css"> --%>
<link rel="stylesheet" href="${path}/resources/css/member/cartList.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">
<!-- 메인박스  -->
	 <div class="main-box">
        <div class="list-title">
        	<div class="list-logo d-flex justify-content-center align-items-center">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#BBA990" class="bi bi-cart4" viewBox="0 0 16 16">
				  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5M3.14 5l.5 2H5V5zM6 5v2h2V5zm3 0v2h2V5zm3 0v2h1.36l.5-2zm1.11 3H12v2h.61zM11 8H9v2h2zM8 8H6v2h2zM5 8H3.89l.5 2H5zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0m9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0"/>
				</svg>
		    </div>
		    <div>장바구니 리스트</div>
		    <button id="deleteSelectedProducts" class="d-btn">선택 삭제</button>
        </div>
        <table class="product-list">
            <tbody>
                <%-- <tr>
                    <td>
	                    <div>
	                    	<input type="checkbox" id="productCheckbox" class="checkbox" checked>
				        </div>
	                    <h5><a href="${path}/product/productdetail.do">교육용 사랑의매1</a></h5>
	                    <h4>30,000원</h4>
                    </td>
                </tr> --%>
            </tbody>
        </table>
        
        
        <!-- 페이지 바 디자인. -->
        <div class="pagination">
		    <button class="prev">&lt;</button>
					    <span class="page active"></span>
					    <span class="page"></span>
					    <span class="page"></span>
					    <span class="page"></span>
					    <span class="page"></span>
		    <button class="next">&gt;</button>
		</div>
    </div>	
</section>

<script>
const memberNo = '${loginMember.memberNo}';
const pagebar = {cPage : 1, numPerPage : 5};

const loadCartListProductList = (memberNo,cPage=1,numPerPage=5) => {
	

	    if (!memberNo) {
	        console.error("회원 정보가 없습니다.");
	        return; 
	    }
	    
	 fetch("${path}/member/cartproductlist.do?memberNo=" + memberNo+"&cPage="+cPage+"&numPerPage="+numPerPage)
	   .then(response => response.json())
	   .then(data => {
	       const tbody = document.querySelector('.product-list tbody');
	       const pagination = document.querySelector('.pagination');
			console.log(data);
	       // 기존 내용 초기화
	       tbody.innerHTML = '';
	       pagination.innerHTML = '';

  
        // 상품 리스트를 5개씩 한 줄에 렌더링
       let row;
       data.cartProducts.forEach((product, index) => {
           // 5개씩 한 줄에 렌더링하기 위해 row 생성
           if (index % 5 === 0) {
               row = document.createElement('tr'); // 새 행 생성
               tbody.appendChild(row);
           }
     	

           const cell = document.createElement('td'); // 열 생성
           cell.innerHTML = `
               <div class="product-img-container">
        	   	<input type="checkbox" id="productCheckbox" class="checkbox" value="\${product.PRODUCTNO}" checked>
          		 <img src="${path}/resources/upload/product/\${product.FILERENAME}" class="product-img" alt="\${product.FILEORIGINALNAME}">
          		</div>
               <h5><a href="${path}/product/productdetail.do?productNo=\${product.PRODUCTNO}">\${product.PRODUCTDESCRIPTION}</a></h5>
              <h4>\${Number(product.PRICE).toLocaleString()}원</h4>
           `;
           row.appendChild(cell); // 행에 열 추가
       });

       // 빈 열 추가 (5개 미만일 경우)
       const remainingCells = 5 - (data.length % 5);
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

//페이지 로드 시 기본 데이터 호출
document.addEventListener('DOMContentLoaded', () => {
	loadCartListProductList(memberNo);  
}); 
</script>


<script>
document.addEventListener("DOMContentLoaded", () => {
    document.getElementById("deleteSelectedProducts").addEventListener("click", () => {
        const checkboxes = document.querySelectorAll(".checkbox:checked"); // 체크된 박스만 선택
        const memberNo = '${loginMember.memberNo}';

        const deletePromises = [];

        console.log("memberNo:", memberNo);
        console.log("checkboxes:", checkboxes); // 체크된 체크박스 NodeList 출력
   

        if (checkboxes.length === 0) {
            alert("선택된 항목이 없습니다.");
            return;
        }

        checkboxes.forEach((checkbox) => {
            const productNo = checkbox.value; // value 속성에서 productNo 가져오기
            console.log("삭제 대상 productNo:", productNo);

            deletePromises.push(
                fetch("${path}/member/cartdelete.do?memberNo=" + memberNo + "&productNo=" + productNo)
                    .then((response) => response.text())
                    .then((data) => {
                        if (data === "success") {
                            console.log(`상품 ${productNo} 삭제 성공`);
                        } else {
                            console.log(`상품 ${productNo} 삭제 실패`);
                        }
                    })
                    .catch((error) => console.error("삭제 오류:", error))
            );
        });

        Promise.all(deletePromises).then(() => {
            alert("선택한 상품 삭제가 완료되었습니다.");
            location.reload(); // 페이지 새로고침
        });
    });
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>