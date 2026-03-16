<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정부서비스 - Page 1</title>
    <style>
        :root {
            var(--krds-primary): #004ea2;
            var(--krds-secondary): #f3f5f8;
            var(--krds-text): #1a1a1a;
            var(--krds-border): #dcdcdc;
            var(--krds-focus): #0052cc;
        }
        body {
            font-family: 'Malgun Gothic', 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            color: #1a1a1a;
            background-color: #f9f9f9;
            line-height: 1.6;
        }
        header {
            background-color: #004ea2;
            color: white;
            padding: 20px 0;
            text-align: center;
        }
        header h2 { margin: 0; font-size: 28px; font-weight: 700; }
        .container {
            max-width: 800px;
            margin: 40px auto;
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            font-size: 28px;
            border-bottom: 2px solid #1a1a1a;
            padding-bottom: 12px;
            margin-top: 0;
            margin-bottom: 24px;
        }
        .data-list {
            background-color: #f3f5f8;
            padding: 24px;
            border-radius: 4px;
            margin-bottom: 24px;
            border: 1px solid #dcdcdc;
            list-style: none;
        }
        .data-list li {
            margin-bottom: 12px;
            font-size: 18px;
        }
        .data-list strong {
            display: inline-block;
            width: 120px;
            color: #004ea2;
        }

        /* Status box styles */
        .status-box {
            padding: 16px;
            border-radius: 4px;
            margin-bottom: 24px;
            font-weight: bold;
        }
        .status-success {
            background-color: #e8f5e9;
            color: #2e7d32;
            border: 1px solid #c8e6c9;
        }
        .status-error {
            background-color: #ffebee;
            color: #c62828;
            border: 1px solid #ffcdd2;
        }

        /* 버튼 스타일 */
        .btn-group { margin-top: 40px; display: flex; gap: 12px; justify-content: flex-start; }
        .btn {
            display: inline-block;
            padding: 14px 28px;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 700;
            border: 1px solid transparent;
            cursor: pointer;
            text-align: center;
            font-size: 16px;
            transition: all 0.2s ease-in-out;
        }
        .btn:focus, .btn:hover { outline: 2px solid #0052cc; outline-offset: 2px; }
        .btn-primary { background-color: #004ea2; color: white; }
        .btn-primary:hover { background-color: #003a7a; }
        .btn-secondary { background-color: white; color: #004ea2; border-color: #004ea2; }
        .btn-secondary:hover { background-color: #f0f4f9; }
    </style>
</head>
<body>
    <header>
        <h2>대한민국 디지털 정부서비스 샘플</h2>
    </header>
    <div class="container">
        <h1>Page 1 데이터베이스 상태 확인</h1>

        <p>시스템 구성 요소의 연결 상태를 확인합니다.</p>

        <c:choose>
            <c:when test="${isConnected}">
                <div class="status-box status-success">
                    ✓ 정상: ${dbStatusMessage}
                </div>
            </c:when>
            <c:otherwise>
                <div class="status-box status-error">
                    ⚠ 주의: ${dbStatusMessage}
                </div>
            </c:otherwise>
        </c:choose>

        <ul class="data-list">
            <li><strong>항목명:</strong> ${page1Data.title != null ? page1Data.title : '데이터 없음'}</li>
            <li><strong>고유번호:</strong> ${page1Data.num != null ? page1Data.num : '데이터 없음'}</li>
        </ul>

        <div class="btn-group">
            <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">메인으로 돌아가기</a>
        </div>
    </div>
</body>
</html>