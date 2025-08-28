<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Nest - Library Management System</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	

<style>
/* Layout to keep footer at bottom */
html, body {
	height: 100%;
	margin: 0;
	display: flex;
	flex-direction: column;
	font-family: 'Segoe UI', 'Roboto', sans-serif;
}

/* Background Image with Overlay */
body {
	background: url('https://images.unsplash.com/photo-1524995997946-a1c2e315a42f') no-repeat center center/cover;
	color: #fff;
}

/* Navbar */
.navbar {
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.7);
}

.navbar-brand {
	font-size: 1.5rem;
	font-weight: bold;
}

.navbar .btn {
	transition: all 0.3s ease-in-out;
	font-weight: 500;
}

.navbar .btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 6px rgba(255, 255, 255, 0.2);
}

/* Welcome Section */
.welcome-section {
	flex: 1;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background-color: rgba(0, 0, 0, 0.65); /* overlay */
	text-align: center;
	padding: 20px;
}

.welcome-section h1 {
	font-size: 3rem;
	font-weight: bold;
	color: #ffc107;
	text-shadow: 2px 2px 5px #000;
}

.welcome-section p {
	font-size: 1.2rem;
	max-width: 700px;
	margin-top: 20px;
	line-height: 1.6;
}

/* Buttons */
.btn-custom {
	width: 140px;
	margin: 6px;
	font-size: 0.9rem;
	padding: 8px 14px;
	border-radius: 25px;
	font-weight: 500;
	transition: all 0.3s ease-in-out;
}

.btn-custom:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 8px rgba(255, 255, 255, 0.2);
}

/* Footer */
footer {
	background-color: rgba(0, 0, 0, 0.85);
	color: white;
	padding: 15px 0;
	text-align: center;
	font-size: 0.9rem;
}
</style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow-sm">
	<div class="container">
		<a class="navbar-brand" href="#">📚 Book Nest</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-end"
			id="navbarNav">
			<ul class="navbar-nav align-items-center">
				<li class="nav-item mx-2"><a class="btn btn-outline-light" href="about.jsp">About</a></li>
				<li class="nav-item mx-2"><a class="btn btn-outline-light" href="contact.jsp">Contact</a></li>
				<li class="nav-item mx-2"><a class="btn btn-outline-warning" href="manager_login.jsp">Manager Login</a></li>
				<li class="nav-item mx-2"><a class="btn btn-primary" href="user_login.jsp">User Login</a></li>
				<li class="nav-item mx-2"><a class="btn btn-success" href="user_register.jsp">Register</a></li>
			</ul>
		</div>
	</div>
</nav>

<!-- Welcome Section -->
<div class="welcome-section">
	<h1>Welcome to Book Nest</h1>
	<p>Your one-stop solution for managing books, members, and transactions with ease and efficiency.</p>
	<!--<div>
		<a href="books.jsp" class="btn btn-warning btn-custom"><i class="fas fa-book"></i> Books</a>
		<a href="members.jsp" class="btn btn-success btn-custom"><i class="fas fa-user-friends"></i> Members</a>
		<a href="transactions.jsp" class="btn btn-info btn-custom"><i class="fas fa-exchange-alt"></i> Transactions</a>
	</div> -->
</div>

<!-- Footer -->
<footer>
	<small>&copy; 2025 Library Management System. All rights reserved.</small>
</footer>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
