<%@ page session="true" %>
<%@ page import="java.sql.*, java.util.*" %>
<%
    // Check if the user is logged in
    String username = (String) session.getAttribute("username");
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Dashboard</title>
    <style>
        /* General styles */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            color: #333;
        }

        /* Navbar styles */
       /* Navbar styles */
.navbar {
    position: fixed;
    top: 0;
    width: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    padding: 15px;
    display: flex;
    justify-content: flex-end;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    z-index: 1000; /* Ensures the navbar stays above other elements */
}

/* Add top margin to the body content */
.container {
    padding: 80px 20px; /* Increased top padding to prevent overlap */
    text-align: center;
}
       

        .navbar a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
            padding: 8px 12px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        /* Container styles */
       

        h1 {
            color: #fff;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        /* Card styles */
        .option-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .option-card {
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
            padding: 25px;
            border-radius: 15px;
            margin: 20px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            width: 280px;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
            color: #333;
        }

        .option-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }

        .option-card h2 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: #fff;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .option-card p {
            font-size: 1rem;
            color: #fff;
            opacity: 0.9;
        }

        /* Media query for responsiveness */
        @media (max-width: 768px) {
            .option-card {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="navbar">
    <a href="dailyDiet.jsp">Daily Diet</a>
    <a href="contactNutritionist.jsp">Contact Nutritionist</a>
    
</div>

<div class="container">
    <h1>Welcome to Your Health Dashboard</h1>
    <div class="option-cards">
        <div class="option-card" onclick="window.location.href='dailyDiet.jsp'">
            <h2>Daily Diet</h2>
            <p>View and manage your daily diet plan.</p>
        </div>
        <div class="option-card" onclick="window.location.href='contactNutritionist.jsp'">
            <h2>Contact Nutritionist</h2>
            <p>Reach out to your assigned nutritionist for advice and guidance.</p>
        </div>
       
    </div>
</div>

</body>
</html>
