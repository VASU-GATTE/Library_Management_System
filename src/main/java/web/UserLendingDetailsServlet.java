package web;

import java.io.IOException;
import java.util.List;

import dao.LendingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Lending;
import model.User;

@WebServlet("/userLendingDetails")
public class UserLendingDetailsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("userId");
            int userId = user.getId();

            LendingDAO lendingDAO = null;
			lendingDAO = new LendingDAO();
            List<Lending> lendings = lendingDAO.getLendingsByUserId(userId);

            request.setAttribute("lendings", lendings);
            request.getRequestDispatcher("lendBook.jsp").forward(request, response);

        } else {
            response.sendRedirect("user_login.jsp"); // Not logged in
        }
    }
}
