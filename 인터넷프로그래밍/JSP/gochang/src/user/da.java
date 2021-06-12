package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class da {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private ResultSet rs;
	
	public UserDAO() {
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
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) 
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류		
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserPhonenum());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // db오류
	}
	
	public ArrayList<User> getList()
	{
		String SQL = "SELECT * FROM user";
		ArrayList<User> list = new ArrayList<User>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserPhonenum(rs.getString(4));
				list.add(user);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public int updatePassword(String userID,String userPassword)
	{
		String SQL = "UPDATE user SET userPassword = ? WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userPassword);
			pstmt.setString(2,userID);
			return pstmt.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updateName(String userID,String userName)
	{
		String SQL = "UPDATE USER SET userName = ? WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userName);
			pstmt.setString(2,userID);
			return pstmt.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	} 
	
	public int updatePhonenum(String userID,String userPhonenum)
	{
		String SQL = "UPDATE USER SET userPhonenum = ? WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userPhonenum);
			pstmt.setString(2,userID);
			return pstmt.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	} 
	
	public int delete(String userID)
	{
		String SQL2 = "DELETE FROM USER WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL2);
			pstmt.setString(1,userID);
			return pstmt.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}
	
	public User getID(String userID)
	{
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserPhonenum(rs.getString(4));
				return user;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
}

