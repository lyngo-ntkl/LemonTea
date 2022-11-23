<%-- 
    Document   : adminPage
    Created on : Jun 27, 2022, 9:41:32 PM
    Author     : Dell
--%>

<%@page import="sample.user.UserDTO"%>
<%@page import="sample.beverage.Beverage"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
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
            if (loginUser==null || !"AD".equals(loginUser.getRoleID())) {
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
                        <a class="navbar-brand" href="adminPage.jsp">
                            <img src="image/Lemon Tea.png" alt="Logo" width="50px"/><span> </span>LemonTea
                        </a>
                        <form class="form-inline my-2 my-lg-0" action="MainController">
                            <input class="form-control mr-sm-2" name="search" type="search" value="<%=search%>" placeholder="Search" aria-label="Search">
                            <input name="action" class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Search">
                        </form>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="adminPage.jsp">Home <span class="sr-only">(current)</span></a>
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
                <h1>Welcome <%=loginUser.getFullName()%></h1>

                <%
                    List<Beverage> listDrink = (List<Beverage>) request.getAttribute("LIST_DRINK");
                    if (listDrink != null && listDrink.size() > 0) {
                        int count = 0;
                %>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Product ID</th>
                            <th>Product name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Category</th>
                            <th>Image</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Beverage drink : listDrink) {
                        %>

                    <form action="MainController">
                        <tr>
                            <td><%=++count%></td>
                            <td><%=drink.getProductID()%></td>
                            <td>
                                <input type="text" name="productName" value="<%=drink.getProductName()%>" class="form-control"/>
                            </td>
                            <td>
                                <input type="text" name="price" value="<%=drink.getPrice()%>" class="form-control"/>
                            </td>
                            <td>
                                <input type="number" name="quantity" value="<%=drink.getQuantity()%>" class="form-control"/>
                            </td>
                            <td>
                                <%
                                    switch (drink.getCategoryID()) {
                                        case "B1":
                                %>
                                <select name="category"  class="form-control">
                                    <option value="B1-Tea" selected="">B1 - Tea</option>
                                    <option value="B2-Coffee">B2 - Coffee</option>
                                    <option value="B3-Milk tea">B3 - Milk tea</option>
                                </select>
                                <%
                                        break;
                                    case "B2":
                                %>
                                <select name="category" class="form-control">
                                    <option value="B1-Tea">B1 - Tea</option>
                                    <option value="B2-Coffee" selected="">B2 - Coffee</option>
                                    <option value="B3-Milk tea">B3 - Milk tea</option>
                                </select>
                                <%
                                        break;
                                    case "B3":
                                %>
                                <select name="category" class="form-control">
                                    <option value="B1-Tea">B1 - Tea</option>
                                    <option value="B2-Coffee">B2 - Coffee</option>
                                    <option value="B3-Milk tea" selected="">B3 - Milk tea</option>
                                </select>
                                <%
                                            break;
                                        default:
                                            break;
                                    }
                                %>

                            </td>
                            <td>
                                <input type="file" name="picture" accept="image/*"/>
                            </td>
                            <td>
                                <input type="hidden" name="productID" value="<%=drink.getProductID()%>"/>
                                <input type="hidden" name="search" value="<%=search%>"/>
                                <input type="submit" name="action" value="Update" class="btn btn-outline-info"/>
                            </td>
                            <td>
                                <input type="submit" name="action" value="Delete" class="btn btn-outline-info"/>
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
                %>
            </div>
            <div class="row">
                <a class="btn btn-block btn-info" href="insert.jsp">Insert</a>
            </div>
            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
            %>
            <%=error%>
        </div>
    </body>
</html>
