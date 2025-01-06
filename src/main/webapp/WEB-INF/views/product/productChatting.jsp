<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/style.css">
<link rel="stylesheet" href="${path}/resources/css/product/productDetail.css">
<link rel="stylesheet" href="${path}/resources/css/product/productChatting.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section class="main-container">


	<!-- 카테고리 박스 -->
	 <div class="ct-box">
		 <div class="checkbox-container">
		 	<div class="title">지역</div>
			    <label><input type="checkbox" /> 서울</label>
			    <label><input type="checkbox" /> 부산</label>
			    <label><input type="checkbox" /> 인천</label>
			    <label><input type="checkbox" /> 군포</label>
			    <label><input type="checkbox" /> 가산</label>
			    <label><input type="checkbox" /> 대전</label>
			    <label><input type="checkbox" /> 대구</label>
			    <label><input type="checkbox" /> 울산</label>
			    <label><input type="checkbox" /> 광주</label>
			    <label><input type="checkbox" /> 강원</label>
			    <label><input type="checkbox" /> 제주</label>  
			</div>
		 <div class="checkbox-container">
		 	<div class="title">카테고리</div>
			    <label><input type="checkbox" /> 도서</label>
			    <label><input type="checkbox" /> 운동</label>
			    <label><input type="checkbox" /> 전자기기</label>
			    <label><input type="checkbox" /> 문구</label>
			    <label><input type="checkbox" /> 생활용품</label> 
			</div>
		 <div class="checkbox-container">
		 	<div class="title">거래방법</div>
			    <label><input type="checkbox" /> 직거래</label>
			    <label><input type="checkbox" /> 택배</label>
			</div>
		 <div class="checkbox-container">
		 	<div class="title">정렬기준</div>
			    <label><input type="checkbox" /> 오름차순</label>
			    <label><input type="checkbox" /> 내림차순</label>
			    <label><input type="checkbox" /> 인기순</label>
			    <label><input type="checkbox" /> 최신순</label>
			</div>
		  <div class="checkbox-container">
		 	<div class="title">금액</div>
			    <label><input type="checkbox" /> 5000원 이하</label>
			    <label><input type="checkbox" /> 10000원 이하</label>
			    <label><input type="checkbox" /> 20000원 이하</label>
			    <label><input type="checkbox" /> 30000원 이하</label>
			    <label><input type="checkbox" /> 그 외</label>
			    <label><input type="checkbox" /> 무료나눔</label>
			</div>
		  <div class="checkbox-container">
		 	<div class="title">거래상태</div>
			    <label><input type="checkbox" /> 거래가능</label>
			    <label><input type="checkbox" /> 거래중</label>
			    <label><input type="checkbox" /> 거래완료</label> 
			</div>
		  <div class="checkbox-container">
		 	<div class="title">상품상태</div>
			    <label><input type="checkbox" /> A급</label>
			    <label><input type="checkbox" /> B급</label>
			    <label><input type="checkbox" /> C급</label>
			    <label><input type="checkbox" /> D급</label>
			    <label><input type="checkbox" /> F급</label>  
			</div>	
		   <div class="reset-btn-container">
		 	<button class="reset-btn"><p>RE</p></button>				
	       </div>
	  
	 </div>
	  
	 
	<div class="main-box d-flex flex-row">
    <!-- 이미지 영역 -->
    <div class="left-box d-flex flex-column">
	    <div class="img-box">
	        <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
	        	<!-- 점 표시 (Indicators) -->
		        <div class="carousel-indicators">
		            <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		            <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
		            <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
		        </div>
        
	            <div class="carousel-inner">
	               <div class="carousel-item active">
	                    <img src="${path}/resources/images/product1.jpg" class="d-block w-100" alt="Product Image 1">
	                </div>
	                <div class="carousel-item">
	                    <img src="${path}/resources/images/product2.jpg" class="d-block w-100" alt="Product Image 2">
	                </div>
	                <div class="carousel-item">
	                    <img src="${path}/resources/images/product3.jpg" class="d-block w-100" alt="Product Image 3">
	                </div> 
	            </div>
	            <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
	                <span class="custom-icon">
	                	<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0"/>
						</svg>
					</span>
	                <span class="visually-hidden">Previous</span>
	            </button>
	            <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
	                <span class="custom-icon">
	                	<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708"/>
						</svg>
	                </span>
	                <span class="visually-hidden">Next</span>
	            </button>
	        </div>
	    </div>
	    
	    <!-- 판매자 정보 -->
	    <div class="seller-info-box">
	        <div class="d-flex justify-content-between align-items-center mb-3">
	            <span class="seller">판매자</span>
	            <span class="more-info"><a href="#" class="text-muted">더보기</a></span>
	        </div>
	        <div class="d-flex justify-content-between align-items-center">
	        	<div class="d-flex">
		        	<div class="seller-img d-flex justify-content-center align-items-center">
		        		<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#ECEBDE" class="bi bi-person-fill" viewBox="0 0 16 16">
						  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
						</svg>
		        	</div>
		        	<div class="d-flex flex-column justify-content-center">
		        		<span class="seller-name">나BS아님</span>
		        		<span class="seller-address">시흥</span>
		        	</div>
	        	</div>
		        <div class="rating d-flex flex-column">
		        	<div>
					    <i class="fas fa-star"></i>
					    <i class="fas fa-star"></i>
					    <i class="fas fa-star"></i>
					    <i class="far fa-star"></i>
					    <i class="far fa-star"></i>
		        	</div>
				    <span>후기 (230개)</span>
				</div>		        
	        </div>
		</div>
	</div>
	
	
    <div class="right-box d-flex flex-column">
    	<div class="product-chatting-info">
    		<div class="title">BS언어 단어 100제 완전 강추 ! 쉬운 습득가능 !</div>
    		<div class="price">35,000원</div>
    	</div>
    	
    	 <div id="chatting-box">
    		<div id="msg-container"></div>
    	
				<div id="msgwrite-container">
						<form class="chatting-input-box">
			    		<textarea type="text" id="msg" class="chatting-input" placeholder="메세지를 입력하세요"></textarea>
			    		<button type="button" class="send-btn" id="send-btn">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
							  <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576zm6.787-8.201L1.591 6.602l4.339 2.76z"/>
							</svg>
						</button>
			    	</form>		
				</div>
			<div id="info-container"></div>
    	</div> 
    	
    </div>

