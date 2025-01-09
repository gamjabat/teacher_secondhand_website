<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/common/mypage.css">
<link rel="stylesheet" href="${path}/resources/css/member/mypageInfoUpdate.css">
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
	<div class="mypageinfo-content">
	   <h2>나의 정보 수정</h2>
		<form class="memberinfo-container" method="post" action="${path }/member/mypageinfoupdateend.do">
			<div class="member-idbox">
				<label class="member-id">아이디</label>
				<div class="member-id" id="id">${memberInfo.memberId }</div>
			</div>
			
			<div class="member-namebox">
				<label class="member-name">이름</label>
				<div class="member-name">${memberInfo.memberName}</div>
			</div>
			
			<div class="member-pwbox">
				<label class="member-pw">비밀번호</label>
				<input type="hidden" name="password">
				<button type="button" class="member-info-btn member-pw-btn">변경</button>
			</div>
			
			<div class="member-emailbox">
				<label class="member-email">이메일</label>
				<div class="member-email">${memberInfo.email }</div>
			</div>
			
			<div class="member-phonebox">
				<label class="member-phone">전화번호</label>
				<input type="hidden" name="phone">
				<div class="member-phone" id="phone">${memberInfo.phone }</div>
				<button type="button" class="member-info-btn member-phone-btn">변경</button>
			</div>
			
			<div class="member-addressbox">
			    <label class="member-address">주소</label>
			    <input type="hidden" name="address" id="hiddenAddress">
			    <div class="member-address" id="address">
			        ${memberInfo.address != null ? memberInfo.address : ''}
			    </div>
			    <button type="button" class="member-info-btn member-address-btn">변경</button>
			</div>
			
			<div class="input-group my-2" style="display: none;" id="daumAddressBox">
			    <div class="box12">
			        <input type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호">
			        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
			    </div>
			    <div class="box345">
			        <input type="text" id="sample6_address" name="sample6_address" placeholder="주소">
			        <input type="text" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소">
			        <input type="text" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목">
			    </div>
			    <button type="button" class="complete-btn" id="completeAddressBtn">입력 완료</button>
			</div>
						
			<div class="member-btdaybox">
				<label class="member-btday">생일</label>
				<div class="member-btday">${memberInfo.birthday }</div>
			</div>
			<button type="submit" class="member-end-btn">회원 정보 수정</button>
		</form>
	</div>
</div>
</section>


<script>
//phone 변경 버튼 로직
const phoneChangeButton = document.querySelector('.member-phone-btn');
const memberPhoneBox = document.querySelector('.member-phonebox'); // member-idbox 선택
const memberPhoneValue = document.querySelector('#phone'); // 현재 아이디 표시 영역
let phoneDynamicContainer = null; // 동적 컨테이너 변수

