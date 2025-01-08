package com.secondhand.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.secondhand.common.PasswordEncoding;
import com.secondhand.model.dto.member.Member;
import com.secondhand.model.service.member.MemberService;

/**
 * Servlet implementation class MypageInfoUpdateServlet
 */
@WebServlet("/member/mypageinfoupdate2.do")
public class MypageInfoUpdateServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageInfoUpdateServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		PasswordEncoding pe = new PasswordEncoding(request);
		
		String password = pe.getParameter("password");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		Member memberInfo = new MemberService().selectMemberById(loginMember.getMemberId());
		
		if(loginMember != null && password.equals(loginMember.getMemberPwd())) {
			request.setAttribute("memberInfo", memberInfo);
			request.getRequestDispatcher("/WEB-INF/views/member/mypageInfoUpdate.jsp")
			.forward(request, response);
			
		} else {
			String msg, loc = "/member/mypagepwcheck.do";
			msg = "비밀번호가 일치하지 않습니다. 다시 입력해주세요.";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);

			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
