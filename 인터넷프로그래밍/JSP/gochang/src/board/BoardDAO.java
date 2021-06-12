package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {

	
	private Connection conn;
	private ResultSet rs;
	
	public BoardDAO() {
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
		String SQL = "SELECT bdID FROM board ORDER BY bdID DESC";
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
	
	public int write(String bdTitle, String userID, String bdContent) {
		String SQL = "INSERT INTO board VALUES(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bdTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bdContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db오류
	}
	
	public ArrayList<Board> getList(int pageNumber){
		String SQL = "SELECT * FROM board WHERE bdID < ? AND bdAvailable = 1 ORDER By bdID DESC LIMIT 10";
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBdID(rs.getInt(1));
				board.setBdTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBdDate(rs.getString(4));
				board.setBdContent(rs.getString(5));
				board.setBdAvailable(rs.getInt(6));
				list.add(board);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM board WHERE bdID < ? AND bdAvailable = 1";
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
	
	public Board getBoard(int bdID) {
		String SQL = "SELECT * FROM board WHERE bdID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bdID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Board board = new Board();
				board.setBdID(rs.getInt(1));
				board.setBdTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBdDate(rs.getString(4));
				board.setBdContent(rs.getString(5));
				board.setBdAvailable(rs.getInt(6));
				return board;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int bdID, String bdTitle, String bdContent) {
		String SQL = "UPDATE board SET bdTitle = ?, bdContent = ? WHERE bdID= ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bdTitle);
			pstmt.setString(2, bdContent);
			pstmt.setInt(3, bdID);
			return pstmt.executeUpdate(); // 성공할시 0 이상의값 반환
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db오류
	}
	
	
	public int delete(int bdID) {
		String SQL = "UPDATE board SET bdAvailable = 0 WHERE bdID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,bdID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Board> getSearchlist(String keyWord){
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			String SQL = "select *from board where bdTitle like ? AND bdAvailable = 1";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			String key = "%" + keyWord + "%";
			pstmt.setString(1, key);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				board.setBdID(rs.getInt(1));
				board.setBdTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBdDate(rs.getString(4));
				board.setBdContent(rs.getString(5));
				board.setBdAvailable(rs.getInt(6));
				list.add(board);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
