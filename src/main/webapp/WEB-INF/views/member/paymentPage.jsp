<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/member/paymentPage.css">
<link rel="stylesheet" href="${path}/resources/css/common/checkbox.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">
<!-- 메인박스  -->
	 <div class="main-box">
        <div class="list-title">
        	<div class="list-logo d-flex justify-content-center align-items-center">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#BBA990" class="bi bi-credit-card" viewBox="0 0 16 16">
				  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1z"/>
				  <path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"/>
				</svg>
		    </div>
		    <div>주문 확인 및 결제</div>
        </div>
        <div class="d-flex flex-row gap-4">
	        <div class="right-box d-flex">
	        	<div class="product-list">
	        		<div class="sub-title">상품 정보</div>
	        		${memeber }
	        		<div class="product-items">
	        		<div class="product-item" data-price="${product.price}" data-name="${product.productName}">
	        			<div>
	                    	<input type="checkbox" id="productCheckbox" class="product-checkbox checkbox" checked>
				        </div>
				        <img src="${path}/resources/upload/product/${img.fileRename}" class="d-block" alt="${img.fileOriginalName}">
				        <div class="product-info">
				        	<div>${product.productName }</div>
				        	<div><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/>원</div>
				        </div>
	        		</div>
	        		</div>
	        		
	        	</div>
	        </div>
	        
	        <form class="left-box">
	        	<div class="shipping-info">
    <div class="sub-title">배송 정보</div>
    
    <!-- 배송지명 -->
    <div class="mb-3 d-flex align-items-center gap-2">
        <label for="shipping-name" class="form-label" style="width: 120px;">배송지명</label>
        <input type="text" id="shipping-name" class="form-control" placeholder="배송지명">
    </div>
    
    <!-- 수령인 -->
    <div class="mb-3 d-flex align-items-center gap-2">
        <label for="member-name" class="form-label" style="width: 120px;">수령인<span class="required">*</span></label>
        <input type="text" id="member-name" class="form-control" placeholder="수령인" value="${member.memberName }">
    </div>
    
    <!-- 배송지 -->
    <div class="mb-3 d-flex align-items-center gap-2">
            <label class="form-label" style="width: 120px;">배송지<span class="required">*</span></label>
            <div class="w-100">
            <div class="d-flex flex-row gap-2">
            
            <input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호">
            <button type="button" onclick="sample6_execDaumPostcode()" class="btn btn-secondary custom-btn">우편번호 찾기</button>
        
            </div>
        <input type="text" id="sample6_address" class="form-control mt-2" placeholder="주소">
        <input type="text" id="sample6_detailAddress" class="form-control mt-2" placeholder="상세주소">
        <input type="text" id="sample6_extraAddress" class="form-control mt-2" placeholder="참고항목">
            
            </div>
    </div>
    
    <!-- 연락처 -->
    <div class="mb-3 d-flex align-items-center gap-2">
        <label for="phone" class="form-label" style="width: 120px;">연락처<span class="required">*</span></label>
        <input type="text" id="phone" class="form-control" placeholder="연락처" value="${member.phone }">
    </div>
    
    <!-- 배송 요청사항 -->
    <div class="mb-3 d-flex align-items-center gap-2">
        <label for="deliveryRequest" class="form-label" style="width: 120px;">배송 요청사항</label>
        <select id="deliveryRequest" class="form-select">
            <option value="">배송 시 요청사항을 선택해 주세요</option>
            <option value="부재시 문 앞에 놓아주세요.">부재시 문 앞에 놓아주세요.</option>
            <option value="배송 전에 연락 주세요.">배송 전에 연락 주세요.</option>
            <option value="부재시 경비실에 맡겨 주세요.">부재시 경비실에 맡겨 주세요.</option>
            <option value="택배함에 넣어주세요.">택배함에 넣어주세요.</option>
        </select>
    </div>
</div>
				
				<div class="payment-info">
					<div class="sub-title d-flex flex-row justify-content-between">
						<div>결제 금액</div>
						<div class="price">30000000원</div>
					</div>
					<div class="d-flex align-items-center gap-5">
						<div>총 상품 금액</div>
						<div class="product-price">30000000원</div>
					</div>
					<div class="d-flex align-items-center gap-5">
						<div>배송비</div>
						<div class="delivery-Fee">3,000원</div>
					</div>
					<div class="d-flex align-items-center gap-5">
						<div>총 결제 금액</div>
						<div class="total-price">30003000원</div>
					</div>
				</div>
				
				<div class="agreement-section mt-4">
				    <div class="form-check">
				        <input class="form-check-input" type="checkbox" id="checkAll">
				        <label class="form-check-label" for="checkAll">
				            주문 내용을 확인했으며, 아래 내용에 모두 동의합니다.
				        </label>
				    </div>
				    <div class="form-check">
				        <input class="form-check-input" type="checkbox" id="agree1" class="agreement-checkbox">
				        <label class="form-check-label" for="agree1">
				            (필수) 개인정보 수집/이용 동의
				        </label>
				    </div>
				    <div class="form-check">
				        <input class="form-check-input" type="checkbox" id="agree2" class="agreement-checkbox">
				        <label class="form-check-label" for="agree2">
				            (필수) 개인정보 제3자 제공 동의
				        </label>
				    </div>
				    <div class="form-check">
				        <input class="form-check-input" type="checkbox" id="agree3" class="agreement-checkbox">
				        <label class="form-check-label" for="agree3">
				            (필수) 결제대행 서비스 이용약관
				        </label>
				    </div>
				</div>
				
				<div class="d-flex justify-content-center">
					<button class="payment-btn"type="button" onclick="processPayment()">30000000원 결제하기</button>
				</div>

	        
	        </form>
        </div>
        
    </div>	
