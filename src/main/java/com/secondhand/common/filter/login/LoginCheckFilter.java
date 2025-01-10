package com.secondhand.common.filter.login;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

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

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(urlPatterns = {
        "/mypage/*",
        "/admin/*",
        "/payment/*",
        "/review/*",
        "/report/*",
        "/member/*",
        "/board/*",
        "/product/*"
} )
public class LoginCheckFilter extends HttpFilter implements Filter {
	private static final List<String> EXCLUDED_URLS = Arrays.asList(
	        "/product/productdetail.do",
	        "/member/membersellerinfopage.do",
	        "/product/search.do"
	    );
       
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
		String contextPath = request.getContextPath(); // /SSEULMANHAE
        String uri = request.getRequestURI(); // 전체 URI

        // URI에서 contextPath 제거
        String path = uri.substring(contextPath.length()); // 실제 경로만 추출
		
		// 제외 URL 목록에 있는지 확인
        if (EXCLUDED_URLS.contains(path)) {
            chain.doFilter(request, response); // 필터를 건너뜀
            return;
        }
		
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
