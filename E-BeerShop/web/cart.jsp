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
                            <div class="dropdown-content-cart">
                                <a href="previousorders">PREVIOUS ORDERS</a>
                                <a href="logout">LOG OUT</a>
                            </div>
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
                            <div class="dropdown-content-cart">
                                <a href="admin">ADMIN PAGE</a>
                                <a href="orders">ORDERS</a>
                                <a href="previousorders">PREVIOUS ORDERS</a>
                                <a href="logout">LOG OUT</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            </c:if>
            <!-- WELCOME TO OUR BEER SHOP -->
            <div class="beers-nav-cart">
                <img src="images/cartcart.png" class="welcome-image-chart">
                <h1 class="welcome-basket-cart">SHOPPING CART</h1>
            </div>
            <!-- SHOPPING CART -->
            <div class="cart">
                <div class="cart-div">
                    <a href="beers" class="continueShopping">←  CONTINUE SHOPPING</a>
                    <br>
                    <br>
                    <br>
                    <div style="overflow: hidden">
                        <c:forEach items="${beers}" var="beer">
                            <div class="cart-beer">
                                <div class="cart-image">
                                    <img src="${beer.image}" style="max-height: 80px">
                                </div>
                                <div class="cart-name">${beer.name}</div> 
                                <div class="cart-price">${beer.price} € Each</div>
                                <div class="add-remove-button">
                                    <a href="?remove=${beer.id}" id="minus"><img src="images/minusButton.png" class="minusButton"></a>
                                    <div class="beer-cartQuantiy">${beer.cartQuantiy}</div>
                                    <a href="?add=${beer.id}"><img src="images/plusButton.png" class="plusButton"></a>
                                </div>
                                <div class="total-onebeer">${beer.totalOneBeer} €</div>
                                <div><a href="?removeall=${beer.id}"><img src="images/closeButton.png" class="close-button"></a></div>
                            </div>
                        </c:forEach>
                        <div class="total">TOTAL: ${total} €</div>
                    </div>
                </div>
            </div>
            <!-- ORDER -->
            <div>
                <input type="button" value="CONFIRM ORDER" onclick="window.location='./cart?buy=1'" class="confirm-order"/>
                <c:if test="${param.buy==1}">
                    <div  class="order-div">    
                        <form action="cart" method="post">
                            <div class="order-div-name">${username}</div>
                            <div class="order-div-addresstel">
                                ADDRESS:<br>
                                <textarea name="address" required rows="3" class="order-div-address"></textarea><br><br>
                                TELEPHONE:<br>
                                +381<input name="tel" required class="order-div-tel">
                            </div>
                            <input type="submit" name="doBuy" value="BUY" class="order-buy"/>
                        </form>
                    </div>    
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
