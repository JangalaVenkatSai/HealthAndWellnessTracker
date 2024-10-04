<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/style_login.css">
</head>
<body>
    <header>
        <nav class="navbar">
            <h1>Health and Wellness</h1>
            <div class="menu-container">
                <div class="menu-icon" onclick="toggleMenu()">&#8230;</div>
                <div class="dropdown-menu" id="dropdownMenu">
                    <a href="login.jsp">Login</a>
                    <a href="register.jsp">Register</a>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <div class="form-container">
            <h2>Login</h2>
            <form action="login" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <input type="submit" value="Login">
                </div>
            </form>
            <p class="error-message">
                <%= request.getParameter("error") != null ? request.getParameter("error") : "" %>
            </p>
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
