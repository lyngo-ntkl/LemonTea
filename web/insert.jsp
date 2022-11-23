<%-- 
    Document   : insert
    Created on : Jul 6, 2022, 6:33:45 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Page</title>
        <link rel="icon" href="image/Lemon Tea.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    </head>
    <body>
        <form action='MainController' class="form-horizontal">
            <input type='text' name='productName' placeholder="Product name"/>
            <input type='text' name='price' placeholder="Price"/>
            <input type='number' name='quantity' placeholder="Available quantity"/>
            <select name="category" class="form-control">
                <option value="B1-Tea">B1 - Tea</option>
                <option value="B2-Coffee">B2 - Coffee</option>
                <option value="B3-Milk tea">B3 - Milk tea</option>
            </select>
            <input type='submit' name='action' value="Insert"/>
        </form>
    </body>
</html>
