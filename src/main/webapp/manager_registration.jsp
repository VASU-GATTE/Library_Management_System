<%@ page language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Manager Registration</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-image:
		url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=1470&q=80');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	font-family: 'Segoe UI', sans-serif;
}

.register-box {
	margin-top: 8%;
	background: rgba(255, 255, 255, 0.92);
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);
}

.register-box h3 {
	margin-bottom: 25px;
	color: #333;
}

.form-control {
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 6px;
}

.btn-primary {
	background-color: #007bff;
	border: none;
}

.btn-primary:hover {
	background-color: #0056b3;
}

.btn-light {
	background-color: #f8f9fa;
	border: 1px solid #ccc;
}

.alert {
	margin-bottom: 15px;
}
</style>
</head>
<body>
	<div class="container text-center">
		<div class="row justify-content-center">
			<div class="col-md-5 register-box">
				<h3>Manager Registration</h3>
				<%
				if (request.getAttribute("error") != null) {
				%>
				<div class="alert alert-danger">
					<%=request.getAttribute("error")%>
				</div>
				<%
				}
				if (request.getAttribute("success") != null) {
				%>
				<div class="alert alert-success">
					<%=request.getAttribute("success")%>
				</div>
				<%
				}
				%>
				<form action="ManagerRegisterServlet" method="post">
					<div class="form-group">
						<input type="text" name="username" class="form-control"
							placeholder="Username" required />
					</div>
					<div class="form-group">
						<input type="email" name="email" class="form-control"
							placeholder="Email" required />
					</div>
					<div class="form-group">
						<input type="password" name="password" class="form-control"
							placeholder="Password" required />
					</div>
					<div class="form-group">
						<input type="password" name="confirmPassword" class="form-control"
							placeholder="ConfirmPassword" required />
					</div>
					<button type="submit" class="btn btn-primary btn-block">Register</button>
					<a href="managerLogin.jsp" class="btn btn-light btn-block">Back
						to Login</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
