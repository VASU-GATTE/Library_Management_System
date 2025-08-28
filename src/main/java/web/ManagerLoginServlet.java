package web;

import java.io.IOException;

import dao.ManagerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Manager;

@WebServlet("/ManagerLoginServlet")
public class ManagerLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("username");
        String password = request.getParameter("password");

        ManagerDAO managerDAO = new ManagerDAO();
        Manager manager = managerDAO.login(name, password); // return Manager object or null

        if (manager != null) {
            HttpSession session = request.getSession();
            session.setAttribute("managerName", manager.getName()); // manager.getName() is valid now
            response.sendRedirect("manager_dashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid credentials");
            request.getRequestDispatcher("manager_login.jsp").forward(request, response);
        }
    }
}
