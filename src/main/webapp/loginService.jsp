<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    if (email.equals("test@test.com") && password.equals("root1234")) {
        session.setAttribute("userId", email);
        response.sendRedirect("logged.jsp");
    } else {
        System.out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>