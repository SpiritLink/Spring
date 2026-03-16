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

        /* 테이블 스타일 (KRDS 가이드라인 유사 적용) */
        .data-table-container {
            margin-top: 24px;
            overflow-x: auto;
        }
        .data-table {
            width: 100%;
            border-collapse: collapse;
            border-top: 2px solid #1a1a1a;
            border-bottom: 1px solid #dcdcdc;
        }
        .data-table th, .data-table td {
            padding: 14px 16px;
            text-align: center;
            border-bottom: 1px solid #dcdcdc;
        }
        .data-table th {
            background-color: #f3f5f8;
            font-weight: 700;
            color: #1a1a1a;
        }
        .data-table tbody tr:hover {
            background-color: #fafafa;
        }
        .empty-row {
            text-align: center;
            padding: 24px !important;
            color: #666;
        }

        /* 버튼 스타일 */
        .btn-group { margin-top: 40px; display: flex; gap: 12px; justify-content: space-between; align-items: center; }
        .btn-actions { display: flex; gap: 12px; }
        .btn {
            display: inline-block;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 700;
            border: 1px solid transparent;
            cursor: pointer;
            text-align: center;
            font-size: 15px;
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
        <h1>Page 1 데이터베이스 조회</h1>

        <p>시스템 구성 요소의 연결 상태를 확인하고, 데이터를 조회합니다.</p>

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

        <div class="data-table-container">
            <table class="data-table">
                <colgroup>
                    <col style="width: 30%;">
                    <col style="width: 70%;">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">고유번호 (KEY_ID)</th>
                        <th scope="col">항목명 (KEY_VALUE)</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty page1DataList}">
                            <c:forEach var="data" items="${page1DataList}">
                                <tr>
                                    <td>${data.NUM}</td>
                                    <td>${data.TITLE}</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="2" class="empty-row">
                                    <c:choose>
                                        <c:when test="${param.action == 'search'}">
                                            조회된 데이터가 없습니다.
                                        </c:when>
                                        <c:otherwise>
                                            '조회' 버튼을 클릭하여 데이터를 확인해주세요.
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>

        <div class="btn-group">
            <div class="btn-actions">
                <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">메인으로</a>
            </div>
            <div class="btn-actions">
                <!-- 조회 시 action 파라미터를 넘겨 컨트롤러에서 전체 목록을 불러오게 합니다 -->
                <form action="${pageContext.request.contextPath}/page1" method="GET" style="margin:0;">
                    <input type="hidden" name="action" value="search">
                    <button type="submit" class="btn btn-primary">데이터 조회</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>