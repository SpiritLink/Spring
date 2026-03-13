<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Page 2</title>
</head>
<body>
    <h1>${message}</h1>
    <p>This is Page 2.</p>

    <hr>

    <a href="${pageContext.request.contextPath}/">
        <button>Go Back to Home</button>
    </a>
</body>
</html>