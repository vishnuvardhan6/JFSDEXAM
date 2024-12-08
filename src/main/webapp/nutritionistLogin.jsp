<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutritionist Login</title>
    <style>
    body {
        font-family: 'Arial', sans-serif;
        background-image: url('https://media.istockphoto.com/id/688160148/photo/healthy-food-supplements-concept-hand-of-nutritionist-doctor-touch-digital-tablet-on-symbols.jpg?s=612x612&w=0&k=20&c=6nA7ysERG8oGBr22Rmifl0pKyGV8wGG1ANIleeZMMCQ=');
        background-size: cover;
        background-position: center;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.6);
        z-index: 1;
    }

    .login-container {
        position: relative;
        z-index: 2;
        background: linear-gradient(145deg, #ffffff, #f0f0f0);
        padding: 30px 40px;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
        width: 100%;
        max-width: 400px;
        text-align: center;
        animation: fadeIn 1s ease-out;
    }

    h1 {
        color: #333;
        font-size: 1.8rem;
        margin-bottom: 20px;
        font-weight: bold;
    }

    .form-group {
        margin-bottom: 20px;
        text-align: left;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        font-size: 0.95rem;
        color: #555;
    }

    input {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 1rem;
        outline: none;
        transition: box-shadow 0.3s ease, border-color 0.3s ease;
    }

    input:focus {
        box-shadow: 0 0 8px rgba(255, 165, 0, 0.6); /* Orange glow */
        border-color: #ffa500; /* Orange */
    }

    button {
        background: linear-gradient(145deg, #ffa500, #ffb732); /* Shades of orange */
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 8px;
        width: 100%;
        font-size: 1rem;
        font-weight: bold;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.2s ease;
    }

    button:hover {
        background: linear-gradient(145deg, #ff9900, #ffb732); /* Darker orange */
        transform: translateY(-2px);
    }

    button:active {
        transform: translateY(0);
    }

    .error {
        color: red;
        margin-bottom: 10px;
        font-size: 0.9rem;
    }

    .register-link {
        margin-top: 20px;
        font-size: 0.9rem;
    }

    .register-link a {
        color: #ff7700; /* Orange */
        text-decoration: none;
        font-weight: bold;
    }

    .register-link a:hover {
        text-decoration: underline;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: scale(0.9);
        }
        to {
            opacity: 1;
            transform: scale(1);
        }
    }
</style>
    </head>
<body>
    <div class="overlay"></div>
    <div class="login-container">
        <h1>Nutritionist Login</h1>

        <!-- SQL Verification Logic -->
        <% 
            String errorMessage = "";
            boolean isLoggedIn = false;

            if (request.getMethod().equalsIgnoreCase("POST")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                String jdbcURL = "jdbc:mysql://localhost:3306/nutrition_db";
                String dbUser = "root";
                String dbPassword = "Vishnu@90219";

                Connection connection = null;
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                    String sql = "SELECT * FROM nutritionists WHERE username = ? AND password = ?";
                    preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setString(1, username);
                    preparedStatement.setString(2, password);

                    resultSet = preparedStatement.executeQuery();

                    if (resultSet.next()) {
                        isLoggedIn = true;
                    } else {
                        errorMessage = "Invalid username or password!";
                    }
                } catch (Exception e) {
                    errorMessage = "Error: " + e.getMessage();
                } finally {
                    if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {}
                    if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException e) {}
                    if (connection != null) try { connection.close(); } catch (SQLException e) {}
                }
            }

            if (isLoggedIn) {
                response.sendRedirect("nutritionistDashboard.jsp");
            }
        %>

        <!-- Display error message -->
        <% if (!errorMessage.isEmpty()) { %>
            <p class="error"><%= errorMessage %></p>
        <% } %>

        <!-- Login Form -->
        <form method="POST">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>

        <!-- Register Link -->
        <div class="register-link">
            <p>Don't have an account? <a href="nutritionistRegister.jsp">Register here</a></p>
        </div>
    </div>
</body>
</html>
