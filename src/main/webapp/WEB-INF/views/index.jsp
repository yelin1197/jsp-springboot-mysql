<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>화햇 로보틱스</title>
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/index.css">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #1a2a6c, #b21f1f, #fdbb2d);
            min-height: calc(100vh - 80px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            position: relative;
            overflow: hidden;
        }

        .hero-content {
            text-align: center;
            color: white;
            z-index: 1;
            max-width: 800px;
        }

        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .hero-subtitle {
            font-size: 1.5rem;
            margin-bottom: 2.5rem;
            opacity: 0.9;
        }

        .button-container {
            display: flex;
            gap: 1.5rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .main-button {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            color: white;
            padding: 1rem 2rem;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            border: 2px solid rgba(255, 255, 255, 0.2);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .main-button:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .main-button::before {
            font-size: 1.2rem;
        }

        .login-btn::before {
            content: "🔑";
        }

        .register-btn::before {
            content: "👤";
        }

        .board-btn::before {
            content: "📝";
        }

        .robot-animation {
            position: absolute;
            width: 300px;
            height: 300px;
            background: url('/images/robot.png') no-repeat center center;
            background-size: contain;
            opacity: 0.1;
            animation: float 6s ease-in-out infinite;
        }

        .robot-1 {
            top: 10%;
            left: 10%;
        }

        .robot-2 {
            bottom: 10%;
            right: 10%;
            animation-delay: -3s;
        }

        @keyframes float {
            0% {
                transform: translateY(0) rotate(0deg);
            }
            50% {
                transform: translateY(-20px) rotate(5deg);
            }
            100% {
                transform: translateY(0) rotate(0deg);
            }
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            .hero-subtitle {
                font-size: 1.2rem;
            }
            .button-container {
                flex-direction: column;
            }
            .main-button {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="hero-section">
        <div class="robot-animation robot-1"></div>
        <div class="robot-animation robot-2"></div>
        <div class="hero-content">
            <h1 class="hero-title">화햇 로보틱스</h1>
            <p class="hero-subtitle">로봇 기술의 혁신을 이끄는 미래 지향적 기업</p>
            <div class="button-container">
                <a href="/login" class="main-button login-btn">로그인</a>
                <a href="/register" class="main-button register-btn">회원가입</a>
                <a href="/board/posts" class="main-button board-btn">게시판</a>
            </div>
        </div>
    </div>
</body>
</html>
