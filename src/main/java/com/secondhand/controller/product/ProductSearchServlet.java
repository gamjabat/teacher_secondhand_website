package com.secondhand.controller.product;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.model.dto.product.Product;
import com.secondhand.model.service.product.ProductService;

/**
 * Servlet implementation class ProductSearchServlet
 */
@WebServlet("/product/search.do")
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchServlet() {
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
		
		String keyword = request.getParameter("keyword");
		String region = request.getParameter("region");
		String category = request.getParameter("category");
		String transaction = request.getParameter("transaction");
		String sorting = request.getParameter("sorting");
		String trade = request.getParameter("trade");
		String price = request.getParameter("price");

        // Handle possible null or empty price

     
		
        Map<String, Object> filters = new HashMap<>();
        filters.put("keyword", keyword);
        filters.put("region", region);
        filters.put("category", category);
        filters.put("transaction", transaction);
        filters.put("sorting", sorting);
        filters.put("trade", trade);
        filters.put("price", price);
        
        String queryStr = request.getQueryString();
        if (queryStr != null) {
            queryStr = queryStr.replaceAll("&?cPage=[^&]*", ""); // cPage 제거
            queryStr = queryStr.replaceAll("&?numPerPage=[^&]*", ""); // numPerPage 제거
            queryStr = queryStr.replaceAll("^&", ""); // 첫 번째 & 제거
        }

        // Call the service to fetch filtered products
        ProductService productService = new ProductService();
        List<Product> products = productService.searchProducts(filters, param);
        
        int totalData = productService.searchProductsCount(filters);
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
		    pageBar.append("<button class='prev' onclick='window.location.href=\"")
		    		.append(request.getRequestURI() + "?" + queryStr)
		    		.append("&cPage=")
		           .append(cPage - 1)
		           .append("&numPerPage=")
		           .append(numPerPage)
		           .append("\"'>&lt;</button>");
		}

		// 페이지 번호 출력
		while (pageNo <= totalPage && pageNo <= pageEnd) {
			if (pageNo == cPage) {
			    pageBar.append("<span class='page active'></span>");
			} else {
			    pageBar.append("<span class='page' onclick='window.location.href=\"")
			           .append(request.getRequestURI() + "?" + queryStr)
			           .append("&cPage=")
			           .append(pageNo)
			           .append("&numPerPage=")
			           .append(numPerPage)
			           .append("\"'></span>");
			}
		    pageNo++;
		}

		// 다음 페이지 버튼
		if (cPage == totalPage) {
		    pageBar.append("<button class='next' disabled>&gt;</button>");
		} else {
		    pageBar.append("<button class='next' onclick='window.location.href=\"")
		    		.append(request.getRequestURI() + "?" + queryStr)
		           .append("&cPage=")
		           .append(cPage + 1)
		           .append("&numPerPage=")
		           .append(numPerPage)
		           .append("\"'>&gt;</button>");
		}

        // Set products to the request attribute
        request.setAttribute("products", products);
        request.setAttribute("pageBar", pageBar);

        // Forward the request to the JSP for rendering the results
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/product/productSearch.jsp");
        dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
