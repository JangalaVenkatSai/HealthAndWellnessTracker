<!DOCTYPE html>
<html>
<head>
    <title>Welcome Page</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            overflow: hidden;
            background-color: #2c3e50; /* Background color to complement the buttons */
        }

        .navbar {
            overflow: hidden;
            background-color: #3498db;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 10;
            text-align: center;
            padding: 10px 0;
        }

        .navbar h1 {
            color: #f2f2f2;
            font-family: 'Roboto', sans-serif;
            font-weight: bold;
            margin: 0;
            font-size: 24px;
        }

        .content {
            position: relative;
            z-index: 3;
            padding: 20px;
            margin-top: 60px; /* Increased margin to accommodate the navbar height */
            text-align: center;
        }

        .button-container {
            position: relative;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            overflow: hidden; /* Hide buttons before animation */
        }

        .button {
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 50px;
            width: 200px;
            height: 60px;
            margin: 10px 0; /* Margin to space out the buttons vertically */
            font-size: 18px;
            cursor: pointer;
            transition: transform 0.5s ease, opacity 0.5s ease;
            opacity: 0;
            position: absolute; /* Position buttons absolutely for sliding effect */
            transform: translateX(100%); /* Start from the right edge */
        }

        .button.show {
            opacity: 1;
            transform: translateX(0);
        }

        .button:nth-child(1) { top: 0; }
        .button:nth-child(2) { top: 70px; }
        .button:nth-child(3) { top: 140px; }
        .button:nth-child(4) { top: 210px; }

    </style>
</head>
<body>

<div class="navbar">
    <h1>Welcome to Our Application</h1>
</div>

<div class="content">
    <div class="button-container">
        <button class="button" id="activityTrackerButton">Activity Tracker</button>
        <button class="button" id="dietRecommendationsButton">Diet Recommendations</button>
        <button class="button" id="feedbackButton">Feedback</button>
        <button class="button" id="logoutButton">Logout</button>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        const buttons = document.querySelectorAll('.button');
        let delay = 0;

        buttons.forEach((button, index) => {
            setTimeout(() => {
                button.classList.add('show');
            }, delay);
            delay += 500; // Delay between button animations
        });

        // Add click event listener to navigate to pages
        document.getElementById('activityTrackerButton').addEventListener('click', () => {
            window.location.href = 'activityTracker.jsp'; // URL for activity tracker page
        });

        document.getElementById('dietRecommendationsButton').addEventListener('click', () => {
            window.location.href = 'diet.jsp'; // URL of the page to navigate to
        });

        document.getElementById('feedbackButton').addEventListener('click', () => {
            window.location.href = 'feedback.jsp'; // URL for feedback page
        });

        document.getElementById('logoutButton').addEventListener('click', () => {
            window.location.href = 'login.jsp'; // URL for logout page
        });
    });
</script>

</body>
</html>
