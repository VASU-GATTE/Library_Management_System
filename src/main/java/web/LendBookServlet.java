package web;

import java.io.IOException;
import java.sql.Date;

import dao.LendingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Lending;
import util.DBConnection;

@WebServlet("/lendBook")
public class LendBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
//        Date returnDate = Date.valueOf(request.getParameter("returnDate"));

        Lending lending = new Lending();
        lending.setBookId(bookId);
        lending.setUserId(userId);
//        lending.setReturnDate(returnDate);

        LendingDAO lendingDAO = new LendingDAO();
        lendingDAO.addLending(lending);

        response.sendRedirect("user_dashboard.jsp");
    }
}
