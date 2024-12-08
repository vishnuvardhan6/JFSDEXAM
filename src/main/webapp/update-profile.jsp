<!DOCTYPE html>
<html lang="en">
<head>
    <title>Profile Creation Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .success-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
            padding: 30px;
            animation: fadeIn 1s ease-in-out;
        }
        .success-card h1 {
            font-size: 24px;
            color: #4caf50;
            margin-bottom: 10px;
        }
        .success-card p {
            margin: 10px 0;
            font-size: 18px;
            color: #555;
        }
        .success-card .buttons {
            display: flex;
            justify-content: center;
            gap: 15px; /* Adds space between buttons */
            margin-top: 20px;
        }
        .success-card a {
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            color: white;
            background: #007bff;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .success-card a:hover {
            background: #0056b3;
            transform: scale(1.05); /* Slight zoom effect */
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
    <div class="success-card">
        <% 
            String jdbcURL = "jdbc:mysql://localhost:3306/your_database_name";
            String dbUser = "your_db_user";
            String dbPassword = "your_db_password";

            String age = request.getParameter("age");
            String gender = request.getParameter("gender");
            String weight = request.getParameter("weight");
            String height = request.getParameter("height");
            String nutritionalDeficiency = request.getParameter("nutritional_deficiency");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                java.sql.Connection connection = java.sql.DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                String sql = "INSERT INTO profiles (age, gender, weight, height, nutritional_deficiency) VALUES (?, ?, ?, ?, ?)";
                java.sql.PreparedStatement statement = connection.prepareStatement(sql);
                statement.setInt(1, Integer.parseInt(age));
                statement.setString(2, gender);
                statement.setDouble(3, Double.parseDouble(weight));
                statement.setDouble(4, Double.parseDouble(height));
                statement.setString(5, nutritionalDeficiency);

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
        %>
                    <h1>Profile Created Successfully!</h1>
                    <p>Your patient profile has been successfully added to the database.</p>
        <%
                }
                statement.close();
                connection.close();
            } catch (Exception e) {
                out.println("<h1>Error occurred while adding the profile.</h1>");
                e.printStackTrace(new java.io.PrintWriter(out));
            }
        %>
        <div class="buttons">
            <a href="patientDashboard.jsp">Return to Dashboard</a>
            <a href="healthDashboard.jsp">Go to Health Dashboard</a>
        </div>
    </div>
</body>
</html>
