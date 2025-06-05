<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 - 화햇 로보틱스</title>
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/main.css">
    <style>
        .board-container {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            margin: 2rem auto;
            max-width: 1200px;
        }

        .board-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #e0e0e0;
        }

        .board-title {
            font-size: 2rem;
            color: #2c3e50;
            font-weight: 700;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .board-title::before {
            content: "🤖";
            font-size: 1.8rem;
        }

        .new-post-btn {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: transform 0.2s, box-shadow 0.2s;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .new-post-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(52, 152, 219, 0.3);
        }

        .new-post-btn::before {
            content: "✏️";
        }

        .post-list {
            display: grid;
            gap: 1rem;
        }

        .post-item {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 1.2rem;
            transition: transform 0.2s, box-shadow 0.2s;
            border: 1px solid #e9ecef;
        }

        .post-item:hover {
            transform: translateX(5px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .post-title {
            color: #2c3e50;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1rem;
            display: block;
            margin-bottom: 0.5rem;
        }

        .post-title:hover {
            color: #3498db;
        }

        .post-meta {
            display: flex;
            align-items: center;
            gap: 1rem;
            color: #6c757d;
            font-size: 0.9rem;
        }

        .post-author {
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }

        .post-author::before {
            content: "👤";
        }

        .empty-message {
            text-align: center;
            padding: 3rem;
            color: #6c757d;
            font-size: 1.1rem;
        }

        .empty-message::before {
            content: "🤖";
            font-size: 2rem;
            display: block;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="container">
        <div class="board-container">
            <div class="board-header">
                <h2 class="board-title">로보틱스 게시판</h2>
                <a href="/board/newPost" class="new-post-btn">새 글 작성</a>
            </div>

            <div class="post-list">
                <c:choose>
                    <c:when test="${empty boards}">
                        <div class="empty-message">
                            아직 작성된 게시글이 없습니다.<br>
                            첫 번째 게시글을 작성해보세요!
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="post" items="${boards}">
                            <div class="post-item">
                                <a href="/board/post?id=${post.id}" class="post-title">${post.title}</a>
                                <div class="post-meta">
                                    <span class="post-author">${userNamesByBoardId[post.id]}</span>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</body>
</html>