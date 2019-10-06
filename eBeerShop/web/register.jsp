<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-BeerShop</title>
        <link rel="stylesheet" href="beerstyle1.css">
        <link rel="icon" type="image/png" href="images/beericon.png" sizes="32x32">
        <link href="https://fonts.googleapis.com/css?family=Luckiest+Guy" rel="stylesheet">
    </head>
    <body>
        <div class="wrapper">
            <div>
                <img class="logo" src="images/mojlogo.png">
                <form method="post" action="register" name="register" class="form-login">
                    <div class="labels">USERNAME</div>
                    <input class="textboxes" type="text" name="username" required><br>
                    <div class="labels">PASSWORD</div>
                    <input class="textboxes" type="password" name="password" required><br>
                    <div class="labels">CONFIRM PASSWORD</div>
                    <input class="textboxes" type="password" name="passwordConfirm" required=""><br>
                    <input class="submit-button" type="submit" value="REGISTER"><br>
                    <a class="register" href="login.jsp">ALREADY HAVE ACCOUNT? LOGIN HERE</a>
                </form>
            </div>
        </div>
    </body>
</html>