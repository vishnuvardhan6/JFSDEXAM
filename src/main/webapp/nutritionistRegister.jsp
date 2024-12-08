<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutritionist Registration</title>
    <style>
        /* Styling for the form */
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://media.istockphoto.com/id/688160148/photo/healthy-food-supplements-concept-hand-of-nutritionist-doctor-touch-digital-tablet-on-symbols.jpg?s=612x612&w=0&k=20&c=6nA7ysERG8oGBr22Rmifl0pKyGV8wGG1ANIleeZMMCQ=');
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            position: relative;
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

        .container {
            position: relative;
            z-index: 2;
            background: linear-gradient(145deg, #ffffff, #f0f0f0);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
            max-width: 400px;
            width: 100%;
        }

        h1 {
            text-align: center;
            color: #f57c00; /* Orange color for heading */
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin: 10px 0 5px;
            font-weight: bold;
            color: #333;
        }

        input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 15px;
            outline: none;
            transition: box-shadow 0.3s ease, border-color 0.3s ease;
        }

        input:focus {
            border-color: #f57c00;
            box-shadow: 0 0 8px rgba(245, 124, 0, 0.6);
        }

        button {
            padding: 12px;
            background: linear-gradient(145deg, #f57c00, #fb8c00); /* Orange gradient */
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background: linear-gradient(145deg, #e57300, #f57c00); /* Darker orange on hover */
            transform: translateY(-2px);
        }

        button:active {
            transform: translateY(0);
        }

        .message {
            text-align: center;
            color: red;
        }
    </style>
    <script>
        // Client-side validation for contact number
        function validateForm() {
            const contact = document.getElementById("contact").value;
            const contactMessage = document.getElementById("contactMessage");

            // Ensure contact number is exactly 10 digits
            if (!/^\d{10}$/.test(contact)) {
                contactMessage.innerText = "Contact number must be exactly 10 digits.";
                return false;
            }

            // Clear any error messages
            contactMessage.innerText = "";
            return true;
        }
    </script>
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        <h1>Nutritionist Registration</h1>

        <% 
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String contact = request.getParameter("contact");

                if (contact == null || !contact.matches("\\d{10}")) {
                    out.println("<p class='message'>Error: Contact number must be exactly 10 digits.</p>");
                } else {
                    String jdbcURL = "jdbc:mysql://localhost:3306/nutrition_db";
                    String dbUser = "root";
                    String dbPassword = "Vishnu@90219";

                    Connection connection = null;
                    PreparedStatement preparedStatement = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                        String sql = "INSERT INTO nutritionists (name, email, username, password, contact) VALUES (?, ?, ?, ?, ?)";
                        preparedStatement = connection.prepareStatement(sql);

                        preparedStatement.setString(1, name);
                        preparedStatement.setString(2, email);
                        preparedStatement.setString(3, username);
                        preparedStatement.setString(4, password);
                        preparedStatement.setString(5, contact);

                        int rowsInserted = preparedStatement.executeUpdate();
                        if (rowsInserted > 0) {
                            response.sendRedirect("registrationSuccess.jsp");
                            return;
                        }
                    } catch (SQLException e) {
                        out.println("<p class='message'>Error: " + e.getMessage() + "</p>");
                    } catch (ClassNotFoundException e) {
                        out.println("<p class='message'>Error loading database driver.</p>");
                    } finally {
                        if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException e) {}
                        if (connection != null) try { connection.close(); } catch (SQLException e) {}
                    }
                }
            }
        %>

        <form method="POST" onsubmit="return validateForm()">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Enter your full name" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Choose a username" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>

            <label for="contact">Contact Number</label>
            <input type="text" id="contact" name="contact" placeholder="Enter your contact number" required>
            <p id="contactMessage" class="message"></p>

            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>
