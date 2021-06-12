package notice;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import notice.Notice;

public class NoticeDAO {
	private Connection conn;
	private ResultSet rs;
	
	public NoticeDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/annawa?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "71540976";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // db오류
	}
	
	public int getNext() {
		String SQL = "SELECT ntID FROM notice ORDER BY ntID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db오류
	}
	
	public int write(String ntTitle, String userID, String ntContent) {
		String SQL = "INSERT INTO notice VALUES(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, ntTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, ntContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db오류
	}
	
	public ArrayList<Notice> getList(int pageNumber){
		String SQL = "SELECT * FROM notice WHERE ntID < ? AND ntAvailable = 1 ORDER By ntID DESC LIMIT 10";
		ArrayList<Notice> list = new ArrayList<Notice>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Notice notice = new Notice();
				notice.setNtID(rs.getInt(1));
				notice.setNtTitle(rs.getString(2));
				notice.setUserID(rs.getString(3));
				notice.setNtDate(rs.getString(4));
				notice.setNtContent(rs.getString(5));
				notice.setNtAvailable(rs.getInt(6));
				list.add(notice);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM notice WHERE ntID < ? AND ntAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Notice getNotice(int ntID) {
		String SQL = "SELECT * FROM notice WHERE ntID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ntID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Notice notice = new Notice();
				notice.setNtID(rs.getInt(1));
				notice.setNtTitle(rs.getString(2));
				notice.setUserID(rs.getString(3));
				notice.setNtDate(rs.getString(4));
				notice.setNtContent(rs.getString(5));
				notice.setNtAvailable(rs.getInt(6));
				return notice;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int ntID, String ntTitle, String ntContent) {
		String SQL = "UPDATE notice SET ntTitle = ?, ntContent = ? WHERE ntID= ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ntTitle);
			pstmt.setString(2, ntContent);
			pstmt.setInt(3, ntID);
			return pstmt.executeUpdate(); // 성공할시 0 이상의값 반환
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db오류
	}
	
	
	public int delete(int ntID) {
		String SQL = "UPDATE notice SET ntAvailable = 0 WHERE ntID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,ntID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

}
