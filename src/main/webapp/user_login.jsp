<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	/* Professional library background: warm, subtle, elegant */
	background-image: url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?auto=format&fit=crop&w=1470&q=80');
	background-size: cover;
	background-position: center;
	height: 100vh;
	color: white;
	font-family: 'Segoe UI', sans-serif;
}

.login-box {
	margin-top: 10%;
	background: rgba(0, 0, 0, 0.75);
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 0 20px rgba(255, 255, 255, 0.2);
	animation: fadeIn 1.2s ease-in-out;
}

h3 {
	margin-bottom: 20px;
	color: #17a2b8; /* teal blue */
	text-shadow: 1px 1px 3px rgba(0,0,0,0.6);
}

@keyframes fadeIn {
	from { opacity: 0; transform: translateY(-20px); }
	to { opacity: 1; transform: translateY(0); }
}

.btn-custom {
	background-color: #17a2b8;
	border: none;
	color: white;
}
.btn-custom:hover {
	background-color: #138496;
}
</style>
</head>
<body>
	<div class="container text-center">
		<div class="row justify-content-center">
			<div class="col-md-4 login-box">
				<h3>User Login</h3>
				<%
				if (request.getAttribute("error") != null) {
				%>
				<div class="alert alert-danger">
					<%=request.getAttribute("error")%>
				</div>
				<%
				}
				%>
				<form action="UserLoginServlet" method="post">
					<div class="form-group">
						<input type="email" name="email" class="form-control"
							placeholder="Email" required />
					</div>
					<div class="form-group">
						<input type="password" name="password" class="form-control"
							placeholder="Password" required />
					</div>
					<button type="submit" class="btn btn-custom btn-block">Login</button>
					<a href="index.jsp" class="btn btn-light btn-block">Back</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
