package goods;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GoodsDAO {

	
	private Connection conn;
	private ResultSet rs;
	
	public GoodsDAO() {
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
	
	public int getNext(int gdCode) {
		String SQL = "SELECT gdID FROM goods WHERE gdCode = ? ORDER BY gdID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, gdCode);
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
	
	
	public ArrayList<Goods> getList(int pageNumber){
		String SQL = "SELECT * FROM goods WHERE gdID < ? AND gdCode = 1 ORDER By gdID DESC LIMIT 5";
		ArrayList<Goods> list = new ArrayList<Goods>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext(1) - (pageNumber-1)*5);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Goods goods = new Goods();
				goods.setGdID(rs.getInt(1));
				goods.setGdName(rs.getString(2));
				goods.setGdContent(rs.getString(3));
				goods.setGdPrice(rs.getInt(4));
				goods.setGdDate(rs.getString(5));
				goods.setGdImage(rs.getString(6));
				list.add(goods);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<Goods> getList2(int pageNumber){
		String SQL = "SELECT * FROM goods WHERE gdID < ? AND gdCode = 2 ORDER By gdID DESC LIMIT 5";
		ArrayList<Goods> list = new ArrayList<Goods>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext(2) - (pageNumber-1)*5);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Goods goods = new Goods();
				goods.setGdID(rs.getInt(1));
				goods.setGdName(rs.getString(2));
				goods.setGdContent(rs.getString(3));
				goods.setGdPrice(rs.getInt(4));
				goods.setGdDate(rs.getString(5));
				goods.setGdImage(rs.getString(6));
				list.add(goods);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber, int gdCode) {
		String SQL = "SELECT * FROM goods WHERE gdID < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*5);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Goods getGoods(int gdID) {
		String SQL = "SELECT * FROM goods WHERE gdID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, gdID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Goods goods = new Goods();
				goods.setGdID(rs.getInt(1));
				goods.setGdName(rs.getString(2));
				goods.setGdContent(rs.getString(3));
				goods.setGdPrice(rs.getInt(4));
				goods.setGdDate(rs.getString(5));
				goods.setGdImage(rs.getString(6));
				return goods;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
}
