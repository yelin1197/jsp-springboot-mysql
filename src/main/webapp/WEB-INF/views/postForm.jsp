<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 작성</title>
</head>
<body>
<h1>게시글 작성</h1>
<form action="/post" method="post">
    <label>제목: <input type="text" name="title" required></label><br>
    <label>내용: <textarea name="content" rows="5" cols="50" required></textarea></label><br>
    <!-- author, password는 제거 -->
    <button type="submit">작성</button>
</form>
</body>
</html>
