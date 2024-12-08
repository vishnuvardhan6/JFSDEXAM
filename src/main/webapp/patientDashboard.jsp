<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard</title>
    <!-- Linking an external icon library for visual icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #d2e6f7, #f0f8ff);
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Header Section */
        .header {
            background: linear-gradient(135deg, #004fac, #0086ff);
            color: white;
            padding: 15px 0;
            text-align: center;
            font-size: 1.8rem;
            position: relative;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .profile-link {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: #f0f8ff;
            font-size: 1rem;
            text-decoration: none;
            transition: color 0.3s ease-in-out;
        }

        .profile-link:hover {
            color: #ffd700;
        }

        /* Dashboard Container */
        .container {
            max-width: 900px;
            margin: 30px auto;
            padding: 25px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        /* Section Titles */
        h2 {
            color: #333;
            margin-bottom: 15px;
            font-size: 1.6rem;
            text-align: center;
            border-bottom: 2px solid #2c89c5;
            padding-bottom: 5px;
        }

        /* Profile Form Styling */
        .profile-form {
            margin-top: 20px;
            padding: 10px;
        }

        .profile-form label {
            font-weight: bold;
            margin: 10px 0 5px;
            color: #555;
        }

        .profile-form input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: border-color 0.3s ease-in-out;
        }

        .profile-form input:focus {
            border-color: #2c89c5;
            outline: none;
        }

        /* Submit Button */
        .submit-btn {
            background: linear-gradient(to right, #2c89c5, #004fac);
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
            font-size: 1rem;
        }

        .submit-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .profile-form input,
            .submit-btn {
                font-size: 0.9rem;
            }

            h2 {
                font-size: 1.4rem;
            }
        }

        /* Hero Section Background Animation */
        /* Center the hero text */
.hero-text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    font-size: 1.4rem;
    font-weight: bold;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
    text-align: center;
}

/* Adjust the size of the hero section */
.hero-section {
    height: 100px; /* Reduced height */
    background: url('https://source.unsplash.com/1600x900/?health,wellness') no-repeat center center/cover;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    position: relative;
    margin-bottom: 20px; /* Reduced spacing */
    filter: brightness(1.2);
}
        

        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 4px;
        }

        }

    </style>
</head>
<body>
    <!-- Header Section -->
    <div class="header">
        Patient Dashboard
        
    </div>

    <!-- Hero Section with background image -->
    <div class="hero-section">
        <div class="hero-overlay"></div>
        <div class="hero-text">Welcome to your Health Journey</div>
    </div>

    <!-- Dashboard Container Section -->
    <div class="container" id="profileSection">
        <h2>Update Your Profile</h2>
        <form action="update-profile.jsp" method="POST" class="profile-form">
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required>

            <label for="gender">Gender:</label>
            <input type="text" id="gender" name="gender" required>

            <label for="weight">Weight (kg):</label>
            <input type="number" id="weight" name="weight" required>

            <label for="height">Height (cm):</label>
            <input type="number" id="height" name="height" required>

            <label for="deficiency">Nutritional Deficiency:</label>
            <input type="text" id="deficiency" name="deficiency" placeholder="e.g., Iron, Vitamin D">

            <button type="submit" class="submit-btn">Save Changes</button>
        </form>
    </div>
</body>
</html>
