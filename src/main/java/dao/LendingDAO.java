package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Lending;
import util.DBConnection;

public class LendingDAO {


    // ✅ Insert a new lending record
    public boolean addLending(Lending lending) {
        String sql = "INSERT INTO lending (book_id, user_id, lent_date, return_date) VALUES (?, ?, ?, ?)";
        try (Connection con=DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, lending.getBookId());
            ps.setInt(2, lending.getUserId());
            ps.setDate(3, lending.getLentDate());
            ps.setDate(4, lending.getReturnDate());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Get all lending records (for manager)
    public List<Lending> getAllLendingsWithUserAndBook() {
        List<Lending> list = new ArrayList<>();
        String sql = "SELECT l.id, l.book_id, l.user_id, l.lent_date, l.return_date, " +
                     "b.title AS book_title, u.name AS user_name " +
                     "FROM lending l " +
                     "JOIN book b ON l.book_id = b.id " +
                     "JOIN users u ON l.user_id = u.id";

        try (
        		Connection con=DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Lending l = new Lending();
                l.setId(rs.getInt("id"));
                l.setBookId(rs.getInt("book_id"));
                l.setUserId(rs.getInt("user_id"));
                l.setLentDate(rs.getDate("lent_date"));
                l.setReturnDate(rs.getDate("return_date"));
                l.setBookTitle(rs.getString("book_title"));
                l.setUserName(rs.getString("user_name"));
                list.add(l);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ Get all lending records for a specific user (for user login)
    public List<Lending> getLendingsByUserId(int userId) {
        List<Lending> list = new ArrayList<>();
        String sql = "SELECT l.id, l.book_id, l.lent_date, l.return_date, b.title AS book_title " +
                     "FROM lending l " +
                     "JOIN book b ON l.book_id = b.id " +
                     "WHERE l.user_id = ?";

        try (Connection con=DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Lending l = new Lending();
                l.setId(rs.getInt("id"));
                l.setBookId(rs.getInt("book_id"));
                l.setUserId(userId);
                l.setLentDate(rs.getDate("lent_date"));
                l.setReturnDate(rs.getDate("return_date"));
                l.setBookTitle(rs.getString("book_title"));
                list.add(l);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ Optional: Delete lending record
    public boolean deleteLending(int id) {
        String sql = "DELETE FROM lending WHERE id = ?";
        try (Connection con=DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Optional: Update return date
    public boolean updateReturnDate(int id, Date newReturnDate) {
        String sql = "UPDATE lending SET return_date = ? WHERE id = ?";
        try (
        		Connection con=DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDate(1, newReturnDate);
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

	public List<Lending> getAllLendingDetails() {
		// TODO Auto-generated method stub
		return null;
	}
	public int getBookIdByLendingId(int lendingId) {
	    String sql = "SELECT book_id FROM lending WHERE id = ?";
	    try (Connection con=DBConnection.getConnection();
	    		PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setInt(1, lendingId);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            return rs.getInt("book_id");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return -1; // Return -1 if not found
	}

}
