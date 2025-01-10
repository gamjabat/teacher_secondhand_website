<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/product/productInsert.css">

<section class="main-container">
    <div class="main-box">
        <div class="insert-title">
            <h2>상품 수정</h2>
        </div>
        <div class="insert-upload-box">
            <form id="product-form">
            	<input type="hidden" id="productNo" value="${product.productNo }">
                <!-- 상품명 -->
                <div class="box1">
                    <label for="product-name"><span>상품명<span class="required">*</span></span></label>
                    <input type="text" id="product-name" name="productName" class="form-control product-name"
                        value="${product.productName}" />
                </div>

                <!-- 카테고리 -->
                <div class="box2">
                    <label for="product-category"><span>카테고리<span class="required">*</span></span></label>
                    <select id="product-category" name="productCategory" class="form-select product-category">
                        <option value="">카테고리를 선택하세요</option>
	       				<option value="PCT-1" ${product.productCategoryNo eq 'PCT-1' ? 'selected' : ''}>책</option>
	       				<option value="PCT-2" ${product.productCategoryNo eq 'PCT-2' ? 'selected' : ''}>수업자료</option>
	       				<option value="PCT-3" ${product.productCategoryNo eq 'PCT-3' ? 'selected' : ''}>교구</option>
	       				<option value="PCT-4" ${product.productCategoryNo eq 'PCT-4' ? 'selected' : ''}>문구류</option>
	       				<option value="PCT-5" ${product.productCategoryNo eq 'PCT-5' ? 'selected' : ''}>운동</option>
	       				<option value="PCT-6" ${product.productCategoryNo eq 'PCT-6' ? 'selected' : ''}>전자기기</option>
	       				<option value="PCT-7" ${product.productCategoryNo eq 'PCT-7' ? 'selected' : ''}>생활용품</option>
	       				<option value="PCT-8" ${product.productCategoryNo eq 'PCT-8' ? 'selected' : ''}>기타</option>
                    </select>
                </div>

                <!-- 가격 -->
                <div class="box3">
                    <label for="product-price"><span>가격<span class="required">*</span></span></label>
                    <input type="text" id="product-price" name="price" class="form-control product-price"
                        value="${product.price}" />
                </div>
                
                <div class="box4 d-flex">
		       		<div class="d-flex flex-row justify-content-between mb-3">
		    				<span class="d-flex align-items-center">이미지 등록<span class="required">*</span></span>
		    				<div class="photoupload-box m-0">
							 	<label for="product-img-upload" class="upload-button">업로드</label> <!-- 버튼 -->
							 	<input type="file" id="product-img-upload" name="product-img-upload" multiple accept="image/*">
					   		</div>
		       		</div>
	    			<div class="flex-box d-flex flex-row m-0" id="preview-container">
	    				<c:forEach var="attachment" items="${attachments}" varStatus="status">
		                    <img src="${path}/resources/upload/product/${attachment.fileRename}" class="photobox" alt="${attachment.fileOriginalName}">
		            	</c:forEach>
		    		</div>
				</div>

                <!-- 상세내용 -->
                <div class="box5">
                    <label for="product-content"><span>상세내용<span class="required">*</span></span></label>
                    <textarea id="description" name="description" class="form-control">${product.productDescription}</textarea>
                </div>

                <!-- 거래방식 -->
                <div class="box6">
                    <label for="product-transmethod"><span>거래방식<span class="required">*</span></span></label>
                    <select id="trans-method" name="transMethod" class="form-select product-transmethod">
                        <option value="">거래방식을 선택하세요</option>
                        <option value="TMD-1" ${product.transMethodNo eq 'TMD-1' ? 'selected' : ''}>직거래</option>
                        <option value="TMD-2" ${product.transMethodNo eq 'TMD-2' ? 'selected' : ''}>택배 거래</option>
                    </select>
                </div>

                <!-- 거래 지역 -->
                <div class="box7" id="location-box" style="${product.transMethodNo eq 'TMD-1' ? '' : 'display: none;'}">
                    <label for="product-location"><span>거래 지역<span class="required">*</span></span></label>
                    <div class="input-group my-2 flex-row" style="display: flex; gap: 10px;">
                    <c:set var="addressParts" value="${fn:split(product.tradeLocation, ' ')}" />
                    
                        <select id="sido" name="sido" class="form-select">
                            <option value="${addressParts[0] }" selected>${addressParts[0] }</option>
                        </select>
                        <select id="gugun" name="gugun" class="form-select">
                            <option value="${addressParts[1] }" selected>${addressParts[1] }</option>
                        </select>
                    </div>
                </div>

                <!-- 해시태그 -->
                <div class="box8">
                    <label for="product-hashtag"><span>해시태그</span></label>
                    <input type="text" id="product-hashtag" name="productHashtag" class="form-control product-hashtag"
                        value="${product.hashTags}" />
                </div>

                <div class="d-flex align-items-center">
                    <button type="button" id="upload-allbtn" class="upload-allbtn"><p>상품 수정</p></button>
                </div>
            </form>
        </div>
    </div>
