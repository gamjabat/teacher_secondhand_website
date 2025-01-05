package com.secondhand.controller.login;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.secondhand.common.PasswordEncoding;
import com.secondhand.model.dto.attachment.Attachment;
import com.secondhand.model.dto.member.Member;
import com.secondhand.model.service.member.MemberService;

/**
 * Servlet implementation class SignUpEndServlet
 */
@WebServlet(name="signUpEndServlet", urlPatterns="/login/signupend.do")
public class SignUpEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
		request.setCharacterEncoding("utf-8");
		
		String path = getServletContext().getRealPath("/resources/upload/member/");
        int maxSize = 1024 * 1024 * 100;
        String encoding = "UTF-8";
        
        MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());
        PasswordEncoding pe = new PasswordEncoding(request);
		
		String name = mr.getParameter("name");
		String id = mr.getParameter("id");
		String nickname = mr.getParameter("nickname");
		String rawPassword  = mr.getParameter("password");
		String encryptedPassword = new PasswordEncoding(request).getSHA512(rawPassword);
		String email = mr.getParameter("email");
		String birthYear = mr.getParameter("birth-year");
		String birthMonth = mr.getParameter("birth-month");
		String birthDay = mr.getParameter("birth-day");
		// 월, 일이 한 자리인 경우 앞에 0 추가
        if (birthMonth != null && birthMonth.length() == 1) {
            birthMonth = "0" + birthMonth;
        }
        if (birthDay != null && birthDay.length() == 1) {
            birthDay = "0" + birthDay;
        }
		String birthDateStr = birthYear + "-" + birthMonth + "-" + birthDay;
		Date birthDate = Date.valueOf(birthDateStr);
		
		String phone = mr.getParameter("phone");
		
		
		String postcode = mr.getParameter("sample6_postcode"); // 우편번호
	    String basicAddress = mr.getParameter("sample6_address"); // 기본 주소
	    String detailAddress = mr.getParameter("sample6_detailAddress"); // 상세 주소
	    String extraAddress = mr.getParameter("sample6_extraAddress"); // 참고 항목
		
	    String fullAddress = String.join(" ", postcode, basicAddress, detailAddress, extraAddress).trim();
	    if (fullAddress.isBlank()) {
	        fullAddress = null; // 주소 정보가 없는 경우 null로 처리
	    }
		/*
		 * String sido = request.getParameter("sido"); String gugun =
		 * request.getParameter("gugun");
		 */
		
		Member insertMember = Member.builder()
								.memberName(name)
								.memberId(id)
								.nickname(nickname)
								.memberPwd(encryptedPassword)
								.email(email)
								.birthday(birthDate)
								.phone(phone)
								.address(fullAddress)
								.build();
		
		String originalFileName = mr.getOriginalFileName("member-img");
		System.out.println("파일이름: "+originalFileName);
		String savedFileName = mr.getFilesystemName("member-img");
		
		Attachment attachment = null;
        if (originalFileName != null && savedFileName != null) {
            attachment = Attachment.builder()
					                .fileOriginalName(originalFileName)
					                .fileRename(savedFileName)
					                .build();
        }
        
        MemberService service = new MemberService();
		String msg, loc ="/";
		
		try {
            if (attachment != null) {
                service.signupMemberWithAttachment(insertMember, attachment);
            } else {
                service.signupMember(insertMember);
            }
            msg = "회원가입을 성공하였습니다.";
            loc = "/";
        } catch (RuntimeException e) {
            e.printStackTrace();
            msg = "회원가입 실패하였습니다. 다시 시도해주세요.";
            loc = "/login/signupagreement.do";
        }
		
		response.setContentType("text/html;charset=utf-8");
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
