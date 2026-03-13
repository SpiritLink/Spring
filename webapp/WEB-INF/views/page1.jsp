<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Page 1</title>
</head>
<body>
    <h1>Page 1 Data from Service</h1>

    <ul>
        <li><strong>Title:</strong> ${page1Data.title}</li>
        <li><strong>Num:</strong> ${page1Data.num}</li>
    </ul>

    <hr>

    <!-- 홈으로 돌아가는 버튼 -->
    <a href="${pageContext.request.contextPath}/">
        <button>Go Back to Home</button>
    </a>
</body>
</html>