phoneChangeButton.addEventListener('click', () => {
    // 이미 생성된 경우 제거(토글 기능)
    if (phoneDynamicContainer) {
    	phoneDynamicContainer.remove(); // 동적 요소 제거
    	phoneDynamicContainer = null; // 컨테이너 상태 초기화
        phoneChangeButton.style.backgroundColor = "#A95151"; // 원래 색상
        phoneChangeButton.style.color = "#fff"; // 원래 글자 색상
        phoneChangeButton.textContent = "변경"; // 버튼 텍스트 복원
        phoneChangeButton.style.border = "1px solid #A95151";
        
        return;
    }

    // div 생성
    phoneDynamicContainer = document.createElement('div');
    phoneDynamicContainer.className = 'change-phonebox change-box';

    // 라벨 생성
    const phoneLabel = document.createElement('label');
    phoneLabel.className = 'change-label';
    phoneLabel.textContent = '새로운 전화번호 :';

    // 인풋 생성
    const phoneInput = document.createElement('input');
    phoneInput.type = 'text';
    phoneInput.className = 'change-input';
    phoneInput.placeholder = '전화번호를 입력하세요';

    // 완료 버튼 생성
    const phoneCompleteButton = document.createElement('button');
    phoneCompleteButton.className = 'complete-btn';
    phoneCompleteButton.textContent = '입력 완료';

    // 완료 버튼 클릭 이벤트
    phoneCompleteButton.addEventListener('click', () => {
        if (!phoneInput.value.trim()) {
            alert('전화번호를 입력하세요.');
            return;
        }
        
     	// 전화번호 형식 검사: 11자리, 010으로 시작해야 함
        if (phoneInput.value.length !== 11 || !phoneInput.value.startsWith('010')) {
            alert('전화번호는 010으로 시작하는 11자리 숫자여야 합니다.');
            return;
        }
        
        memberPhoneValue.textContent = phoneInput.value;
        document.querySelector('input[name="phone"]').value = phoneInput.value;
        

        // 동적 요소 제거
        phoneDynamicContainer.remove();
        phoneDynamicContainer = null;

        // 버튼 상태 복원
        phoneChangeButton.style.backgroundColor = "#A95151"; // 원래 색상
        phoneChangeButton.style.color = "#fff"; // 원래 글자 색상
        phoneChangeButton.textContent = "변경"; // 버튼 텍스트 복원
        phoneChangeButton.style.border = "1px solid #A95151";
    });

    // div에 요소 추가
    phoneDynamicContainer.appendChild(phoneLabel);
    phoneDynamicContainer.appendChild(phoneInput);
    phoneDynamicContainer.appendChild(phoneCompleteButton);

    // member-idbox 아래에 동적 div 추가
    memberPhoneBox.insertAdjacentElement('afterend', phoneDynamicContainer);

    // 버튼 스타일 변경
    phoneChangeButton.style.backgroundColor = "#fff"; // 하얀 바탕
    phoneChangeButton.style.color = "red"; // 빨간 글씨
    phoneChangeButton.style.border = "1px solid red"; // 빨간 테두리
    phoneChangeButton.textContent = "취소"; // 버튼 텍스트 변경
});


//Pwd 변경 버튼 로직
const pwChangeButton = document.querySelector('.member-pw-btn');
const memberPwBox = document.querySelector('.member-pwbox'); // member-pwbox 선택
let pwDynamicContainer = null; // 동적 컨테이너 변수

