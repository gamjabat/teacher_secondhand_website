<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${path}/resources/style.css">
  <link rel="stylesheet" href="${path}/resources/css/common/header.css">
  <link rel="stylesheet" href="${path}/resources/css/common/footer.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <%-- <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.min.js"></script> --%>
  <title>SSEULMANHAE</title>
</head>
<body>	
	<div class="header-container">
    	<div class="header-box">
      	<div class="logo-container">
	 			<a href="${path }/">
	      		<img src="${path}/resources/images/SSEULMANHAE_LOGO.png" class="logo" alt="Logo" onclick="mainPage();">
      		</a> 
      	</div>
      	<div class="search-container">
    		<form class="search-form" action="#" method="post">
        		<input type="text" class="search-input" placeholder="검색어를 입력하세요">
    		</form>
		</div>
      
      	<div class="interface-bar">
	      	<div>메뉴</div>
      	</div>
    </div>
  </div>
