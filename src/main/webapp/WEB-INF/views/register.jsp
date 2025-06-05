<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 화햇 로보틱스</title>
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/main.css">
    <style>
        .register-section {
            min-height: calc(100vh - 80px);
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            padding: 2rem;
        }

        .register-container {
            background: white;
            padding: 2.5rem;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            position: relative;
            overflow: hidden;
        }

        .register-container::before {
            content: "🤖";
            position: absolute;
            top: -20px;
            right: -20px;
            font-size: 150px;
            opacity: 0.1;
            transform: rotate(15deg);
        }

        .form-title {
            font-size: 2rem;
            color: #2c3e50;
            margin-bottom: 2rem;
            text-align: center;
            font-weight: 700;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            color: #2c3e50;
            font-weight: 600;
        }

        .form-input {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            outline: none;
        }

        .form-button {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .form-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
        }

        .form-link {
            display: block;
            text-align: center;
            margin-top: 1.5rem;
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .form-link:hover {
            color: #2980b9;
        }

        .error-message {
            background: #fee2e2;
            color: #dc2626;
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 1.5rem;
            text-align: center;
            font-weight: 500;
        }

        .password-requirements {
            font-size: 0.875rem;
            color: #6b7280;
            margin-top: 0.5rem;
        }

        @media (max-width: 480px) {
            .register-container {
                padding: 2rem;
            }
            .form-title {
                font-size: 1.75rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="register-section">
        <div class="register-container">
            <h2 class="form-title">회원가입</h2>
            <% if (request.getAttribute("error") != null) { %>
                <div class="error-message">${error}</div>
            <% } %>
            <form action="/register" method="post">
                <div class="form-group">
                    <label for="username" class="form-label">아이디</label>
                    <input type="text" id="username" name="username" class="form-input" required>
                </div>
                <div class="form-group">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" id="password" name="password" class="form-input" required>
                    <div class="password-requirements">
                        영문, 숫자, 특수문자를 포함한 8자 이상
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="form-label">이메일</label>
                    <input type="email" id="email" name="email" class="form-input" required>
                </div>
                <button type="submit" class="form-button">회원가입</button>
            </form>
            <a href="/login" class="form-link">로그인으로 돌아가기</a>
        </div>
    </div>
</body>
</html>