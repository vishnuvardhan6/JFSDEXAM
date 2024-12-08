<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Type Login</title>
    <style>
        /* Body Styling */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #89cff0, #4ba3c7);
            margin: 0;
            overflow: hidden;
        }

        /* Adding Background Particles */
        .particles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            overflow: hidden;
            pointer-events: none;
        }

        .particle {
            position: absolute;
            width: 10px;
            height: 10px;
            background: white;
            border-radius: 50%;
            opacity: 0.5;
            animation: floatUp 8s linear infinite;
        }

        @keyframes floatUp {
            0% {
                transform: translateY(100vh) translateX(0);
                opacity: 0;
            }
            50% {
                opacity: 0.8;
            }
            100% {
                transform: translateY(-100vh) translateX(30px);
                opacity: 0;
            }
        }

        /* Container Styling */
        .login-container {
            width: 400px;
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            text-align: center;
            z-index: 1;
        }

        /* Title Styling */
        .login-container h2 {
            font-size: 28px;
            color: #2b7cbf;
            margin-bottom: 30px;
        }

        /* Options Container */
        .account-options {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* Option Buttons */
        .account-option {
            padding: 15px;
            border: 2px solid #2b7cbf;
            color: #2b7cbf;
            background: linear-gradient(90deg, rgba(43, 124, 191, 0.1), rgba(43, 124, 191, 0.2));
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            text-transform: uppercase;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        /* Hover Effects */
        .account-option:hover {
            background: linear-gradient(90deg, #2b7cbf, #1f6ea9);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(43, 124, 191, 0.4);
        }

        .account-option a {
            text-decoration: none;
            color: inherit;
            display: block;
            width: 100%;
            height: 100%;
        }

        /* Add Gradient Glow Effect */
        .account-option:before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 200%;
            height: 100%;
            background: linear-gradient(90deg, rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0));
            transform: skewX(-25deg);
            transition: left 0.3s ease;
        }

        .account-option:hover:before {
            left: 100%;
        }
    </style>
</head>
<body>
    <!-- Particle Background -->
    <div class="particles">
        <!-- Generate 15 particles -->
        <% for (int i = 0; i < 15; i++) { %>
            <div class="particle" style="top:<%= Math.random() * 100 %>%; left:<%= Math.random() * 100 %>%; animation-delay:<%= Math.random() * 5 %>s;"></div>
        <% } %>
    </div>

    <!-- Login Options -->
    <div class="login-container">
        <h2>Select Your Account Type</h2>
        <div class="account-options">
            <!-- Nutritionist -->
            <div class="account-option">
                <a href="nutritionistLogin.jsp">NUTRITIONIST</a>
            </div>
            <!-- Patient -->
            <div class="account-option">
                <a href="patientLogin.jsp">PATIENT</a>
            </div>
            <!-- Admin -->
            <div class="account-option">
                <a href="adminlog.html">ADMIN LOGIN</a>
            </div>
        </div>
    </div>
</body>
</html>
