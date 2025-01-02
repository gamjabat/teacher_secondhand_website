<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/login/signUp.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.min.js"></script>

<section class="main-container">
<div class="main-box">
<div class="container d-flex flex-column align-items-center justify-content-center">
        <div class="signup-container">
    <div class="signup-title">회원가입</div>
    <form id="signup-form" method="post" action="${path}/login/signupend.do">
      <div class="form-group">
        <div class="input-label">
        	<label for="name">이름</label>
        	<span style="color: red;">*</span>
        </div>
        <div class="input-group">
        	<input type="text" id="name" name="name" placeholder="이름 입력">
        </div>
      </div>

      <div class="form-group">
      	<div class="input-label">
        	<label for="id">아이디</label>
        	<span style="color: red;">*</span>
        </div>
        <div class="input-group d-flex flex-column ">
        	<div class="input-group id-group d-flex flex-row w-100" style="gap: 10px;">
        		<input type="text" id="id" name="id" placeholder="아이디 입력" class="form-control">
        		<button type="button" id="check-id-btn" class="btn btn-secondary" onclick="checkId();">중복 확인</button>
        	</div>
        	<small class="error"></small>
        </div>
      </div>
      
      <div class="form-group">
        <div class="input-label">
        	<label for="nickname">닉네임</label>
        </div>
        <div class="input-group">
        	<input type="text" id="nickname" name="nickname" placeholder="닉네임 입력 (선택 사항)">
        </div>
      </div>
      
      <div class="form-group">
      	<div class="input-label">
        	<label for="password">비밀번호</label>
        	<span style="color: red;">*</span>
        </div>
        <div class="input-group d-flex flex-column">
        	<input type="password" id="password" name="password" placeholder="비밀번호 입력">
        	<small class="error"></small>
        </div>
      </div>

      <div class="form-group">
      	<div class="input-label">
        	<label for="confirm-password">비밀번호 확인</label>
        	<span style="color: red;">*</span>
        </div>
        <div class="input-group d-flex flex-column">
        	<input type="password" id="confirm-password" placeholder="비밀번호 확인 입력">
        	<small class="error"></small>
        </div>
      </div>

      <div class="form-group">
      	<div class="input-label">
        	<label for="email">이메일</label>
        	<span style="color: red;">*</span>
        </div>
        <div class="input-group">
          <input type="email" id="email" name="email" placeholder="이메일 입력">
        </div>
      </div>
      
      <div class="form-group">
        <div class="input-label">
            <label for="birth">생년월일</label>
            <span style="color: red;">*</span>
        </div>
        <div class="input-group my-2" style="display: flex; gap: 10px;">
            <select id="birth-year" name="birth-year" class="form-select">
                <option value="">년도</option>
            </select>
            <select id="birth-month" name="birth-month" class="form-select">
                <option value="">월</option>
            </select>
            <select id="birth-day" name="birth-day" class="form-select">
                <option value="">일</option>
            </select>
        </div>
      </div>

      <div class="form-group">
      	<div class="input-label">
        	<label for="phone">전화번호</label>
        	<span style="color: red;">*</span>
        </div>
        <div class="input-group d-flex flex-column">
        	<input type="text" id="phone" name="phone" placeholder="휴대폰 번호 입력 (예: 01012345678)">
        	<small class="error"></small>
        </div>
      </div>

      <div class="form-group">
        <div class="input-label">
            <label for="address">주소</label>
            <span style="color: red;">*</span>
        </div>
        	<div class="input-group my-2" style="display: flex; gap: 10px;">
	         		<div class="box12">	
		         		<input type="text" id="sample6_postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					</div>
	         		<div class="box345">
		          		<input type="text" id="sample6_address" placeholder="주소">
						<input type="text" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목">
					</div>
        </div>
      </div>

      <button type="submit" class="signup-btn my-3">회원 가입</button>
    </form>
  </div>
</div>
</div>
</section>

