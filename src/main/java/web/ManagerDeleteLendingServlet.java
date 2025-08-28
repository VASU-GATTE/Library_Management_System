package web;

import java.io.IOException;
import java.sql.SQLException;

import dao.BookDAO;
import dao.LendingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/manager/delete-lending")
public class ManagerDeleteLendingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int lendingId = Integer.parseInt(request.getParameter("lendingId"));

        LendingDAO lendingDAO = null;
		lendingDAO = new LendingDAO();
        BookDAO bookDAO = null;
		bookDAO = new BookDAO();

        // Get the bookId before deletion so we can update its status
        int bookId = lendingDAO.getBookIdByLendingId(lendingId);

        boolean deleted = lendingDAO.deleteLending(lendingId);

        if (deleted) {
            // Mark the book as available again
            bookDAO.updateBookStatus(bookId, "Available");
            response.sendRedirect("lending");
        } else {
            request.setAttribute("errorMessage", "Failed to delete lending record.");
            request.getRequestDispatcher("manager-error.jsp").forward(request, response);
        }
    }
}
