<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>JSP Engine Test</title>
</head>
<body>
    <h1>JSP Engine Status: OK</h1>

    <h3>Server Time:</h3>
    <p>Current time is: <%= new Date() %></p>

    <h3>Loop Test:</h3>
    <ul>
        <%
            for (int i = 1; i <= 5; i++) {
        %>
            <li>Item <%= i %></li>
        <%
            }
        %>
    </ul>

    <h3>Request Info:</h3>
    <p>Context Path: <%= request.getContextPath() %></p>
    <p>Request URI: <%= request.getRequestURI() %></p>
</body>
</html>