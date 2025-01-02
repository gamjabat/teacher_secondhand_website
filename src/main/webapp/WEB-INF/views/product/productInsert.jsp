<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/product/productInsert.css">
<section class="main-container">

	
	 <!-- 메인박스  -->
	 <div class="main-box">
       	
       		<!--상품등록 타이틀 -->
       	<div class="insert-title">
       		<h2>상품등록</h2>
       	</div>
       	
       	
       	<!-- 상세 정보 입력 컨테이너-->
       	
       	<div class="insert-upload-box">
       		
       		<form action="">
       		
       		<div class="box1">
       			<label for="product-name"><span>상품명</span></label>
                <input type="text" id="product-name" class="product-name" placeholder="상품명을 입력해 주세요." name="" value="">
       		</div>
       		
       		<div class="box2">
       			<label for="product-category"><span>카테고리</span></label>
       			<select class="product-category">
       				<option value="cat-1"> 도서 </option>
       				<option value="cat-2"> 운동 </option>
       				<option value="cat-3"> 전자기기 </option>
       				<option value="cat-4"> 문구 </option>
       				<option value="cat-5"> 생활용품 </option>
       			</select>
       		</div>
       		
       		<div class="box3">
       			<label for="product-price"><span>가격</span></label>
                <input type="text" id="product-price" class="product-price" placeholder="가격을 입력해 주세요." name="" value="">
       		</div>
       		
       		<div class="box4">
    			<span>이미지등록</span> <!-- 소제목 -->
    			<div class="flex-box d-flex flex-row">
		    			<span class="photobox">사진</span>
		    			<span class="photobox">사진</span>
		    			<span class="photobox">사진</span>
		    			<span class="photobox">사진</span>
	    		</div>
    			<div class="photoupload-box">
					 <label for="product-img-upload" class="upload-button">업로드</label> <!-- 버튼 -->
					 <input type="file" id="product-img-upload" name="product-img-upload" accept="image/*">
			   </div>
			    
			</div>
			
			  
       		<div class="box5">
       			<label for="product-content"><span>상세내용</span></label>
       			<textarea></textarea>
       		</div>
       		</form>
       		
       		<button class="upload-allbtn"><p>상품등록</p></button>
       	</div>

    </div>	
    
</section>    

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
