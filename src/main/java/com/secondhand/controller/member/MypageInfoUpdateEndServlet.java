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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.secondhand.common.PasswordEncoding;
import com.secondhand.model.dto.attachment.Attachment;
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
		// 파일 업로드 설정
	    String uploadPath = getServletContext().getRealPath("/resources/upload/member");
	    int maxFileSize = 5 * 1024 * 1024; // 5MB
	    String encoding = "UTF-8";

	    MultipartRequest mr = new MultipartRequest(request, uploadPath, maxFileSize, encoding, new DefaultFileRenamePolicy());

	    // 업로드된 파일 이름 가져오기
	    String originalFileName = mr.getOriginalFileName("member-img");
	    String savedFileName = mr.getFilesystemName("member-img");
	    System.out.println(originalFileName + " " + savedFileName );

	    // 기존 로직
	    String passwordInput = mr.getParameter("password");
	    String password = "";
	    if (passwordInput == null || passwordInput.isEmpty()) {
	        password = null;
	    } else {
	        password = new PasswordEncoding(request).getSHA512(passwordInput);
	    }

	    String phone = mr.getParameter("phone").isEmpty() ? null : mr.getParameter("phone");
	    String address = mr.getParameter("address").isEmpty() ? null : mr.getParameter("address");

	    HttpSession session = request.getSession();
	    Member loginMember = (Member) session.getAttribute("loginMember");

	    Map<String, Object> param = new HashMap<>();
	    
	    // 파일을 수정했으면
	    Attachment attachment = null;
        if (originalFileName != null && savedFileName != null) {
            attachment = Attachment.builder()
					                .fileOriginalName(originalFileName)
					                .fileRename(savedFileName)
					                .attachmentMemberNo(loginMember.getMemberNo())
					                .build();
        }

	    // 동적 쿼리로 업데이트 구현
	    param.put("memberNo", loginMember.getMemberNo());
	    param.put("memberPwd", password);
	    param.put("phone", phone);
	    param.put("address", address);
	    param.put("originalFileName", originalFileName); // 추가
	    param.put("savedFileName", savedFileName); // 추가
	    param.put("attachment", attachment);

	    int result = new MemberService().updateMemberInfo(param);
	    
	    if (savedFileName != null) {
	        // 기존 파일 삭제 처리
	        MemberService memberService = new MemberService();
	        memberService.deleteExistingProfileImage(uploadPath, loginMember.getProfileImageName());
	    }

	    String msg, loc = "/member/mypageinfoupdate.do";
	    if (result > 0) {
	        msg = "회원 정보 수정이 완료되었습니다.";
	        Member m = new MemberService().selectMemberById(loginMember.getMemberId());
	        session.setAttribute("loginMember", m);
	    } else {
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
