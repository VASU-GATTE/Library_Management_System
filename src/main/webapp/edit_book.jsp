<%@ page import="dao.BookDAO" %>
<%@ page import="model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
String idParam = request.getParameter("id");
if (idParam == null || idParam.isEmpty()) {
    response.sendRedirect("manage_books.jsp");
    return;
}

int bookId = Integer.parseInt(idParam);
BookDAO dao = new BookDAO();
Book book = dao.getBookById(bookId);

if (book == null) {
    response.sendRedirect("manage_books.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Edit Book</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
            padding-top: 50px;
        }
        .edit-form {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="edit-form">
        <h3 class="mb-4">Edit Book</h3>
        <form id="editBookForm" action="updateBook" method="post">
            <input type="hidden" name="id" value="<%=book.getId()%>" />

            <div class="form-group">
                <label>Title</label>
                <input type="text" name="title" class="form-control" value="<%=book.getTitle()%>" required />
            </div>

            <div class="form-group">
                <label>Author</label>
                <input type="text" name="author" class="form-control" value="<%=book.getAuthor()%>" />
            </div>

            <div class="form-group">
                <label>Status</label>
                <select name="status" class="form-control" required>
                    <option value="Available" <%= "Available".equals(book.getStatus()) ? "selected" : "" %>>Available</option>
                    <option value="Not Available" <%= "Not Available".equals(book.getStatus()) ? "selected" : "" %>>Not Available</option>
                </select>
            </div>

           

            <button type="button" class="btn btn-primary" onclick="confirmUpdate()">Save Changes</button>
            <a href="manage_books.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>

<script>
    function confirmUpdate() {
        Swal.fire({
            title: 'Confirm Update',
            text: "Are you sure you want to save the changes?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, update it!'
        }).then((result) => {
            if (result.isConfirmed) {
            	window.location.href = 'manage_books.jsp';
                document.getElementById('editBookForm').submit();
            }
        });
    }
</script>

</body>
</html>
