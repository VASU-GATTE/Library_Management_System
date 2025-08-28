package web;

import java.io.IOException;

import dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/manager/change-book-status")
public class ManagerChangeBookStatusServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String newStatus = request.getParameter("status");

        BookDAO bookDAO = null;
		bookDAO = new BookDAO();

        boolean updated = bookDAO.updateBookStatus(bookId, newStatus);

        if (updated) {
            response.sendRedirect("books");
        } else {
            request.setAttribute("errorMessage", "Failed to update book status.");
            request.getRequestDispatcher("manager-error.jsp").forward(request, response);
        }
    }
}
