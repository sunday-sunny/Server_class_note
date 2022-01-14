package com.test.main.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.jdbc.DBUtil;

public class MemberDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MemberDAO() {
		
		try {
			
			conn = DBUtil.open();
			stat = conn.createStatement();
			
			
		} catch (Exception e) {
			System.out.println("MemberDAO.MemberDAO()");
			e.printStackTrace();
		}
	}

	// LoginOk 서블릿이 아이디와 암호를 줄테니 개인 정보를 돌려주세요. > 로그인 처리
	public MemberDTO login(MemberDTO dto) {
		
		try {
			
			// ? > 오라클 매개변수 > %s 역할
			String sql = "select * from tblUser where id = ? and pw = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			// 결과를 받고 > 담고 > return
			if(rs.next()) {
				MemberDTO result = new MemberDTO();
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setLv(rs.getString("lv"));
				
				return result;
			}
			
			
		} catch (Exception e) {
			System.out.println("MemberDTO.login()");
			e.printStackTrace();
		}
		
		return null;
	}

	// Member.java > 아이디를 줄테니 게시물 수를 주세요~
	public int getCount(String id) {
		
		try {
			
			String sql = "select count(*) as cnt from tblBoard where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			rs = pstat.executeQuery(); 

			if(rs.next())
				return rs.getInt("cnt");
			
			
		} catch (Exception e) {
			System.out.println("MemberDAO.getCount()");
			e.printStackTrace();
			
		}
		
		
		return 0;
	}
}