</section>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

	 document.addEventListener('DOMContentLoaded', () => {
			 document.querySelector(".ct-box").style.display = "none";
			 document.querySelector(".search-input").style.display = "none";
		    const checkboxes = document.querySelectorAll('.product-checkbox');
		    const agreementCheckboxes = document.querySelectorAll('.agreement-section .form-check-input');
		    const paymentButton = document.querySelector('.payment-btn');
	
		    // 선택된 상품의 총 금액 계산
		    function calculateTotal() {
		        let totalAmount = 0;
		        let checkedCount = 0;
	
		        checkboxes.forEach((checkbox) => {
		            if (checkbox.checked) {
		                const productItem = checkbox.closest('.product-item');
		                const price = parseInt(productItem.getAttribute('data-price'), 10);
		                totalAmount += price;
		                checkedCount++;
		            }
		        });
	
		        const deliveryFee = checkedCount > 0 ? 3000 : 0;
	
		        document.querySelector('.product-price').textContent = totalAmount.toLocaleString() + '원';
		        document.querySelector('.price').textContent = (totalAmount + deliveryFee).toLocaleString() + '원';
		        document.querySelector('.delivery-Fee').textContent = deliveryFee.toLocaleString() + '원';
		        document.querySelector('.total-price').textContent = (totalAmount + deliveryFee).toLocaleString() + '원';
		        document.querySelector('.payment-btn').textContent = (totalAmount + deliveryFee).toLocaleString() + '원 결제하기';
		    }
	
		    // 필수 값 확인
		    function validateForm() {
		        const memberName = document.getElementById('member-name').value.trim();
		        const phone = document.getElementById('phone').value.trim();
		        const checkedProducts = Array.from(checkboxes).some(checkbox => checkbox.checked);
	
		        const allAgreementsChecked = Array.from(agreementCheckboxes).every(checkbox => checkbox.checked);
	
		        if (!memberName) {
		            alert('수령인을 입력해주세요.');
		            return false;
		        }
	
		        if (!phone) {
		            alert('연락처를 입력해주세요.');
		            return false;
		        }
	
		        if (!checkedProducts) {
		            alert('결제할 상품을 선택해주세요.');
		            return false;
		        }
	
		        if (!allAgreementsChecked) {
		            alert('모든 약관에 동의해주세요.');
		            return false;
		        }
	
		        return true;
		    }
	
		    // 결제 버튼 클릭 이벤트
		    paymentButton.addEventListener('click', (event) => {
		        if (!validateForm()) {
		            event.preventDefault(); // 폼 제출 방지
		        }
		    });
	
		    // 체크박스 변경 시 총 금액 재계산
		    checkboxes.forEach((checkbox) => {
		        checkbox.addEventListener('change', calculateTotal);
		    });
	
		    // 약관 체크박스 동기화
		    agreementCheckboxes.forEach((checkbox) => {
		        checkbox.addEventListener('change', () => {
		            const allChecked = Array.from(agreementCheckboxes).every(cb => cb.checked);
		            document.getElementById('checkAll').checked = allChecked;
		        });
		    });
	
		    // "모두 동의" 체크박스 동작
		    document.getElementById('checkAll').addEventListener('click', (event) => {
		        const isChecked = event.target.checked;
		        agreementCheckboxes.forEach((checkbox) => {
		            checkbox.checked = isChecked;
		        });
		    });
	
		    // 초기 계산
		    calculateTotal();
		});

	 	// 결제 API
</script>
<script>
const processPayment = () => {
    // Step 1: 결제 초기화 요청
    $.post(
        "${path}/payment.do",
        {
            action: "init" // 초기화 요청
        },
        (data) => {
            if (data.success) {
                // Step 2: 결제 요청
                console.log("결제번호:",data.paymentNo);
                IMP.init("imp02225488");
                IMP.request_pay(
                    {
                        channelKey: "channel-key-9880c4ca-1f39-4e8e-9b44-c4222f6967aa",
                        pay_method: "card",
                        merchant_uid: data.paymentNo, // 서버에서 생성된 주문번호
                        name: "${product.productName}",
                        amount: 100, // 결제 금액
                        buyer_name: document.getElementById("member-name").value.trim(),
                        buyer_tel: document.getElementById("phone").value.trim(),
                        buyer_addr: "",
                    },
                    async (response) => {
                    	response.success = response.imp_uid ? true : false;
                        if (response.error_code != null) {
                            console.error(response.error_code);
                            return alert("결제에 실패하였습니다. 에러 내용: " + response.error_msg);
                        }

                        if (response.success) {
                            // Step 3: 결제 완료 요청
                            $.post(
                                "${path}/payment.do",
                                {
                                    action: "complete", // 완료 요청
                                    imp_uid: response.imp_uid, // 포트원 아이디
                                    merchant_uid: response.merchant_uid, // 주문번호
                                    amount: 100, // 실제 결제 금액
                                    productNo: "${product.productNo}", // 상품 번호
                                    paymentNo: response.merchant_uid,
                                    receipt_url: "",
                                    memberNo: "${loginMember.memberNo}"
                                },
                                (result) => {
                                    if (result.success) {
                                        alert("결제가 완료되었습니다!");
                                        location.assign("${path}/payment/paymentdetail.do?paymentNo="+result.paymentNo); // 성공 페이지로 이동
                                    } else {
                                        alert("결제 검증 실패: " + result.message);
                                    }
                                }
                            );
                        } else {
                            alert("결제가 진행되지 않았습니다!");
                        }
                    }
                );
            } else {
                alert("결제 초기화에 실패했습니다.");
            }
        }
    );
    
};
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
