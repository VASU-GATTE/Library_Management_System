package web;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import dao.BookDAO;
import dao.LendingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.DBConnection;

@WebServlet("/returnBook")
public class UserReturnBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int lendingId = Integer.parseInt(request.getParameter("lendingId"));
        int bookId = Integer.parseInt(request.getParameter("bookId"));

        LendingDAO lendingDAO = null;
		lendingDAO = new LendingDAO();
        BookDAO bookDAO = null;
		bookDAO = new BookDAO();

        // Set return date to today
        lendingDAO.updateReturnDate(lendingId, Date.valueOf(LocalDate.now()));

        // Update book status to Available
        bookDAO.updateBookStatus(bookId, "Available");

        // Optionally delete the lending record after return
        // lendingDAO.deleteLendingRecord(lendingId);

        response.sendRedirect("lending-details");
    }
}
