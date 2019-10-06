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
        <link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700" rel="stylesheet">
    </head>
    <body>
        <div class="beers-wrapper">
            <!-- ADMIN -->
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
                <h1 class="welcome">ORDERS DETAILS</h1>
                <p class="welcome">SEE ALL ORDERS</p>
            </div>        
            <!-- ORDERS -->
            <div class="orders-table">
                <table class="orders-table-table">
                    <tr class="tr">
                        <td>ORDER ID</td>
                        <td>USERNAME</td>
                        <td>ADDRESS</td>
                        <td>TELEPHONE</td>
                        <td>(QUANTITY) & BEERS NAME</td>
                        <td>TOTAL PRICE</td>
                    </tr>
                    <c:forEach items="${orders}" var="orders">
                        <tr class="tr">
                            <td>${orders.id}</td>
                            <td>${orders.username}</td>
                            <td>${orders.address}</td>
                            <td>${orders.tel}</td>
                            <td>(${orders.quantity})<br>${orders.beersName}</td>
                            <td>${orders.totalPrice} €</td>
                        </tr>
                    </c:forEach>
                </table>  
            </div>
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