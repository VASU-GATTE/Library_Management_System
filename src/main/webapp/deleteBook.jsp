<%@ page import="dao.BookDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Delete Book</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="bg-light d-flex justify-content-center align-items-center" style="height:100vh;">

<%
String idParam = request.getParameter("id");
if (idParam == null || idParam.isEmpty()) {
    response.sendRedirect("manage_books.jsp");
    return;
}

int bookId = Integer.parseInt(idParam);
BookDAO dao = new BookDAO();
boolean deleted = dao.deleteBook(bookId);
%>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        <% if (deleted) { %>
        Swal.fire({
            icon: 'success',
            title: 'Deleted!',
            text: 'The book was deleted successfully.',
            timer: 2000,
            showConfirmButton: true
        }).then(() => {
            window.location.href = 'manage_books.jsp';
        });
        <% } else { %>
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Failed to delete the book.',
            confirmButtonText: 'Back to Books'
        }).then(() => {
            window.location.href = 'manage_books.jsp';
        });
        <% } %>
    });
</script>

</body>
</html>
