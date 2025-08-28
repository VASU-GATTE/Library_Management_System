package web;

import java.io.IOException;
import java.util.List;

import dao.LendingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Lending;
import util.DBConnection;

@WebServlet("/manager/lending-details")
public class ManagerLendingDetailsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        LendingDAO lendingDAO = null;
		lendingDAO = new LendingDAO();
        List<Lending> lendings = lendingDAO.getAllLendingDetails();

        request.setAttribute("lendings", lendings);
        request.getRequestDispatcher("/manager/lending-details.jsp").forward(request, response);
    }
}
