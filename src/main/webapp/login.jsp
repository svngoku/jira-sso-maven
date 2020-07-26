<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSO JIRA</title>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/aui/5.2/css/aui.css" media="all">
    <!--[if lt IE 9]><link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/aui/5.2/css/aui-ie.css" media="all"><![endif]-->
    <!--[if IE 9]><link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/aui/5.2/css/aui-ie9.css" media="all"><![endif]-->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/aui/5.2/js/aui.js"></script>
    <!--[if lt IE 9]><script src="//cdnjs.cloudflare.com/ajax/libs/aui/5.2/js/aui-ie.js"></script><![endif]-->
</head>

<body>
    <%
        if ((session.getAttribute("userId") != null) || (session.getAttribute("userId") != "")) {
        response.sendRedirect("logged.jsp");
    %>
    <%} else { %>
    <div id="page" class="Hybrid">
        <h2 class="">Connexion SSO </h2>
        <form method="POST" class="aui" action="loginService.jsp">
            <div class="field-group">
                <label for="Login">Email</label>
                <input class="text" type="email" name="email">
            </div>
            <div class="field-group">
                <label for="password">Password</label>
                <input class="password" type="password" name="password">
            </div>
            <div class="field-group">
                <button class="aui-button aui-button-primary">
                    SSO Connexion
                </button>
            </div>
        </form>
    </div>
    <%
        }
    %>
    <script>
    </script>
</body>


</html>