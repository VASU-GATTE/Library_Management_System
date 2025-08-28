package web;

import java.io.IOException;
import dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;

@WebServlet("/addBook")
public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Book book = new Book();
        book.setTitle(request.getParameter("title"));
        book.setAuthor(request.getParameter("author"));
        book.setStatus(request.getParameter("status"));
        book.setCategory(request.getParameter("category"));
        book.setPublisher(request.getParameter("publisher"));
        book.setPublishedYear(Integer.parseInt(request.getParameter("publishedYear")));

        BookDAO bookDAO = new BookDAO();
        bookDAO.addBook(book);

        response.sendRedirect("manager_dashboard.jsp");
    }
}
