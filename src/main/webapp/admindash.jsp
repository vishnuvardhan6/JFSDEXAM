<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/nutrition_db";
    String dbUser = "root";
    String dbPassword = "Vishnu@90219";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    int patientCount = 0;
    int nutritionistCount = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        statement = connection.createStatement();

        resultSet = statement.executeQuery("SELECT COUNT(*) AS count FROM patients");
        if (resultSet.next()) {
            patientCount = resultSet.getInt("count");
        }

        resultSet = statement.executeQuery("SELECT COUNT(*) AS count FROM nutritionists");
        if (resultSet.next()) {
            nutritionistCount = resultSet.getInt("count");
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (resultSet != null) try { resultSet.close(); } catch (SQLException ignored) {}
        if (statement != null) try { statement.close(); } catch (SQLException ignored) {}
        if (connection != null) try { connection.close(); } catch (SQLException ignored) {}
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - HealthhubPro</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Global Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* General Body Styling */
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #e0eafc, #cfdef3);
            min-height: 100vh;
            color: #333;
        }

        /* Header Section */
        header {
            background: #4CAF50;
            color: #fff;
            padding: 15px 0;
            text-align: center;
            font-size: 24px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-bottom: 4px solid #2E7D32;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        /* Main Dashboard Container */
        .container {
            padding: 20px;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Dashboard Cards */
        .option-card {
            background: #fff;
            width: 250px;
            height: 250px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease-in-out;
            text-align: center;
        }

        .option-card:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        /* Title and Counts Styling */
        .option-card h3 {
            font-size: 18px;
            color: #555;
            margin-bottom: 10px;
        }

        .option-card p {
            font-size: 20px;
            color: #2c89c5;
            font-weight: bold;
            margin: 5px 0;
        }

        /* Footer Section */
        footer {
            margin: 30px 0;
            text-align: center;
            color: #555;
            font-size: 14px;
        }

        /* Responsive Cards */
        @media screen and (max-width: 768px) {
            .option-card {
                width: 100%;
            }
        }

        @media screen and (max-width: 480px) {
            header {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <header>
        <h1>HealthHub Admin Dashboard</h1>
    </header>

    <!-- Main Container with Dashboard Cards -->
    <div class="container">
        <!-- Patients Section -->
        <div class="option-card">
            <i class="fa fa-users fa-3x" style="color:#2c89c5;"></i>
            <h3>Patients</h3>
            <p><%= patientCount %></p>
            <a href="viewPatients.jsp" style="color: #2c89c5; text-decoration: none; font-weight: bold;">View Patients</a>
        </div>

        <!-- Nutritionists Section -->
        <div class="option-card">
            <i class="fa fa-user-md fa-3x" style="color:#2c89c5;"></i>
            <h3>Nutritionists</h3>
            <p><%= nutritionistCount %></p>
            <a href="viewNutritionists.jsp" style="color: #2c89c5; text-decoration: none; font-weight: bold;">View Nutritionists</a>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2024 HealthHub. All rights reserved.</p>
    </footer>
</body>
</html>
