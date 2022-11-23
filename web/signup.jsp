<%-- 
    Document   : signup
    Created on : Jul 5, 2022, 9:44:20 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup Page</title>
        <link rel="icon" href="image/Lemon Tea.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
        <script src="https://www.google.com/recaptcha/api.js"></script>
        <script type="text/javascript">
            var onloadCallback = function () {
                grecaptcha.render('html_element', {
                    'sitekey': '6LfgF9YgAAAAABmsAzw-fO6hwHzGy1vxaGdGIEg0'
                });
            };
        </script>
    </head>
    <body>
        <%--
            Site key: 6LfgF9YgAAAAABmsAzw-fO6hwHzGy1vxaGdGIEg0
            Secret key: 6LfgF9YgAAAAAFtfa1uie-4R2h0MgQpUZJozR3VV
        --%>
        <div class='container-fluid d-flex justify-content-around'>
            <div class="row">
                <h1>Sign up</h1>
            </div>
            <div class="row">
                <form action="MainController" class="form-horizontal">
                    <div class="form-group">
                        <input type='text' name="userID" placeholder="userID" required="" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <input type='text' name="fullName" placeholder="Full name" required="" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <input type='password' name="password" placeholder="Password" required="" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <input type='password' name="passwordConfirm" placeholder="Password confirm" required="" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <div class="g-recaptcha" data-sitekey="6LfgF9YgAAAAABmsAzw-fO6hwHzGy1vxaGdGIEg0"></div>
                    </div>
                    <div class="form-group">
                        <input type="submit" name="action" value="Sign up" class="btn btn-info"/>
                    </div>
                </form>
            </div>
            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
            %>
            <div class="row">
                <%=error%>
            </div>
        </div>
        <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
                async defer>
        </script>
    </body>
</html>
