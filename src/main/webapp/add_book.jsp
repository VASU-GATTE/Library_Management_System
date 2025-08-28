<!DOCTYPE html>
<html>
<head>
<title>Add Book</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-image:
		url('https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1500&q=80');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	font-family: 'Segoe UI', sans-serif;
}

.form-container {
	background-color: rgba(255, 255, 255, 0.95);
	padding: 30px;
	border-radius: 15px;
	margin-top: 60px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
}

h3 {
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<div class="form-container col-md-6 offset-md-3">
			<h3 class="text-center">Add New Book</h3>
			<form action="addBook" method="post">
				<div class="form-group">
					<label>Book Title</label> <input type="text" class="form-control" name="title">
				</div>
				<div class="form-group">
					<label>Author</label> <input type="text" name="author"
						class="form-control" required>
				</div>
				<div class="form-group">
					<label>Status</label> <select name="status" class="form-control">
						<option value="available">Available</option>
						<option value="Not avaliable">Not Available</option>
					</select>
				</div>
				<div class="form-group">
					<label>Category</label> <input type="text" class="form-control" name="category">
				</div>
				<div class="form-group">
					<label>Publisher</label> <input type="text" class="form-control" name="publisher">
				</div>
				<div class="form-group">
					<label>Published Year</label> <input type="text" class="form-control" name="publishedYear">
				</div>
				
				
				<button type="submit" class="btn btn-success btn-block">Add
					Book</button>
				<a href="manager_dashboard.jsp" class="btn btn-secondary btn-block">Cancel</a>
			</form>
		</div>
	</div>
</body>
</html>