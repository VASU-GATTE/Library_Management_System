package web;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import util.DBConnection;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = null;
		userDAO = new UserDAO();
        User user = userDAO.login(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            //session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("customerEmail", user.getEmail());
            session.setAttribute("customerName", user.getName());
            response.sendRedirect("user_dashboard.jsp"); // Redirect to lending details
        } else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("user_login.jsp").forward(request, response);
        }
    }
}
