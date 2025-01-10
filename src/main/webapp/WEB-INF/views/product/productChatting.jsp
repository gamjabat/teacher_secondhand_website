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
	 
	<div class="main-box d-flex flex-row">
    <!-- 이미지 영역 -->
    <!-- 이미지 영역 -->
    <div class="left-box d-flex flex-column">
        <div class="img-box">
		    <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
		        <!-- 점 표시 (Indicators) -->
		        <div class="carousel-indicators">
		            <c:forEach var="attachment" items="${attachments}" varStatus="status">
		                <button 
		                    type="button" 
		                    data-bs-target="#productCarousel" 
		                    data-bs-slide-to="${status.index}" 
		                    class="${status.first ? 'active' : ''}" 
		                    aria-current="${status.first ? 'true' : 'false'}" 
		                    aria-label="Slide ${status.index + 1}">
		                </button>
		            </c:forEach>
		        </div>
		
		        <!-- 이미지 슬라이드 -->
		        <div class="carousel-inner">
		            <c:forEach var="attachment" items="${attachments}" varStatus="status">
		                <div class="carousel-item ${status.first ? 'active' : ''}">
		                    <img src="${path}/resources/upload/product/${attachment.fileRename}" class="product-img d-block" alt="${attachment.fileOriginalName}">
		                </div>
		            </c:forEach>
		        </div>
		
		        <!-- 이전 버튼 -->
		        <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
		            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		            <span class="visually-hidden">Previous</span>
		        </button>
		        <!-- 다음 버튼 -->
		        <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
		            <span class="carousel-control-next-icon" aria-hidden="true"></span>
		            <span class="visually-hidden">Next</span>
		        </button>
		    </div>
		</div>
	    
	    <!-- 판매자 정보 -->
		<div class="seller-info-box">
		   <div class="d-flex justify-content-between align-items-center mb-3">
		       <span class="seller">판매자</span>
		       <span class="more-info">
		           <a href="${path}/member/membersellerinfopage.do?sellerId=${sellerInfo.MEMBERNO}" class="text-muted">더보기</a>
		       </span>
		   </div>
		   <div class="d-flex justify-content-between align-items-center">
		       <div class="d-flex">
		           <div class="seller-img d-flex justify-content-center align-items-center">
		           		<c:if test="${sellerInfo.FILERENAME == null }">
			               	<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#ECEBDE" class="bi bi-person-fill" viewBox="0 0 16 16">
			                   <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
			               </svg>
			            </c:if>
			            <c:if test="${sellerInfo.FILERENAME != null }">
			            	<img src="${path}/resources/upload/member/${sellerInfo.FILERENAME}" class="seller-img" alt="${sellerInfo.FILEORIGINALNAME}">
			            </c:if>
		           </div>
		           <div class="d-flex flex-column justify-content-center">
		               <span class="seller-name">${sellerInfo.NICKNAMEORID}</span>
		               <span class="seller-address">${sellerInfo.ADDRESS}</span>
		           </div>
		       </div>
		       <div class="rating d-flex flex-column">
		           <div>
		               <c:forEach var="star" begin="1" end="5">
		                   <i class="${star <= sellerInfo.AVERAGERATING ? 'fas fa-star' : 'far fa-star'}"></i>
		               </c:forEach>
		           </div>
		           <span>후기 (${sellerInfo.REVIEWCOUNT}개)</span>
		        </div>			        
		    </div>					                                                                                                                                                              
		</div>
	</div>
	
	
    <div class="right-box d-flex flex-column justify-content-between">
    	<div class="product-chatting-info">
    		<input type="hidden" id="productNo" value="${product.productNo}">
    		<div class="title">${product.productName }</div>
    		<div class="price"><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/>원</div>
    	</div>
    	
    	 <div id="chatting-box">
    		<div id="msg-container">
			    <c:forEach var="message" items="${messages}">
			        <c:set var="isSender" value="${message.SENDER_MEMBER_NO == sessionScope.loginMember.memberNo}" />
			        
			        <!-- 메시지 컨테이너 -->
			        <div class="${isSender ? 'sender-chat' : 'receiver-chat'}" style="display: flex; justify-content: ${isSender ? 'flex-end' : 'flex-start'};">
			            
			            <!-- '나'가 아닌 경우: 이름 태그 -> 채팅 말풍선 -->
			            <c:if test="${!isSender}">
			                <!-- 프로필 아이콘 -->
			                <c:if test="${message.PROFILE_IMAGE_NAME == null}">
			                    <div class="member-img" style="width: 30px; height: 30px; border-radius: 50%; background-color: #ECEBDE; display: flex; align-items: center; justify-content: center; margin: 5px;">
			                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
			                            <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
			                        </svg>
			                    </div>
			                </c:if>
			                <c:if test="${message.PROFILE_IMAGE_NAME != null}">
			                    <img src="${path}/resources/upload/member/${message.PROFILE_IMAGE_NAME}" style="width: 30px; height: 30px; border-radius: 50%; margin: 5px;">
			                </c:if>
			                
			                <!-- 이름 태그 -->
			                <span class="member-name" style="font-size: 12px; color: #888;">
			                    <c:out value="${message.MEMBER_ID}" />
			                </span>
			                
			                <!-- 채팅 말풍선 -->
			                <div class="chat-content" style="max-width: 60%; padding: 10px; border-radius: 10px; background-color: #FFFFFF; box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1); margin: 5px; word-wrap: break-word;">
			                    <c:out value="${message.MESSAGE_CONTENT}" />
			                </div>
			            </c:if>
			            
			            <!-- '나'인 경우: 채팅 말풍선 -> 이름 태그 -->
			            <c:if test="${isSender}">
			                <!-- 채팅 말풍선 -->
			                <div class="chat-content" style="max-width: 60%; padding: 10px; border-radius: 10px; background-color: #FFFFFF; box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1); margin: 5px; word-wrap: break-word;">
			                    <c:out value="${message.MESSAGE_CONTENT}" />
			                </div>
			                
			                <!-- 이름 태그 -->
			                <span class="member-name" style="font-size: 12px; color: #888; margin: 0 10px 0 0;">
			                    나
			                </span>
			            </c:if>
			        </div>
			    </c:forEach>
			</div>
    		
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
$(document).ready(() => {
    $('#msg-container').scrollTop($('#msg-container')[0].scrollHeight);
});

