<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Manager Dashboard</title>
<link rel="stylesheet"
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
body {
  background-image: url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=1470&q=80');
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  font-family: 'Segoe UI', sans-serif;
  height: 100vh;
  margin: 0;
  color: #fff;
}

/* Dark overlay for readability */
.overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.65);
  z-index: -1;
}

.dashboard-container {
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 40px 20px;
}

.dashboard {
  background-color: rgba(255, 255, 255, 0.95);
  border-radius: 20px;
  box-shadow: 0 0 30px rgba(0,0,0,0.5);
  padding: 40px 30px;
  max-width: 600px;
  width: 100%;
  color: #343a40;
  text-align: center;
  animation: fadeInUp 1s ease forwards;
}

h2 {
  font-weight: 700;
  margin-bottom: 30px;
  color: #17a2b8; /* Teal Blue */
  text-shadow: 1px 1px 5px rgba(0,0,0,0.2);
}

.card-btn {
  display: block;
  background-color: #17a2b8;
  color: white;
  border: none;
  border-radius: 50px;
  font-weight: 600;
  font-size: 1.1rem;
  padding: 12px 0;
  margin: 15px 0;
  box-shadow: 0 6px 15px rgba(23, 162, 184, 0.4);
  transition: background-color 0.3s ease, transform 0.3s ease;
  text-decoration: none;
}

.card-btn:hover {
  background-color: #138496;
  transform: translateY(-4px);
  box-shadow: 0 10px 20px rgba(19, 132, 150, 0.6);
}

.logout-btn {
  background-color: #dc3545;
  box-shadow: 0 6px 15px rgba(220, 53, 69, 0.4);
}

.logout-btn:hover {
  background-color: #b02a37;
  box-shadow: 0 10px 20px rgba(176, 42, 55, 0.6);
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
</head>
<body>
  <div class="overlay"></div>

  <div class="dashboard-container">
    <div class="dashboard">
      <h2>Welcome Manager</h2>

      <a href="view_books.jsp" class="card-btn">📚 View All Books</a>
      <a href="add_book.jsp" class="card-btn">➕ Add New Book</a>
      <a href="manage_books.jsp" class="card-btn">🛠 Manage Books</a>
      <a href="logoutServlet" class="card-btn logout-btn">🚪 Logout</a>
    </div>
  </div>
</body>
</html>