pwChangeButton.addEventListener('click', () => {
    // 이미 생성된 경우 제거(토글 기능)
    if (pwDynamicContainer) {
        pwDynamicContainer.remove(); // 동적 요소 제거
        pwDynamicContainer = null; // 컨테이너 상태 초기화
        pwChangeButton.style.backgroundColor = "#A95151"; // 원래 색상
        pwChangeButton.style.color = "#fff"; // 원래 글자 색상
        pwChangeButton.textContent = "변경"; // 버튼 텍스트 복원
        pwChangeButton.style.border = "1px solid #A95151";
        return;
    }

    // div 생성
    pwDynamicContainer = document.createElement('div');
    pwDynamicContainer.className = 'change-pwbox';

    // 첫 번째 라벨과 인풋 생성
    const pwInputContainer1 = document.createElement('div');
    pwInputContainer1.className = 'pw-input-container change-box';
    const pwLabel1 = document.createElement('label');
    pwLabel1.className = 'change-label';
    pwLabel1.textContent = '새로운 비밀번호 :';

    const pwInput1 = document.createElement('input');
    pwInput1.type = 'password';
    pwInput1.className = 'change-input';
    pwInput1.placeholder = '비밀번호 입력';

    // 유효성 검사 메시지
    const pwValidationMessage = document.createElement('div');
    pwValidationMessage.className = 'validation-message error-msg';
    pwValidationMessage.style.color = 'red'; // 초기 상태는 경고 메시지

    // 두 번째 라벨과 인풋 생성
    const pwInputContainer2 = document.createElement('div');
    pwInputContainer2.className = 'pw-input-container change-box';
    const pwLabel2 = document.createElement('label');
    pwLabel2.className = 'change-label';
    pwLabel2.textContent = '새로운 비밀번호 확인 :';

    const pwInput2 = document.createElement('input');
    pwInput2.type = 'password';
    pwInput2.className = 'change-input';
    pwInput2.placeholder = '비밀번호 확인';

    // 비밀번호 일치 메시지
    const pwMatchMessage = document.createElement('div');
    pwMatchMessage.className = 'match-message error-msg';

    // 완료 버튼 생성
    const pwCompleteButton = document.createElement('button');
    pwCompleteButton.className = 'complete-btn';
    pwCompleteButton.type = 'button';
    pwCompleteButton.textContent = '입력 완료';

    // 유효성 검사 함수
    function validatePassword(password) {
        const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
        return regex.test(password);
    }

    // 비밀번호 입력 실시간 검사
    pwInput1.addEventListener('input', () => {
        if (validatePassword(pwInput1.value)) {
            pwValidationMessage.textContent = '비밀번호가 유효합니다.';
            pwValidationMessage.style.color = 'green';
        } else {
            pwValidationMessage.textContent =
                '비밀번호는 8자리 이상, 대소문자, 숫자, 특수문자(!@#$%^&*)를 각각 포함해야 합니다.';
            pwValidationMessage.style.color = 'red';
        }
    });

    // 비밀번호 일치 실시간 검사
    pwInput2.addEventListener('input', () => {
        if (pwInput1.value === pwInput2.value) {
            pwMatchMessage.textContent = '비밀번호가 일치합니다.';
            pwMatchMessage.style.color = 'green';
        } else {
            pwMatchMessage.textContent = '비밀번호가 일치하지 않습니다.';
            pwMatchMessage.style.color = 'red';
        }
    });

    // 완료 버튼 클릭 이벤트
    pwCompleteButton.addEventListener('click', () => {
        if (!validatePassword(pwInput1.value)) {
            alert('유효한 비밀번호를 입력하세요.');
            return;
        }
        if (pwInput1.value !== pwInput2.value) {
            alert('비밀번호가 일치하지 않습니다.');
            return;
        }

     // 기존에 존재하던 #password 요소 제거 (중복 방지)
        const existingPasswordDiv = document.querySelector('.member-pw#password');
        if (existingPasswordDiv) {
            existingPasswordDiv.remove();
        }

        // 비밀번호가 변경되었을 때만 새로운 div 추가
        const passwordDiv = document.createElement('div');
        passwordDiv.className = 'member-pw';
        passwordDiv.id = 'password';
        passwordDiv.textContent = '비밀번호가 성공적으로 변경되었습니다.';
        document.querySelector('input[name="password"]').value = pwInput1.value;

        // pwBox 내부에 추가
        pwChangeButton.insertAdjacentElement('beforebegin', passwordDiv);

        // 동적 요소 제거
        pwDynamicContainer.remove();
        pwDynamicContainer = null;

        // 버튼 상태 복원
        pwChangeButton.style.backgroundColor = "#A95151"; // 원래 색상
        pwChangeButton.style.color = "#fff"; // 원래 글자 색상
        pwChangeButton.textContent = "변경"; // 버튼 텍스트 복원
        pwChangeButton.style.border = "1px solid #A95151";
    });

    // div에 요소 추가
    pwInputContainer1.appendChild(pwLabel1);
    pwInputContainer1.appendChild(pwInput1);
    pwDynamicContainer.appendChild(pwInputContainer1);
    pwDynamicContainer.appendChild(pwValidationMessage); // 유효성 검사 메시지 추가 (컨테이너 다음)

    pwInputContainer2.appendChild(pwLabel2);
    pwInputContainer2.appendChild(pwInput2);
    pwInputContainer2.appendChild(pwCompleteButton); // 완료 버튼은 맨 아래
    pwDynamicContainer.appendChild(pwInputContainer2);
    pwDynamicContainer.appendChild(pwMatchMessage); // 비밀번호 일치 메시지 추가 (컨테이너 다음)

    // member-pwbox 아래에 동적 div 추가
    memberPwBox.insertAdjacentElement('afterend', pwDynamicContainer);

    // 버튼 스타일 변경
    pwChangeButton.style.backgroundColor = "#fff"; // 하얀 바탕
    pwChangeButton.style.color = "red"; // 빨간 글씨
    pwChangeButton.style.border = "1px solid red"; // 빨간 테두리
    pwChangeButton.textContent = "취소"; // 버튼 텍스트 변경
});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
document.addEventListener("DOMContentLoaded", () => {
    const addressChangeButton = document.querySelector('.member-address-btn');
    const daumAddressBox = document.getElementById('daumAddressBox');
    const addressDisplay = document.getElementById('address');
    const hiddenAddressInput = document.getElementById('hiddenAddress');
    let isDaumAddressActive = false;

    // "변경" 버튼 클릭 이벤트
    addressChangeButton.addEventListener('click', () => {
        if (isDaumAddressActive) {
            daumAddressBox.style.display = 'none';
            addressChangeButton.textContent = "변경";
            addressChangeButton.style.backgroundColor = "#A95151";
            addressChangeButton.style.color = "#fff";
            addressChangeButton.style.border = "1px solid #A95151";
            isDaumAddressActive = false;
        } else {
            daumAddressBox.style.display = 'block';
            addressChangeButton.textContent = "취소";
            addressChangeButton.style.backgroundColor = "#fff";
            addressChangeButton.style.color = "red";
            addressChangeButton.style.border = "1px solid #ff6f61";
            isDaumAddressActive = true;
        }
    });

    // "입력 완료" 버튼 클릭 이벤트
    document.getElementById('completeAddressBtn').addEventListener('click', () => {
        const postcode = document.getElementById('sample6_postcode').value.trim();
        const address = document.getElementById('sample6_address').value.trim();
        const detailAddress = document.getElementById('sample6_detailAddress').value.trim();
        const extraAddress = document.getElementById('sample6_extraAddress').value.trim();

        // 입력된 값 디버깅 출력
        console.log("우편번호:", postcode);
        console.log("주소:", address);
        console.log("상세주소:", detailAddress);
        console.log("참고항목:", extraAddress);

        // 주소를 조합
        let fullAddress = "";

        if (postcode) {
            fullAddress += postcode + " ";
        }
        if (address) {
            fullAddress += address;
        }
        if (detailAddress) {
            fullAddress += " " + detailAddress;
        }
        if (extraAddress) {
            fullAddress += " " + extraAddress;
        }

        // 최종 주소 확인
        console.log("최종 주소:", fullAddress);

        if (fullAddress.trim() === "") {
            console.error("Full address is empty. Check the input values.");
            alert("주소를 정확히 입력해주세요.");
            return;
        }

        // 주소를 화면과 hidden input에 반영
        addressDisplay.textContent = fullAddress; // 화면에 표시
        if (hiddenAddressInput) {
            hiddenAddressInput.value = fullAddress; // 히든 필드에 저장
        } else {
            console.error("Hidden address input element not found.");
        }

        // 다음 주소 검색 박스 숨김
        daumAddressBox.style.display = 'none';
        addressChangeButton.textContent = "변경";
        addressChangeButton.style.backgroundColor = "#A95151";
        addressChangeButton.style.color = "#fff";
        addressChangeButton.style.border = "1px solid #A95151";
        isDaumAddressActive = false;
    });
});

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수

            // 도로명 주소와 지번 주소 선택
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            // 참고항목 조합
            if (data.userSelectedType === 'R') {
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("sample6_extraAddress").value = extraAddr;
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 설정
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
 
 <script>

// 헤더 없애기
document.addEventListener('DOMContentLoaded', () => {
	
	 document.querySelector(".ct-box").style.display = "none";
	 document.querySelector(".search-input").style.display = "none";
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>