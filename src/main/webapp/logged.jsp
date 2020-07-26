<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Login Success Page</title>
</head>
<body>
    <%
        if ((session.getAttribute("userId") == null) || (session.getAttribute("userId") == "")) {
    %>
    You are not logged in<br/>
    <a href="index.jsp">Please Login</a>
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