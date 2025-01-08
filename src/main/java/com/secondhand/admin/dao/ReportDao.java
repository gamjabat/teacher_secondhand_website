package com.secondhand.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.secondhand.admin.dto.Report;


public class ReportDao {
	public String generateReportNo(SqlSession session) {
		return session.selectOne("report.generateReportNo");
	}
	public int insertReport(SqlSession session, Report r) {
		return session.insert("report.insertReport", r);
	}
	public Report selectReportByNo(SqlSession session, String reportNo) {
	    return session.selectOne("report.selectReportByNo", reportNo);
	}
	public List<Report> selectAllreports(SqlSession session,Map<String, Integer> param) {
	    return session.selectList("report.selectAllreports",null,new RowBounds(
				(param.get("cPage")-1)*param.get("numPerPage"),param.get("numPerPage")));
	}
	 //페이징 처리
    public List<Report> selectPagingReport(SqlSession session, Map<String, Integer> param) {
    		int cPage = param.get("cPage");
    		int numPerPage = param.get("numPerPage");
    		
    		return session.selectList("report.selectAllreports", 
    				Map.of("start",(cPage-1)*numPerPage+1, "end", cPage*numPerPage ));
    }
    public int selectReportCount(SqlSession session) {
    	return session.selectOne("report.selectReportCount");
    }
    
    public int updateReport(SqlSession session, Report report) {
        return session.update("report.updateReport", report);
    }
    
    //마이페이지 신고내역.
    public List<Map<String, Object>> getReportPurchaseHistory(SqlSession session, Map<String, Object> param) {
		int cPage = (int)param.get("cPage");
		int numPerPage = (int)param.get("numPerPage");
		
		param.put("start", (cPage-1)*numPerPage+1);
		param.put("end", cPage*numPerPage);
		return session.selectList("report.getReportPurchaseHistory", param);
	}
    //마이페이지 신고내역.
	public int getPurchaseHistoryCount(SqlSession session, String memberNo) {
    	return session.selectOne("report.getPurchaseHistoryCount", memberNo);
    }
}
