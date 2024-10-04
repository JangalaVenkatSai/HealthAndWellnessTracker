<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Feedback</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        /* General Styles */
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f4f8;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            border-top: 5px solid #007BFF;
        }

        /* Heading Style */
        h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        /* Form Styles */
        form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 15px;
        }

        textarea {
            width: calc(100% - 30px); /* Adjust the width to fit within the padding */
            padding: 15px;
            font-size: 16px;
            border: 2px solid #ccc;
            border-radius: 6px;
            resize: vertical;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        textarea:focus {
            border-color: #007BFF;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
            outline: none;
        }

        input[type="submit"] {
            padding: 12px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007BFF;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
            box-shadow: 0 2px 6px rgba(0, 86, 179, 0.2);
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .container {
                width: 90%;
            }

            h2 {
                font-size: 24px;
            }

            textarea {
                font-size: 14px;
            }

            input[type="submit"] {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Submit Feedback</h2>
    <form action="submitFeedback" method="post">
        <div class="form-group">
            <textarea name="feedback" rows="5" placeholder="Enter your feedback here..." required></textarea>
        </div>
        <div class="form-group">
            <input type="submit" value="Submit">
        </div>
    </form>
</div>
</body>
</html>
