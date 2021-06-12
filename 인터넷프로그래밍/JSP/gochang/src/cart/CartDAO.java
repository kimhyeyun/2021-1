package cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CartDAO {
	private Connection conn;
	private ResultSet rs;
	
	public CartDAO() {
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

	
}
