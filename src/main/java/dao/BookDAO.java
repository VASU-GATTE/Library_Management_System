package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Book;
import util.DBConnection;

public class BookDAO {


    // Add new book
    public boolean addBook(Book book) {
        String sql = "INSERT INTO book (title, author, status,category,publisher,publishedYear) VALUES (?,?,?,?,?,?)";
        try (Connection con=DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql)) {
        	ps.setString(1, book.getTitle());
        	 ps.setString(2, book.getAuthor());
        	 ps.setString(3, book.getStatus());
        	ps.setString(4,book.getCategory());
           ps.setString(5, book.getPublisher());
           ps.setInt(6, book.getPublishedYear());
           int rowsInserted=ps.executeUpdate();
           if(rowsInserted==1) {
        	   return true;
           }
         
           
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get book by ID
    public Book getBookById(int id) {
        String sql = "SELECT * FROM book WHERE id = ?";
        try (Connection con=DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPublisher(rs.getString("publisher"));
                book.setStatus(rs.getString("status")); 
                System.out.println("Saved: " + book);
                return book;
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get all books
    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM book";
        try (Connection con=DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Book book = new Book(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("author"),
                    rs.getString("status"),
                    rs.getString("category"),
                    rs.getString("publisher"),
                    rs.getInt("publishedYear")
                );
                books.add(book);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    // Get available books
    public List<Book> getAvailableBooks() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM book WHERE status = 'Available'";
        try (
        		Connection con=DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Book book = new Book(
                		rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("status"),
                        rs.getString("category"),
                        rs.getString("publisher"),
                        rs.getInt("publishedYear")
                );
                books.add(book);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    // Update book
    public boolean updateBook(Book book) {
        String sql = "UPDATE book SET title = ?, author = ?, status = ?,category=?,publisher=?,publishedYear=? where id=? ";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getStatus());

            // If category or publisher is null, DB keeps the old value
            ps.setString(4, book.getCategory());
            ps.setString(5, book.getPublisher());

            // Handle year: if it's 0 or negative, keep the old value
            if (book.getPublishedYear() > 0) {
                ps.setInt(6, book.getPublishedYear());
            } else {
                ps.setNull(6, java.sql.Types.INTEGER);
            }

            ps.setInt(7, book.getId());

            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // Update status only
    public boolean updateBookStatus(int id, String status) {
        String sql = "UPDATE book SET status = ? WHERE id = ?";
        try (
        		Connection con=DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, id);
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete book
    public boolean deleteBook(int id) {
        String sql = "DELETE FROM book WHERE id = ?";
        try (
        		Connection con=DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
