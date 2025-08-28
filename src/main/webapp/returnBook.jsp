<%@ page import="java.util.List" %>
<%@ page import="dao.LendingDAO" %>
<%@ page import="model.Lending" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    LendingDAO dao = new LendingDAO();
    Integer userId = (Integer) session.getAttribute("userId");
    List<Lending> borrowedBooks = dao.getLendingsByUserId(userId);
    int borrowedBookCount = borrowedBooks.size();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Return a Book</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image:
                url('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=1500&q=80');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            font-family: 'Segoe UI', sans-serif;
        }

        .return-form {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 15px;
            margin-top: 60px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            position: relative;
        }

        h2 {
            font-weight: bold;
        }

        .top-right {
            position: absolute;
            top: 20px;
            right: 30px;
        }

        .book-count {
            background-color: #17a2b8;
            color: white;
            padding: 10px 15px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: bold;
            display: inline-block;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }
    </style>
</head>
<body>
    <!-- Logout Button -->
    <div class="top-right">
        <a href="LogoutServlet" class="btn btn-danger btn-sm">Logout</a>
    </div>

    <div class="container">
        <div class="return-form col-md-6 offset-md-3">
            <div class="form-title">
                <h2>Return A Book</h2>
                <div class="book-count">
                    Borrowed: <%= borrowedBookCount %>
                </div>
            </div>

            <%
                if (borrowedBooks.isEmpty()) {
            %>
            <div class="alert alert-warning text-center">You have no borrowed books to return.</div>
            <%
                } else {
            %>
            <form action="returnBook" method="post">
                <div class="form-group">
                    <label>Select Book to Return</label>
                    <select name="bookId" class="form-control" required>
                        <%
                            for (Lending book : borrowedBooks) {
                        %>
                        <option value="<%= book.getId() %>">	
                            Book <%= book.getBookId() %> - <%= book.getUserId() %>
                        </option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary btn-block">Return Book</button>
            </form>
            <%
                }
            %>

            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                String successMessage = (String) request.getAttribute("successMessage");
                if (errorMessage != null) {
            %>
                <div class="alert alert-danger mt-3"><%= errorMessage %></div>
            <%
                } else if (successMessage != null) {
            %>
                <div class="alert alert-success mt-3"><%= successMessage %></div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
