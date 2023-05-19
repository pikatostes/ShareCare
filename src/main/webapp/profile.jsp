<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>ShareCare - Profile</title>
    <link rel="stylesheet" href="styleProfile.css">
</head>

<body>
    <div id="container">
        <header>
            <div class="logo">
                <a href="index.jsp"><img src="imagen/solidarity.avif" alt=""></a>
                <a href="index.jsp">
                    <h1>ShareCare</h1>
                </a>
            </div>
            <nav>
                <a href="index.jsp" class="nav-link">Home</a>
                <a href="" class="nav-link">Help someone</a>
                <a href="" class="nav-link">Quam?</a>
                <a href="" class="nav-link">Placeat!</a>
                <a href="login.jsp" class="log-in">Log In</a>
                <a href="registro.jsp" class="register">Register</a>
            </nav>
        </header>

        <div class="main">
            <div class="profile">
                <div class="profilePic">
                    <img src="imagen/gus.png" alt="imagen de prueba">
                </div>
                <div class="info">
                    <h2>Edit info</h2>
                    <form action="post">
                        <label for="email"><input type="email" name="email" id="email" placeholder="email"></label>
                        <label for="user"><input type="text" name="user" id="user" placeholder="user"></label>
                        <label for="password"><input type="password" name="password" id="password"
                                placeholder="password"></label>
                        <div class="options">
                            <input type="submit" value="Change">
                            <input type="reset" value="Revert">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>