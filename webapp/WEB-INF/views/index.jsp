<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정부서비스 - 메인</title>
    <style>
        :root {
            /* KRDS(디지털 정부서비스 UI/UX 가이드라인) 컬러 팔레트 */
            --krds-primary: #004ea2;
            --krds-secondary: #f3f5f8;
            --krds-text: #1a1a1a;
            --krds-border: #dcdcdc;
            --krds-focus: #0052cc;
            --krds-tertiary: #424242;
        }
        body {
            font-family: 'Malgun Gothic', 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            color: var(--krds-text);
            background-color: #f9f9f9;
            line-height: 1.6;
        }
        header {
            background-color: var(--krds-primary);
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
            border-bottom: 2px solid var(--krds-text);
            padding-bottom: 12px;
            margin-top: 0;
            margin-bottom: 24px;
        }
        h3 {
            font-size: 20px;
            margin-top: 24px;
            margin-bottom: 12px;
        }
        .info-box {
            background-color: var(--krds-secondary);
            padding: 24px;
            border-radius: 4px;
            margin-bottom: 24px;
            border: 1px solid var(--krds-border);
        }
        ul { list-style-type: square; padding-left: 24px; margin: 0; }
        li { margin-bottom: 8px; }

        /* 버튼 스타일 */
        .btn-group { margin-top: 40px; display: flex; gap: 12px; justify-content: center; flex-wrap: wrap; }
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
        .btn:focus, .btn:hover { outline: 2px solid var(--krds-focus); outline-offset: 2px; }
        .btn-primary { background-color: var(--krds-primary); color: white; }
        .btn-primary:hover { background-color: #003a7a; }
        .btn-secondary { background-color: white; color: var(--krds-primary); border-color: var(--krds-primary); }
        .btn-secondary:hover { background-color: #f0f4f9; }
        .btn-tertiary { background-color: var(--krds-tertiary); color: white; }
        .btn-tertiary:hover { background-color: #2b2b2b; }
    </style>
</head>
<body>
    <header>
        <h2>대한민국 디지털 정부서비스 샘플</h2>
    </header>
    <div class="container">
        <h1>서비스 메인 페이지</h1>

        <div class="info-box">
            <h3>접속 및 시스템 정보</h3>
            <p><strong>서버 접속 시간:</strong> <%= new Date() %></p>
            <p><strong>요청 URI:</strong> <%= request.getRequestURI() %></p>
        </div>

        <h3>안내 사항</h3>
        <ul>
            <li>원하시는 서비스를 아래 버튼을 통해 선택하여 주시기 바랍니다.</li>
            <li>본 페이지는 디지털 정부서비스 UI/UX 가이드라인(KRDS)을 준수하여 설계되었습니다.</li>
        </ul>

        <div class="btn-group">
            <a href="${pageContext.request.contextPath}/page1" class="btn btn-primary">Page 1 서비스 이용</a>
            <a href="${pageContext.request.contextPath}/page2" class="btn btn-secondary">Page 2 서비스 이용</a>
            <a href="${pageContext.request.contextPath}/environment_setup" class="btn btn-tertiary">환경구성</a>
        </div>
    </div>
</body>
</html>