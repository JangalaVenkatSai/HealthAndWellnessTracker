<%@ page import="com.healthwellness.util.BMICalculator" %>
<%@ page session="true" %>
<%@ page import="com.healthwellness.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Diet Recommendations</title>
    <link rel="stylesheet" type="text/css" href="css/style_diet.css">
</head>
<body>
    <header>
        <nav class="navbar">
            <h1>Health and Wellness</h1>
            <div class="menu-container">
                <div class="menu-icon" onclick="toggleMenu()">&#8230;</div>
                <div class="dropdown-menu" id="dropdownMenu">
                    <a href="home.jsp">Home</a>
                    <a href="login.jsp">Login</a>
                    <a href="register.jsp">Register</a>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <div class="form-container">
            <h2>Diet Recommendations for <%= user.getUsername() %></h2>
            <form action="bmiCalculator" method="post">
                <div class="form-group">
                    <label for="weight">Weight (kg):</label>
                    <input type="text" id="weight" name="weight" required>
                </div>
                <div class="form-group">
                    <label for="height">Height (m):</label>
                    <input type="text" id="height" name="height" required>
                </div>
                <div class="form-group">
                    <input type="submit" value="Calculate BMI">
                </div>
            </form>

            

            <%
                String bmiResult = (String) request.getAttribute("bmiResult");
                String recommendation = (String) request.getAttribute("recommendation");
                if (bmiResult != null) {
            %>
                <div class="result-container">
                    <p><%= bmiResult %></p>
                    <p><strong>Diet Recommendation:</strong> <%= recommendation %></p>
                </div>
            <%
                }
            %>
        </div>
    </main>

    <script>
        function toggleMenu() {
            const menu = document.getElementById('dropdownMenu');
            menu.classList.toggle('show');
        }
    </script>
</body>
</html>
