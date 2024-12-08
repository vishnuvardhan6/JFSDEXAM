<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutritionist Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #4caf50;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            font-weight: bold;
        }
        .navbar a:hover {
            text-decoration: underline;
        }
        .welcome {
            margin: 20px;
            font-size: 24px;
            color: #333;
        }
        .dashboard-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
        }
        .action-card {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            flex: 1;
            min-width: 200px;
            text-align: center;
        }
        .action-card h3 {
            color: #4caf50;
            margin-bottom: 10px;
        }
        .action-card a {
            color: #0066cc;
            text-decoration: none;
            font-weight: bold;
        }
        .action-card a:hover {
            text-decoration: underline;
        }
        .logout {
            text-align: right;
            margin: 20px;
        }
        .logout a {
            color: #ff0000;
            text-decoration: none;
            font-weight: bold;
        }
        .logout a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <span>Nutritionist Dashboard</span>
        <span>
            <a href="nutritionistProfile.jsp">Profile</a>
            <a href="nutritionistClients.jsp">Clients</a>
            <a href="nutritionistDietData.jsp">Diet Data</a>
        </span>
    </div>

    <!-- Welcome Section -->
    <div class="welcome">
        <% 
            String username = (String) session.getAttribute("username");
            if (username != null) {
        %>
            Welcome, <%= username %>! Manage your tasks below:
        <% } else { 
            // If session is invalid, redirect to login
           
        } %>
    </div>

    <!-- Dashboard Actions -->
    <div class="dashboard-actions">
        <div class="action-card">
            <h3>Manage Clients</h3>
            <p>View, add, or update client details.</p>
            <a href="nutritionistClients.jsp">Go to Clients</a>
        </div>
        <div class="action-card">
            <h3>Update Diet Data</h3>
            <p>Manage dietary recommendations and plans.</p>
            <a href="nutritionistDietData.jsp">Update Diet Plans</a>
        </div>
        <div class="action-card">
            <h3>View Reports</h3>
            <p>Analyze progress and generate reports.</p>
            <a href="nutritionistReports.jsp">View Reports</a>
        </div>
    </div>

    <!-- Logout Section -->
    <div class="logout">
        <a href="index.jsp">Logout</a>
    </div>
</body>
</html>
