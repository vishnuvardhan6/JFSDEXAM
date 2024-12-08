<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Diet Plan</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            background: linear-gradient(45deg, #8e44ad, #3498db);
            font-family: 'Arial', sans-serif;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .diet-plan-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 700px;
            text-align: center;
        }
        h1 {
            font-size: 30px;
            margin-bottom: 30px;
            font-weight: 700;
        }
        .diet-plan-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .diet-plan-table th, .diet-plan-table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        .diet-plan-table th {
            background-color: #6c5ce7;
            color: white;
        }
        .diet-plan-table td {
            background-color: #ffffff;
            color: #333;
        }
        .diet-plan-table tr:nth-child(even) {
            background-color: #f3f4f6;
        }
        .diet-plan-table td span {
            font-weight: bold;
        }
        .back-button {
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #ff4081;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .back-button:hover {
            background-color: #f50057;
        }
        .message {
            font-size: 16px;
            color: #ffeb3b;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="diet-plan-container">
        <h1>Your Personalized Diet Plan</h1>
        
        <% 
            String userId = request.getParameter("userId"); // Assuming you have the user's ID passed as a parameter
            String message = "";

            if (userId != null) {
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    // Load MySQL driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish connection with the database
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nutrition_db", "root", "Vishnu@90219");

                    // Query to get the user's diet plan based on userId
                    String query = "SELECT * FROM diet_plans WHERE user_id = ?";
                    ps = conn.prepareStatement(query);
                    ps.setString(1, userId);
                    rs = ps.executeQuery();

                    // Check if a diet plan exists for the user
                    if (rs.next()) {
        %>

                    <!-- Display diet plan table -->
                    <table class="diet-plan-table">
                        <thead>
                            <tr>
                                <th>Meal Type</th>
                                <th>Meal Description</th>
                                <th>Calories</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                do {
                            %>
                            <tr>
                                <td><%= rs.getString("meal_type") %></td>
                                <td><%= rs.getString("meal_description") %></td>
                                <td><%= rs.getInt("calories") %></td>
                            </tr>
                            <% 
                                } while (rs.next());
                            %>
                        </tbody>
                    </table>

                    <% 
                    } else {
                        message = "No diet plan found for this user.";
                    }
                } catch (Exception e) {
                    message = "An error occurred: " + e.getMessage();
                } finally {
                    // Close the resources
                    try { 
                        if (rs != null) rs.close(); 
                        if (ps != null) ps.close(); 
                        if (conn != null) conn.close(); 
                    } catch (Exception ignored) {}
                }
            } else {
                message = "Invalid user ID.";
            }
        %>

        <!-- Display message if no diet plan or error occurs -->
        <% if (!message.isEmpty()) { %>
            <p class="message"><%= message %></p>
        <% } %>

        <!-- Back button -->
        <button class="back-button" onclick="window.history.back();">Go Back</button>
    </div>
</body>
</html>
