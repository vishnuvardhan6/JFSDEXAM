<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dietary Data Management</title>
    <style>
        .filter-bar {
            margin: 20px 0;
        }
        .filter-bar select {
            padding: 10px;
            margin-right: 10px;
        }
        .diet-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .diet-table th, .diet-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .diet-table th {
            background-color: #4caf50;
            color: white;
        }
    </style>
</head>
<body>
    <h2>Diet Data</h2>
    <div class="filter-bar">
        <label for="diet-type">Filter by Diet Type:</label>
        <select id="diet-type">
            <option>All</option>
            <option>Vegetarian</option>
            <option>Ketogenic</option>
            <option>Mediterranean</option>
        </select>
    </div>
    <table class="diet-table">
        <thead>
            <tr>
                <th>Meal Name</th>
                <th>Calories</th>
                <th>Proteins</th>
                <th>Carbs</th>
                <th>Diet Type</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%-- Loop through diet data from the database --%>
            <tr>
                <td>Grilled Chicken</td>
                <td>400</td>
                <td>40g</td>
                <td>10g</td>
                <td>Ketogenic</td>
                <td>
                    <button>Edit</button>
                    <button>Delete</button>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