</section>

<script>
document.addEventListener('DOMContentLoaded', () => {
	 document.querySelector(".ct-box").style.display = "none";
	 document.querySelector(".search-input").style.display = "none";
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
	    
	 	// 가격 입력 필드에서 숫자만 입력되도록 제한
        $("#product-price").on("input", function () {
            this.value = this.value.replace(/[^0-9]/g, "");
        });
	});
	
	$(document).ready(function () {
	    // 거래 방식 선택에 따라 거래 지역 박스 표시 여부 결정
	    $("#trans-method").on("change", function () {
	        const selectedValue = $(this).val();

	        // "TMD-1"은 직거래로 가정
	        if (selectedValue === "TMD-1") {
	            $("#location-box").show(); // 거래 지역 선택 박스 표시
	        } else {
	            $("#location-box").hide(); // 거래 지역 선택 박스 숨기기
	        }
	    });

	    // 지역 선택 관련 기존 코드 ...
	    $("select[name=sido]").each(function () {
	        const $selsido = $(this);
	        area0.forEach(value => {
	            $selsido.append(`<option value='${value}'>${value}</option>`);
	        });
	    });

	    $("select[name^=sido]").change(function () {
	        const areaIndex = $("option", $(this)).index($("option:selected", $(this))); // 선택 지역의 구/군 Array
	        const $gugun = $(this).next();
	        $("option", $gugun).remove(); // 구/군 초기화

	        if (areaIndex === 0) {
	            $gugun.append("<option value=''>구/군 선택</option>");
	        } else {
	            eval("area" + areaIndex).forEach(gugun => {
	                $gugun.append(`<option value='${gugun}'>${gugun}</option>`);
	            });
	        }
	    });
	});

	

    $(document).ready(function () {
        // 지역 선택 관련 기존 코드 ...

        // 이미지 업로드 처리
        $("#product-img-upload").on("change", function () {
            const files = this.files;
            const previewContainer = $("#preview-container");

            // 기존 프리뷰 초기화
            previewContainer.html("");

            // 선택된 파일을 각각 처리
            Array.from(files).forEach((file) => {
                if (file.type.startsWith("image/")) {
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        // 이미지 요소 생성
                        const img = $("<img>")
                            .addClass("photobox")
                            .attr("src", e.target.result)
                            .css({
                                width: "200px",
                                height: "200px",
                                objectFit: "cover",
                                border: "1px solid #ddd",
                                borderRadius: "5px",
                                marginRight: "10px"
                            });

                        // 프리뷰 컨테이너에 추가
                        previewContainer.append(img);
                    };

                    // 파일을 읽기
                    reader.readAsDataURL(file);
                } else {
                    alert("이미지 파일만 업로드할 수 있습니다.");
                }
            });
        });
    });
    
    /* document.getElementById("product-form").addEventListener("submit", async function (event) {
	    event.preventDefault(); // 기본 동작 방지
	
	    const isValid = fn_invalidate(); // 유효성 검사 결과
	    if (isValid) {
	        this.submit(); // 유효성 검사 통과 시 제출
	    } else {
	        console.log("유효성 검사 실패, 제출 중단");
	    }
	});
    
    const fn_invalidate = () => {
	    const nameInput = document.getElementById('product-name');
	    const categorySelect = document.getElementById('product-category');
	    const priceInput = document.getElementById('product-price');
	    const imgInput = document.getElementById('product-img-upload');
	    const descriptionInput = document.getElementById('description');
	    const transMethodSelect = document.getElementById('trans-method');
	    const sidoSelect = document.querySelector('select[name="sido"]'); 
	    const gugunSelect = document.querySelector('select[name="gugun"]');
	
	    if (nameInput.value.trim() === "") {
	        alert("상품명을 입력해주세요.");
	        nameInput.focus();
	        return false;
	    }
	
	    if (categorySelect.value.trim() === "") {
	        alert("카테고리를 선택해주세요.");
	        categorySelect.focus();
	        return false;
	    }
	
	    if (priceInput.value.trim() === "") {
	        alert("가격을 입력해주세요.");
	        priceInput.focus();
	        return false;
	    }
	
	    if (imgInput.value.trim() === "") {
	        alert("상품 이미지를 등록해주세요.");
	        imgInput.focus();
	        return false;
	    }
	
	    if (descriptionInput.value.trim() === "") {
	        alert("상세내용을 입력해주세요.");
	        descriptionInput.focus();
	        return false;
	    }
	    
	    if (transMethodSelect.value.trim() === "") {
	        alert("거래 방식을 선택해주세요.");
	        transMethodSelect.focus();
	        return false;
	    }
	
	    if (transMethodSelect.value === "TMD-1") {
	        if (!sidoSelect.value || sidoSelect.value === "시/도 선택") {
	            alert("시/도를 선택해주세요.");
	            sidoSelect.focus();
	            return false;
	        }
	        if (!gugunSelect.value || gugunSelect.value === "구/군 선택") {
	            alert("구/군을 선택해주세요.");
	            gugunSelect.focus();
	            return false;
	        }
	    }
	    
	    return true;
	}; */
    
	
	$(document).ready(function () {
	    $("#upload-allbtn").click(function () {
	        const formdata = new FormData();

	        // 파일 추가
	        let files = $("#product-img-upload")[0].files;
	        let count=0;
	        for(let file of $("#product-img-upload")[0].files){
				formdata.append("upfile"+ ++count,file);
			};

	        // 폼 데이터 추가
	        formdata.append("productNo", $("#productNo").val());
	        formdata.append("productName", $("#product-name").val());
	        formdata.append("productCategory", $("#product-category").val());
	        formdata.append("price", $("#product-price").val());
	        formdata.append("description", $("#description").val());
	        formdata.append("transMethod", $("#trans-method").val());
	        formdata.append("product-hashtag", $("#product-hashtag").val());
	        formdata.append("sido", $("#sido").val());
	        formdata.append("gugun", $("#gugun").val());

	        // AJAX 요청
	        $.ajax({
	            url: "${path}/product/editproduct.do",
	            type: "POST",
	            data: formdata,
	            processData: false,
	            contentType: false,
	            success: function (response) {
	                alert("상품 수정이 완료되었습니다.");
	                console.log(response);
	                window.location.href = "${path}/product/productdetail.do?productNo=${product.productNo}";
	            },
	            error: function (xhr, status, error) {
	                alert("상품 수정 중 오류가 발생했습니다.");
	                console.error(error);
	                location.reload();
	            },
	        });
	    });
	});
    
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
