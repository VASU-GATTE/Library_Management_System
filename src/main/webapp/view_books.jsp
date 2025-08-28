<%@ page import="java.util.List"%>
<%@ page import="dao.BookDAO"%>
<%@ page import="model.Book"%>
<%
BookDAO bookDAO = new BookDAO();
List<Book> books = bookDAO.getAllBooks();
%>
<!DOCTYPE html>
<html>
<head>
<title>All Books</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-image: url('images/admin-bg.jpg');
	background-size: cover;
	background-repeat: no-repeat;
}

.booking-container {
	background: rgba(255, 255, 255, 0.97);
	padding: 25px;
	margin-top: 50px;
	border-radius: 15px;
}
</style>
</head>
<body>
	<div class="container booking-container">
		<h2 class="text-center">All Books</h2>
		<table class="table table-bordered table-hover">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>Book Title</th>
					<th>Author</th>
					<th>Status</th>
					<th>Category</th>
					<th>Publisher</th>
					<th>Published Year</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Book bk : books) {
				%>
				<tr>
					<td><%=bk.getId()%></td>
					<td><%=bk.getTitle()%></td>
					<td><%=bk.getAuthor()%></td>
					<td><%=bk.getStatus()%></td>
					<td><%=bk.getCategory()%></td>
					<td><%=bk.getPublisher()%></td>
					<td><%=bk.getPublishedYear()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<div class="mt-4 text-center">
				<a href="manager_dashboard.jsp" class="btn btn-warning">Back to dashboard</a>
			</div>
	</div>
</body>
</html>