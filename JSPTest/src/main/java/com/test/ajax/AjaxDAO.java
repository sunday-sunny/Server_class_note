package com.test.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.jdbc.DBUtil;

public class AjaxDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public AjaxDAO() {
		try {
			
			conn = DBUtil.open();
			stat = conn.createStatement();
			
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.AjaxDAO()");
			e.printStackTrace();
		}
	}
	
	public int count() {
		
		try {
			
			String sql = "select count(*) as cnt from tblBoard";
			rs = stat.executeQuery(sql);
			
			if(rs.next())
				return rs.getInt("cnt");
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.count()");
			e.printStackTrace();
		}
		
		return 0;
	}

}
