<%-- 
    Document   : login
    Created on : Jun 27, 2022, 5:09:03 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="icon" href="image/Lemon Tea.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container-fluid col-xs-12">
            <div class="d-flex justify-content-center">
                <form action="MainController" method="POST" class="form-horizontal">
                    <div class="form-group">
                        <h1>Login</h1>
                    </div>
                    <div class="form-group">
                        UserID<input type="text" name="userID" class="form-control"/>
                    </div>
                    <div class="form-group">
                        Password<input type="password" name="password" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <input type="submit" name="action" value="Login" class="btn btn-primary btn-block"/>
                    </div>
                    <div class="form-group">
                        <label>Don't have an account?</label>
                        <a href="signup.jsp" class="btn btn-outline-primary btn-block">Sign up</a>
                        <label>Or</label>
                    </div>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/MilkTeaShopManagement/LoginGoogleController&response_type=code
                       &client_id=960459532301-oafhddmngqt7e8e4agc4uo3kc3m72fq7.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>
                </form>
                <%-- Client id: 960459532301-oafhddmngqt7e8e4agc4uo3kc3m72fq7.apps.googleusercontent.com
                 Client secret: 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
                 href uri=Authorized redirect URIs--%>
            </div>
        </div>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%=error%>
        <footer></footer>
    </body>
</html>
