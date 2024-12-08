<!DOCTYPE html>
<html lang="en">
<head>
    <title>Nutritionist Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        table th {
            background-color: #4caf50;
            color: white;
        }
        .chart-container {
            width: 80%;
            margin: 40px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        form {
            text-align: center;
            margin: 20px;
        }
        select, button {
            padding: 10px 15px;
            font-size: 16px;
            margin: 10px;
        }
        button {
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Nutritionist Dashboard</h2>

    <!-- Client Management Table -->
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Contact</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Vishnu</td>
                <td>20</td>
                <td>Male</td>
                <td>12355</td>
            </tr>
            <tr>
                <td>Akhil</td>
                <td>30</td>
                <td>Male</td>
                <td>147852</td>
            </tr>
            <tr>
                <td>Vijay</td>
                <td>18</td>
                <td>Male</td>
                <td>1234567890</td>
            </tr>
        </tbody>
    </table>

    <!-- Report Section -->
    <form>
        <label for="client-select">Select Client:</label>
        <select id="client-select">
            <option value="Vishnu">Vishnu</option>
            <option value="Akhil">Akhil</option>
            <option value="Vijay">Vijay</option>
        </select>
        <button type="button" onclick="updateReport()">View Report</button>
    </form>
    
    <div class="chart-container">
        <canvas id="progress-chart"></canvas>
    </div>

    <script>
        // Client progress data
        const clientData = {
            Vishnu: {
                labels: ['Week 1', 'Week 2', 'Week 3'],
                data: [70, 68, 67],
            },
            Akhil: {
                labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
                data: [85, 84, 82, 80],
            },
            Vijay: {
                labels: ['Week 1', 'Week 2'],
                data: [65, 64],
            },
        };

        const ctx = document.getElementById('progress-chart').getContext('2d');
        let chart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: [],
                datasets: [{
                    label: 'Weight Progress (kg)',
                    data: [],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 2,
                    fill: false,
                }],
            },
            options: {
                responsive: true,
                scales: {
                    x: { title: { display: true, text: 'Weeks' } },
                    y: { title: { display: true, text: 'Weight (kg)' } },
                },
            },
        });

        function updateReport() {
            const selectedClient = document.getElementById('client-select').value;
            const data = clientData[selectedClient];
            chart.data.labels = data.labels;
            chart.data.datasets[0].data = data.data;
            chart.update();
        }
    </script>
</body>
</html>
