<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-BeerShop</title>
        <link rel="stylesheet" href="beerstyle1.css">
        <link rel="icon" type="image/png" href="images/beericon.png" sizes="32x32">
        <link href="https://fonts.googleapis.com/css?family=Luckiest+Guy" rel="stylesheet">
        <script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>
        <script src='https://code.jquery.com/jquery-1.9.1.min.js'></script>
    </head>
    <body>
        <div class="beers-wrapper">
            <!-- HEADER -->
            <div class="header">
                <a href="beers"><img src="images/mojlogo.png" class="beers-logo"></a>
                <div class="header-menu">
                    <ul class="list">
                        <li class="dropdown">
                            <a href="#" class="dropbtn">
                                <img src="images/loginslika.png" class="header-menu-image" style="padding-left: 20px">
                                <span class="header-menu-span">MY ACCOUNT</span>
                            </a>
                            <div class="dropdown-content">
                                <a href="admin">ADMIN PAGE</a>
                                <a href="orders">ORDERS</a>
                                <a href="previousorders">PREVIOUS ORDERS</a>
                                <a href="logout">LOG OUT</a>
                            </div>
                        </li>
                        <li>
                            <a href="cart">
                                <img src="images/cart.png" class="header-menu-image">
                                <span class="header-menu-span">CART</span>
                                <div class="total-beers-count">
                                    <span class="cart-count">${totalBeersCount}</span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- WELCOME TO OUR BEER SHOP -->
            <div class="beers-nav">
                <h1 class="welcome">WELCOME TO OUR BEER SHOP</h1>
                <p class="welcome">THE BEST PLACE FOR SHOPPING ONLINE</p>
            </div>
            <!-- ADMIN ADD NEW BEER -->
            <div class="admin-main">
                <div class="adminPage-newBeer">
                <h2>ADD NEW BEER</h2>
                <form method="post" action="admin" class="form-admin">
                        <div class="labels">BEER NAME:</div>
                        <input class="textboxes-admin" type="text" name="beername" required><br>
                        <div class="labels">BEER PRICE:</div>
                        <input class="textboxes-admin" type="text" name="beerprice" required><br>
                        <div class="labels">BREWERY:</div>
                        <input class="textboxes-admin" type="text" name="beerbrewery" required><br>
                        <div class="labels">COUNTRY:</div>
                        <input class="textboxes-admin" type="text" name="beercountry" required><br>
                        <div class="labels">STYLE:</div>
                        <input class="textboxes-admin" type="text" name="beerstyle" required><br>
                        <div class="labels">ALCOHOL PERCENT:</div>
                        <input class="textboxes-admin" type="text" name="beeralcohol" required><br>
                        <div class="labels">PACKING:</div>
                        <input class="textboxes-admin" type="text" name="beerpacking" required><br>
                        <div class="labels">DESCRIPTION:</div>
                        <textarea class="textboxes-admin" name="beerdescription" rows="6" wrap="hard" required></textarea><br>
                        <div class="labels">BEER IMAGE (LINK):</div>
                        <input class="textboxes-admin" type="text" name="beerimage" required><br>
                        <input class="submit-button" type="submit" value="ADD"><br>
                    </form>
                </div>
                <!-- ADMIN ADD BEER QUANTITY -->
                <div class="adminPage-quantity">
                    <h2>ADD BEER QUANTITY</h2>
                    <form method="post" action="admin" class="form-admin">
                        <div class="labels">BEER NAME:</div>
                        <input class="textboxes-admin" type="text" name="beernamequantity" required><br>
                        <div class="labels">QUANTITY:</div>
                        <input class="textboxes-admin" type="text" name="beerquantity" required><br>
                        <input class="submit-button" type="submit" value="ADD"><br>
                    </form>
                </div>
                <!-- CHANGE PRICE -->
                <div class="adminPage-quantity">
                    <h2>CHANGE PRICE</h2>
                    <form method="post" action="admin" class="form-admin">
                        <div class="labels">BEER NAME:</div>
                        <input class="textboxes-admin" type="text" name="beernameprice" required><br>
                        <div class="labels">NEW PRICE:</div>
                        <input class="textboxes-admin" type="text" name="newbeerprice" required><br>
                        <input class="submit-button" type="submit" value="ADD"><br>
                    </form>
                </div>
                <!-- ADMIN DELITE BEER -->
                <div class="adminPage-delite">
                    <h2>DELITE BEER</h2>
                    <form method="post" action="admin" class="form-admin">
                        <div class="labels">BEER NAME:</div>
                        <input class="textboxes-admin" type="text" name="deletebeer" required><br>
                        <input class="submit-button" type="submit" value="DELITE"><br>
                    </form>
                </div>
            </div>
            <!-- FOOTER -->
            <div class="footer">
                <img src="images/mojlogowhite.png" class="footer-image">
                <p class="footer-p">COPYRIGHT 2018 - BEER SHOP BEOGRAD</p>
                <div class="footer-follow">
                    <p class="footer-follow-p">FOLLOW US</p>
                    <a href="https://www.facebook.com/"><img src="images/facebooklogo.png" class="footer-facebook"></a>
                    <a href="https://www.instagram.com/"><img src="images/instagramlogo.png" class="footer-instagram"></a>
                    <a href="https://twitter.com/"><img src="images/twitterlogo.png" class="footer-twitter"></a>
                </div>
            </div>               
        </div>                      
    </body>
</html>