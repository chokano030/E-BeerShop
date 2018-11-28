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
            <!-- USER -->
            <c:if test="${status==0}">
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
                                <a href="previousorders">PREVIOUS ORDERS</a>
                                <a href="logout">LOG OUT</a>
                            </div>
                        </li>
                        <li>
                            <c:if test="${totalBeersCount==0}">
                                <a href="#">
                                    <img src="images/cart.png" class="header-menu-image">
                                    <span class="header-menu-span">CART</span>
                                    <div class="total-beers-count">
                                        <span class="cart-count">0</span>
                                    </div>
                                </a>
                            </c:if> 
                            <c:if test="${totalBeersCount>0}">
                                <a href="cart">
                                    <img src="images/cart.png" class="header-menu-image">
                                    <span class="header-menu-span">CART</span>
                                    <div class="total-beers-count">
                                        <span class="cart-count">${totalBeersCount}</span>
                                    </div>
                                </a>
                            </c:if>
                        </li>
                    </ul>
                </div>
            </div>
            </c:if>
            <!-- ADMIN -->
            <c:if test="${status==1}">
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
                            <c:if test="${totalBeersCount==0}">
                                <a href="#">
                                    <img src="images/cart.png" class="header-menu-image">
                                    <span class="header-menu-span">CART</span>
                                    <div class="total-beers-count">
                                        <span class="cart-count">0</span>
                                    </div>
                                </a>
                            </c:if> 
                            <c:if test="${totalBeersCount>0}">
                                <a href="cart">
                                    <img src="images/cart.png" class="header-menu-image">
                                    <span class="header-menu-span">CART</span>
                                    <div class="total-beers-count">
                                        <span class="cart-count">${totalBeersCount}</span>
                                    </div>
                                </a>
                            </c:if>
                        </li>
                    </ul>
                </div>
            </div>
            </c:if>
            <!-- WELCOME TO OUR BEER SHOP -->
            <div class="beers-nav">
                <h1 class="welcome">WELCOME TO OUR BEER SHOP</h1>
                <p class="welcome">THE BEST PLACE FOR SHOPPING ONLINE</p>
            </div>
            <!-- ONE BEER -->
            <div class="onebeer">
                    <div class="beer-name-onebeer">${beer.name}</div>
                    <div class="beer-description-onebeer">${beer.description}</div>
                    <div class="beer-brewery-onebeer">${beer.brewery}</div>
                    <div class="beer-country-onebeer">${beer.country}</div>
                    <div class="beer-style-onebeer">${beer.style}</div>
                    <div class="beer-alcohol-onebeer">${beer.alcohol}%</div>
                    <div class="beer-packing-onebeer">${beer.packing}</div>
                    <div class="beer-image-onebeer"><img src="${beer.image}"></div>
                    <c:if test="${beer.quantity==0}">
                        <div class="unavailable-onebeer"><p class="p-unavailable">CURRENTLY UNAVAILABLE</p></div>
                        <div class="add-div-onebeer-quan"><p class="addbtn-onebeer">ADD TO CART</p></div>
                    </c:if>
                    <c:if test="${beer.quantity!=0}">
                        <a href="onebeer?id=${beer.id}&add=${beer.id}">
                            <div class="add-div-onebeer"><p class="addbtn-onebeer">ADD TO CART</p></div>
                        </a>
                    </c:if>  
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
