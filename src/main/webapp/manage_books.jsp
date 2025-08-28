<%@ page import="java.util.List"%>
<%@ page import="dao.BookDAO"%>
<%@ page import="model.Book"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%
BookDAO dao = new BookDAO();
List<Book> books = dao.getAllBooks();
%>

<!DOCTYPE html>
<html>
<head>
<title>Manage All Books</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-image:
		url('https://images.unsplash.com/photo-1521791136064-7986c2920216?auto=format&fit=crop&w=1500&q=80');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	font-family: 'Segoe UI', sans-serif;
}

.booking-table {
	background-color: rgba(255, 255, 255, 0.96);
	padding: 30px;
	border-radius: 15px;
	margin-top: 50px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
}

.action-buttons {
	display: flex;
	gap: 10px;
}

.action-buttons>* {
	margin-right: 8px;
}

.action-buttons>*:last-child {
	margin-right: 0;
}
</style>
</head>
<body>
	<div class="container">
		<div class="booking-table">
			<h3 class="text-center mb-4">All Books</h3>

			<%
			if (books.isEmpty()) {
			%>
			<div class="alert alert-info text-center">No books available.</div>
			<%
			} else {
			%>
			<table class="table table-bordered table-hover">
				<thead class="thead-dark">
					<tr>
						<th>Book ID</th>
						<th>Title</th>
						<th>Author</th>
						<th>Status</th>
						<th>Category</th>
						<th>Publisher</th>
						<th>Published Year</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Book b : books) {
					%>
					<tr>
						<td><%=b.getId()%></td>
						<td><%=b.getTitle()%></td>
						<td><%=b.getAuthor()%></td>
						<td><%=b.getStatus()%></td>
						<td><%=b.getCategory()%></td>
						<td><%=b.getPublisher()%></td>
						<td><%=b.getPublishedYear()%></td>
						<td>
							<div class="action-buttons">
								<form action="updateBook" method="post" style="display: inline;">
									<input type="hidden" name="id" value="<%=b.getId()%>">
									<input type="hidden" name="title" value="<%=b.getTitle()%>">
									<a href="edit_book.jsp?id=<%=b.getId()%>"
										class="btn btn-sm btn-primary">Update</a>

								</form>
								<form action="deleteBook" method="post" style="display: inline;">
									<input type="hidden" name="id" value="<%=b.getId()%>">
									<input type="hidden" name="title" value="<%=b.getTitle()%>">
								<a href="deleteBook.jsp?id=<%=b.getId()%>"
									class="btn btn-sm btn-danger"
									onclick="return confirm('Are you sure to delete this book?')">Delete</a>
									</form>
							</div>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
			}
			%>

			<div class="text-center mt-3">
				<a href="manager_dashboard.jsp" class="btn btn-secondary">Back
					to Dashboard</a>
			</div>
		</div>
	</div>
</body>
</html>
