<%-- 
    Document   : viewCart
    Created on : Jul 6, 2022, 11:45:24 PM
    Author     : Dell
--%>

<%@page import="sample.user.UserDTO"%>
<%@page import="sample.beverage.Beverage"%>
<%@page import="sample.beverage.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="icon" href="image/Lemon Tea.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"US".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
            }
        %>
        <div class="container-fluid">
            <div class="row">
                <header>
                    <nav class="navbar navbar-expand-lg sticky-top navbar-light d-flex justify-content-end">
                        <a class="navbar-brand" href="index.jsp">
                            <img src="image/Lemon Tea.png" alt="Logo" width="50px"/><span> </span>LemonTea
                        </a>
                        <form class="form-inline my-2 my-lg-0" action="MainController">
                            <input class="form-control mr-sm-2" name="search" type="search" placeholder="Search" aria-label="Search">
                            <input name="action" class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Search">
                        </form>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Menu
                                    </a>
                                    <div class="dropdown-menu list-inline" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#">Tea</a>
                                        <a class="dropdown-item" href="#">Coffee</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Milk Tea</a>
                                    </div>
                                </li>
                                <!--                                                                <li class="nav-item">
                                                                                                    <a class="nav-link" href="#">Blog</a>
                                                                                                </li>-->
                                <li class="nav-item active">
                                    <a class="nav-link" href="viewCart.jsp">Cart <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="MainController?action=Logout">Logout <span class="sr-only">(current)</span></a>
                                </li>
                            </ul>
                        </div>
                        <button class="navbar-toggler justify-content-end" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </nav>
                </header>
            </div>
            <%
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null) {
            %>
            <div class="row">
                <table border="1" class="table">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total</th>
                            <th scope="col">Remove</th>
                            <th scope="col">Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            double total = 0;
                            for (Beverage drink : cart.getCart().values()) {
                                total += drink.getPrice();
                        %>
                    <form action="MainController">
                        <tr>
                            <td><%=drink.getProductName()%></td>
                            <td><%=drink.getPrice()%>$</td>
                            <td>
                                <input type="number" name="quantity" value="<%=drink.getQuantity()%>" required="" min="1"/>
                            </td>
                            <td><%=drink.getPrice() * drink.getQuantity()%>$</td>
                            <td>
                                <input type="hidden" name="productID" value="<%=drink.getProductID()%>"/>
                                <input type="submit" name="action" value="Remove" class="btn btn-outline-info"/>
                            </td>
                            <td>
                                <input type="submit" name="action" value="Edit" class="btn btn-outline-info"/>
                            </td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <h1>Total: <%=total%>$</h1>
                <form action="MainController">
                    <select class="form-control">
                        <option>Cash</option>
                        <option disabled="">Online Banking</option>
                    </select>
                    <input type="submit" name="action" value="Check out" class="btn btn-primary"/>
                </form>
            </div>
            <%
                }
            %>
            <%
                String message = (String) request.getAttribute("MESSAGE");
                if (message != null) {
            %>
            <div class="row">
                <div class="alert alert-warning" role="alert">
                    <%=message%>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </body>
</html>
