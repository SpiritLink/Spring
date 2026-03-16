<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정부서비스 - 환경구성</title>
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
        h3 {
            font-size: 20px;
            margin-top: 24px;
            margin-bottom: 12px;
            color: #004ea2;
        }
        .content-box {
            background-color: #f3f5f8;
            padding: 24px;
            border-radius: 4px;
            margin-bottom: 24px;
            border: 1px solid #dcdcdc;
        }
        ul {
            margin-top: 0;
            padding-left: 20px;
        }
        li {
            margin-bottom: 8px;
        }

        /* 코드 블럭 스타일 */
        pre {
            background-color: #2b2b2b;
            color: #f8f8f2;
            padding: 16px;
            border-radius: 4px;
            overflow-x: auto;
            font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
            font-size: 14px;
            line-height: 1.4;
            margin-top: 12px;
            margin-bottom: 24px;
        }
        code {
            font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
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
        <h1>DB 환경구성 안내</h1>

        <div class="content-box">
            <h3>데이터베이스 기본 환경</h3>
            <ul>
                <li><strong>사용 중인 DB:</strong> Oracle Database 23ai Free (26 ai free 대응)</li>
                <li><strong>구동 환경:</strong> Docker 또는 Colima를 이용한 로컬 환경 컨테이너 구동</li>
            </ul>
            <h3>기능 안내</h3>
            <ul>
                <li><strong>Page 1</strong>에서 <strong>DB 성공 여부</strong>를 조회할 수 있습니다.</li>
                <li><strong>Page 1</strong>에서 <strong>'데이터 조회' 버튼 클릭 시</strong> 삽입된 데이터 조회가 가능합니다.</li>
            </ul>
        </div>

        <h3>초기 세팅 쿼리</h3>
        <p>본 샘플 서비스의 원활한 동작을 위해 DB 접속 툴(예: IntelliJ Database, SQL Developer 등)을 이용하여 아래의 쿼리를 순차적으로 실행하여 주십시오.</p>
        <p>해당 쿼리는 시스템 구동에 필요한 테이블스페이스 및 계정을 생성하고 권한을 부여하며, 더미 테이블과 기초 데이터를 삽입합니다.</p>

<pre><code>-- 1. 테이블 스페이스 생성 (데이터 파일 경로와 크기는 환경에 맞게 조정할 수 있습니다)
CREATE TABLESPACE DUMMY_TS
DATAFILE 'dummy_ts.dbf' SIZE 100M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED;

-- 2. DUMMY 계정 생성 및 기본 테이블 스페이스 할당
CREATE USER DUMMY IDENTIFIED BY "1q2w3e4r"
DEFAULT TABLESPACE DUMMY_TS
QUOTA UNLIMITED ON DUMMY_TS;

-- 3. 계정에 필요한 기본 권한 부여 (접속, 자원 생성, 세션 생성)
GRANT CONNECT, RESOURCE, CREATE SESSION TO DUMMY;

-- 4. DUMMY 계정의 테이블 생성 (DUMMY_TS 테이블 스페이스 사용)
CREATE TABLE DUMMY.DUMMY_TABLE_01 (
    KEY_ID INT,
    KEY_VALUE VARCHAR2(255)
) TABLESPACE DUMMY_TS;

-- 5. 테스트용 더미 데이터 삽입
-- (Oracle DB 환경에서는 다중 INSERT 구문을 아래와 같이 하나씩 수행하거나 INSERT ALL을 사용해야 합니다)
INSERT INTO DUMMY.DUMMY_TABLE_01 (KEY_ID, KEY_VALUE) VALUES (1, '더미1');
INSERT INTO DUMMY.DUMMY_TABLE_01 (KEY_ID, KEY_VALUE) VALUES (2, '더미2');
COMMIT;

-- 6. 데이터 생성 확인
SELECT * FROM DUMMY.DUMMY_TABLE_01;</code></pre>

        <div class="btn-group">
            <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">메인으로 돌아가기</a>
        </div>
    </div>
</body>
</html>