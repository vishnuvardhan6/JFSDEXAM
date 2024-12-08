<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Registration</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: url('https://max-website20-images.s3.ap-south-1.amazonaws.com/Tuberculosis_Diet_7c38785313.jpg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        color: #333;
    }
    .register-container {
        background-color: rgba(255, 255, 255, 0.5);
        padding: 30px 40px;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
        text-align: center;
    }
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #4a4a4a;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        label {
            font-weight: 600;
            text-align: left;
            margin-bottom: 5px;
        }
        input {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background: #f3f4f6;
            font-size: 14px;
            transition: box-shadow 0.3s ease;
        }
        input:focus {
            outline: none;
            box-shadow: 0 0 8px rgba(0, 118, 255, 0.3);
        }
        button {
            background: #6a11cb;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #500dab;
        }
        .error {
            color: #ff0033;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .link-container {
            margin-top: 20px;
            font-size: 14px;
        }
        a {
            color: #6a11cb;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h1>Patient Registration</h1>
        <% 
            // Get the parameters from the form
            String fullName = request.getParameter("name");  // Change name to fullName
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String phone = request.getParameter("phone");
            String errorMessage = "";
            String successMessage = "";

            if (fullName != null && email != null && password != null && confirmPassword != null && phone != null) {
                if (!password.equals(confirmPassword)) {
                    errorMessage = "Passwords do not match.";
                } else {
                    Connection conn = null;
                    PreparedStatement ps = null;

                    try {
                        // Load the database driver and establish connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nutrition_db", "root", "Vishnu@90219");

                        // Corrected query
                        String query = "INSERT INTO patients (full_name, email, password, phone) VALUES (?, ?, ?, ?)";
                        ps = conn.prepareStatement(query);
                        ps.setString(1, fullName);  // Use fullName
                        ps.setString(2, email);
                        ps.setString(3, password);
                        ps.setString(4, phone);
                        ps.executeUpdate();
                        successMessage = "Registration successful. You can now <a href='patientLogin.jsp'>login</a>.";
                    } catch (Exception e) {
                        errorMessage = "An error occurred: " + e.getMessage();
                    } finally {
                        try { 
                            if (ps != null) ps.close(); 
                            if (conn != null) conn.close(); 
                        } catch (Exception ignored) {}
                    }
                }
            }
        %>

        <!-- Display any error or success messages -->
        <% if (!errorMessage.isEmpty()) { %>
            <p class="error"><%= errorMessage %></p>
        <% } %>
        <% if (!successMessage.isEmpty()) { %>
            <p style="color: green; font-size: 14px;"><%= successMessage %></p>
        <% } %>

        <!-- Registration form -->
        <form action="patientRegister.jsp" method="POST">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" placeholder="Enter your full name" required>
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
            <label for="phone">Phone</label>
            <input type="text" id="phone" name="phone" placeholder="Enter your phone number" required>
            <button type="submit">Register</button>
        </form>

        <div class="link-container">
            <p>Already have an account? <a href="patientLogin.jsp">Login here</a></p>
        </div>
    </div>
</body>
</html>
