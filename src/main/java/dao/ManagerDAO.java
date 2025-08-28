package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Lending;
import model.Manager;
import util.DBConnection;

public class ManagerDAO {

	public Manager login(String name, String password) {
		Manager manager = null;
		try (Connection conn = DBConnection.getConnection();
				PreparedStatement stmt = conn
						.prepareStatement("SELECT * FROM manager WHERE name = ? AND password = ?")) {

			stmt.setString(1, name);
			stmt.setString(2, password);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				manager = new Manager();
				manager.setName(rs.getString("name"));
				manager.setPassword(rs.getString("password"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (manager.getName().equals("vasu11") && manager.getPassword().equals("vasu11")) {
			return manager;
		}
		return null;
	}

	// Get all lending details (with book title and user name)
	public List<Lending> getAllLendingDetails() {
		List<Lending> lendings = new ArrayList<>();
		String sql = "SELECT l.id, l.book_id, l.user_id, l.lent_date, l.return_date, "
				+ "b.title AS book_title, u.name AS user_name " + "FROM lending l " + "JOIN book b ON l.book_id = b.id "
				+ "JOIN users u ON l.user_id = u.id";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Lending lending = new Lending();
				lending.setId(rs.getInt("id"));
				lending.setBookId(rs.getInt("book_id"));
				lending.setUserId(rs.getInt("user_id"));
				lending.setLentDate(rs.getDate("lent_date"));
				lending.setReturnDate(rs.getDate("return_date"));
				lending.setBookTitle(rs.getString("book_title"));
				lending.setUserName(rs.getString("user_name"));

				lendings.add(lending);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return lendings;
	}

	// Update book status (Available or Lent)
	public boolean updateBookStatus(int bookId, String status) {
		String sql = "UPDATE book SET status = ? WHERE id = ?";
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, status);
			ps.setInt(2, bookId);
			return ps.executeUpdate() == 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// Update return date of lending
	public boolean updateReturnDate(int lendingId, Date returnDate) {
		String sql = "UPDATE lending SET return_date = ? WHERE id = ?";
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setDate(1, returnDate);
			ps.setInt(2, lendingId);
			return ps.executeUpdate() == 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// Mark book as returned: update return date and make book available
	public boolean markBookAsReturned(int lendingId, int bookId, Date returnDate) {
		boolean statusUpdated = updateBookStatus(bookId, "Available");
		boolean returnDateUpdated = updateReturnDate(lendingId, returnDate);
		return statusUpdated && returnDateUpdated;
	}

	// Delete a lending record
	public boolean deleteLending(int lendingId) {
		String sql = "DELETE FROM lending WHERE id = ?";
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, lendingId);
			return ps.executeUpdate() == 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
