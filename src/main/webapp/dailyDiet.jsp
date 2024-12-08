<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daily Diet Entry</title>
    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #333;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100%;
            line-height: 1.6;
        }

        /* Container */
        .container {
            background: #ffffff;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            padding: 20px 30px;
            width: 100%;
            max-width: 500px;
            text-align: center;
            transition: transform 0.2s ease;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        /* Header Styling */
        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 1.8rem;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        /* Form Styling */
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            width: 100%;
        }

        /* Form Group */
        .form-group {
            display: flex;
            flex-direction: column;
            text-align: left;
            gap: 8px;
        }

        /* Input Field Styling */
        input[type="text"],
        input[type="number"] {
            padding: 10px 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #6a11cb;
            outline: none;
        }

        /* Submit Button */
        button[type="submit"] {
            margin-top: 10px;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #ffffff;
            padding: 10px;
            border: none;
            border-radius: 25px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: transform 0.2s ease, background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            transform: scale(1.1);
            background-color: #555;
        }

        /* Media Query for responsiveness */
        @media (max-width: 768px) {
            .container {
                padding: 20px 15px;
                max-width: 90%;
            }
            h2 {
                font-size: 1.6rem;
            }

            input[type="text"],
            input[type="number"] {
                font-size: 0.9rem;
            }

            button[type="submit"] {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Daily Diet Entry</h2>
    <form action="saveDiet.jsp" method="post">
        <div class="form-group">
            <label for="mealType">Meal Type (e.g., Breakfast, Lunch, Dinner):</label>
            <input type="text" id="mealType" name="mealType" required>
        </div>
        <div class="form-group">
            <label for="foodItems">Food Items (comma-separated):</label>
            <input type="text" id="foodItems" name="foodItems" required>
        </div>
        <div class="form-group">
            <label for="calories">Total Calories:</label>
            <input type="number" id="calories" name="calories" required>
        </div>
        <div class="form-group">
            <label for="protein">Protein (g):</label>
            <input type="number" id="protein" name="protein" required>
        </div>
        <div class="form-group">
            <label for="carbs">Carbohydrates (g):</label>
            <input type="number" id="carbs" name="carbs" required>
        </div>
        <div class="form-group">
            <label for="fats">Fats (g):</label>
            <input type="number" id="fats" name="fats" required>
        </div>
        <button type="submit">Save Diet Entry</button>
    </form>
</div>

</body>
</html>
