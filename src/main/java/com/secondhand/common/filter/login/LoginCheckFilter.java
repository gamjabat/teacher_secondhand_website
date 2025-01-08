package com.secondhand.common.filter.login;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.secondhand.common.PasswordEncoding;
import com.secondhand.model.dto.member.Member;
import com.secondhand.model.service.member.MemberService;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(servletNames = {
				"productchattingservlet"
				,"paymentpageservlet"
				,"mypagepurchasehistoryservlet"
				,"adminmainservlet"
				,"productinsertservlet"
				,"cartlistservlet"
				,"wishlistservlet"
				,"paymentservlet"
				,"paymentdetailservlet"
				,"insertReviewServlet"
		} )
public class LoginCheckFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginCheckFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession session  = request.getSession();
		
		if(session.getAttribute("loginMember")==null) {
			// 로그인 실패
			request.setAttribute("msg", "로그인후 이용가능합니다. 로그인하세요.");
			request.setAttribute("loc", "/login/loginpage.do");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
