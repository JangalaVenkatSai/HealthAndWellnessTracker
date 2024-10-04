<!DOCTYPE html>
<html>
<head>
    <title>Health and Wellness</title>
    <link rel="stylesheet" type="text/css" href="css/style_index.css">
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
        <div class="container">
            <h2>Welcome to Health and Wellness</h2>
            <p>Your journey to a healthier life starts here. Use the navigation above to access login and registration pages.</p>
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