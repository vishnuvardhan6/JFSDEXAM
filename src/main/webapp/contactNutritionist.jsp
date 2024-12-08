<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Nutritionist</title>
    <style>
        /* Reset and base styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #92fe9d, #00c9ff);
            color: #333;
            padding: 20px;
        }
        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 30px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
            color: #007ACC;
            margin-bottom: 20px;
        }
        p {
            text-align: center;
            color: #555;
            margin-bottom: 30px;
        }
        .nutritionist {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .nutritionist:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }
        .nutritionist img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            margin-right: 20px;
        }
        .nutritionist h3 {
            margin: 0;
            color: #007ACC;
        }
        .nutritionist p {
            margin: 5px 0 0;
            color: #555;
            font-size: 14px;
        }
        @media (max-width: 600px) {
            .nutritionist {
                flex-direction: column;
                align-items: flex-start;
                text-align: left;
            }
            .nutritionist img {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Contact a Nutritionist</h1>
        <p>Here are some randomly selected nutritionists you can reach out to:</p>
        
        <%
            // Array of sample nutritionists
            String[] nutritionists = {
                "Dr. Vishnu Vardhan - Specializes in Child Nutrition",
                "Dr. Akhil - Expert in Sports Nutrition",
                "Dr. Vijay - Focuses on Weight Management",
                "Dr. Sandeep - Expert in Diabetic Diets",
                "Dr. Sravan - Specializes in Plant-Based Diets",
                "Dr. Pooja - Focuses on Senior Nutrition"
            };

            // Array of images
            String[] images = {
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGi04_BKrGsJL5Cfmoi-CvZ44y9z7Clp4FQw&s",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLdVIk8cxsG_9Uc2jbikFLztiafFFv13U75A&s",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5eTLGFc9O499Uhj1nLbuK5cCxtPkHaRpa1A&s",
                "https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg",
                "https://media.istockphoto.com/id/1292015214/photo/portrait-female-doctor-stock-photo.jpg?s=612x612&w=0&k=20&c=nr4XaWnRPQnWqwhzahajZhskIDG1yK9DmIteV5gpUOI="
            };

            // Generate random indices to select nutritionists
            java.util.Random random = new java.util.Random();
            int numToDisplay = 5; // Number of nutritionists to display
            java.util.HashSet<Integer> displayedIndices = new java.util.HashSet<>();

            while (displayedIndices.size() < numToDisplay) {
                int randomIndex = random.nextInt(nutritionists.length);
                displayedIndices.add(randomIndex);
            }

            // Display selected nutritionists
            int imgIndex = 0;
            for (int index : displayedIndices) {
        %>
            <div class="nutritionist">
                <img src="<%= images[imgIndex % images.length] %>" alt="Nutritionist Photo">
                <div>
                    <h3><%= nutritionists[index].split(" - ")[0] %></h3>
                    <p><%= nutritionists[index].split(" - ")[1] %></p>
                </div>
            </div>
        <%
                imgIndex++;
            }
        %>
    </div>
</body>
</html>
