package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/library";
	private static final String USER = "root";
	private static final String PASSWORD = "Vasu_gatte@06";

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // Make sure MySQL JDBC driver is in your classpath
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(URL, USER, PASSWORD);
	}
}