const sender='${sessionScope.loginMember.memberId}';
const senderNo='${sessionScope.loginMember.memberNo}';
const productNo= $('#productNo').val();
const senderImg='${sessionScope.loginMember.profileImageName}';

let socket=new WebSocket("ws://localhost:9090/SSEULMANHAE/chatting?productNo="+productNo); 

socket.onopen=(response)=>{
	const msg=new Message("open",sender,senderNo,senderImg,"","",productNo);
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
    
 	// 프로필 이미지 또는 기본 아이콘
    const $profileIcon = $('<div>').addClass('member-img').css({
        'width': '30px',
        'height': '30px',
        'border-radius': '50%',
        'background-color': '#ECEBDE',
        'display': 'flex',
        'align-items': 'center',
        'justify-content': 'center',
        'margin': '5px'
    });

    if (!isSender && msg.senderImg) {
        $profileIcon.append(
            $('<img>').attr('src', `${path}/resources/upload/member/\${msg.senderImg}`).css({
                'width': '30px',
                'height': '30px',
                'border-radius': '50%',
                'margin': '5px'
            })
        );
    } else if (!isSender) {
        $profileIcon.append(
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
        'margin': isSender ? '0 10px 0 0' : '0 0 0 0'
    }).text(isSender ? '나' : msg.sender);

    if (isSender) {
        $container.append($chatBubble).append($nameTag);
    } else {
        $container.append($profileIcon).append($nameTag).append($chatBubble);
    }

    $('#msg-container').append($container);
    $('#msg-container').scrollTop($('#msg-container')[0].scrollHeight);
};

 //소켓서버에 메세지 보내기
$("#send-btn").click(e=>{
	 const message=$("#msg").val();
	 const productNo= $('#productNo').val();
	 const senderNo='${sessionScope.loginMember.memberNo}';
	 const senderImg='${sessionScope.loginMember.profileImageName}';
	 if(message.trim().length>0){	 
		 //object 로 넘어 가기 때문에 toJson() 메소드사용
		socket.send(new Message("msg",sender,senderNo,senderImg,'',message, productNo).toJson());
		$("#msg").val('');
	} else {
	alert("메세지를 입력하세요 !");
	$("#msg").focus();
 }
}); // 올바르게 닫기

class Message{
	constructor(type,sender,senderNo,senderImg,receiver,data,room) {
		this.type=type;
		this.sender=sender;
		this.senderNo=senderNo;
		this.senderImg=senderImg;
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