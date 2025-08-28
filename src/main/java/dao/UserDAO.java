package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Lending;
import model.User;
import util.DBConnection;

public class UserDAO {

    // Login user with email and password
    public User login(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection con=DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                return user;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get all books lent by a user, with book title and dates
    public List<Lending> getUserLendingDetails(int userId) {
        List<Lending> lendings = new ArrayList<>();
        String sql = "SELECT l.id, l.book_id, l.lent_date, l.return_date, b.title AS book_title " +
                     "FROM lending l " +
                     "JOIN books b ON l.book_id = b.id " +
                     "WHERE l.user_id = ?";

        try (
        		Connection con=DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Lending lending = new Lending();
                lending.setId(rs.getInt("id"));
                lending.setBookId(rs.getInt("book_id"));
                lending.setUserId(userId);
                lending.setLentDate(rs.getDate("lent_date"));
                lending.setReturnDate(rs.getDate("return_date"));
                lending.setBookTitle(rs.getString("book_title"));
                lendings.add(lending);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lendings;
    }

    // Optional: Register a new user (if needed)
    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
        try (
        		Connection con=DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
