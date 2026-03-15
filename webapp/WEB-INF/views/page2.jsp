<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정부서비스 - Page 2</title>
    <style>
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
        .notice-box {
            background-color: #fff4e5;
            padding: 24px;
            border-radius: 4px;
            margin-bottom: 24px;
            border: 1px solid #ffd499;
            color: #b25000;
        }
        .notice-box strong { font-size: 18px; display: block; margin-bottom: 8px; }

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
        <h1>Page 2 서비스 안내</h1>

        <div class="notice-box">
            <strong>알림창 (${message})</strong>
            해당 서비스는 현재 준비중이거나 제한된 권한으로 접근하셨습니다.
        </div>

        <p>추가적인 도움이 필요하신 경우 고객센터로 문의하여 주시기 바랍니다. 감사합니다.</p>

        <div class="btn-group">
            <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">메인으로 돌아가기</a>
        </div>
    </div>
</body>
</html>