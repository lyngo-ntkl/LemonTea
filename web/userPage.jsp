<%-- 
    Document   : userPage
    Created on : Jul 3, 2022, 3:10:49 PM
    Author     : Dell
--%>

<%@page import="sample.beverage.BeverageDAO"%>
<%@page import="sample.beverage.Beverage"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
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
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <div class="container-fluid col-xs-12">
            <div class="row">
                <header>
                    <nav class="navbar navbar-expand-lg sticky-top navbar-light d-flex justify-content-end">
                        <a class="navbar-brand" href="userPage.jsp">
                            <img src="image/Lemon Tea.png" alt="Logo" width="50px"/><span> </span>LemonTea
                        </a>
                        <form class="form-inline my-2 my-lg-0" action="MainController">
                            <input class="form-control mr-sm-2" name="search" type="search" value="<%=search%>" placeholder="Search" aria-label="Search">
                            <input name="action" class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Search">
                        </form>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="userPage.jsp">Home <span class="sr-only">(current)</span></a>
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
                                <li class="nav-item">
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
            <div class="row">
                <%
                    if (loginUser != null) {
                %>
                <h1>Welcome <%=loginUser.getFullName()%></h1>

                <%
                    }
                %>
            </div>
            <div class="row col-xs-12">
                <div id="carouselExampleIndicators" class="carousel slide col-xs-12" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="image/Carousel 1.png" alt="" class="w-100"/>
                        </div>
                        <div class="carousel-item">
                            <img src="image/Carousel 2.png" alt="" class="w-100"/>
                        </div>
                        <div class="carousel-item">
                            <img src="image/Carousel 3.png" alt="" class="w-100"/>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="row">
                <%
                    if (!search.isEmpty()) {
                        List<Beverage> listDrink = (List<Beverage>) request.getAttribute("LIST_DRINK");
                        if (listDrink != null && listDrink.size() > 0) {
                            int size = listDrink.size();
                            Beverage beverage;
                %>
                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th scope="col">Product name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Available quantity</th>
                            <th scope="col">Quantity</th>
                            <!--<th></th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < size; i++) {
                                beverage = listDrink.get(i);
                        %>
                    <form action="MainController">
                        <tr>
                            <td><%=beverage.getProductName()%></td>
                            <td><%=beverage.getPrice()%></td>
                            <td><%=beverage.getQuantity()%></td>
                            <td>
                                <input type="number" name="quantity" class="form-control" min="1" max="<%=beverage.getQuantity()%>"/>
                            </td>
                            <td>
                                <input type="hidden" name="search" value="<%=search%>"/>
                                <input type="hidden" name="productID" value="<%=beverage.getProductID()%>"/>
                                <input type="hidden" name="productName" value="<%=beverage.getProductName()%>"/>
                                <input type="hidden" name="price" value="<%=beverage.getPrice()%>"/>
                                <input type="hidden" name="availableQuantity" value="<%=beverage.getQuantity()%>"/>
                                <input type="hidden" name="categoryID" value="<%=beverage.getCategoryID()%>"/>
                                <input type="submit" name="action" value="Add" class="btn btn-outline-info" />
                            </td>
                        </tr>
                    </form>

                    <%
                        }
                    %>
                    </tbody>
                </table>
                <%
                        }
                    }
                %>
            </div>
            <%
                String error = (String) request.getAttribute("ERROR");
                if (error != null) {
            %>
            <div class="alert alert-warning" role="alert">
                Not available enough
            </div>
            <%
                }
            %>
        </div>
    </body>
</html>
