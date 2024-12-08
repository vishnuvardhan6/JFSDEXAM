<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            text-align: center;
            padding: 50px;
        }
        .success-message {
            color: #4CAF50;
            font-size: 24px;
            font-weight: bold;
        }
        .back-link {
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
            color: #007BFF;
            font-size: 18px;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="success-message">
        Operation completed successfully!
    </div>
    <a href="update-profile.jsp" class="back-link">Go Back to Home</a>
</body>
</html>
