package com.secondhand.controller.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.secondhand.model.dto.attachment.Attachment;
import com.secondhand.model.dto.member.Member;
import com.secondhand.model.dto.product.Product;
import com.secondhand.model.service.product.ProductService;

/**
 * Servlet implementation class ProductEditEndServlet
 */
@WebServlet("/product/editproduct.do")
public class ProductEditEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductEditEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = getServletContext().getRealPath("/resources/upload/product/");
        int maxSize = 1024 * 1024 * 100;
        String encoding = "UTF-8";

        Map<String, Object> result = new HashMap<>();

        try {
            MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());

            // 상품 정보 수집
            String productNo= mr.getParameter("productNo"); 
            String name = mr.getParameter("productName");
            String category = mr.getParameter("productCategory");
            int price = Integer.parseInt(mr.getParameter("price"));
            String description = mr.getParameter("description");
            String transMethod = mr.getParameter("transMethod");
            String sido = mr.getParameter("sido");
            String gugun = mr.getParameter("gugun");
            String tradeLocation = (transMethod.equals("TMD-2") || sido.equals("시/도 선택") || gugun.equals("구/군 선택")) ? null : sido + " " + gugun;
            String hashtag = mr.getParameter("product-hashtag");

            HttpSession session = request.getSession();
            Member loginMember = (Member) session.getAttribute("loginMember");

            Product updateProduct = Product.builder()
            	.productNo(productNo)
                .productName(name)
                .productCategoryNo(category)
                .price(price)
                .productDescription(description)
                .productMemberNo(loginMember.getMemberNo())
                .transMethodNo(transMethod)
                .tradeLocation(tradeLocation)
                .hashTags(hashtag)
                .build();

            // 파일 정보 수집
            Enumeration<String> fileNames = mr.getFileNames();
            List<Attachment> attachments = new ArrayList<>();
            while (fileNames.hasMoreElements()) {
                String fileParamName = fileNames.nextElement();
                String originalFileName = mr.getOriginalFileName(fileParamName);
                String savedFileName = mr.getFilesystemName(fileParamName);

                if (originalFileName != null && savedFileName != null) {
                    attachments.add(Attachment.builder()
                        .fileOriginalName(originalFileName)
                        .fileRename(savedFileName)
                        .build());
                }
            }

            // 서비스 호출
            ProductService service = new ProductService();
            int productResult = service.updateProduct(updateProduct, attachments);

            if (productResult > 0) {
                result.put("success", true);
                result.put("message", "상품이 성공적으로 수정되었습니다.");
            } else {
                result.put("success", false);
                result.put("message", "상품 수정에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "서버 오류가 발생했습니다.");
        }

        response.setContentType("application/json;charset=utf-8");
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
