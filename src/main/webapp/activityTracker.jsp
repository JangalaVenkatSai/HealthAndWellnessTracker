<%@ page import="java.util.List" %>
<%@ page import="com.healthwellness.model.Activity" %>
<%@ page import="com.healthwellness.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Activity Tracker</title>
    <link rel="stylesheet" type="text/css" href="css/style_activitytracker.css">
</head>
<body>
    <header>
        <nav class="navbar">
            <h1>Activity Tracker</h1>
            <div class="menu-container">
                <div class="menu-icon" onclick="toggleMenu()">&#8230;</div>
                <div class="dropdown-menu" id="dropdownMenu">
                    <a href="home.jsp">Home</a>
                    <a href="activityTracker.jsp">Activity Tracker</a>
                    <a href="logout.jsp">Logout</a>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <div class="container">
            <h2>Log Your Activity</h2>
            <form action="activityTracker" method="post" class="activity-form">
                <div class="form-group">
                    <label for="activityType">Activity Type:</label>
                    <select id="activityType" name="activityType" required>
                        <option value="">Select Activity</option>
                        <option value="Walking">Walking</option>
                        <option value="Swimming">Swimming</option>
                        <option value="Running">Running</option>
                        <option value="Cycling">Cycling</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="duration">Duration (minutes):</label>
                    <input type="number" id="duration" name="duration" step="0.1" min="0" required>
                </div>

                <div class="form-group">
                    <input type="submit" value="Submit Activity">
                </div>
            </form>

            <h2>Your Activity Records</h2>
            <table>
                <thead>
                    <tr>
                        <th>Activity Type</th>
                        <th>Duration (minutes)</th>
                        <th>Calories Burned</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    List<Activity> activities = (List<Activity>) request.getAttribute("activities");
                    if (activities != null && !activities.isEmpty()) {
                        for (Activity activity : activities) {
                    %>
                    <tr>
                        <td><%= activity.getActivityType() %></td>
                        <td><%= activity.getDuration() %></td>
                        <td><%= activity.getCaloriesBurned() %></td>
                    </tr>
                    <% 
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="3">No activities recorded yet.</td>
                    </tr>
                    <% 
                    }
                    %>
                </tbody>
            </table>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 Health and Wellness</p>
    </footer>

    <script>
        function toggleMenu() {
            const menu = document.getElementById('dropdownMenu');
            menu.classList.toggle('show');
        }
    </script>
</body>
</html>
