package com.test.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
	
	
	public String get(String seq) {
		try {
			String sql = "select subject from tblBoard where seq=" + seq ;
			rs = stat.executeQuery(sql);
			
			if(rs.next()) return rs.getString("subject");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("AjaxDAO.get()");
		}
		
		return null;
	}

	
	public ArrayList<String> list() {
		
		try {
			String sql = "select subject from tblBoard";
			rs = stat.executeQuery(sql);
			
			ArrayList<String> list = new ArrayList<String>();
			while(rs.next())
				list.add(rs.getString("subject"));
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public MemberDTO getMember(String id) {
		
		try {
			String sql = "select * from tblUser where id = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setLv(rs.getString("lv"));
				dto.setPw(rs.getString("pw"));
				
				return dto;
			}
			
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.getMember()");
			e.printStackTrace();
			
		}
		
		
		return null;
	}

	public ArrayList<MemberDTO> mlist() {
		
		try {
			String sql = "select * from tblUser";
			rs = stat.executeQuery(sql);
			
			ArrayList<MemberDTO> mlist = new ArrayList<MemberDTO>();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setLv(rs.getString("lv"));
				dto.setPw(rs.getString("pw"));
				
				mlist.add(dto);
			}
			
			return mlist;
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.mlist()");
			e.printStackTrace();
			
		}
		
		return null;
	}

	public int add(MemberDTO dto) {
		
		try {
			String sql = "insert into tblUser (id, pw, name, lv) values (?, ?, ?, default)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.add()");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public int check(String id) {
		
		try {
			String sql = "select count(*) as cnt from tblUser where id = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			rs = pstat.executeQuery();
			
			if(rs.next()) return rs.getInt("cnt");
			
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.check()");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public void updatePoint(PointDTO dto) {
		
		try {
			String sql = "update tblIcon set x = ?, y = ? where icon_id = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getX());
			pstat.setString(2, dto.getY());
			pstat.setString(3, dto.getId());
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.updatePoint()");
			e.printStackTrace();
		}
		
		
	}
	
	// ex05.java > listPoint 
	public ArrayList<PointDTO> listPoint() {
		
		try {
			String sql = "select * from tblIcon";
			rs = stat.executeQuery(sql);
			
			ArrayList<PointDTO> list = new ArrayList<PointDTO>();
			
			while(rs.next()) {
				PointDTO dto = new PointDTO();
				dto.setId(rs.getString("icon_id"));
				dto.setX(rs.getString("x"));
				dto.setY(rs.getString("y"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.listPoint()");
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	
	// ex06.java > 
	public int del(String id) {
		
		try {
			String sql = "delete from tblUser where = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.del()");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public ArrayList<BoardDTO> listBoard(int begin) {
		
		try {
			String sql = "select * from ("
					+ "select a.*, rownum as rnum from (select * from vwBoard order by thread desc) a) where rnum between ? and ?";
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, begin);
			pstat.setInt(2, begin+2);
			rs = pstat.executeQuery();
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.listBoard()");
			e.printStackTrace();
		}
		
		return null;
	}

}
