<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>새 글 작성 - 화햇 로보틱스</title>
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="container">
        <div class="form-container">
            <h2 class="form-title">새 글 작성</h2>
            <form action="/board/newPost" method="post">
                <div class="form-group">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" id="title" name="title" class="form-input" required>
                </div>
                <div class="form-group">
                    <label for="content" class="form-label">내용</label>
                    <textarea id="content" name="content" class="form-input" style="min-height: 200px;" required></textarea>
                </div>
                <input type="hidden" id="userId" name="userId" value="${loginUserId}" />
                <div class="form-group">
                    <div class="form-label">작성자: <b>${loginUsername}</b></div>
                </div>
                <button type="submit" class="form-button">등록</button>
            </form>
        </div>
    </div>
</body>
</html>