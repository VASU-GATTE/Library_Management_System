<%@ page import="java.util.List"%>
<%@ page import="dao.BookDAO"%>
<%@ page import="model.Book"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%
BookDAO dao = new BookDAO();
List<Book> books = dao.getAvailableBooks();
int availableBookCount = books.size();

Integer userId = (Integer) session.getAttribute("userId");
String customerName = (String) session.getAttribute("userName");
String customerEmail = (String) session.getAttribute("userEmail");
%>

<!DOCTYPE html>
<html>
<head>
<title>Borrow a Book</title>
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

.booking-form {
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

.room-count {
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
	<!-- ✅ Logout Button -->
	<div class="top-right">
		<a href="LogoutServlet" class="btn btn-danger btn-sm">Logout</a>
	</div>

	<div class="container">
		<div class="booking-form col-md-6 offset-md-3">
			<div class="form-title">
				<h2>Lend A Book</h2>
				<div class="room-count">
					Available:
					<%=availableBookCount%></div>
			</div>

			<%
			if (books.isEmpty()) {
			%>
			<div class="alert alert-warning text-center">No available Books
				at the moment. Please check back later.</div>
			<%
			} else {
			%>
			<form action="lendBook" method="post">
				<div class="form-group">
					<label>User Id</label> <input type="number" name="userId"
						class="form-control"
						value="<%= session.getAttribute("userId") %>" readonly>
				</div>
				<div class="form-group">
					<label>User Email</label> <input type="email"
						name="userEmail" class="form-control"
						value="<%= session.getAttribute("userEmail") %>" readonly>
				</div>
				<div class="form-group">
					<label>Select Book</label> <select name="bookId"
						class="form-control" required>
						<%
						for (Book book : books) {
						%>
						<option value="<%=book.getId()%>">Book
							<%=book.getId()%> -
							<%=book.getTitle()%>
						</option>
						<%
						}
						%>
					</select>
				</div>
							<!-- ✅ Added numberOfDays input -->
				<div class="form-group">
					<label>Number of Days</label> <input type="number"
						name="numberOfDays" class="form-control" min="1" max="30" 
						oninvalid="this.setCustomValidity('Number of days cannot exceed 30')"
						oninput="this.setCustomValidity('')" required>
				</div>

				<button type="submit" class="btn btn-success btn-block">Borrow
					Now</button>
			</form>
			<%
			}
			%>

			<%
			String errorMessage = (String) request.getAttribute("errorMessage");
			if (errorMessage != null) {
			%>
			<div class="alert alert-danger mt-3"><%=errorMessage%></div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>