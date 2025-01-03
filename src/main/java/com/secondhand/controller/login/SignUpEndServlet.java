package com.secondhand.controller.login;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.common.PasswordEncoding;
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
		PasswordEncoding pe = new PasswordEncoding(request);
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String password = pe.getParameter("password");
		String email = request.getParameter("email");
		String birthYear = request.getParameter("birth-year");
		String birthMonth = request.getParameter("birth-month");
		String birthDay = request.getParameter("birth-day");
		// 월, 일이 한 자리인 경우 앞에 0 추가
        if (birthMonth != null && birthMonth.length() == 1) {
            birthMonth = "0" + birthMonth;
        }
        if (birthDay != null && birthDay.length() == 1) {
            birthDay = "0" + birthDay;
        }
		String birthDateStr = birthYear + "-" + birthMonth + "-" + birthDay;
		Date birthDate = Date.valueOf(birthDateStr);
		
		String phone = request.getParameter("phone");
		
		
		String postcode = request.getParameter("sample6_postcode"); // 우편번호
	    String basicAddress = request.getParameter("sample6_address"); // 기본 주소
	    String detailAddress = request.getParameter("sample6_detailAddress"); // 상세 주소
	    String extraAddress = request.getParameter("sample6_extraAddress"); // 참고 항목
		
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
								.memberPwd(password)
								.email(email)
								.birthday(birthDate)
								.phone(phone)
								.address(fullAddress)
								.build();
		
		MemberService service = new MemberService();
		
		String msg, loc ="/";
		try {
			int result = service.signupMember(insertMember);
			msg="회원가입을 성공하였습니다.";
			loc="/";
		} catch(RuntimeException e) {
			e.printStackTrace();
			msg="회원가입 실패하였습니다. 다시 시도해주세요.";
			loc="/login/signupagreement.do";
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
