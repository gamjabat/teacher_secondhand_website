package com.secondhand.controller.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
 * Servlet implementation class MypageInfoUpdateEndServlet
 */
@WebServlet("/member/mypageinfoupdateend.do")
public class MypageInfoUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageInfoUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		PasswordEncoding pe = new PasswordEncoding(request);
		String passwordInput = request.getParameter("password");
		String password = "";
		if (request.getParameter("password").equals("")) {
		    password = null; // 필요 시 null로 처리
		} else {
			password = pe.getParameter("password");
		}
		String phone = request.getParameter("phone").equals("")?null:request.getParameter("phone");
		String address = request.getParameter("address").equals("")?null:request.getParameter("address");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		//동적쿼리로 업데이트 구현
		
		System.out.println(passwordInput+"input"+password+ "p"+phone+ "a"+address);
		
		Map<String, Object> param = new HashMap<>();
		
		param.put("memberNo", loginMember.getMemberNo());
		param.put("memberPwd", password);
		param.put("phone", phone);
		param.put("address", address);
		
		int result = new MemberService().updateMemberInfo(param);
		
		String msg, loc = "/member/mypageinfoupdate.do";
		
		if(result > 0) {
			msg = "회원 정보 수정이 완료되었습니다.";
			Member m = new MemberService().selectMemberById(loginMember.getMemberId());
			session.setAttribute("loginMember", m);
		}else {
			msg = "회원 정보 수정이 실패 되었습니다. 다시 시도해주세요.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		response.setContentType("text/html;charset=utf-8");
		
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
