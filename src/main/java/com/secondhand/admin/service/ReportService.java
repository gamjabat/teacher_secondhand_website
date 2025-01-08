package com.secondhand.admin.service;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.admin.dao.ReportDao;
import com.secondhand.admin.dto.Report;



public class ReportService {
	private ReportDao dao=new ReportDao();
	
	public int insertReport(Report r) {
		SqlSession session = getSession();
		try {
	      
	        String reportNo = dao.generateReportNo(session); 
	        r.setReportNo(reportNo); 

	     
	        int result = dao.insertReport(session, r);
	        if (result <= 0) {
	            session.rollback();
	            throw new RuntimeException("신고 등록 실패");
	        }

	      
	        session.commit();
	        return result;

	    } catch (Exception e) {
	        session.rollback();
	        throw new RuntimeException("등록 중 오류 발생: " + e.getMessage());
	    } finally {
	        session.close();
	    }
	}
	
	public Report selectByBoardNo(String reportNo) {
		 
		 SqlSession session = getSession();
		 Report qb = dao.selectReportByNo(session, reportNo);
		 session.close();
		 return qb;   
	}
	
	public List<Report> selectAllreports(Map<String, Integer> param) {
        try (SqlSession session = getSession()) {
            ReportDao dao = new ReportDao();
            return dao.selectAllreports(session,param);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to fetch QnA boards", e);
        }
    }
	 // 게시물 페이징바
	 public List<Report> selectPagingReport(Map<String, Integer> param) {
		 SqlSession session = getSession();
		 List<Report> report = dao.selectPagingReport(session, param);
		 session.close();
		 return report;
	 }
	// 총 개수 
		 public int selectReportCount() {
			 SqlSession session = getSession();
			 int count = dao.selectReportCount(session);
			 session.close();
			 return count;
		 }
}
