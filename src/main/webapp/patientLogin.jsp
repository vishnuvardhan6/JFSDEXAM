<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            background: linear-gradient(45deg, #42a5f5, #478ed1);
            font-family: 'Arial', sans-serif;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 380px;
            text-align: center;
        }
        h1 {
            font-size: 30px;
            margin-bottom: 25px;
            font-weight: 700;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        label {
            font-size: 14px;
            font-weight: 600;
            color: #ddd;
            text-align: left;
        }
        input {
            padding: 14px;
            border: none;
            border-radius: 8px;
            background-color: #ffffff;
            font-size: 16px;
            color: #333;
            transition: background-color 0.3s ease;
        }
        input:focus {
            outline: none;
            background-color: #e1f5fe;
        }
        button {
            padding: 14px;
            background-color: #ff4081;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #f50057;
        }
        .error {
            color: #ff5252;
            font-size: 14px;
            margin-bottom: 15px;
        }
        .link-container {
            margin-top: 20px;
            font-size: 14px;
        }
        .link-container a {
            color: #80deea;
            text-decoration: none;
            font-weight: 600;
        }
        .link-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Patient Login</h1>
        <% 
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String errorMessage = "";

            if (email != null && password != null) {
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    // Load MySQL driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish connection with the database
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nutrition_db", "root", "Vishnu@90219");

                    // Query to check login credentials
                    String query = "SELECT * FROM patients WHERE email = ? AND password = ?";
                    ps = conn.prepareStatement(query);
                    ps.setString(1, email);
                    ps.setString(2, password);
                    rs = ps.executeQuery();

                    // If user is found, redirect to the dashboard
                    if (rs.next()) {
                        response.sendRedirect("healthDashboard.jsp");
                    } else {
                        errorMessage = "Invalid email or password.";
                    }
                } catch (Exception e) {
                    // Handle error if any exception occurs
                    errorMessage = "An error occurred: " + e.getMessage();
                } finally {
                    // Close the resources
                    try { 
                        if (rs != null) rs.close(); 
                        if (ps != null) ps.close(); 
                        if (conn != null) conn.close(); 
                    } catch (Exception ignored) {}
                }
            }
        %>
        
        <!-- Display error message if login fails -->
        <% if (!errorMessage.isEmpty()) { %>
            <p class="error"><%= errorMessage %></p>
        <% } %>

        <!-- Login form -->
        <form action="patientLogin.jsp" method="POST">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
            <button type="submit">Login</button>
        </form>
        
        <!-- Registration link -->
        <div class="link-container">
            <p>Don't have an account? <a href="patientRegister.jsp">Register here</a></p>
        </div>
    </div>
</body>
</html>
