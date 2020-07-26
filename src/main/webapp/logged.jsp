<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Success Page</title>
</head>
<body>
    <%
        if ((session.getAttribute("userId") == null) || (session.getAttribute("userId") == "")) {
    %>
    Vous n etes pas connecter <br/>
    <a href='login.jsp'>Please connecté vous</a>
    <%} else {
    %>
    Welcome <%=session.getAttribute("userId")%>
    <a href='logout.jsp'>Log out</a>
    <%
        }
    %>
<br
</body>
</html>