<script>
	$(document).ready(function () {
	    // 생년월일 초기화
	    const currentYear = new Date().getFullYear();
	    const $birthYear = $('#birth-year');
	    const $birthMonth = $('#birth-month');
	    const $birthDay = $('#birth-day');
	
	    // 년도 추가 (1900년부터 현재년도까지)
	    for (let year = currentYear; year >= 1900; year--) {
	        $birthYear.append('<option value="' + year + '">' + year + '년</option>');
	    }
	
	    // 월 추가 (1월부터 12월)
	    for (let month = 1; month <= 12; month++) {
	        $birthMonth.append('<option value="' + month + '">' + month + '월</option>');
	    }
	
	    // 일 추가 (월 선택에 따라 동적으로 변경)
	    $birthMonth.change(function () {
	        const selectedYear = parseInt($birthYear.val(), 10);
	        const selectedMonth = parseInt($birthMonth.val(), 10);
	
	        if (isNaN(selectedYear) || isNaN(selectedMonth)) {
	            $birthDay.empty().append('<option value="">일</option>');
	            return;
	        }
	
	        const daysInMonth = new Date(selectedYear, selectedMonth, 0).getDate();
	        $birthDay.empty().append('<option value="">일</option>');
	
	        for (let day = 1; day <= daysInMonth; day++) {
	            $birthDay.append('<option value="' + day + '">' + day + '일</option>');
	        }
	    });
	
	    // 년도 변경 시에도 일수 갱신
	    $birthYear.change(function () {
	        $birthMonth.trigger('change');
	    });
	});

	$(document).ready(function () {
	    var area0 = ["서울특별시", "인천광역시", "대전광역시", "광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도"];
	    var area1 = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
	    var area2 = ["계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"];
	    var area3 = ["대덕구", "동구", "서구", "유성구", "중구"];
	    var area4 = ["광산구", "남구", "동구", "북구", "서구"];
	    var area5 = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
	    var area6 = ["남구", "동구", "북구", "중구", "울주군"];
	    var area7 = ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군"];
	    var area8 = ["고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군"];
	    var area9 = ["강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군"];
	    var area10 = ["제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군"];
	    var area11 = ["계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군"];
	    var area12 = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
	    var area13 = ["광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
	    var area14 = ["경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군"];
	    var area15 = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
	    var area16 = ["서귀포시", "제주시", "남제주군", "북제주군"];
	
	 	// 시/도 선택 박스 초기화
	    $("select[name=sido]").each(function () {
	        var $selsido = $(this);
	        $.each(area0, function (index, value) {
	            $selsido.append("<option value='" + value + "'>" + value + "</option>");
	        });
	    });
	
	    // 시/도 선택시 구/군 설정
	    $("select[name^=sido]").change(function() {
	     var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	     var $gugun = $(this).next(); // 선택영역 군구 객체
	     $("option",$gugun).remove(); // 구군 초기화
	
	     if(area == "area0")
	      $gugun.append("<option value=''>구/군 선택</option>");
	     else {
	      $.each(eval(area), function() {
	       $gugun.append("<option value='"+this+"'>"+this+"</option>");
	      });
	     }
	    });
	});
	
	
	const checkId = () => {
	    const idInput = document.getElementById("id");
	    const idError = document.querySelector('.id-group').nextElementSibling;
	    const idValue = idInput.value.trim();
	
	    if (!idValue) {
	        idError.textContent = "아이디를 입력해주세요.";
	        idError.style.color = "red";
	        return;
	    }
	
	    $.ajax({
	        url: `${path}/member/idduplicate.do`,
	        type: "POST",
	        data: { id: idValue },
	        success: function (response) {
	            if (response.isDuplicate) {
	                idError.textContent = "이미 사용 중인 아이디입니다.";
	                idError.style.color = "red";
	            } else {
	                idError.textContent = "사용 가능한 아이디입니다.";
	                idError.style.color = "green";
	            }
	        },
	        error: function () {
	            idError.textContent = "아이디 확인 중 문제가 발생했습니다.";
	            idError.style.color = "red";
	        }
	    });
	};
	
	//실시간 유효성 검사
	const idInput = document.getElementById('id');
	const passwordInput = document.getElementById('password');
	const confirmPasswordInput = document.getElementById('confirm-password');
	const phoneInput = document.getElementById('phone');
	const idError = document.querySelector('.id-group').nextElementSibling;
	const passwordError = passwordInput.nextElementSibling;
	const confirmPasswordError = confirmPasswordInput.nextElementSibling;
	const phoneError = phoneInput.nextElementSibling;
	
	// 유효성 검사 함수
	function validateId() {
	  const idValue = idInput.value.trim();
	  const idRegex = /^[a-zA-Z][a-zA-Z0-9]{5,12}$/; // 영문 또는 영문+숫자 조합, 6~13자
	  if (!idRegex.test(idValue)) {
	    idError.textContent = '아이디는 영문 또는 영문+숫자 조합으로 6~13자여야 합니다.';
	    idError.style.color = 'red';
	    return false;
	  }
	  idError.textContent = '';
	  return true;
	}

	function validatePassword() {
		  const passwordValue = passwordInput.value.trim();
		  const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/; // 최소 8자, 특수문자, 대소문자, 숫자 포함
		  if (!passwordRegex.test(passwordValue)) {
		    passwordError.textContent = '비밀번호는 8자리 이상, 대소문자, 숫자, 특수문자(!@#$%^&*)를 각각 포함해야 합니다.';
		    passwordError.style.color = 'red';
		    return false;
		  }
		  passwordError.textContent = '';
		  return true;
		}

	function validateConfirmPassword() {
		  if (passwordInput.value.trim() !== confirmPasswordInput.value.trim()) {
		    confirmPasswordError.textContent = '비밀번호가 일치하지 않습니다.';
		    confirmPasswordError.style.color = 'red';
		    return false;
		  }
		  confirmPasswordError.textContent = '비밀번호가 일치합니다.';
		  confirmPasswordError.style.color = 'green';
		  return true;
		}

	function validatePhone() {
		  const phoneValue = phoneInput.value.trim();
		  const phoneRegex = /^010\d{8}$/; // 010으로 시작하고 11자리 숫자
		  if (!phoneRegex.test(phoneValue)) {
			phoneError.textContent = '전화번호는 010으로 시작하며 숫자 11자리여야 합니다.';
			confirmPasswordError.style.color = 'red';
		    return false;
		  }
		  phoneError.textContent = '';
		  return true;
		}

	idInput.addEventListener('input', validateId);
	passwordInput.addEventListener('input', validatePassword);
	confirmPasswordInput.addEventListener('input', validateConfirmPassword);
	phoneInput.addEventListener('input', validatePhone);


	document.getElementById("signup-form").addEventListener("submit", async function (event) {
	    event.preventDefault(); // 기본 동작 방지
	
	    const isValid = await fn_invalidate(); // 유효성 검사 결과
	    if (isValid) {
	        this.submit(); // 유효성 검사 통과 시 제출
	    } else {
	        console.log("유효성 검사 실패, 제출 중단");
	    }
	});

	const fn_invalidate = async () => {
	    const nameInput = document.getElementById('name');
	    const idInput = document.getElementById('id');
	    const passwordInput = document.getElementById('password');
	    const confirmPasswordInput = document.getElementById('confirm-password');
	    const emailInput = document.getElementById('email');
	    const birthYearSelect = document.getElementById('birth-year');
	    const birthMonthSelect = document.getElementById('birth-month');
	    const birthDaySelect = document.getElementById('birth-day');
	    const phoneInput = document.getElementById('phone');
	
	    if (nameInput.value.trim() === "") {
	        alert("이름을 입력해주세요.");
	        nameInput.focus();
	        return false;
	    }
	
	    if (idInput.value.trim() === "") {
	        alert("아이디를 입력해주세요.");
	        idInput.focus();
	        return false;
	    }
	
	    if (passwordInput.value.trim() === "") {
	        alert("비밀번호를 입력해주세요.");
	        passwordInput.focus();
	        return false;
	    }
	
	    if (confirmPasswordInput.value.trim() !== passwordInput.value.trim()) {
	        alert("비밀번호가 일치하지 않습니다.");
	        confirmPasswordInput.focus();
	        return false;
	    }
	
	    if (emailInput.value.trim() === "") {
	        alert("이메일을 입력해주세요.");
	        emailInput.focus();
	        return false;
	    }
	
	    if (!birthYearSelect.value || !birthMonthSelect.value || !birthDaySelect.value) {
	        alert("생년월일을 모두 선택해주세요.");
	        return false;
	    }
	
	    const isDuplicateValid = await checkDuplicate();
	    return isDuplicateValid;
	};

	const checkDuplicate = () => {
	    const nicknameInput = document.getElementById("nickname");
	    const nicknameValue = nicknameInput.value.trim();
	    const phoneInput = document.getElementById("phone");
	    const phoneValue = phoneInput.value.trim();
	    const emailInput = document.getElementById("email");
	    const emailValue = emailInput.value.trim();
	
	    return new Promise((resolve) => {
	        $.ajax({
	            url: `${path}/member/checkduplicate.do`,
	            type: "POST",
	            data: { nickname: nicknameValue, phone: phoneValue, email: emailValue },
	            success: function (response) {
	                if (response.nicknameIsDuplicate) {
	                    alert("입력하신 닉네임이 이미 존재합니다.");
	                    nicknameInput.focus();
	                    resolve(false);
	                } else if (response.phoneIsDuplicate) {
	                    alert("입력하신 전화번호가 이미 존재합니다.");
	                    phoneInput.focus();
	                    resolve(false);
	                } else if (response.emailIsDuplicate) {
	                    alert("입력하신 이메일이 이미 존재합니다.");
	                    emailInput.focus();
	                    resolve(false);
	                } else {
	                    resolve(true);
	                }
	            },
	            error: function () {
	                alert("중복 확인 중 오류가 발생했습니다.");
	                resolve(false);
	            }
	        });
	    });
	};
	</script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
 