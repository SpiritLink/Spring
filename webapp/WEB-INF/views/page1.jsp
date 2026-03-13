<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Page 1</title>
</head>
<body>
    <h1>Welcome to Page 1</h1>
    <p>This is a new page created by Spring MVC.</p>

    <hr>

    <!-- 홈으로 돌아가는 버튼 -->
    <a href="${pageContext.request.contextPath}/">
        <button>Go Back to Home</button>
    </a>
</body>
</html>