</div>
  
</section>    
<script>

const sender='${sessionScope.loginMember.memberId}';

let socket=new WebSocket("ws://localhost:9090/SSEULMANHAE/chatting"); 

socket.onopen=(response)=>{
	const msg=new Message("open",sender,"","","");
	socket.send(msg.toJson()); 	
}

socket.onmessage=(e)=>{

	const data=JSON.parse(e.data);
	console.log(e);
	switch(data.type){
	case "alram": alramMessage(data);break;
	case "users": userPrint(data);break;
	case "msg" : msgprint(data);break;
	}

}
// 알림 메시지를 표시하는 함수
const alramMessage=(msg)=>{
const $h5 = $("<div>").text(msg.data).css(
	        "textAlign", "center",
	        "color", "#4CAF50", 
	        "fontWeight", "bold"
	    );

$("#msg-container").append($h5);
}

const userPrint=(msg)=>{
	const users=JSON.parse(msg.data);
	const $ul=$("<ul>");
	users.forEach(user=> {
		$("<li>").text(user).appendTo($ul);
});
$("#info-container").html($ul);
}

const msgprint = (msg) => {
    const isSender = sender === msg.sender; // Check if the sender is the logged-in user
    const $container = $('<div>').addClass(isSender ? 'sender-chat' : 'receiver-chat').css('display', 'flex');

    if (isSender) {
        $container.css('justify-content', 'flex-end');
    } else {
        $container.css('justify-content', 'flex-start');
    }

    const $chatBubble = $('<div>').addClass('chat-content').css({
        'max-width': '60%',
        'padding': '10px',
        'border-radius': '10px',
        'background-color': '#FFFFFF',
        'box-shadow': '0px 0px 5px rgba(0, 0, 0, 0.1)',
        'margin': '5px',
        'word-wrap': 'break-word'
    }).text(msg.data);

    const $nameTag = $('<span>').addClass('member-name').css({
        'font-size': '12px',
        'color': '#888',
        'margin': isSender ? '0 10px 0 0' : '0 0 0 10px'
    }).text(isSender ? '나' : msg.sender);

    const $profileIcon = $('<div>').addClass('member-img').css({
        'width': '30px',
        'height': '30px',
        'border-radius': '50%',
        'background-color': '#ECEBDE',
        'display': 'flex',
        'align-items': 'center',
        'justify-content': 'center',
        'margin': '5px'
    }).append(
        $('<svg>').attr({
            xmlns: 'http://www.w3.org/2000/svg',
            width: '20',
            height: '20',
            fill: 'currentColor',
            class: 'bi bi-person-fill',
            viewBox: '0 0 16 16'
        }).append(
            $('<path>').attr('d', 'M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6')
        )
    );

    if (isSender) {
        $container.append($chatBubble).append($nameTag);
    } else {
        $container.append($profileIcon).append($nameTag).append($chatBubble);
    }

    $('#msg-container').append($container);
    $('#msg-container').scrollTop($('#msg-container')[0].scrollHeight); // Auto-scroll to the bottom
};


 //소켓서버에 메세지 보내기
$("#send-btn").click(e=>{
	 const message=$("#msg").val();
	 if(message.trim().length>0){	 
		 //object 로 넘어 가기 때문에 toJson() 메소드사용
		socket.send(new Message("msg",sender,'',message,'').toJson()); // type , sender , receiver , data , room 
 } else {
	alert("메세지를 입력하세요 !");
	$("#msg").focus();
 }
}); // 올바르게 닫기



class Message{
	constructor(type,sender,receiver,data,room) {
		this.type=type;
		this.sender=sender;
		this.receiver=receiver;
		this.data=data;
		this.room=room;
	}
	/* 파싱해서 보내야함 */
	toJson(){
		return JSON.stringify(this); //this 객체를 반환
	}
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>