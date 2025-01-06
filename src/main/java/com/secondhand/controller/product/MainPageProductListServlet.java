package com.secondhand.controller.product;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.secondhand.model.dto.product.Product;
import com.secondhand.model.service.product.ProductService;

/**
 * Servlet implementation class MainPageProductListServlet
 */
@WebServlet("/products.do")
public class MainPageProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage;
		try{
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		
		int numPerPage;
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch(NumberFormatException e) {
			numPerPage = 10;
		}
		
		Map<String, Object> param = Map.of("cPage", cPage, "numPerPage", numPerPage);
		
		List<Product> products = new ProductService().selectProductAll(param);
		
		int totalData = new ProductService().selectProductAllCount();
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=5; // 페이지바에 출력될 숫자의 개수
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo + pageBarSize-1;
		
		//새로운 디자인.
		StringBuilder pageBar = new StringBuilder();
		//pageBar.append("<div class='pagination'>");

		// 이전 페이지 버튼
		if (cPage == 1) {
		    pageBar.append("<button class='prev' disabled>&lt;</button>");
		} else {
		    pageBar.append("<button class='prev' onclick='loadProductList(")
		           .append(cPage - 1)
		           .append(", ")
		           .append(numPerPage)
		           .append(")'>&lt;</button>");
		}

		// 페이지 번호 출력
		while (pageNo <= totalPage && pageNo <= pageEnd) {
			if (pageNo == cPage) {
			    pageBar.append("<span class='page active'></span>");
			} else {
			    pageBar.append("<span class='page' onclick='loadProductList(")
			           .append(pageNo)
			           .append(", ")
			           .append(numPerPage)
			           .append(")'></span>");
			}
		    pageNo++;
		}

		// 다음 페이지 버튼
		if (cPage == totalPage) {
		    pageBar.append("<button class='next' disabled>&gt;</button>");
		} else {
		    pageBar.append("<button class='next' onclick='loadProductList(")
		           .append(cPage + 1)
		           .append(", ")
		           .append(numPerPage)
		           .append(")'>&gt;</button>");
		}

		//pageBar.append("</div>");
		
		
		Map<String, Object> result = Map.of(
	            "products", products,
	            "pageBar", pageBar
	        );

		response.setContentType("application/json; charset=UTF-8");
        new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
